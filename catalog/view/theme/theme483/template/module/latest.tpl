
<div class="box new-products">
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
		<div class="box-product">
			<ul class="row">
	  <?php $i=0; foreach ($products as $product) { $i++ ?>
	  <?php 
		   $perLine = 3;
		   $spanLine = 3;
		   $last_line = "";
						$total = count($products);
						$totModule = $total%$perLine;
						if ($totModule == 0)  { $totModule = $perLine;}
						if ( $i > $total - $totModule) { $last_line = " last_line";}
						if ($i%$perLine==1) {
							$a='first-in-line';
						}
						elseif ($i%$perLine==0) {
							$a='last-in-line';
						}
						else {
							$a='';
						}
					?>
					<li class="<?php echo $a. $last_line ;?> col-sm-<?php echo $spanLine ;?>">
						<div class="padding">
							<!-- Product image -->
							<div class="product_image image2">
								<a href="<?php echo $product['href']; ?>"><?php if ($product['thumb']) { ?><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><?php } else{ ?><img src="catalog/view/theme/theme483/image/no-image.png" alt="" /><?php } ?></a>
							</div>
							<div class="inner">
								<div class="f-left">
									<!-- Product name -->
									<div class="product_name name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
									
									<!-- Product description -->
									<?php if ($product['description']) {?>
									<div class="product_description description"><?php echo mb_substr($product['description1'],0,59,'UTF-8').'...';?></div>
									<?php } ?>
						
									<!-- Product price -->
									<?php if ($product['price']) { ?>
									<div class="product_price">
										<div class="price">
											<?php if (!$product['special']) { ?>
											<?php echo $product['price']; ?>
											<?php } else { ?>
											<span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
											<?php } ?>
										</div>
									</div>
									<?php } ?>									
								</div>
								
								<!-- Product raitng -->								
								<div class="product_rating rating"><?php if ( $product['rating'] ) { ?>
									<img src="catalog/view/theme/theme483/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /><?php } ?>
								</div>
								<div class="clear"></div>
								
								<!-- Product buttons -->
								<div class="product_button">						
									<div class="cart">
										<a data-id="<?php echo $product['product_id']; ?>;" title="<?php echo $button_cart; ?>" class="tooltip-1 button addToCart">
											<i class="fa fa-shopping-cart"></i>
										</a>
									</div><div class="wishlist">
										<a class="tooltip-1" title="<?php echo $button_wishlist; ?>"  onclick="addToWishList('<?php echo $product['product_id']; ?>');">
											<i class="fa fa-star"></i>
										</a>
									</div><div class="compare">
										<a class="tooltip-1" title="<?php echo $button_compare; ?>"  onclick="addToCompare('<?php echo $product['product_id']; ?>');">
											<i class="fa fa-bar-chart-o"></i>
										</a>
									</div>
									
								</div>
								<div class="clear"></div>
								
							</div>
							<div class="clear"></div>
						</div>
					</li>
				<?php } ?>
			</ul>
		</div>
	</div>
</div>