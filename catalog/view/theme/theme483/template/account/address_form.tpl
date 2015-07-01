<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="box-container">
	  <form class="form-horizontal content-border" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="address">
		<h2><?php echo $text_edit_address; ?></h2>
			<div class="content">
			  <div class="form">
					<div class="form-group">
						<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_firstname; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="firstname" value="<?php echo $firstname; ?>" />
							<?php if ($error_firstname) { ?>
							<span class="error help-inline"><?php echo $error_firstname; ?></span>
							<?php } ?>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_lastname; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="lastname" value="<?php echo $lastname; ?>" />
							<?php if ($error_lastname) { ?>
							<span class="error help-inline"><?php echo $error_lastname; ?></span>
							<?php } ?>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><?php echo $entry_company; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="company" value="<?php echo $company; ?>" />
						</div>
					</div>
					<?php if ($company_id_display) { ?>
						<div class="form-group">
							<label class="control-label col-sm-5" ><?php echo $entry_company_id; ?></label>
							<div class="controls col-sm-7">
								<input type="text" name="company_id" value="<?php echo $company_id; ?>" />
								<?php if ($error_company_id) { ?>
								<span class="error help-inline"><?php echo $error_company_id; ?></span>
								<?php } ?>
							</div>
						</div>
					<?php } ?>
					<?php if ($tax_id_display) { ?>
					<div class="form-group">
						<label class="control-label col-sm-5" ><?php echo $entry_tax_id; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
							<?php if ($error_tax_id) { ?>
							<span class="error help-inline"><?php echo $error_tax_id; ?></span>
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<div class="form-group">
						<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_address_1; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="address_1" value="<?php echo $address_1; ?>" />
							<?php if ($error_address_1) { ?>
							<span class="error help-inline"><?php echo $error_address_1; ?></span>
							<?php } ?>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><?php echo $entry_address_2; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="address_2" value="<?php echo $address_2; ?>" />
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_city; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="city" value="<?php echo $city; ?>" />
							<?php if ($error_city) { ?>
							<span class="error help-inline"><?php echo $error_city; ?></span>
							<?php } ?>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></label>
						<div class="controls col-sm-7">
							<input type="text" name="postcode" value="<?php echo $postcode; ?>" />
							<?php if ($error_postcode) { ?>
							<span class="error help-inline"><?php echo $error_postcode; ?></span>
							<?php } ?>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_country; ?></label>
						<div class="controls col-sm-7">
							<select name="country_id">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($countries as $country) { ?>
								<?php if ($country['country_id'] == $country_id) { ?>
								<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
							<?php if ($error_country) { ?>
							<span class="error help-inline"><?php echo $error_country; ?></span>
							<?php } ?>
						</div>
					</div>
			
					<div class="form-group">
						<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_zone; ?></label>
						<div class="controls col-sm-7">
							<select name="zone_id">
							</select>
							<?php if ($error_zone) { ?>
							<span class="error help-inline"><?php echo $error_zone; ?></span>
							<?php } ?>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-5" ><?php echo $entry_default; ?></label>
						<div class="controls col-sm-7">
							<?php if ($default) { ?>
							<label class="radio inline">
								<input type="radio" name="default" value="1" checked="checked" />
								<?php echo $text_yes; ?>
							</label>
							<label class="radio inline">
								<input type="radio" name="default" value="0" />
								<?php echo $text_no; ?>
							</label>
							<?php } else { ?>
							<label class="radio inline">
								<input type="radio" name="default" value="1" />
							<?php echo $text_yes; ?>
							</label>
							<label class="radio inline">
								<input type="radio" name="default" value="0" checked="checked" />
							<?php echo $text_no; ?>
							</label>
							<?php } ?>
						</div>
					</div>
			  </div>
			</div>
			<div class="buttons">
			  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
			  <div class="right"><a onclick="$('#address').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a></div>
			</div>
	  </form>
  </div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>

					<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/address/country&country_id=' + this.value,
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
<?php echo $footer; ?>