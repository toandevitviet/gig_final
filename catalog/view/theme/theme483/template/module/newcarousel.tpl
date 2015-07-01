<script>
	jQuery(function(){
		jQuery('#camera_wrap_<?php echo $module; ?>').camera({
			fx: 'simpleFade',
			navigation: true,
			playPause: false,
			thumbnails: false,
			navigationHover: true,
			barPosition: 'top',
			loader: false,
			time: 3000,
			transPeriod:800,
			alignment: 'center',
			autoAdvance: true,
			mobileAutoAdvance: true,
			barDirection: 'leftToRight', 
			barPosition: 'bottom',
			easing: 'easeInOutExpo',
			// height: '350px',
			height: '35.74%',
			minHeight: '90px',
			hover: true,
			pagination: false,
			loaderColor			: '#1f1f1f', 
			loaderBgColor		: 'transparent',
			loaderOpacity		: 1,
			loaderPadding		: 0,
			loaderStroke		: 3
			});
	});
</script>
<div class="wp-slideshow">
    <div class="container">
        <div class="fluid_container">
            <div id="camera_wrap_<?php echo $module; ?>" >
                <?php foreach ($banners as $banner) { ?>
                        <div title="<?php echo $banner['title']; ?>" data-thumb="<?php echo $banner['image']; ?>" <?php if ($banner['link']) { ?> data-link="<?php echo $banner['link']; ?>"<?php } ?> data-src="<?php echo $banner['image']; ?>">
                        </div>
                <?php } ?>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>