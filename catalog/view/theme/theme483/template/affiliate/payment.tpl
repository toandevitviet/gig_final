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
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="payment">
	<h2><?php echo $text_your_payment; ?></h2>
	<div class="content">
		<div class="form form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-5"><?php echo $entry_tax; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="tax" value="<?php echo $tax; ?>" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-5"><?php echo $entry_payment; ?></label>
				<div class="controls col-sm-7">
					<div class="radio">
					<label ><?php if ($payment == 'cheque') { ?>
						<input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
						<?php } else { ?>
							<input type="radio" name="payment" value="cheque" id="cheque" />
						<?php } ?>
						<?php echo $text_cheque; ?>
					</label>
					</div>
					<div class="radio">
					<label >
						<?php if ($payment == 'paypal') { ?>
							<input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
						<?php } else { ?>
							<input type="radio" name="payment" value="paypal" id="paypal" />
						<?php } ?>
						<?php echo $text_paypal; ?>
					</label>
					</div>
					<div class="radio">
					<label >
						<?php if ($payment == 'bank') { ?>
							<input type="radio" name="payment" value="bank" id="bank" checked="checked" />
						<?php } else { ?>
							<input type="radio" name="payment" value="bank" id="bank" />
						<?php } ?>
						<?php echo $text_bank; ?>
					</label>
					</div>
				</div>
			</div>
			<div class="form-group payment" id="payment-cheque">
				<label class="control-label col-sm-5"><?php echo $entry_cheque; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="cheque" value="<?php echo $cheque; ?>" />
				</div>
			</div>
			<div class="form-group payment" id="payment-paypal">
				<label class="control-label col-sm-5"><?php echo $entry_paypal; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="paypal" value="<?php echo $paypal; ?>" />
				</div>
			</div>
			<div class="form-group payment" id="payment-bank">
				<div class="form-group">
					<label class="control-label col-sm-5"><?php echo $entry_bank_name; ?></label>
					<div class="controls col-sm-7">
						<input type="text" name="bank_name" value="<?php echo $bank_name; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5"><?php echo $entry_bank_branch_number; ?></label>
					<div class="controls col-sm-7">
						<input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5"><?php echo $entry_bank_swift_code; ?></label>
					<div class="controls col-sm-7">
						<input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5"><?php echo $entry_bank_account_name; ?></label>
					<div class="controls col-sm-7">
						<input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5"><?php echo $entry_bank_account_number; ?></label>
					<div class="controls col-sm-7">
						<input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" />
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="buttons">
	  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
	  <div class="right"><a onclick="$('#payment').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a></div>
	</div>
  </form>
  </div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>

<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	
	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script> 
<?php echo $footer; ?> 