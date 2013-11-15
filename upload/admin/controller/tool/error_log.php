<?php 
class ControllerToolErrorLog extends Controller { 
	public function index() {		
		$this->load->language('tool/error_log');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$data['heading_title'] = $this->language->get('heading_title');
		 
		$data['button_clear'] = $this->language->get('button_clear');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL')
   		);
		
		$data['clear'] = $this->url->link('tool/error_log/clear', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['error_warning'] = '';
		$data['log'] = '';
		
		$file = DIR_LOGS . $this->config->get('config_error_filename');
		
		if (file_exists($file)) {
			$size = filesize($file);
			
			if ($size >= 5242880){
				$suffix = array(
					'B',
					'KB',
					'MB',
					'GB',
					'TB',
					'PB',
					'EB',
					'ZB',
					'YB'
				);

				while (($size / 1024) > 1) {
					$size = $size / 1024;
					$i++;
				}
				
				$data['error_warning'] = sprintf($this->language->get('error_warning'), basename($file), round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i]);
			} else {
				$data['log'] = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);
			}
		}	
			
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('tool/error_log.tpl', $data));
	}
	
	public function clear() {
		$this->load->language('tool/error_log');
		
		$file = DIR_LOGS . $this->config->get('config_error_filename');
		
		$handle = fopen($file, 'w+'); 
				
		fclose($handle); 			
		
		$this->session->data['success'] = $this->language->get('text_success');
		
		$this->redirect($this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL'));		
	}
}
?>