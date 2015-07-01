
<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>

<div class="product-info">
		<div class="row">
	<?php if ($thumb) { ?>
	<div class="col-sm-4">

	<h1 class="view"><?php echo $heading_title; ?></h1>
	
	<script type="text/javascript">
		jQuery(document).ready(function(){
		var myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
		});
	</script>
	<?php 
    
        //$url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        //echo $url . '<br>';
       if ($id_category_find == 1) {
            $find = true;
        } else {
                $find = false;
        }

    ?>
    
    <?php if( isset($find) && $find == 1 ) {?>
	<?php $i=0; if ($thumb || $images) {$i++  ?>
        <div id="full_gallery">
            <ul id="gallery">
                <?php if (!empty($thumb1)) { ?><li><a href="<?php echo $thumb1;  ?>" data-something="something" data-another-thing="anotherthing"><img src="<?php echo $thumb1; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li><?php } ?>
                <?php foreach ($images as $image) { ?>
                <li><a href="<?php echo $image['popup']; ?>" data-something="something<?php echo $i?>" data-another-thing="anotherthing<?php echo $i?>"><img src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>"  width="70" height="70"/></a></li>
                <?php } ?>
            </ul>		
	</div>	
	<?php } ?>
    <?php } else { ?>
        <?php $i=0; if ($thumb || $images) {$i++  ?>
        <div id="full_gallery">
            <ul id="gallery">
                <?php if (!empty($thumb1)) { ?><li><a href="<?php echo 'image/' . $image_product;  ?>" data-something="something" data-another-thing="anotherthing"><img src="<?php echo 'image/' . $image_product; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li><?php } ?>
                <?php foreach ($images as $image) { ?>
                <li><a href="<?php echo 'image/' . $image_product_popup; ?>" data-something="something<?php echo $i?>" data-another-thing="anotherthing<?php echo $i?>"><img src="<?php echo 'image/' . $image_product_popup; ?>" alt="<?php echo $heading_title; ?>"  width="70" height="70"/></a></li>
                <?php } ?>
            </ul>
        </div> 
    <?php }?>
    <?php } ?>

    <?php if( isset($find) && $find == 1 ) { ?>
        <?php if ($thumb || $images) { ?>
        <div id="default_gallery" class="left spacing">
            <?php if ($thumb1) { ?>
            <div class="image"> 
                <img id="zoom_01"  data-zoom-image="<?php echo $thumb1; ?>" src="<?php echo $thumb1; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
            </div>
            <?php } ?>
            <?php if ($images || $thumb1) { ?>
                <div class="image-additional">
                    <ul id="image-additional">
                        <?php if (!empty($thumb1)) { ?>
                        <li>
                            <a href="#" data-image="<?php echo $thumb1; ?>" data-zoom-image="<?php echo $thumb1; ?>">
                                    <img  src="<?php echo $thumb1; ?>" alt="" />
                            </a>
                        </li>
                        <?php } ?>
                        <?php foreach ($images as $image) { ?>
                         <li>
                            <a href="#" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
                                    <img  src="<?php echo $image['thumb']; ?>" alt="" />
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                    <div class="clear"></div>
                </div>
            <?php } ?>
        </div>
        <?php } ?>
        <?php } else { ?>        
        <?php if ($thumb || $images) { ?>
            <div id="default_gallery" class="left spacing">
                <?php if ($thumb1) { ?>
                <div class="image"> 
                        <img id="zoom_01"  data-zoom-image="<?php echo 'image/' . $image_product; ?>" src="<?php echo 'image/' . $image_product; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                </div>
                <?php } ?>
                <?php if ($images || $thumb1) { ?>
                    <div class="image-additional">
                        <ul id="image-additional">
                            <?php if (!empty($thumb1)) { ?>
                            <li>
                                <a href="#" data-image="<?php echo 'image/' . $image_product; ?>" data-zoom-image="<?php echo 'image/' . $image_product; ?>">
                                        <img  src="<?php echo 'image/' . $image_product; ?>" alt="" />
                                </a>
                            </li>
                            <?php } ?>
                            <?php foreach ($images as $image) { ?>
                             <li>
                                <a href="#" data-image="<?php echo 'image/' . $image_product_popup; ?>" data-zoom-image="<?php echo 'image/' . $image_product_popup; ?>">
                                        <img  src="<?php echo 'image/' . $image_product; ?>" alt="" />
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                        <div class="clear"></div>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>              
        <?php } ?>
        
	</div>
	<div class="col-sm-8"><?php } else { ?>
            <div class="col-sm-12"><?php } ?>
            <h1><?php echo $heading_title; ?><div style="color:#84BF49; display:inline; text-transform: capitalize;"><?php echo ' (Price: ' .  $price . ')'; ?></div></h1>
	    <div class="description-add">
                <div class="product-section">
                      <div  lass="options-add">
                  <?php if ($options) { ?>
                       <div class="options">
                             <h2><?php echo $text_option; ?></h2>
                             <?php foreach ($options as $option) { ?>
                             <?php if ($option['type'] == 'select') { ?>
                             <div id="option-<?php echo $option['product_option_id']; ?>" class="option-add">
                               <label><?php echo $option['name']; ?>:</label>
                               <select name="option[<?php echo $option['product_option_id']; ?>]">
                                     <option value=""><?php echo $text_select; ?></option>
                                     <?php foreach ($option['option_value'] as $option_value) { ?>
                                     <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                     <?php if ($option_value['price']) { ?>
                                     (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                     <?php } ?>
                                     </option>
                                     <?php } ?>
                               </select>
                             </div>
                             <?php } ?>

                             <?php if ($option['type'] == 'text') { ?>
                             <div id="option-<?php echo $option['product_option_id']; ?>" class="option-add">
                               <label><?php if ($option['required']) { ?>
                               <span class="required">*</span>
                               <?php } ?>
                               <?php echo $option['name']; ?>:</label>
                               <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                             </div>
                             <?php } ?>
                             
                             <?php } ?>
                       </div>
                       <?php } ?>
                      </div>
                </div>

                <input class="q-mini" type="hidden" name="product_id"  value="<?php echo $product_id; ?>" />
                <div class="cart">
                             <div class="prod-row">
                                     <div class="cart-top-custom2">
                                             <div class="cart-top-padd form-inline">
                                             <a id="button-cart" class="button-prod" ><i class="fa fa-shopping-cart"></i><span><?php echo $button_cart; ?></span></a>
                                             </div>
                                     </div>
                             </div>
                     </div>
                     <div class="clear"></div>
             </div>          
            </div>
        </div>
	<div class="tabs">
		<div class="tab-heading-add">
			<?php echo $tab_description; ?>
		</div>
		<div class="tab-content-add">
			<?php echo $description; ?>
		</div>
	</div>
	  
  </div>
  
  <?php echo $content_bottom; ?></div>
 
<!--right add-->
	<div class="right-add">
		<aside class="col-sm-3" id="column-right">		
			<div class="box specials">
				<div class="box-heading-custom special-heading">other Products</div>
					<div class="box-content">						
						<ul class="acount">			              
			              <?php foreach($category_custom as $item) {
			               if($item['category_type'] == 'card') : ?>  
						  <li><a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a></li>
			              <?php endif; } ?>		
						</ul>
					</div>
				<div class="clear"></div>
			</div>

			<!--product-->

			<?php if(isset($randomproduct)) : ?>
            <?php //echo "<pre>"; var_dump($randomproduct);  ?>
            
			<div class="box specials">
				<div class="box-heading-custom-1 special-heading">Shop now !</div>
					<div class="box-content">	
					<?php 
						$i = 0;
						foreach($randomproduct as $key => $row){
    						if(++$i > 2) break;
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
	</div> <!-- end right-->

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript"><!--
  
  $('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
  
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
				if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span><i class="fa fa-times-circle"></i></span></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				$('#cart-total2').html(json['total']);
				$('#cart').load('index.php?route=module/cart #cart > *');
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
			setTimeout(function() {$('.success').fadeOut(1000)},3000)
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/theme483/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/theme483/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>