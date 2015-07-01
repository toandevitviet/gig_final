<?php
class ModelToolImage extends Model {
	/**
	*	
	*	@param filename string
	*	@param width 
	*	@param height
	*	@param type char [default, w, h]
	*				default = scale with white space, 
	*				w = fill according to width, 
	*				h = fill according to height
	*	
	*/
	public function resize($filename, $width, $height, $type = "") {
		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		} 
		
		$info = pathinfo($filename);
		
		$extension = $info['extension'];
		
		$old_image = $filename;
		$new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . $type .'_' . $this->config->get('config_store_id') . '.' . $extension;
		
		if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
			$path = '';
			
			$directories = explode('/', dirname(str_replace('../', '', $new_image)));
			
			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				
				if (!file_exists(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}		
			}

			list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);

			if (1==1) {
				$image = new Image(DIR_IMAGE . $old_image);
				$image->resize($width, $height, $type);
				// iWatermark - from iwatermark.xml vqmod file
				$this->load->model('module/iwatermark');
				$iWatermarkSetting = $this->model_module_iwatermark->getSetting('iwatermark');
				if (!empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]) && $iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['Enabled'] == 'true') {
					$extra_conditions = array();
					
					if (!empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitCategories']) && $iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitCategories'] == 'specific' && !empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitCategoriesList'])) {
						$extra_conditions[] = 'p2c.category_id IN (' . implode(',', $iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitCategoriesList']) . ')';
					}
					
					if (!empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitRelated']) && $iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitRelated'] == 'specific' && !empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitRelatedList'])) {
						$extra_conditions[] = 'p.product_id IN (' . implode(',', $iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitRelatedList']) . ')';
					}
				
					$inProducts = $this->db->query('(SELECT image FROM ' . DB_PREFIX . 'product p JOIN ' . DB_PREFIX . 'product_to_category p2c ON (p.product_id = p2c.product_id) WHERE p.image="' . $filename . '"' . (!empty($extra_conditions) ? ' AND (' . implode(' OR ', $extra_conditions) . ')' : '') . ') UNION (SELECT image FROM ' . DB_PREFIX . 'product_image p JOIN ' . DB_PREFIX . 'product_to_category p2c ON (p.product_id = p2c.product_id) WHERE p.image="' . $filename . '"' . (!empty($extra_conditions) ? ' AND (' . implode(' OR ', $extra_conditions) . ')' : '') . ')');
					
					if ($inProducts->num_rows > 0) {
						$imageConfig = array(
							'ConfigWidth' => $this->config->get('config_image_popup_width'),
							'ConfigHeight' => $this->config->get('config_image_popup_height')
						);
						$iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')] = array_merge($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')], $imageConfig);
						//echo '<pre>'; print_r($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]); exit;
						if ($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeType'] == 'all' || 
							(
								$iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeType'] == 'bigger_than' && 
								(
									(int)trim($width) > (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeWidth']) && empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeHeight']) || 
									(int)trim($height) > (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeHeight']) && empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeWidth']) || 
									(int)trim($width) > (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeWidth']) && (int)trim($height) > (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeHeight'])
								)
							)
							||
							(
								$iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeType'] == 'smaller_than'  && 
								(
									(int)trim($width) < (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeWidth']) && empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeHeight']) || 
									(int)trim($height) < (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeHeight']) && empty($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeWidth']) || 
									(int)trim($width) < (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeWidth']) && (int)trim($height) < (int)trim($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]['LimitSizeHeight'])
								)
							)
						) {
							$image->iWatermark($iWatermarkSetting['iWatermark'][$this->config->get('config_store_id')]);
						}
					}
				}
				// end from iwatermark.xml
				$image->save(DIR_IMAGE . $new_image);
			} else {
				copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
			}
		}
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {
			return $this->config->get('config_url') . 'image/' . $new_image;
		}	
	}
}
?>