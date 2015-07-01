<?php
class ControllerModuleIwatermark extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/iwatermark');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addStyle('view/stylesheet/iwatermark.css');
		$this->document->addStyle('view/stylesheet/iwatermark_colorpicker.css');
		$this->document->addScript('view/javascript/iwatermark_colorpicker.js');
		
		$this->load->model('module/iwatermark');
		
			
		$this->session->data['flash_error'] = empty($this->session->data['flash_error']) ? array() : $this->session->data['flash_error'];
		$this->session->data['flash_success'] = empty($this->session->data['flash_success']) ? array() : $this->session->data['flash_success'];
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$this->user->hasPermission('modify', 'module/iwatermark')) {
				$this->session->data['flash_error'][] = $this->language->get('error_permission');
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
			
			if (empty($_GET['activate'])) {
				// Clear cache
				$this->model_module_iwatermark->cleanFolder(DIR_IMAGE . 'cache');
				// Data validation
				$this->validate();
			}
			
			$this->model_module_iwatermark->editSetting('iwatermark', $this->request->post);		
			$this->session->data['flash_success'][] = $this->language->get('text_success');
			
			if (!empty($_GET['activate'])) {
				$this->session->data['flash_success'][] = $this->language->get('text_success_activation');
			}
			
			$selectedTab = (empty($this->request->post['selectedTab'])) ? 0 : $this->request->post['selectedTab'];
			$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'] . '&tab='.$selectedTab, 'SSL'));
		}

		// Set language data
		$variables = array(
			'heading_title',
			'text_enabled',
			'text_disabled',
			'text_content_top',
			'text_content_bottom',
			'text_column_left',
			'text_column_right',
			'text_activate',
			'text_not_activated',
			'text_click_activate',
			'entry_code',
			'button_save',
			'button_cancel',
			'entry_type',
			'text_type_image',
			'text_type_text',
			'entry_image',
			'text_max_size',
			'text_max_size_learn',
			'text_top_left',
			'text_top_right',
			'text_center',
			'text_bottom_left',
			'text_bottom_right',
			'entry_position',
			'entry_opacity',
			'entry_text',
			'entry_current_image',
			'text_cache_delete_warning',
			'entry_image_opacity',
			'entry_text_color',
			'text_default',
			'entry_watermark_limit',
			'entry_all_images',
			'entry_bigger_than',
			'entry_smaller_than',
			'entry_font',
			'entry_font_size',
			'entry_watermark_limit_categories',
			'entry_all_categories',
			'entry_following_categories',
			'entry_watermark_limit_related',
			'entry_all_related',
			'entry_following_related',
			'entry_rotation'
		);
		foreach ($variables as $variable) $this->data[$variable] = $this->language->get($variable);
		
		$this->data['maxSize'] = $this->model_module_iwatermark->returnMaxUploadSize();
		$this->data['maxSizeReadable'] = $this->model_module_iwatermark->returnMaxUploadSize(true);
		
		$this->data['error_code'] = isset($this->error['code']) ? $this->error['code'] : '';
  		$this->data['breadcrumbs'] = array(
			array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			),
			array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			),
			array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			)
		);	
		$this->data['action'] = $this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['iWatermark'])) {
			foreach ($this->request->post['iWatermark'] as $key => $value) {
				$this->data['data']['iWatermark'][$key] = $this->request->post['iWatermark'][$key];
			}
		} else {
			$configValue = $this->model_module_iwatermark->getSetting('iwatermark');
			$this->data['data'] = $configValue;
			
		}
		
		$this->data['currenttemplate'] =  $this->config->get('config_template');
		
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('setting/store');
		$stores = array_merge(array(0 => array('store_id' => '0', 'name' => $this->config->get('config_name') . ' (' .$this->data['text_default'] . ')', 'url' => NULL, 'ssl' => NULL)), $this->model_setting_store->getStores());
		$this->data['stores'] = $stores;
		
		$this->data['fonts'] = array();
		$fontsFolder = IMODULE_ROOT.'vendors/iwatermark/font/';
		if (is_dir($fontsFolder)) {
			$fontsFolderFiles = scandir($fontsFolder);
			foreach ($fontsFolderFiles as $font) {
				if (substr($font, strripos($font, '.ttf')) == '.ttf') {
					$this->data['fonts'][] = $font;	
				}
			}
		}
		
		// Categories
		$this->load->model('catalog/category');
		$categories = array();
		
		$this->data['product_categories'] = array();
		
		foreach ($stores as $store) {
			if (!empty($this->data['data']['iWatermark'][$store['store_id']]['LimitCategoriesList'])) {
				$categories = $this->data['data']['iWatermark'][$store['store_id']]['LimitCategoriesList'];
			} else {
				$categories = array();
			}
			
			$this->data['product_categories'][$store['store_id']] = array();
			
			foreach ($categories as $category_id) {
				$category_info = $this->model_catalog_category->getCategory($category_id);
				
				if ($category_info) {
					$this->data['product_categories'][$store['store_id']][] = array(
						'category_id' => $category_info['category_id'],
						'name'        => version_compare(VERSION, '1.5.4.1', '<=') ? ($this->model_catalog_category->getPath($category_id)) : (($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name'])
					);
				}
			}
		}
		
		// Related
		$this->load->model('catalog/product');
		$products = array();
		
		$this->data['products_related'] = array();
		
		foreach ($stores as $store) {
			if (!empty($this->data['data']['iWatermark'][$store['store_id']]['LimitRelatedList'])) {
				$products = $this->data['data']['iWatermark'][$store['store_id']]['LimitRelatedList'];
			} else {
				$products = array();
			}
			
			$this->data['products_related'][$store['store_id']] = array();
			
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);
				
				if ($product_info) {
					$this->data['products_related'][$store['store_id']][] = array(
						'product_id' => $product_info['product_id'],
						'name'        => $product_info['name']
					);
				}
			}
		}
		
		$this->template = 'module/iwatermark.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		$this->load->model('setting/store');
		$stores = array_merge(array(0 => array('store_id' => '0', 'name' => '', 'url' => NULL, 'ssl' => NULL)), $this->model_setting_store->getStores());
		
		foreach ($stores as $store) {
			if (!empty($this->request->post['iWatermark'][$store['store_id']]['Enabled']) && $this->request->post['iWatermark'][$store['store_id']]['Enabled'] == 'true') {
				if (empty($this->request->post['iWatermark'][$store['store_id']]['Type'])) {
					$this->session->data['flash_error'][] = $this->language->get('error_type_empty');
					$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
				}
				
				if ($this->request->post['iWatermark'][$store['store_id']]['Type'] == 'image') {
					if (!empty($this->request->files['iWatermark']['size'][$store['store_id']]['Image'])) {
						try {
							$image = $this->model_module_iwatermark->getStandardFile($this->request->files['iWatermark'], $store['store_id']);
							$this->request->post['iWatermark'][$store['store_id']]['ImagePath'] = $image['path'];
							$this->request->post['iWatermark'][$store['store_id']]['Image'] = $image['image'];
						} catch (Exception $e) {
							$this->session->data['flash_error'][] = $e->getMessage();
							$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
						}
					}
					
					$configValue = $this->model_module_iwatermark->getSetting('iwatermark');
					if (empty($this->request->post['iWatermark'][$store['store_id']]['ImagePath']) || empty($this->request->post['iWatermark'][$store['store_id']]['Image'])) {
						$this->session->data['flash_error'][] = $this->language->get('error_image_empty');
						$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
					}
				} else if ($this->request->post['iWatermark'][$store['store_id']]['Type'] == 'text') {
					if (empty($this->request->post['iWatermark'][$store['store_id']]['Text'])) {
						$this->session->data['flash_error'][] = $this->language->get('error_text_empty');
						$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
					}
					
					if (empty($this->request->post['iWatermark'][$store['store_id']]['Font'])) {
						$this->session->data['flash_error'][] = $this->language->get('error_font_empty');
						$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
					}
					
					if (!isset($this->request->post['iWatermark'][$store['store_id']]['FontSize']) || (int)$this->request->post['iWatermark'][$store['store_id']]['FontSize'] < 8 || (int)$this->request->post['iWatermark'][$store['store_id']]['FontSize'] > 100) {
						$this->session->data['flash_error'][] = $this->language->get('error_invalid_font_size');
						$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
					}
					
					if (empty($this->request->post['iWatermark'][$store['store_id']]['Color']) || !preg_match('/[0-9a-fA-F]{6}/', $this->request->post['iWatermark'][$store['store_id']]['Color'])) {
						$this->session->data['flash_error'][] = $this->language->get('error_text_color');
						$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
					} else {
						// Convert color to RGB, so it can be used in the watermark.
						$this->request->post['iWatermark'][$store['store_id']]['ColorRGB'] = $this->model_module_iwatermark->hex2rgb($this->request->post['iWatermark'][$store['store_id']]['Color']);	
					}
				}
				
				$positions = array('top_left', 'top_right', 'center', 'bottom_left', 'bottom_right');
				if (empty($this->request->post['iWatermark'][$store['store_id']]['Position']) || !in_array($this->request->post['iWatermark'][$store['store_id']]['Position'], $positions)) {
					$this->session->data['flash_error'][] = $this->language->get('error_invalid_position');
					$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
				}
				
				$limitSizeTypes = array('all', 'bigger_than', 'smaller_than');
				if (empty($this->request->post['iWatermark'][$store['store_id']]['LimitSizeType']) || !in_array($this->request->post['iWatermark'][$store['store_id']]['LimitSizeType'], $limitSizeTypes)) {
					$this->session->data['flash_error'][] = $this->language->get('error_invalid_limit_size_type');
					$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
				}
				
				if (!isset($this->request->post['iWatermark'][$store['store_id']]['LimitSizeWidth']) || (!is_numeric($this->request->post['iWatermark'][$store['store_id']]['LimitSizeWidth']) && $this->request->post['iWatermark'][$store['store_id']]['LimitSizeWidth'] != '') || (int)$this->request->post['iWatermark'][$store['store_id']]['LimitSizeWidth'] < 0) {
					$this->session->data['flash_error'][] = $this->language->get('error_invalid_limit_size_width');
					$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
				}
				
				if (!isset($this->request->post['iWatermark'][$store['store_id']]['LimitSizeHeight']) || (!is_numeric($this->request->post['iWatermark'][$store['store_id']]['LimitSizeHeight']) && $this->request->post['iWatermark'][$store['store_id']]['LimitSizeHeight'] != '') || (int)$this->request->post['iWatermark'][$store['store_id']]['LimitSizeHeight'] < 0) {
					$this->session->data['flash_error'][] = $this->language->get('error_invalid_limit_size_height');
					$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
				}
				
				if (!isset($this->request->post['iWatermark'][$store['store_id']]['Opacity']) || (int)$this->request->post['iWatermark'][$store['store_id']]['Opacity'] < 0 || (int)$this->request->post['iWatermark'][$store['store_id']]['Opacity'] > 100) {
					$this->session->data['flash_error'][] = $this->language->get('error_invalid_opacity');
					$this->redirect($this->url->link('module/iwatermark', 'token=' . $this->session->data['token'], 'SSL'));
				}
			}
		}
	}
	
	public function autocomplete_category() {
		$json = array();
		
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');
			
			if (version_compare(VERSION, '1.5.2.1', '>')) {
				$data = array(
					'filter_name' => $this->request->get['filter_name'],
					'start'       => 0,
					'limit'       => 20
				);
			} else {
				$data = 0;
			}
			
			$results = $this->model_catalog_category->getCategories($data);
				
			foreach ($results as $result) {
				if (version_compare(VERSION, '1.5.2.1', '<=')) {
					if (stripos($result['name'], $this->request->get['filter_name']) === false) continue;
				}
				
				$json[] = array(
					'category_id' => $result['category_id'], 
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}		
		}

		$sort_order = array();
	  
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	}
	
	public function autocomplete_product() {
		$json = array();
		
		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model']) || isset($this->request->get['filter_category_id'])) {
			$this->load->model('catalog/product');
			$this->load->model('catalog/option');
			
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}
			
			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}
			
			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 20;	
			}			
						
			$data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit
			);
			
			$results = $this->model_catalog_product->getProducts($data);
			
			foreach ($results as $result) {
				
				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),	
					'model'      => $result['model'],
					'price'      => $result['price']
				);	
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>