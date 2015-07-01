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
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="password">
	<h2><?php echo $text_password; ?></h2>
	<div class="content">
		<div class="form form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-5"><span class="required">*</span> <?php echo $entry_password; ?></label>
				<div class="controls col-sm-7">
					<input type="password" name="password" value="<?php echo $password; ?>" />
					<?php if ($error_password) { ?>
					<span class="error help-block"><?php echo $error_password; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-5"><span class="required">*</span> <?php echo $entry_confirm; ?></label>
				<div class="controls col-sm-7">
					<input type="password" name="confirm" value="<?php echo $confirm; ?>" />
					<?php if ($error_confirm) { ?>
					<span class="error"><?php echo $error_confirm; ?></span>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
	<div class="buttons">
	  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
	  <div class="right"><a onclick="$('#password').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a></div>
	</div>
  </form>
  </div>
	<?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>

<?php echo $footer; ?>