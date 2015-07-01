<?php 
class ModelModuleWatermark extends Model {
	public function updateWatermarkStatus($data){
		$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape($data) . "' WHERE  `key` = 'watermark_status'");	
		
		return true;
	}
	
	public function updateWatermark($data) {		
		$watermarks = array();
		
		$applied = $this->getApplySetting();
		$updated = array();
		
		foreach ($data as $watermark)
		{
			if(!isset($watermark['selected']))
				$watermarks[] =  $watermark;
			else
			{
				//unlink("../image/watermark/".$watermark['wid'].".png");
			}
		}
		
		foreach($applied as $store_id => $store)
		{
			$is_exist = false;
			
			foreach($watermarks as $watermark){
				$is_exist = ($store['watermark'] == $watermark['wid']);
			}
			
			$updated[$store_id] = array('watermark' => ($is_exist) ? $store['watermark'] : 0 , 'position' => $store['position']);
			
		}
		$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(serialize($watermarks)) . "' WHERE  `key` = 'watermark_settings'");	
		
		$this->updateApplySetting($updated);
		
		return true;
	}	
	
	public function editWatermark($data, $wid){
		$watermarks = $this->getWatermarks();
		
		$updated = array();
		foreach($watermarks as $value){
			if($value['wid'] == $wid){
				$value = array_merge(array("wid" => $wid ),$data);
			}			
			$updated[] = $value;
		}
		
		$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(serialize($updated)) . "' WHERE  `key` = 'watermark_settings'");	
		
		return true;
	}
	
	public function updateApplySetting($data)
	{
		$this->updateWatermarkStatus($data['watermark_status']);
		
		$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(serialize(array_slice($data,1,5))) . "' WHERE  `key` = 'watermark_apply'");	
		
		return true;
	}
	
	public function getApplySetting()
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = 'watermark_apply'");
		
		if($query->num_rows == 1)		
			return unserialize($query->row['value']);		
		return false;
	}
	
	public function addWatermark($watermark)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = 'watermark_settings'");
		
		if($query->num_rows == 1)
		{	
			$data = unserialize($query->row['value']);
			
			$watermark_info = $watermark;
			$watermark_id = $this->generateWatermarkId();
			
			$watermark_info['watermark_text']['font'] = ($watermark_info['watermark_text']['font'] == "Default") ? "Arial.ttf" : $watermark_info['watermark_text']['font'];
			
			$data[] = array_merge(array("wid" => $watermark_id ),$watermark_info);
			
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(serialize($data)) . "' WHERE  `key` = 'watermark_settings'");
			
			return true;
		}
		
		return false;
	}
	
	public function getWatermarks()
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = 'watermark_settings'");
		if($query->num_rows == 1)
		{
			return unserialize($query->row['value']);			
		}
		return false;
		
	}
	public function getWatermarkById($id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = 'watermark_settings'");
		if($query->num_rows == 1)
		{
			$data = unserialize($query->row['value']);			
			
			foreach ($data as $value)
			{	
				if($value['wid'] == $id)
					return $value;
			}
		}
		return false;
	}
	public function getWatermarkIds()
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `key` = 'watermark_settings'");
		if($query->num_rows == 1)
		{
			$data = unserialize($query->row['value']);			
			$key = array();
			
			foreach ($data as $value)
			{	$key["wid"] = $value['wid'];	}
				
			return $key;
		}
		return false;
	}
	
	public function generateWatermarkId()
	{
		if($ids = $this->getWatermarkIds())
		{	
			while(in_array($id = rand(1000,9999), $ids));
			
			return $id;
				
		}
		else
			return rand(1000,9999);
	}
	
	public function getManufacturersByStoreid($store_id)
	{
		$manufacturer_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer_to_store WHERE store_id = '" . (int)$store_id . "'");

		foreach ($query->rows as $result) {
			$manufacturer_store_data[] = $result['manufacturer_id'];
		}
		
		return $manufacturer_store_data;
	}
	
	public function getProductsByStore($store)
	{
		$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " .DB_PREFIX ."product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p2s.store_id = '" . $this->db->escape($store) . "'";
		
		$query = $this->db->query($sql);
		
		if($query->num_rows)
			return $query->rows;
		else
			return false;
		
	}

	public function getCategoriesByStore($store, $parent_id = 0) {
		$sql = "SELECT c.category_id, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR ' &gt; ') FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS name ,(SELECT COUNT(oc.category_id) FROM " . DB_PREFIX . "category oc WHERE oc.parent_id=c.category_id) as child_count FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . $this->db->escape($store) . "' ORDER BY c.sort_order, LCASE(cd.name)";
		
		
		echo $sql;
		
		$query = $this->db->query($sql);

		if($query->num_rows)
			return $query->rows;
		else
			return false;
	}
	
	public function clearCache($path) {
	
		if (empty($path)) return false;
		
		$files = scandir($path);
		
		foreach ($files as $file) {
		
			if (!in_array($file, array('.', '..', 'index.html'))) {
			
				if (is_file($path.'/'.$file)) unlink ($path.'/'.$file);
				
				if (is_dir($path.'/'.$file)) {
					$this->clearCache($path.'/'.$file);	
					rmdir($path.'/'.$file);
				}
			}
		}
		
	}
	
	public function uninstall(){
	
	}

	
}
?>