<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, , initial-scale=1.0">
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script>
	if (navigator.userAgent.match(/Android/i)) {
		var viewport = document.querySelector("meta[name=viewport]");
	}
	if(navigator.userAgent.match(/Android/i)){
		window.scrollTo(0,1);
	}
</script> 
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bootstrap.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/cloud-zoom.css" rel="stylesheet"  />
<link rel="stylesheet"  href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/stylesheet.css" />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/font-awesome.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/slideshow.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/jquery.prettyPhoto.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/camera.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/superfish.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/responsive.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/photoswipe.css" rel="stylesheet"  />
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/jquery.bxslider.css" rel="stylesheet"  />
<link rel="stylesheet"  href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/colorbox.css" media="screen" />

<!--add stylesheet validate plugin-->
<link href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/validationEngine.jquery.css" rel="stylesheet"  />


<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>"  href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link rel="stylesheet"  href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet"  href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet"  href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/livesearch.css"/>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600' rel='stylesheet' type='text/css'>

<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery/jquery-1.10.2.min.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery/jquery-ui-1.8.24.min.js"></script>
<script src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/colorbox/jquery.colorbox.js"></script>
<script src="catalog/view/javascript/jquery/jquery.jcarousel.min.js"></script>
<script src="catalog/view/javascript/jquery/jquery.cycle.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/bootstrap/bootstrap.js"></script>
<script src="catalog/view/javascript/jquery/tabs.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jQuery.equalHeights.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/elevate/jquery.elevatezoom.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery.prettyPhoto.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jscript_zjquery.anythingslider.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/common.js"></script>
<script src="catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery.mobile-events.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/superfish.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/tm-stick-up.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/script.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/sl/camera.js"></script>
<!-- bx-slider -->
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/bxslider/jquery.bxslider.js"></script>
<!-- photo swipe -->
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/photo-swipe/klass.min.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/photo-swipe/code.photoswipe.jquery-3.0.5.js"></script>

<!--add validate js plugin-->
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery.validationEngine-en.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery.validationEngine.js"></script>
<script>
$(document).ready(function(e) {
    $("#main-query-form, #feedback, #contact, #contact_home, #gift_form, #feedback_form").validationEngine({
        validationEventTrigger: 'keyup',
        promptPosition: 'bottomRight',
        showOneMessage:true,
        maxErrorsPerField:true		
    }); 
});
</script>
<!--end validate-->

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE]>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/html5.js"></script>
<![endif]-->
<!--[if gte IE 9]>
  <style type="text/css">.gradient {filter: none;}</style>
<![endif]-->
<!--[if lt IE 8]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]-->

<!--[if IE]>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/sl/jscript_zjquery.anythingslider.js"></script>
<script>if(/*@cc_on!@*/false){document.documentElement.className+=' ie';}</script>
<![endif]-->

<!--[if  IE 8]>
<link rel="stylesheet"  href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/ie8.css" />
<![endif]-->
<!--[if  IE 8]>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/respond.js"></script>
<![endif]-->
<!--[if  IE 8]>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/matchmedia.polyfill.js"></script>
<![endif]-->
<!--[if  IE 8]>
<script  src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/matchmedia.addListener.js"></script>
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet"  href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->

