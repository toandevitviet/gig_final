<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1 class="style-1"><?php echo $heading_title; ?></h1>
  <?php if(count($categories) > 0) : ?>
    <div class="line-about"></div>
  <?php endif; ?>
  <?php 
    $advs = array();
    foreach($category_custom as $item) { 
            if($item['category_type'] == 'advs') {
            array_push($advs, $item['category_id']);
      }
    }
  if ((isset($this->request->get['path'])) && (in_array($this->request->get['path'] , $advs))) {
  ?>
	<?php if ($thumb || $description) { ?>
            <div class="category-info">
                  <?php if ($thumb) { ?>
                  <div class="image">
                      <img src="<?php echo 'image/' . $image_category; //echo $thumb; ?>" alt="<?php echo $heading_title; ?>" width="873" height="310"  style="
              margin-bottom: 20px; margin-top: 10px;"/></div>
                  <?php } ?>
                  <?php if ($description) { ?>
                        <?php echo $description; ?>
                  <?php } ?>
            </div>	
            <?php } ?>
        </div>
	<!--right add-->
	<div class="right-add">
		<aside class="col-sm-3" id="column-right">
      <?php if(isset($category_custom)) : ?>		
			<div class="box specials">
				<div class="box-heading-custom-near special-heading">Our other products</div>
					<div class="box-content">						
						<ul class="acount">
            <!-- <li><?php //echo $this->request->get['route']; ?></li> -->
              <?php foreach($category_custom as $item) { 
                if($item['category_type'] == 'advs') :
              ?>  
							   <li><a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a></li>
              <?php endif; } ?>		
						</ul>
					</div>
				<div class="clear"></div>
			</div>
      <?php  endif; ?>

			<div class="box man info">
				<div class="box-content">
					<div class="box-query-info">
              <a href=<?php HTTP_SERVER;?>"index.php?route=information/contact" alt="Contact us" style="margin-top:15px">    
						<div class="img-icon">
              <img src="<?php echo $this->config->get('config_url');?>catalog/view/theme/theme483/image/phone.png" width="58px" height="58px" />
						</div>
						<div class="content-query">
							Submit your Enquiries HERE!
						</div>
            </a>
					</div>
				</div>				
			</div>	
		</aside>
	</div>

	<?php
  } // end advs        
  //gift page
  elseif((isset($this->request->get['path'])) && ($this->request->get['path'] =='70')) {
  ?>
	<?php if ($thumb || $description) { ?>
  <div class="category-info">
	<?php if ($thumb) { ?>
	<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" width="873" height="310" /></div>
	<?php } ?>
	<?php if ($description) { ?>
	<?php echo $description; ?>	
  <!--begin one section-->   
  <div id="G199" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-1">Below $200</div>
      <div class="box-content">
          <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 1 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                              <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach; ?>           
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->   

    <!--begin one section-->
      
      <div id="G399" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-2">
         $200- $399
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 2 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


   <!--begin one section-->
      
      <div id="G599" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-3">
         $400- $599 
      </div> 
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 3 ) {  ?>
                <?php //echo "<pre>"; var_dump($gift);?> 
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->

    <!--begin one section-->
      
      <div id="G799" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-4">
         $600- $799
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 4 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>          
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
      
      <div id="G999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-5">
         $800- $999
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 5 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>              
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
      
      <div id="G1299" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-6">
         $1000- $1299
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 6 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>          
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


   <!--begin one section-->
      
      <div id="G1599" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-7">
         $1300 - $1599
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 7 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
      
      <div id="G1899" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-8">
         $1600 - $1899
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 8 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>             
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->



    <!--begin one section-->
      
      <div id="G2199" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-9">
         $1900 - $2199
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <?php //var_dump($products);?> 
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 9 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>             
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


     <!--begin one section-->
      
      <div id="G2499" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-10">
         $2200 - $2499
      </div>
      <div class="box-content">
          <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 10 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G2999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-11">
        $2500 - $2999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 11 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->



    <!--begin one section-->
	<div id="G3499" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-12">
        $3000 - $3499
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 12 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G3999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-13">
        $3500 - $3999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 13 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G4499" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-14">
        $4000 - $4499
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 14 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G4999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-15">
        $4500 - $4999
      </div>
      <div class="box-content">
       <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 15 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G5499" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-16">
        $5000 - $5499
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 16 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G5999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-17">
         $5500 - $5999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 17 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G6499" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-18">
        $6000 - $6499
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 18 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G6999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-19">
        $6500 - $6999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 19 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G7999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-20">
       $7000 - $7999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 20 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G8999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-21">
        $8000 - $8999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 21 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->

    <!--begin one section-->
	<div id="G9999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-22">
         $9000 - $9999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 22 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G11999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-23">
        $10000 - $11999
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 23 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>

        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->


    <!--begin one section-->
	<div id="G12999" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-24">
        $12000 - $12999
      </div>
      <div class="box-content">
       <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 24 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>
        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price--> 


    <!--begin one section-->
	<div id="G13000" class="box featured">
      <div class="box-heading-gift row col-sm-12 color-25">
        $13000 and above voucher is negotiable
      </div>
      <div class="box-content">
        <div class="box-product-custom">
            <ul class="row">
                <?php foreach ($gifts as $gift) : ?>
                <?php 
                if ($gift['gift'] == 25 ) { ?>
                <li class="first-in-line last_line col-sm-2 custom-product-more">
                  <div class="padding bgitems">
                    <!-- Product image -->
                    <div class="product_image image2"> <!--index.php?route=product/gift&amp;path=70&amp;product_id=-->
                      <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>">
                        <img id="img_<?php echo $gift['cardgift_id']; ?>" class="img_gift_page" src="image/<?php echo $gift['image']; ?>" title="<?php echo $gift['name']; ?>" alt="<?php echo $gift['name']; ?>" />
                      </a>
                    </div><!-- Product quick view -->
                    <div class="quick-view1 preview cleanuphtml-1">
                      <h2 class="h2-gift-page">
                        <a style="color:#31353d; font-size:14px; " href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>"> 
                        <?php echo substr($gift['name'], 0, 30); ?>
                        </a>
                      </h2>

                      <?php if ($gift['price']) { ?>
                        <div class="product_price">
                          <div class="price_custom_gif">
                             <div style="color:#84BF49; display:inline; font-size: 16px; text-transform: capitalize;"><?php echo '(Worth: $' . $gift['price'] . ')'; ?></div>
                          </div>
                        </div>
                        <?php } ?>

                      <div class="product_button_custom">
                        <div class="gift">
                            <a href="index.php?route=product/gift&amp;path=70&amp;product_id=<?php echo intval($gift['cardgift_id']); ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to gift"><span class="over"></span>
                              <i class="fa fa-gift"></i>
                            </a>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </li>
                <?php } ?>
                <?php endforeach;?>            
              </ul>
            </div>

        <div class="clear"></div>
      </div>
    </div><!-- finish one section group price-->

    <div class="clear"></div>

	<?php } ?>
  </div>
	
  <?php } ?>
</div>
<?php //echo $column_right; ?>
	<!--right add-->
	<div class="right-add">
		<aside class="col-sm-3" id="column-right">	
    <?php if(isset($randomproduct)) : ?>	
			<div class="box specials">
      <div class="box-heading-custom special-heading"><a href="#">Shop now</a></div>
					<div class="box-content">	
          <?php 
            $i = 0;
            foreach($randomproduct as $key => $row){ //echo "<pre>"; var_dump($row);
                if(++$i > 3) break;
          ?>          
          <li class="first-in-line last_line col-sm-12 right-list">
            <div class="product_image image2">
              <a href="<?php echo $row['href'];?>">

              <?php if ($row['thumb']) { ?><img id="img_<?php echo $row['product_id']; ?>" src=<?php HTTP_SERVER;?> "<?php echo $row['thumb']; ?>" width="270" height="264" alt="<?php echo $row['name']; ?>" /><?php } else { ?><img src="catalog/view/theme/theme483/image/no-image.png" alt="" /><?php } ?>
              </a>
            </div>
            <div class="inner maxheight-feat" style="height: 140px;margin: 22px;">
              <div class="f-left">          
                <div class="product_name name"><a href="<?php echo $row['href'];?>"><?php echo $row['name']; ?></a></div>
                <div class="product_description description"><?php echo substr($row['description'],0,100); ?>...</div>
                <div class="product_price">
                  <div class="price">
                    $<?php echo $row['price'];?>  
                  </div>
                </div>
              </div>        
              <div class="product_rating rating"></div>
              <div class="clear"></div>
              <div class="product_button" style="float: right;margin-right: -22px;margin-top: 40px;">
                <div class="cart">
                  <a data-id="<?php echo $row['product_id']; ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to Cart"><span class="over"></span><span class="over"></span>
                    <i class="fa fa-shopping-cart"></i>
                  </a>
                </div>
              </div>
              <div class="clear"></div>
            </div>
            <div class="clear"></div>
          </li> 
          <?php } ?>
					</div>
				<div class="clear"></div>
			</div>	
      <?php endif; ?>		
		</aside>
	</div>


<?php 
 }
	else {

   ?>
  <div class="ecom-cate">
	   	<?php if ($description) { ?>
			<?php echo $description; ?>
		<?php } ?>
	</div>

  <!--begin category custom sub category-->
  <?php if ($categories) { ?>
  <div class="categori-cate">
    <div class="tab-heading-add-add">
      Categories    
    </div>

    <div class="product-grid">
      <ul class="row">
      <?php $i=0;?>
        <?php foreach ($categories as $category) { $i++; ?>
        <?php 
            if ($i%4==1) {
              $a='first-in-line';
            }
            elseif ($i%4==0) {
              $a='last-in-line';
            }
            else {
              $a='';
            }
          ?>
        <script type="text/javascript">
            if ($('body').width() > 767) {
            (function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
            $(window).load(function(){
            if($(".subcatname").length){
            $(".subcatname").equalHeights()}
            });
          };
        </script>
          <li class="col-sm-3 prod custom-li"> <!--prod-->
          <div class="padding">
            <div class="image">
              <a href="<?php echo $category['href']; ?>">
                <img src="<?php echo 'image/' . $category['image']; ?>" alt="<?php echo $category['name']; ?>"  width="270" height="210" /></a>
            </div>
            <div class="name subcatname">
              <a href="<?php echo $category['href']; ?>">
                <?php echo substr($category['name'], 0, 40); ?>
              </a>
            </div>
          </div>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div> 
  <?php } ?>
  <!--end comment category before-->

  


  <div class="product-filter">
		<div class="sort"><b><?php echo $text_sort; ?></b>
	  <select onchange="location = this.value;">
		<?php foreach ($sorts as $sorts) { ?>
		<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
		<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
		<?php } else { ?>
		<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
		<?php } ?>
		<?php } ?>
	  </select>
	</div>
	<div class="limit"><b><?php echo $text_limit; ?></b>
	  <select onchange="location = this.value;">
		<?php foreach ($limits as $limits) { ?>
		<?php if ($limits['value'] == $limit) { ?>
		<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
		<?php } else { ?>
		<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
		<?php } ?>
		<?php } ?>
	  </select> 
	</div>

  </div>
  <!-- product of categories-->
  <div class="product-grid">
	<ul class="row">
		<?php $i=0; foreach ($products as $product) { $i++; ?>
		<?php 
			if ($i%3==1) {
				$a='first-in-line';
			}
			elseif ($i%3==0) {
				$a='last-in-line';
			}
			else {
				$a='';
			}
		?>
		<li class="col-sm-4 prod <?php echo $a?>">
		<div class="padding">
     
		<div class="image"><a href="<?php echo $product['href']; ?>"><?php if ($product['thumb']) { ?><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /><?php } else{ ?><img src="catalog/view/theme/theme483/image/no-image.png" alt="" /><?php } ?></a>
		</div>
	
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		<div class="description"><?php echo $product['description']; ?></div>
		<div class="description1"><?php echo mb_substr($product['description'],0,59,'UTF-8').'...';?></div>
		<?php if ($product['price']) { ?>
			<div class="product_price">
			<div class="price">
				<?php if ($product['tax']) { ?>
					<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
				<?php if (!$product['special']) { ?>
					<?php echo $product['price']; ?>
				<?php } else { ?><span class="price-new"><?php echo $product['special']; ?></span> 
				<?php } ?>
			</div>
			</div>
		<?php } ?>
		<div class="product_name">
			<div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="tooltip-1 button" title="<?php echo $button_cart; ?>"><i class="fa fa-shopping-cart"></i></a></div>
		</div>
		
		<div class="rating">
		</div>
		
		</div>
	</li>
		<?php } ?>
	 </ul>
  </div>
  
  <!-- <div class="pagination"><?php //echo $pagination; ?></div> -->
  <?php //}   ?>
  <?php if (!$categories && !$products) { ?>
  <div class="box-container">
	  <div class="content"><?php echo $text_empty; ?></div>
	  <div class="buttons">
		<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
	  </div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

<?php //echo $column_right; ?>

<!--product-->
<!--right-->
<div class="right-add">
	<aside class="col-sm-3" id="column-right">		
		<?php if(isset($randomproduct)) : ?>  
      <div class="box specials">
      <div class="box-heading-custom-2 special-heading">You may also like...</div>
          <div class="box-content"> 
          <?php 
            $i = 0;
            foreach($randomproduct as $key => $row){ //echo "<pre>"; var_dump($row);
                if(++$i > 3) break;
          ?>          
          <li class="first-in-line last_line col-sm-12 right-list">
            <div class="product_image image2">
              <a href="<?php echo $row['href'];?>">

              <?php if ($row['thumb']) { ?><img id="img_<?php echo $row['product_id']; ?>" src="<?php echo $row['thumb']; ?>" width="270" height="264" alt="<?php echo $row['name']; ?>" /><?php } else { ?><img src="catalog/view/theme/theme483/image/no-image.png" alt="" /><?php } ?>
              </a>
            </div>
            <div class="inner maxheight-feat" style="height: 140px;margin: 22px;">
              <div class="f-left">          
                <div class="product_name name"><a href="<?php echo $row['href'];?>"><?php echo $row['name']; ?></a></div>
                <div class="product_description description"><?php echo substr($row['description'],0,100); ?>...</div>
                <div class="product_price">
                  <div class="price">
                    $<?php echo $row['price'];?>  
                  </div>
                </div>
              </div>        
              <div class="product_rating rating"></div>
              <div class="clear"></div>
              <div class="product_button" style="float: right;margin-right: -22px;margin-top: 40px;">
                <div class="cart">
                  <a data-id="<?php echo $row['product_id']; ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to Cart"><span class="over"></span><span class="over"></span>
                    <i class="fa fa-shopping-cart"></i>
                  </a>
                </div>
              </div>
              <div class="clear"></div>
            </div>
            <div class="clear"></div>
          </li> 
          <?php } ?>
          </div>
        <div class="clear"></div>
      </div>  
      <?php endif; ?>   
	</aside>
</div>
<!--right-->


<?php } //} ?>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid ').attr('class', 'product-list');
		$('.product-list ul').removeClass('row');
		$('.product-list ul li.prod').removeClass('col-sm-4');
		$('.product-list ul li.prod').each(function(index, element) {
			html = '';
				html += '<div class="row">';
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image col-sm-4">' + image + '</div>';
			}
			html += '<div class="left col-sm-8">';
				html += '<div class="name">' + $(element).find('.name').html() + '</div>';
				html += '<div class="description1">' + $(element).find('.description1').html() + '</div>';
				html += '<div class="description">' + $(element).find('.description').html() + '</div>';
				var price = $(element).find('.price').html();
				if (price != null) {
					html += '<div class="price">' + price  + '</div>';
				}
				
				html += '<div class="product_button">';
				html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
				html += '<div class="clear">' + $(element).find('.clear').html() + '</div>';
				html += '</div>';
				
				var rating = $(element).find('.rating').html();			
				if (rating != null) {
					html += '<div class="rating">' + '' + '</div>';
				}
				
				html += '</div></div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <div id="list_b"><i class="fa fa-list"></i></div> <a id="grid_a" onclick="display(\'grid\');"><i class="fa fa-th"></i></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		$('.product-grid ul').addClass('row');
		$('.product-grid ul li.prod').addClass('col-sm-4');
		$('.product-grid ul li.prod').each(function(index, element) {
			html = '';
					
			var image = $(element).find('.image').html();
			
			html += '<div class="padding">';
			
			if (image != null) {	
				html += '<div class="image">' + image + '</div>';
			}
			
			if ($('body').width() > 767) {
				(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
				$(window).load(function(){
				if($(".maxheight-cat").length){
				$(".maxheight-cat").equalHeights()}
				});
			};
			
			html += '<div class="left maxheight-cat">';
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description1">' + $(element).find('.description1').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			if (price != null) {
				html += '<div class="product_price"><div class="price">' + price  + '</div></div>';
			}
			var rating = $(element).find('.rating').html();	
			html += '<div class="rating">' + '' + '</div>';
			html += '<div class="clear">' + $(element).find('.clear').html() + '</div>';
			
			html += '<div class="product_button">';
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';						
			html += '</div>';
			
			html += '<div class="clear">' + $(element).find('.clear').html() + '</div>';
			html += '</div></div>';
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a id="list_a" onclick="display(\'list\');"><i class="fa fa-list"></i></a>  <div id="grid_b"><i class="fa fa-th"></i></i></div>');
		
		$.totalStorage('display', 'grid');
	}
	if ($('body').width() > 940) {
	// tooltip demo
		$('.tooltip-toggle').tooltip({
		selector: "a[data-toggle=tooltip]"
		})
		$('.tooltip-1').tooltip({
			placement:'bottom'
		})
		$('.tooltip-2').tooltip({
			placement:'top'
		})
		}
	
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 

<?php echo $footer; ?>