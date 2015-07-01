<?php echo $header; ?>
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
	<form class="form-horizontal content-border" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit">
	<h2><?php echo $text_your_details; ?></h2>
	<div class="content">
	  <div class="form ">
			<div class="form-group">
				<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_firstname; ?></label>
				<div class="controls col-sm-7">
					<?php if ($error_firstname) { ?>
					<?php } ?><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
					<span class="error help-inline"><?php echo $error_firstname; ?></span>
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
				<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_email; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="email" value="<?php echo $email; ?>" />
					<?php if ($error_email) { ?>
					<span class="error help-inline"><?php echo $error_email; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-5" ><span class="required">*</span> <?php echo $entry_telephone; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="telephone" value="<?php echo $telephone; ?>" />
					<?php if ($error_telephone) { ?>
					<span class="error help-inline"><?php echo $error_telephone; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-5" ><?php echo $entry_fax; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="fax" value="<?php echo $fax; ?>" />
				</div>
			</div>
	  </div>
	</div>
	<div class="buttons">
	  <div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
	  <div class="right">
		<a onclick="$('#edit').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a>
	  </div>
	</div>
  </form>
  </div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>
			
<?php echo $footer; ?>