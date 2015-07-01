<?php
class ModelCatalogCardgift extends Model {
	public function addCardgift($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "cardgift SET group_id = '" . (int)$data['group_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");

		$cardgift_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "cardgift SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE cardgift_id = '" . (int)$cardgift_id . "'");
		}

		$this->db->query("INSERT INTO " . DB_PREFIX . "cardgift_description SET cardgift_id = '" . (int)$cardgift_id . "', name = '" . $this->db->escape($data['cardgift_description']['name']) . "', description = '" . $this->db->escape($data['cardgift_description']['description']) . "' , price = '" . $this->db->escape($data['cardgift_description']['price']) . "'");

		$this->cache->delete('cardgift');
	}

	public function editCardgift($cardgift_id, $data) {
		//var_dump($cardgift_id);
		//var_dump($data); die;
		$this->db->query("UPDATE " . DB_PREFIX . "cardgift SET group_id = '" . (int)$data['group_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE cardgift_id = '" . (int)$cardgift_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "cardgift SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE cardgift_id = '" . (int)$cardgift_id . "'");
		}

		if (isset($data['cardgift_description'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "cardgift_description SET name = '" . $this->db->escape(html_entity_decode($data['cardgift_description']['name'], ENT_QUOTES, 'UTF-8')) . "', price = '" . $data['cardgift_description']['price'] . "', description = '" . $this->db->escape(html_entity_decode($data['cardgift_description']['description'], ENT_QUOTES, 'UTF-8')) . "' WHERE cardgift_id = '" . (int)$cardgift_id . "'");
		}
		
		$this->cache->delete('cardgift');
	}

	public function deleteCardgift($cardgift_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cardgift WHERE cardgift_id = '" . (int)$cardgift_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "cardgift_description WHERE cardgift_id = '" . (int)$cardgift_id . "'");

		$this->cache->delete('cardgift');
	} 

	

	public function getCardgift($cardgift_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cardgift_description cd LEFT JOIN " . DB_PREFIX . "cardgift cd2 ON (cd.cardgift_id = cd2.cardgift_id) WHERE cd2.cardgift_id = '" . (int)$cardgift_id . "'");
		//var_dump($query->row);die;//
		return $query->row;
	} 

	public function getCardgifts($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "cardgift AS cd LEFT JOIN " . DB_PREFIX . "cardgift_description cd1 ON (cd.cardgift_id = cd1.cardgift_id) "; //WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "'

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql); 

		return $query->rows;
	}


	public function checkCardgift($data) {
		$sql = "SELECT COUNT(DISTINCT cardgift_id) AS card_count FROM " . DB_PREFIX . "cardgift WHERE " . DB_PREFIX . "cardgift.group_id = '" . (int)$data['group_id'] . "' ";
		
     	$query = $this->db->query($sql); 
		$total = count((array)$query);
		$value = $query->row['card_count'];
		
		if ($value == 6 ) {
			$check_number = true; 
		} else {
			$check_number = false;
		}
		return $check_number;
	}



	public function getCardgiftDescriptions($cardgift_id) {
		$cardgift_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cardgift_description WHERE cardgift_id = '" . (int)$cardgift_id . "'");

		foreach ($query->rows as $result) {
			$cardgift_description_data = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'price'      	   => $result['price']
			);
		}
		//var_dump($cardgift_description_data); die;
		return $cardgift_description_data;
	}	

	public function getTotalCardgifts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cardgift");

		return $query->row['total'];
	}	

	public function getTotalCardgiftsByImageId($image_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cardgift WHERE image_id = '" . (int)$image_id . "'");

		return $query->row['total'];
	}		
}
?>