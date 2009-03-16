<?php 
class ControllerPaymentProtx extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/protx');

		$this->document->title = $this->language->get('heading_title');
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('protx', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->https('extension/payment'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_simulator'] = $this->language->get('text_simulator');
		$this->data['text_test'] = $this->language->get('text_test');
		$this->data['text_live'] = $this->language->get('text_live');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_vendor'] = $this->language->get('entry_vendor');
		$this->data['entry_password'] = $this->language->get('entry_password');
		$this->data['entry_test'] = $this->language->get('entry_test');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

		$this->data['error_warning'] = @$this->error['warning'];
		$this->data['error_vendor'] = @$this->error['vendor'];
		$this->data['error_password'] = @$this->error['password'];

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
       		'href'      => $this->url->https('payment/protx'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = $this->url->https('payment/protx');
		
		$this->data['cancel'] = $this->url->https('extension/payment');
		
		if (isset($this->request->post['protx_status'])) {
			$this->data['protx_status'] = $this->request->post['protx_status'];
		} else {
			$this->data['protx_status'] = $this->config->get('protx_status');
		}
		
		if (isset($this->request->post['protx_geo_zone_id'])) {
			$this->data['protx_geo_zone_id'] = $this->request->post['protx_geo_zone_id'];
		} else {
			$this->data['protx_geo_zone_id'] = $this->config->get('protx_geo_zone_id'); 
		} 

		if (isset($this->request->post['protx_order_status_id'])) {
			$this->data['protx_order_status_id'] = $this->request->post['protx_order_status_id'];
		} else {
			$this->data['protx_order_status_id'] = $this->config->get('protx_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['protx_vendor'])) {
			$this->data['protx_vendor'] = $this->request->post['protx_vendor'];
		} else {
			$this->data['protx_vendor'] = $this->config->get('protx_vendor');
		}
		
		if (isset($this->request->post['protx_password'])) {
			$this->data['protx_password'] = $this->request->post['protx_password'];
		} else {
			$this->data['protx_password'] = $this->config->get('protx_password');
		}
		
		if (isset($this->request->post['protx_test'])) {
			$this->data['protx_test'] = $this->request->post['protx_test'];
		} else {
			$this->data['protx_test'] = $this->config->get('protx_test');
		}
		
		if (isset($this->request->post['protx_sort_order'])) {
			$this->data['protx_sort_order'] = $this->request->post['protx_sort_order'];
		} else {
			$this->data['protx_sort_order'] = $this->config->get('protx_sort_order');
		}
		
		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$this->id       = 'content';
		$this->template = 'payment/protx.tpl';
		$this->layout   = 'module/layout';
		
 		$this->render();
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/protx')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!@$this->request->post['protx_vendor']) {
			$this->error['vendor'] = $this->language->get('error_vendor');
		}

		if (!@$this->request->post['protx_password']) {
			$this->error['password'] = $this->language->get('error_password');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>