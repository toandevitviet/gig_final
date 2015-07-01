<?php echo $header; ?>
<div id="content" class="iWatermarkContent">
    <!-- START BREADCRUMB -->
    <?php require_once(DIR_APPLICATION.'view/template/module/iwatermark/breadcrumb.php'); ?>
    <!-- END BREADCRUMB -->
    <!-- START FLASHMESSAGE -->
    <?php require_once(DIR_APPLICATION.'view/template/module/iwatermark/flashmessage.php'); ?>
    <!-- END FLASHMESSAGE -->
    <div class="box">
        <div class="heading">
        	<h1>
            	<img src="view/image/iwatermark.png" style="margin-top: -3px;" alt="" />
                <span class="iWatermarksTitle"><?php echo $heading_title; ?></span>
                <?php 
                	$dirname = DIR_APPLICATION.'view/template/module/iwatermark/';
                    
                	$tab_files = scandir($dirname); 
                	$tabs = array();
                	foreach ($tab_files as $key => $file) {
                		if (strpos($file,'tab_') !== false) {
                			$tabs[] = array(
                            	'file' => $dirname.$file,
                				'name' => ucwords(str_replace('.php','',str_replace('_',' ',str_replace('tab_','',$file))))
                			);
               			} 
                	}
               		foreach ($tabs as $key => $tab) {
                		if ($tab['name'] == 'Support' && $key < count($tabs) - 1) {
                			$temp = $tabs[count($tabs) - 1];
                			$tabs[count($tabs) - 1] = $tab;
                			$tabs[$key] = $temp;
                			break;
                		}
                	}
                ?>
        		<ul class="iWatermarkAdminSuperMenu">
          		<?php foreach($tabs as $tab): ?>
            		<li><?php echo $tab['name']; ?></li>
          		<?php endforeach; ?>
        		</ul>
        	</h1>
			<div class="buttons">
            	<a onclick="<?php if (!empty($data['iWatermark']['Activated'])) { ?>if (confirm('<?php echo $text_cache_delete_warning; ?>')) <?php } else { ?>$('#form').attr('action',$('#form').attr('action')+'&activate=true');<?php } ?>$('#form').submit();" class="button submitButton"><?php echo $button_save; ?></a>
                <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
            </div>
		</div>
        <!-- START NOT ACTIVATED CHECK -->
        <?php require_once(DIR_APPLICATION.'view/template/module/iwatermark/notactivated.php'); ?>
        <!-- END NOT ACTIVATED CHECK -->
		<div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <ul class="iWatermarkAdminSuperWrappers">
                    <?php foreach($tabs as $tab): ?>
                    <li><?php require_once($tab['file']); ?></li>
                    <?php endforeach; ?>
                </ul>
                <input type="hidden" class="selectedTab" name="selectedTab" value="<?php echo (empty($_GET['tab'])) ? 0 : $_GET['tab'] ?>" />
                <input type="hidden" name="iWatermark[Activated]" value="true"/>
            </form>
		</div>
	</div>
</div>
<script type="text/javascript">
var selectedTab = $('.selectedTab').val();
$('.iWatermarkAdminSuperMenu li').removeClass('selected').eq(selectedTab).addClass('selected');
$('.iWatermarkAdminSuperWrappers > li').hide().eq(selectedTab).show();

$('.iWatermarkAdminMenu li').click(function() {
	$('.iWatermarkAdminMenu li',$(this).parents('li')).removeClass('selected');
	$(this).addClass('selected');
	$($('.iWatermarkAdminWrappers li',$(this).parents('li')).hide().get($(this).index())).fadeIn(200);
});

$('.iWatermarkAdminSuperMenu li').click(function() {
	$('.iWatermarkAdminSuperMenu > li',$(this).parents('h1')).removeClass('selected');
	$(this).addClass('selected');
	$($('.iWatermarkAdminSuperWrappers > li',$(this).parents('#content')).hide().get($(this).index())).fadeIn(200);
	$('.selectedTab').val($(this).index());
});

</script>
<?php echo $footer; ?>