<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  <div class="box-container">
	<div class="wishlist-product">
	  <div class="table-radius">
		<table class="table table-bordered">
		<thead>
		  <tr>
			<td class=""> <?php echo $button_remove; ?> </td>
			<td class=""><?php echo $column_image; ?></td>
			<td class=""><?php echo $column_name; ?></td>
			<td class=""><?php echo $column_model; ?></td>
			<td class=""><?php echo $column_stock; ?></td>
			<td class=""><?php echo $column_price; ?></td>
			<td class=""><?php echo $column_action; ?></td>
		  </tr>
		</thead>
		<?php foreach ($products as $product) { ?>
		<tbody id="wishlist-row<?php echo $product['product_id']; ?>">
		  <tr>
			<td class="remove"><a href="<?php echo $product['remove']; ?>"><i class="fa fa-trash-o-o"></i></a></td>
			<td class="image"><?php if ($product['thumb']) { ?>
				<div class="image2">
					<a href="<?php echo $product['href']; ?>">
						<img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
					</a>
				</div>
			  <?php } ?></td>
			<td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
			<td class="model"><?php echo $product['model']; ?></td>
			<td class="stock"><div class="prod-stock"><?php echo $product['stock']; ?></div></td>
			<td class="price"><?php if ($product['price']) { ?>
			  <div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
				<?php } ?>
			  </div>
			  <?php } ?></td>
			<td class="action"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></td>
		  </tr>
		</tbody>
		<?php } ?>
	  </table>
	</div>
	</div>
	<div class="buttons">
	  <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a></div>
	</div>
  </div>
  <?php } else { ?>
  <div class="box-container">
	<div class="content"><?php echo $text_empty; ?></div>
	<div class="buttons">
	  <div class="right"><a href="<?php echo $continue; ?>" class="button-cont-right"><?php echo $button_continue; ?><i class="fa fa-arrow-circle-right"></i></a></div>
	</div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

<?php echo $column_right; ?>

<?php echo $footer; ?>