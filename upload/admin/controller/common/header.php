<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$data['base'] = HTTPS_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}

		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$this->load->language('common/header');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_order'] = $this->language->get('text_order');
		$data['text_processing_status'] = $this->language->get('text_processing_status');
		$data['text_complete_status'] = $this->language->get('text_complete_status');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_customer'] = $this->language->get('text_customer');
		$data['text_online'] = $this->language->get('text_online');
		$data['text_approval'] = $this->language->get('text_approval');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_review'] = $this->language->get('text_review');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_front'] = $this->language->get('text_front');
		$data['text_help'] = $this->language->get('text_help');
		$data['text_homepage'] = $this->language->get('text_homepage');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
		$data['text_logout'] = $this->language->get('text_logout');

		if (!isset($this->request->get['user_token']) || !isset($this->session->data['user_token']) || ($this->request->get['user_token'] != $this->session->data['user_token'])) {
			$data['logged'] = '';

			$data['home'] = $this->url->link('common/dashboard', '', true);
		} else {
			$data['logged'] = true;

			$data['home'] = $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true);
			$data['logout'] = $this->url->link('common/logout', 'user_token=' . $this->session->data['user_token'], true);
			
			$this->load->model('report/statistics');
			
			// Processing Orders
			$data['processing_total'] = (int)$this->model_report_statistics->getValue('order_processing');
			$data['processing_status'] = $this->url->link('sale/order', 'user_token=' . $this->session->data['user_token'] . '&filter_order_status=' . implode(',', $this->config->get('config_processing_status')), true);

			// Complete Orders
			$complete_total = $this->model_report_statistics->getValue('order_complete');
			
			
			$data['complete_total'] = (int)$complete_total;
			$data['complete_status'] = $this->url->link('sale/order', 'user_token=' . $this->session->data['user_token'] . '&filter_order_status=' . implode(',', $this->config->get('config_complete_status')), true);

			// Customers
			$this->load->model('extension/report/customer');

			$data['online_total'] = (int)$this->model_extension_report_customer->getTotalCustomersOnline();

			$data['online'] = $this->url->link('extension/report/customer_online', 'user_token=' . $this->session->data['user_token'], true);
			
			// Returns
			$return_total = $this->model_report_statistics->getValue('return');
			 
			$data['return_total'] = (int)$return_total;
			$data['return'] = $this->url->link('sale/return', 'user_token=' . $this->session->data['user_token'], true);

 			$customer_total = (int)$this->model_report_statistics->getValue('customer');
 
			$data['customer_total'] = $customer_total;
			$data['customer'] = $this->url->link('customer/customer', 'user_token=' . $this->session->data['user_token'] . '&filter_approved=0', true);

			// Affliate
			$affiliate_total = (int)$this->model_report_statistics->getValue('affiliate');
			
			$data['affiliate_total'] = $affiliate_total;
			$data['affiliate'] = $this->url->link('customer/customer', 'user_token=' . $this->session->data['user_token'] . '&filter_affiliate=1', true);

			// Products
			$product_total = (int)$this->model_report_statistics->getValue('product');
			 
			$data['product_total'] = (int)$product_total;
			$data['product'] = $this->url->link('catalog/product', 'user_token=' . $this->session->data['user_token'] . '&filter_quantity=0', true);

			// Reviews
			$review_total = (int)$this->model_report_statistics->getValue('review');
			
			$data['review_total'] = $review_total;
			$data['review'] = $this->url->link('catalog/review', 'user_token=' . $this->session->data['user_token'] . '&filter_status=0', true);

			$data['alerts'] =(int) $customer_total + (int)$product_total + (int)$review_total + (int)$affiliate_total + (int)$return_total;
			
			// Online Stores
			$data['stores'] = array();

			$data['stores'][] = array(
				'name' => $this->config->get('config_name'),
				'href' => HTTP_CATALOG
			);

			$this->load->model('setting/store');

			$results = $this->model_setting_store->getStores();

			foreach ($results as $result) {
				$data['stores'][] = array(
					'name' => $result['name'],
					'href' => $result['url']
				);
			}
		}

		return $this->load->view('common/header', $data);
	}
}