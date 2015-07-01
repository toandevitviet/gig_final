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
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="forgotten">
			<p><?php echo $text_email; ?></p>
			<h2><?php echo $text_your_email; ?></h2>
			<div class="content">
			<div class="form-horizontal">
				<div class="form-group form">
				<label class="control-label col-sm-5"><?php echo $entry_email; ?></label>
				<div class="controls col-sm-7">
					<input type="text" name="email" value="" />
					</div>
				</div>
			</div>
			</div>
			<div class="buttons">
			<div class="left"><a href="<?php echo $back; ?>" class="button-back-left"><i class="fa fa-reply"></i><?php echo $button_back; ?></a></div>
			<div class="right">
				<a onclick="$('#forgotten').submit();" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a>
			</div>
			</div>
		</form>
	</div>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>

<?php echo $footer; ?>