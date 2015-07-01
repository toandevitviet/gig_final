<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
  <div class="col-sm-12">
	<div class="warning"><?php echo $error_warning; ?></div>
  </div>
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
	<div class="content-border">
	<h2><?php echo $text_address_book; ?></h2>
	<?php foreach ($addresses as $result) { ?>
	<div class="content">
	  <div><?php echo $result['address']; ?></div><br />
	  <div><a href="<?php echo $result['update']; ?>" class="button"><span><?php echo $button_edit; ?></span></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="button"><span><?php echo $button_delete; ?></span></a></div>
	  
	  <br />
	</div>
	<?php } ?>
	<div class="buttons">
	  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
	  <div class="right"><a href="<?php echo $insert; ?>" class="button-cont-right"><?php echo $button_new_address; ?><i class="fa fa-arrow-circle-right"></i></a></div>
	</div>
	</div>
	</div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>
	
<?php echo $footer; ?>