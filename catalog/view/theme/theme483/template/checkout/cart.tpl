<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-12<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?>
	<?php //if ($weight) { ?>
	<!-- &nbsp;(<?php //echo $weight; ?>) -->
	<?php //} ?>
  </h1>
  <?php if ($attention) { ?>
  <div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/theme483/image/remove-small.png" alt="" class="close" /></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?><img src="catalog/view/theme/theme483/image/remove-small.png" alt="" class="close" /></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/theme483/image/remove-small.png" alt="" class="close" /></div>
  <?php } ?>
  <form id="form-cart" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<div class="cart-info">
	  <div class="shop-cart">
	  <table class="table table-bordered ">
		<thead>
		  <tr>
			<td class="image"><?php echo $column_image; ?></td>
			<td class="name"><?php echo $column_name; ?></td>
			
			<td class="quantity"><?php echo $column_quantity; ?></td>
			<td class="price-td"><?php echo $column_price; ?></td>
			<td class="total-td" style="border-right:none;"><?php echo $column_total; ?></td>
		  </tr>
		</thead>
  
		<tbody>
		  <?php foreach ($products as $product) { ?>
			<?php if(!empty($product['recurring'])): ?>
			  <tr>
				  <td colspan="6" style="border:none;"><image src="catalog/view/theme/theme483/image/reorder.png" alt="" title="" style="float:left;" /><span style="float:left;line-height:18px; margin-left:10px;"> 
					  <strong><?php echo $text_recurring_item ?></strong>
					  <?php echo $product['profile_description'] ?>
				  </td>
				</tr>
			<?php endif; ?>
		  <tr>
			<td class="image"><?php if ($product['thumb']) { ?>
			  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" width="46" height="46" /></a>
			  <?php } ?></td>
			<td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			  <?php if (!$product['stock']) { ?>
			  <span class="stock">***</span>
			  <?php } ?>
			  <div>
				<?php foreach ($product['option'] as $option) { ?>
				- <small class="custom_fff"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
				<?php } ?>
				<?php if (!empty($product['recurring'])): ?>
				- <small class="custom_fff"><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
				<?php endif; ?>
			  </div>
			  <?php if ($product['reward']) { ?>
			  <small><?php echo $product['reward']; ?></small>
			  <?php } ?></td>
			
			<!-- <td class="price"><?php //echo $product['quantity']; ?>  </td> -->

			<td class="quantity"><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
			<div class="wrapper mt5">
			  <a class="input-update" onClick="document.getElementById('form-cart').submit()" ><i class=" fa fa-refresh"></i></a>
			  &nbsp;<a href="<?php echo $product['remove']; ?>"><i class="fa fa-trash-o-o"></i></a>
			  </div>
			</td>
			<td class="price"><?php echo $product['price']; ?></td>
			<td class="total"><?php echo $product['total']; ?></td>
		  </tr>
		  <?php } ?>
		  <?php foreach ($vouchers as $vouchers) { ?>
		  <tr>
			<td class="image"></td>
			<td class="name"><?php echo $vouchers['description']; ?></td>
			<td class="model"></td>
			<td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
			  &nbsp;<div class="wrapper mt5"><a href="<?php echo $vouchers['remove']; ?>"><i class="fa fa-trash-o-o"></i></a></div></td>
			<td class="price"><?php echo $vouchers['amount']; ?></td>
			<td class="total"><?php echo $vouchers['amount']; ?></td>
		  </tr>
		  <?php } ?>
		</tbody>
	  </table>
		  </div>
	</div>
  </form>
 
  <div class="cart-bottom">
	<div class="cart-total">
	<table id="total" class="table table-bordered">
	  <?php $count =0; foreach ($totals as $total) { $count +=1; if ($total == end($totals)) {$a='last';} else {$a='';} ?>
	  <tr class="row-table-<?php echo $count; ?>">
		<td class="right cart-total-name <?php echo $a;?>" ><b><?php echo $total['title']; ?>:</b></td>
		<td class="right cart-total1 <?php echo $a;?>"><?php echo $total['text']; ?></td>
	  </tr>
	  <?php } ?>
	</table>
  </div>
	<div class="buttons">
	<div class="right"><a href="<?php echo $checkout; ?>" class="button-cont-right"><?php echo $button_checkout; ?><i class="fa fa-check"></i></a></div>
	<div class="center"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_shopping; ?><i class="fa fa-arrow-circle-right"></i></a></div>
  </div>
  </div>
  <?php echo $content_bottom; ?></div>

<?php //echo $column_right; ?>

<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});

<?php if ($next == 'coupon') { ?>
$('#use_coupon').trigger('click');
<?php } ?>
<?php if ($next == 'voucher') { ?>
$('#use_voucher').trigger('click');
<?php } ?>
<?php if ($next == 'reward') { ?>
$('#use_reward').trigger('click');
<?php } ?>
<?php if ($next == 'shipping') { ?>
$('#shipping_estimate').trigger('click');
<?php } ?>
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/theme483/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/theme483/image/close-1.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio table table-bordered table-hover">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '600px',
					height: '400px',
					href: false,
					html: html
				});
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/theme483/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}
	
					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
<?php echo $footer; ?>