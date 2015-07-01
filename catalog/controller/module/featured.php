<?php
class ControllerModuleFeatured extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured'); 

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$products = explode(',', $this->config->get('featured_product'));	
                
        $this->language->load('information/contact');
        
        $this->data['text_location'] = $this->language->get('text_location');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_telephone'] = $this->language->get('text_telephone');
		$this->data['text_fax'] = $this->language->get('text_fax');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_tel'] = $this->language->get('entry_tel');
        $this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
//		$this->data['entry_captcha'] = $this->language->get('entry_captcha');

		$this->data['text_email'] = $this->language->get('text_email');

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
                
                if (isset($this->error['tel'])) {
			$this->data['error_tel'] = $this->error['tel'];
		} else {
			$this->data['error_tel'] = '';
		}
                
                if (isset($this->error['company'])) {
			$this->data['error_company'] = $this->error['company'];
		} else {
			$this->data['error_company'] = '';
		}                
                		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}		

		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}		

                $this->data['action'] = $this->url->link('common/home');
                
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} else {
			$this->data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['tel'])) {
			$this->data['tel'] = $this->request->post['tel'];
		} else {
			$this->data['tel'] = $this->customer->getTel();
		}
                
		if (isset($this->request->post['company'])) {
			$this->data['company'] = $this->request->post['company'];
		} else {
			$this->data['company'] = $this->customer->getCompany();
		}
                
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['enquiry'])) {
			$this->data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		//Get random home page later
		//$products = array_slice($products, 0, (int)$setting['limit']);
		
		// $randoms = $this->model_catalog_product->getRandomProduct_limit3();
		// //echo '<pre>'; var_dump($randoms); die;
		// foreach ($randoms as $random) {
		// 	$this->data['products'][] = array(
		// 				'product_id'  => $random['product_id'],
		// 				'thumb'   	  => $random['image'],
		// 				'name'    	  => $random['name'],
		// 				'special' 	  => $random['spical_value'],
		// 				'description' => strip_tags(html_entity_decode($random['description'], ENT_QUOTES, 'UTF-8')),
		// 				'price' 	  => $random['price'],
		// 				'href'    	  => $this->url->link('product/product', 'product_id=' . $random['product_id'])
		// 			);
		// 	}

		//var_dump($this->data['products']); 


		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
                    
                    'image_root'   	 => $product_info['image'],
				);
			}
		}
        
        
         //find category and check set
		   $product_info_category = $this->model_catalog_product->getCategories($product_id);

		   $cate = array();
		   $findId = '';
		   foreach ($product_info_category as $key) {
				# category_id
				array_push($cate, $key['category_id']);
		   }
		   //var_dump($cate); 
		   if (in_array(59, $cate))
			 {
				  $findId = 1;
			 }
		   else
			 {
				  $findId = 0;
			 }

		   $this->data['id_category_find'] = $findId;
           
           

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();              
                
                
        /* Check if form has been submitted */
        if( isset($_POST['submit_home']) )
        {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->hostname = $this->config->get('config_smtp_host');
            $mail->username = $this->config->get('config_smtp_username');
            $mail->password = $this->config->get('config_smtp_password');
            $mail->port = $this->config->get('config_smtp_port');
            $mail->timeout = $this->config->get('config_smtp_timeout');				
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->request->post['email']);
            $mail->setSender($this->request->post['name']);

            //content contact home
            $content = "";
            $content .="Dear Admin," . "\n";
            $content .="You have received a message from " . $this->request->post['name'] . ". \n";
			$content .="Name: " . $this->request->post['name'] . "\n";
			$content .="Email: " . $this->request->post['email'] . "\n";
			$content .="Tel: " . $this->request->post['tel'] . "\n";
			$content .="Company: " . $this->request->post['company'] . "\n";
			$content .="Message: " . $this->request->post['enquiry'] . "\n";

            $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), 'You have received a new enquiry'), ENT_QUOTES, 'UTF-8'));
            $mail->setText(strip_tags(html_entity_decode($content, ENT_QUOTES, 'UTF-8')));
            $mail->send();
            $this->redirect($this->url->link('information/contact/success'));
        }
	}
}
?>