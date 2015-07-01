<?php echo $header; ?>
<?php if ($success) { ?>
<div class="col-sm-12"><div class="success"><?php echo $success; ?><span class="close"><i class="fa fa-times-circle"></i></span></div></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="col-sm-12"><div class="warning"><?php echo $error_warning; ?></div></div>
<?php } ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="box-container">
	  <div class="login-content row">
		<div class="col-sm-6">
		  <div class="left">
			<div class="heading">
				<i class="fa fa-file-text-o"></i>
				<div class="extra-wrap">
					<h2><?php echo $text_new_customer; ?></h2>
					<b><?php echo $text_register; ?></b>
				</div>
			</div>
			<div class="content">
				<p><?php echo $text_register_account; ?></p>
				<a href="<?php echo $register; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a>
			</div>
		  </div>
		</div>
		<div class="col-sm-6">
		  <div class="right">
			<div class="heading">
				<i class="fa fa-key"></i>
				<div class="extra-wrap">
					<h2><?php echo $text_returning_customer; ?></h2>
					<b><?php echo $text_i_am_returning_customer; ?></b>
				</div>
			</div>
			<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login">
			  <div class="content">
				<div class="form-group">
					<label class="padd-form control-label col-sm-5" ><?php echo $entry_email; ?></label>
					<div class="controls col-sm-7">
						<input class="q1 margen-bottom" type="text" name="email" value="<?php echo $email; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="padd-form control-label col-sm-5" ><?php echo $entry_password; ?></label>
					<div class="controls col-sm-7">
						<input class="q1 margen-bottom" type="password" name="password" value="<?php echo $password; ?>" />
					</div>
				</div>
				<div class="login-buttons">
					<a onclick="$('#login').submit();" class="button-cont-right"><?php echo $button_login; ?><i class="fa fa-arrow-circle-right"></i></a>
					<?php if ($redirect) { ?>
					<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					<?php } ?>
					<a class="link-login" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				</div>
			  </div>
			</form>
		  </div>
		</div>
	  </div>
  </div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>
  
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>