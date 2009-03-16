<?php 
class ControllerPaymentLinkPoint extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/linkpoint');

		$this->document->title = $this->language->get('heading_title');
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('linkpoint', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->https('extension/payment'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
				
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_merchant'] = $this->language->get('entry_merchant');
		$this->data['entry_test'] = $this->language->get('entry_test');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

		$this->data['error_warning'] = @$this->error['warning'];
		$this->data['error_merchant'] = @$this->error['merchant'];

  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->https('common/home'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->https('extension/payment'),
       		'text'      => $this->language->get('text_payment'),
      		'separator' => ' :: '
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => $this->url->https('payment/linkpoint'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = $this->url->https('payment/linkpoint');
		
		$this->data['cancel'] = $this->url->https('extension/payment');
		
		if (isset($this->request->post['linkpoint_status'])) {
			$this->data['linkpoint_status'] = $this->request->post['linkpoint_status'];
		} else {
			$this->data['linkpoint_status'] = $this->config->get('linkpoint_status');
		}
		
		if (isset($this->request->post['linkpoint_geo_zone_id'])) {
			$this->data['linkpoint_geo_zone_id'] = $this->request->post['linkpoint_geo_zone_id'];
		} else {
			$this->data['linkpoint_geo_zone_id'] = $this->config->get('linkpoint_geo_zone_id'); 
		} 

		if (isset($this->request->post['linkpoint_order_status_id'])) {
			$this->data['linkpoint_order_status_id'] = $this->request->post['linkpoint_order_status_id'];
		} else {
			$this->data['linkpoint_order_status_id'] = $this->config->get('linkpoint_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['linkpoint_merchant'])) {
			$this->data['linkpoint_merchant'] = $this->request->post['linkpoint_merchant'];
		} else {
			$this->data['linkpoint_merchant'] = $this->config->get('linkpoint_merchant');
		}
		
		if (isset($this->request->post['linkpoint_test'])) {
			$this->data['linkpoint_test'] = $this->request->post['linkpoint_test'];
		} else {
			$this->data['linkpoint_test'] = $this->config->get('linkpoint_test');
		}
		
		if (isset($this->request->post['linkpoint_sort_order'])) {
			$this->data['linkpoint_sort_order'] = $this->request->post['linkpoint_sort_order'];
		} else {
			$this->data['linkpoint_sort_order'] = $this->config->get('linkpoint_sort_order');
		}
		
		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$this->id       = 'content';
		$this->template = 'payment/linkpoint.tpl';
		$this->layout   = 'module/layout';
		
 		$this->render();
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/linkpoint')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!@$this->request->post['linkpoint_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}
				
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>