<?php echo $header; ?>
<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1 class="style-1"><?php echo $heading_title; ?></h1>
  <div class="box-container">
	<?php echo $text_description; ?>
	<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return">
	
	<div class="content content-border">
		<h2><?php echo $text_order; ?></h2>
		<div class="form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_firstname; ?></label>
			<div class="col-sm-7">
				<input type="text" name="firstname" value="<?php echo $firstname; ?>"  />
				<?php if ($error_firstname) { ?>
				<span class="error help-block"><?php echo $error_firstname; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_lastname; ?></label>
			<div class="col-sm-7">
				<input type="text" name="lastname" value="<?php echo $lastname; ?>"  />
				<?php if ($error_lastname) { ?>
				<span class="error help-block"><?php echo $error_lastname; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_email; ?></label>
			<div class="col-sm-7">
				<input type="text" name="email" value="<?php echo $email; ?>"  />
				<?php if ($error_email) { ?>
				<span class="error help-block"><?php echo $error_email; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_telephone; ?></label>
			<div class="col-sm-7">
				<input type="text" name="telephone" value="<?php echo $telephone; ?>"  />
				<?php if ($error_telephone) { ?>
				<span class="error help-block"><?php echo $error_telephone; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_order_id; ?></label>
			<div class="col-sm-7">
				<input type="text" name="order_id" value="<?php echo $order_id; ?>"  />
				<?php if ($error_order_id) { ?>
				<span class="error help-block"><?php echo $error_order_id; ?></span>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-5" ><?php echo $entry_date_ordered; ?></label>
			<div class="col-sm-7">
				<input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="col-sm-4 date" />
			</div>
		</div>
	</div>
	
	<div id="return-product">
	  <div class="content  content-border">
		<h2><?php echo $text_product; ?></h2>
		<div class="return-product">
		  <div class="return-name form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <b><?php echo $entry_product; ?></b></label>
			<div class="col-sm-7">
				<input type="text" name="product" value="<?php echo $product; ?>"  />
				<?php if ($error_product) { ?>
				<span class="error help-block"><?php echo $error_product; ?></span>
				<?php } ?>
			</div>
		  </div>
		  <div class="return-model form-group">
			<label class="control-label col-sm-5" ><span class="required">*</span> <b><?php echo $entry_model; ?></b></label>
			<div class="col-sm-7">
				<input type="text" name="model" value="<?php echo $model; ?>"  />
				<?php if ($error_model) { ?>
				<span class="error help-block"><?php echo $error_model; ?></span>
				<?php } ?>
			</div>
		  </div>
		  <div class="return-quantity form-group">
			<label class="control-label col-sm-5" ><b><?php echo $entry_quantity; ?></b></label>
			<div class="col-sm-7">
				<input type="text" name="quantity" value="<?php echo $quantity; ?>"  />
			</div>
		  </div>
		</div>
		<div class="return-detail ">
		  <div class="return-reason form-group">
			<label class="control-label col-sm-5"></label>
			<div class="col-sm-7">
				<label><span class="required">*</span> <b><?php echo $entry_reason; ?></b></label>
				<?php foreach ($return_reasons as $return_reason) { ?>	
				<?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
				<label class="radio" for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /><?php echo $return_reason['name']; ?></label>
				<?php } else { ?>
				<label class="radio" for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /><?php echo $return_reason['name']; ?></label>
				<?php  } ?>
				<?php  } ?>
				<?php if ($error_reason) { ?>
				<span class="error help-block"><?php echo $error_reason; ?></span>
				<?php } ?>
			</div>
		  </div>
		  <div class="return-opened form-group">
			<label class="control-label col-sm-5"></label>
			<div class="col-sm-7">
				<label><b><?php echo $entry_opened; ?></b></label>
				<label class="radio" >
					<?php if ($opened) { ?>
					<input type="radio" name="opened" value="1" id="opened" checked="checked" />
					<?php } else { ?>
					<input type="radio" name="opened" value="1" id="opened" />
					<?php } ?>
					<?php echo $text_yes; ?>
				</label>
				<label class="radio" >
					<?php if (!$opened) { ?>
					<input type="radio" name="opened" value="0" id="unopened" checked="checked" />
					<?php } else { ?>
					<input type="radio" name="opened" value="0" id="unopened" />
					<?php } ?>
					<?php echo $text_no; ?>
				</label>
			</div>
		  </div>
		  <div class="return-captcha form-group">
			<label class="control-label col-sm-5"><?php echo $entry_captcha; ?></label>
			<div class="col-sm-7">
				<input class="col-sm-2" type="text" name="captcha" value="<?php echo $captcha; ?>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="index.php?route=account/return/captcha" alt="" />
				<?php if ($error_captcha) { ?>
				<span class="error help-block"><?php echo $error_captcha; ?></span>
				<?php } ?>
			</div>
		  </div>
		  
		</div>
			<div class="form-group">
				<label class="control-label col-sm-5"><?php echo $entry_fault_detail; ?></label>
				<div class="col-sm-7">
					<textarea  name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
				</div>
			</div>
			<?php if ($text_agree) { ?>
			<div class="buttons">
			<div class="left"><a href="<?php echo $back; ?>" class="button-return-left"><span><?php echo $button_back; ?></span></a></div>
			<div class="right"><?php echo $text_agree; ?>
				<?php if ($agree) { ?>
				<input type="checkbox" name="agree" value="1" checked="checked" />
				<?php } else { ?>
				<input type="checkbox" name="agree" value="1" />
				<?php } ?>
				<input type="submit" value="<?php echo $button_continue; ?>" class="button-return-right" />
			</div>
			</div>
			<?php } else { ?>
			<div class="buttons">
			<div class="left"><a href="<?php echo $back; ?>" class="button-return-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
			<div class="right button-return-right-i">
				<input type="submit" value="<?php echo $button_continue; ?>" class="button-return-right" />
				<i class="fa fa-arrow-circle-right"></i>
			</div>
			</div>
			<?php } ?>
	  </div>
	</div>
	
  </form>
  </div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>
	
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').fancybox({
		
	});
});
//--></script>
<?php echo $footer; ?>