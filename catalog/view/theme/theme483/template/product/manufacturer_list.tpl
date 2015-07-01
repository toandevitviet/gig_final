<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<h1><?php echo $heading_title; ?></h1>
	<?php if ($categories) { ?>
	<div class="box-container">
	<p class="manuf-p"><b><?php echo $text_index; ?></b>
		<?php foreach ($categories as $category) { ?>
		&nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
		<?php } ?>
	</p>
	<?php foreach ($categories as $category) { ?>
	<div class="manufacturer-list">
		<div class="manufacturer-heading"><span><?php echo $category['name']; ?></span><a id="<?php echo $category['name']; ?>"></a></div>
		<div class="manufacturer-content">
		<div class="row">
		<?php if ($category['manufacturer']) { ?>
		<?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
		<ul class="col-sm-4">
			<?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
			<?php for (; $i < $j; $i++) { ?>
			<?php if (isset($category['manufacturer'][$i])) { ?>
			<li><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php echo $category['manufacturer'][$i]['name']; ?></a></li>
			<?php } ?>
			<?php } ?>
		</ul>
		<?php } ?>
		<?php } ?>
		</div>
		</div>
	</div>
	
	<?php } ?>
	</div>
	<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
	<div class="buttons">
		<div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></a></div>
	</div>
	<?php } ?>
	<?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>

<?php echo $footer; ?>