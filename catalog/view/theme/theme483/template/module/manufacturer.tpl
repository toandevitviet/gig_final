<div class="clear"></div>
<div class="box man info">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
	<?php if ($manufacturers) { ?>
	<ul class="info">
	  <?php foreach ($manufacturers as $manufacturer) {   ?>
	  <li><a title="<?php echo $manufacturer['name']; ?>" href="<?php echo $manufacturer['href']; ?>">
			<?php if ($manufacturer['image_link']) { ?>				
				<img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" />
			<?php } ?>
			<span><?php echo $manufacturer['name']; ?></span>
		</a></li>
		
		<?php } ?>
	</ul>
	<?php } ?>
	<div class="clear"></div>
  </div>
</div>