<?php if (!empty($stores)) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo empty($this->request->get['route']) ? 'common-home' : str_replace('/', '-', $this->request->get['route']); ?>"><a id="hidden" href="<?php echo $base; ?>"></a>
<div id="body">
	<!-- swipe menu -->
	<div class="swipe">
		<div class="swipe-menu">
			<ul class="links">
				<?php if (!isset($this->request->get['route'])) { $route='active'; }  else {$route='';}?> <li class="first"><a class="<?php echo $route; if (isset($this->request->get['route']) && $this->request->get['route']=="common/home") {echo "active";} ?>" href="<?php echo $home; ?>"><i class="fa fa-home"></i><?php echo $text_home; ?></a></li>
				<?php if (!$logged) { ?>
				<?php echo $text_welcome; ?>
				<?php } else { ?>
				<?php echo $text_logged; ?>
				<?php } ?>
			</ul>
			<ul class="foot foot-1">
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			</ul>
		</div>
	</div>
	<div id="page">
		<div id="shadow">
		<div class="shadow"></div>
		<!-- Header -->
		<header id="header">
			<!-- Top link -->
			<script type="text/javascript">
				jQuery(document).ready(function(){
					if ($('body').width() > 990) { 
						$('.nav__primary').tmStickUp({correctionSelector: $('#wpadminbar')});
					};
				});
			</script>
			<div class="nav__primary">
				<div class="container">
				<div class="row">
				<div class="col-sm-12">				
					<div class="top-links">						
						
						<div class="top-buttons-logg">
							<ul class="links">
								<?php if (!$logged) { ?>
									<?php echo $text_welcome; ?>
									<?php } else { ?>
									<?php echo $text_logged; ?>
								<?php } ?>
							</ul>
						</div>
						
						<!-- search -->
						<div id="search">
							<div class="inner">
								<div class="button-search"><i class="fa fa-search"></i></div>
								<input type="search" name="search"  placeholder="" value="" />
							</div>
						</div>
						
						<ul class="links">
							<?php if (!isset($this->request->get['route'])) { $route='active'; }  else {$route='';}?>                               
							<li><a class="<?php if (isset($this->request->get['route']) && $this->request->get['route']=="account/account") {echo "active";} ?>" href="<?php echo $account; ?>"><i class="fa fa-user"></i><?php echo $text_account; ?></a></li>
							<li><a class="<?php if (isset($this->request->get['route']) && $this->request->get['route']=="checkout/cart") {echo "active";} ?>" href="<?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i><?php echo $text_shopping_cart; ?></a></li>
							<li><a class="<?php if (isset($this->request->get['route']) && $this->request->get['route']=="checkout/checkout") {echo "active";} ?>" href="<?php echo $checkout; ?>"><i class="fa fa-check"></i><?php echo $text_checkout; ?></a></li>
							<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
								<?php } else { ?>
								<?php echo $text_logged; ?>
							<?php } ?>
						</ul>
						
						<div class="clear"></div>
					</div>
				</div>
			</div>
			</div>
		</div>
			<div class="container">
				<div class="toprow-1">
					<div class="row">
						<div class="col-sm-12">
							<a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
							<div class="top-search">
								<i class="fa fa-search"></i>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-12">					
						<!-- Logo -->
						<?php if ($logo) { ?>
							<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
						<?php } ?>												
						<!-- Cart -->
						<div class="cart-position">
							<div class="cart-inner"><?php echo $cart; ?></div>
						</div>						
						<div class="clear"></div>						
					</div>
				</div>
				
				<!-- menu not desktop-->
				<?php if ($categories) { ?>
				<div id="menu-gadget">
					<div class="row">
						<div class="col-sm-12">
							<div id="menu-icon"></div>
							<ul id="nav" class="sf-menu-phone">
							<?php if (!isset($this->request->get['route'])) { $route='active'; }  else {$route='';}?> 
	                        <!--homepage-->
	                        <?php if(isset($this->request->get['route']) && ($this->request->get['route'] ==='common/home') || (HTTP_SERVER && (!isset($this->request->get['route'])))) { ?>
	                            <li class="current cat_200">
	                                <a href="<?php echo $home; ?>">
	                                    <span class="over"></span>
	                                    <span><?php echo $text_home; ?></span>
	                                </a>
	                            </li>
	                        <?php } else { ?>
	                            <li class="cat_200">
	                                <a href="<?php echo $home; ?>">
	                                    <span class="over"></span>
	                                    <span><?php echo $text_home; ?></span>
	                                </a>
	                            </li>
	                        <?php } ?>                        

	                        <!--list information check top-->
	                        <?php $cv=0;?>
							<?php foreach ($informations_top as $information_top) { $cv++; 
							?>
							<li class="cat_<?php echo $cv ?>">
							<a href="<?php echo $information_top['href']; ?>"><span><?php echo $information_top['title']; ?></span></a>

							</li>
							<?php } ?>	

							<!-- list category-->	
							<?php $cv=0;?>
							<?php foreach ($categories as $category) { $cv++; 
								if($category['category_type'] == 'top') :
							?>
							<?php if ($category['category_id'] == $category_id) { ?>
							<li class="current cat_<?php echo $cv ?>">
							<?php } else { ?>
							<li class="cat_<?php echo $cv ?>">
							<?php } ?>
							<a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>

							</li>
							<?php endif; ?>
							<?php } ?>	
				
	                        <!--Feedback: not backend-->
	                        <?php $url_feedback =  HTTP_SERVER .'index.php?route=information/feedback';
	                            $url_fb_len = strlen(isset($this->request->get['route']));
	                            if(isset($this->request->get['route'])){
	                            	if(strpos($this->request->get['route'],"information/feedback") !== FALSE){
	                                	$check =TRUE;
	                            	}else{ $check =FALSE;}
	                            }else{
	                            	$check = FALSE;
	                            }
	                            
	                            if(($url_fb_len = 19) && ($check)){ 
	                                $url_fb_len_update = TRUE;
	                            }else{ $url_fb_len_update = FALSE;}      
	                        ?>
                                
	                        <?php if(isset($this->request->get['route']) && ($url_fb_len_update)) { ?>
	                            <li class="active">
	                                <a href="<?php echo $url_feedback;?>">
	                                    <span class="over"></span>
	                                    <span><?php echo 'Feedback';?></span>
	                                </a>
	                            </li>
	                        <?php } else { ?>
	                            <li class="">
	                                <a href="<?php echo $url_feedback;?>">
	                                    <span class="over"></span>
	                                    <span><?php echo 'Feedback';?></span>
	                                </a>
	                            </li>
	                        <?php } ?>
                                                
	                        <!--contact us: not backend-->
	                        <?php $url_contact =  HTTP_SERVER .'index.php?route=information/contact';
	                            $url_about_len = strlen(isset($this->request->get['route']));
	                            if(isset($this->request->get['route'])){
	                            	if(strpos($this->request->get['route'],"information/contact") !== FALSE){
	                                	$check =TRUE;
	                            	}else{ $check =FALSE;}
	                            }else{
	                            	$check = FALSE;
	                            }
	                            
	                            if(($url_about_len = 18) && ($check)){ 
	                                $url_about_len_update = TRUE;
	                            }else{ $url_about_len_update = FALSE;}      
	                        ?>
                        
	                        <?php if(isset($this->request->get['route']) && ($url_about_len_update)) { ?>
	                            <li class="current cat_202">
	                                <a href="<?php echo $url_contact;?>">
	                                    <span class="over"></span>
	                                    <span><?php echo 'Contact us';?></span>
	                                </a>
	                            </li>
	                        <?php } else { ?>
	                            <li class="cat_202">
	                                <a href="<?php echo $url_contact;?>">
	                                    <span class="over"></span>
	                                    <span><?php echo 'Contact us';?></span>
	                                </a>
	                            </li>
	                        <?php } ?>	
                                    
						</div>
					</div>
				</div>
				<?php } ?>
			
				<!-- Top menu desktop -->
			
				<?php if ($categories) { ?>				
				
				<div class="row">
				<div class="col-sm-12">
				<div id="menu">
					<ul  class="sf-menu">
                        <?php if (!isset($this->request->get['route'])) { $route='active'; }  else {$route='';}?> 
                        <!--homepage-->
                        <?php if(isset($this->request->get['route']) && ($this->request->get['route'] ==='common/home') || (HTTP_SERVER && (!isset($this->request->get['route'])))) { ?>
                            <li class="current cat_200">
                                <a href="<?php echo $home; ?>">
                                    <span class="over"></span>
                                    <span><?php echo $text_home; ?></span>
                                </a>
                            </li>
                        <?php } else { ?>
                            <li class="cat_200">
                                <a href="<?php echo $home; ?>">
                                    <span class="over"></span>
                                    <span><?php echo $text_home; ?></span>
                                </a>
                            </li>
                        <?php } ?>
                        

                        <!--list information check top-->
                        <?php $cv=0;?>
						<?php foreach ($informations_top as $information_top) { $cv++; 
						?>
						<li class="cat_<?php echo $cv ?>">
						<a href="<?php echo $information_top['href']; ?>"><span><?php echo $information_top['title']; ?></span></a>

						</li>
						<?php } ?>	


						<!-- list category-->	
						<?php $cv=0;?>
						<?php foreach ($categories as $category) { $cv++; 
							if($category['category_type'] == 'top') :
						?>
						<?php if ($category['category_id'] == $category_id) { ?>
						<li class="current cat_<?php echo $cv ?>">
						<?php } else { ?>
						<li class="cat_<?php echo $cv ?>">
						<?php } ?>
						<a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>

						</li>
						<?php endif; ?>
						<?php } ?>	

				
                        <!--Feedback: not backend-->
                        <?php $url_feedback =  HTTP_SERVER .'index.php?route=information/feedback';
                            $url_fb_len = strlen(isset($this->request->get['route']));
                            if(isset($this->request->get['route'])){
                            	if(strpos($this->request->get['route'],"information/feedback") !== FALSE){
                                	$check =TRUE;
                            	}else{ $check =FALSE;}
                            }else{
                            	$check = FALSE;
                            }
                            
                            if(($url_fb_len = 19) && ($check)){ 
                                $url_fb_len_update = TRUE;
                            }else{ $url_fb_len_update = FALSE;}      
                        ?>
                                
                        <?php if(isset($this->request->get['route']) && ($url_fb_len_update)) { ?>
                            <li class="active">
                                <a href="<?php echo $url_feedback;?>">
                                    <span class="over"></span>
                                    <span><?php echo 'Feedback';?></span>
                                </a>
                            </li>
                        <?php } else { ?>
                            <li class="">
                                <a href="<?php echo $url_feedback;?>">
                                    <span class="over"></span>
                                    <span><?php echo 'Feedback';?></span>
                                </a>
                            </li>
                        <?php } ?>
                                                
                        <!--contact us: not backend-->
                        <?php $url_contact =  HTTP_SERVER .'index.php?route=information/contact';
                            $url_about_len = strlen(isset($this->request->get['route']));
                            if(isset($this->request->get['route'])){
                            	if(strpos($this->request->get['route'],"information/contact") !== FALSE){
                                	$check =TRUE;
                            	}else{ $check =FALSE;}
                            }else{
                            	$check = FALSE;
                            }
                            
                            if(($url_about_len = 18) && ($check)){ 
                                $url_about_len_update = TRUE;
                            }else{ $url_about_len_update = FALSE;}      
                        ?>
                        
                        <?php if(isset($this->request->get['route']) && ($url_about_len_update)) { ?>
                            <li class="current cat_202">
                                <a href="<?php echo $url_contact;?>">
                                    <span class="over"></span>
                                    <span><?php echo 'Contact us';?></span>
                                </a>
                            </li>
                        <?php } else { ?>
                            <li class="cat_202">
                                <a href="<?php echo $url_contact;?>">
                                    <span class="over"></span>
                                    <span><?php echo 'Contact us';?></span>
                                </a>
                            </li>
                        <?php } ?>	
                        </ul>
                    	<div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>	
			
		</header>
		<section>
		<?php if ($header_top) {?>
			<!-- Header Top position -->
			<div class="header-modules">
				<?php echo $header_top; ?>
			</div>
		<?php }?>
		<!-- Container -->
			<div id="container">
				<p id="back-top"><a href="#top"><span></span></a></p>
				<div class="container">
					<?php if (!empty($error)) { ?>
					<div class="warning"><?php echo $error ?><img src="catalog/view/theme/theme483/image/close-1.png" alt="" class="close" /></div>
					<?php } ?>
					<div id="notification"></div>
					<div class="row">
