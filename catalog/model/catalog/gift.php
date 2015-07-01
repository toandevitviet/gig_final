<?php
class ModelCatalogGift extends Model {
	public function getProduct($product_id) {
		$query = $this->db->query("SELECT  *  FROM " . DB_PREFIX ."cardgift INNER JOIN " . DB_PREFIX . "cardgift_description    ON " . DB_PREFIX ."cardgift.cardgift_id = ". DB_PREFIX . "cardgift_description.cardgift_id WHERE " . DB_PREFIX ."cardgift_description.cardgift_id = ". $product_id .""); 
		if ($query->num_rows) {
			return array(
				'cardgift_id'             => $query->row['cardgift_id'],
				'name' 				      => $query->row['name'],
				'description'             => $query->row['description'],
				'group_id'                => $query->row['group_id'],
				'price'                   => $query->row['price'],
				'image'                   => $query->row['image']
			);
		} else {
			return false;
		}
	}
	

	public function getProductImages($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

}
?>