<?php 
class ControllerCatalogCardgift extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('catalog/cardgift');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/cardgift');

		$this->getList();
	}

	public function insert() {
		$this->language->load('catalog/cardgift');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/cardgift');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			

			$value_check = $this->model_catalog_cardgift->checkCardgift($this->request->post);
			//$this->check_number);
			//var_dump($v);
			

			if($value_check == true){ //die("ddd");
				$this->session->data['fail'] = $this->language->get('text_fail');
				
			}
			else{
				//die("ttt");
				$this->model_catalog_cardgift->addCardgift($this->request->post);

				$this->session->data['success'] = $this->language->get('text_success');
			}
			//$this->model_catalog_cardgift->addCardgift($this->request->post);

			//$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'] . $url, 'SSL')); 
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('catalog/cardgift');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/cardgift');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_cardgift->editCardgift($this->request->get['cardgift_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('catalog/cardgift');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/cardgift');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $group_id) {
				$this->model_catalog_cardgift->deleteCardgift($group_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('catalog/cardgift/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/cardgift/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		

		$this->data['cardgifts'] = array();

		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$cardgift_total = $this->model_catalog_cardgift->getTotalCardgifts();

		$results = $this->model_catalog_cardgift->getCardgifts($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/cardgift/update', 'token=' . $this->session->data['token'] . '&cardgift_id=' . $result['cardgift_id'] . $url, 'SSL')
			);

			$this->data['cardgifts'][] = array(
				'cardgift_id' => $result['cardgift_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['cardgift_id'], $this->request->post['selected']),

				'description' => $result['description'],
				'price' 	  => $result['price'],
				'image'       => $result['image'],

				'group_id'    => $result['group_id'],


				'action'      => $action
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['fail'])) {
			$this->data['fail'] = $this->session->data['fail'];

			unset($this->session->data['fail']);
		} else {
			$this->data['fail'] = '';
		}


		$pagination = new Pagination();
		$pagination->total = $cardgift_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->template = 'catalog/cardgift_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');

		$this->data['entry_name'] = $this->language->get('entry_name');

		//$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');

		$this->data['entry_price'] = $this->language->get('entry_price');


		$this->data['entry_group_id'] = $this->language->get('entry_group_id');

		$this->data['entry_image'] = $this->language->get('entry_image');

		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);


		if (!isset($this->request->get['cardgift_id'])) {
			$this->data['action'] = $this->url->link('catalog/cardgift/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/cardgift/update', 'token=' . $this->session->data['token'] . '&cardgift_id=' . $this->request->get['cardgift_id'], 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/cardgift', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['cardgift_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			//$cardgift_info = $this->model_catalog_cardgift->getCardgift($this->request->get['group_id']);
			$cardgift_info = $this->model_catalog_cardgift->getCardgift($this->request->get['cardgift_id']);
		}

		$this->data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		//echo $this->request->get['cardgift_id']; die;
		if (isset($this->request->post['cardgift_description'])) {
			$this->data['cardgift_description'] = $this->request->post['cardgift_description'];
		} elseif (isset($this->request->get['cardgift_id'])) {
			$this->data['cardgift_description'] = $this->model_catalog_cardgift->getCardgiftDescriptions($this->request->get['cardgift_id']);
		} else {
			$this->data['cardgift_description'] = array();
		}


		if (isset($this->request->post['path'])) {
			$this->data['path'] = $this->request->post['path'];
		} else {
			$this->data['path'] = '';
		}
		

		if (isset($this->request->post['group_id'])) {
			$this->data['group_id'] = $this->request->post['group_id'];
		} elseif (!empty($cardgift_info)) {
			$this->data['group_id'] = $cardgift_info['group_id'];
		} else {
			$this->data['group_id'] = 0;
		}

		
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($cardgift_info)) {
			$this->data['image'] = $cardgift_info['image'];
		} else {
			$this->data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($cardgift_info) && $cardgift_info['image'] && file_exists(DIR_IMAGE . $cardgift_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($cardgift_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($cardgift_info)) {
			$this->data['sort_order'] = $cardgift_info['sort_order'];
		} else {
			$this->data['sort_order'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($cardgift_info)) {
			$this->data['status'] = $cardgift_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		
		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'catalog/cardgift_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/cardgift')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		// foreach ($this->request->post['cardgift_description'] as $language_id => $value) {
		// 	if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
		// 		$this->error['name'][$language_id] = $this->language->get('error_name');
		// 	}
		// }

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/cardgift')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}


	public function autocomplete() {
		$json = array();

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	}		
}
?>