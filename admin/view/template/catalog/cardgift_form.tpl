<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/gift.jpg" alt="" width="22" height="22" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">        
        
        <div id="tab-general">
            <table class="form">
              <tr>
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="cardgift_description[name]" size="100" value="<?php echo isset($cardgift_description['name']) ? $cardgift_description['name'] : ''; ?>" />
                </td>
              </tr>

              <tr>
                <td><span class="required">*</span> <?php echo $entry_price;  //$entry_name; ?></td>
                <td><input type="text" name="cardgift_description[price]" size="100" value="<?php echo isset($cardgift_description['price']) ? $cardgift_description['price'] : ''; ?>" />
                  <?php if (isset($error_price)) { ?>
                  <span class="error"><?php echo $error_price; ?></span>
                  <?php } ?></td>
              </tr>


              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="cardgift_description[description]" id="description" cols="40" rows="5"><?php echo isset($cardgift_description['description']) ? $cardgift_description['description'] : ''; ?></textarea></td>
              </tr>
            </table>
        </div>
        <!--tab-general-->

        <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_group_id; ?>
              <input type="hidden" value="<?php echo $group_id; ?>" name="group_id" />
              </td>
              <td>
              <!--<input type="text" name="group_id" value="<?php //echo $group_id; ?>" />-->
                <?php $cg = $group_id; ?>
                <select name="group_id">            
                  <option value="1" <?php if($cg == 1) print('selected="selected"'); ?> >BELOW $200</option>
                  <option value="2" <?php if($cg == 2) print('selected="selected"'); ?> >$200- $399</option>
                  <option value="3" <?php if($cg == 3) print('selected="selected"'); ?> >$400- $599</option>
                  <option value="4" <?php if($cg == 4) print('selected="selected"'); ?> >$600 - $799</option>
                  <option value="5" <?php if($cg == 5) print('selected="selected"'); ?> >$800 - $999</option>
                  <option value="6" <?php if($cg == 6) print('selected="selected"'); ?> >$1000 - $1299</option>
                  <option value="7" <?php if($cg == 7) print('selected="selected"'); ?> >$1300 - $1599</option>
                  <option value="8" <?php if($cg == 8) print('selected="selected"'); ?> >$1600 - $1899</option> 
                  <option value="9" <?php if($cg == 9) print('selected="selected"'); ?> >$1900 - $2199</option>
                  <option value="10" <?php if($cg == 10) print('selected="selected"'); ?> >$2200 - $2499</option>
                  <option value="11" <?php if($cg == 11) print('selected="selected"'); ?> >$2500 - $2999</option>
                  <option value="12" <?php if($cg == 12) print('selected="selected"'); ?> >$3000 - $3499</option>
                  <option value="13" <?php if($cg == 13) print('selected="selected"'); ?> >$3500 - $3999</option>
                  <option value="14" <?php if($cg == 14) print('selected="selected"'); ?> >$4000 - $4499</option>
                  <option value="15" <?php if($cg == 15) print('selected="selected"'); ?> >$4500 - $4999</option>
                  <option value="16" <?php if($cg == 16) print('selected="selected"'); ?> >$5000 - $5499</option>  
                  <option value="17" <?php if($cg == 17) print('selected="selected"'); ?> >$5500 - $5999</option> 
                  <option value="18" <?php if($cg == 18) print('selected="selected"'); ?> >$6000 - $6499</option>
                  <option value="19" <?php if($cg == 19) print('selected="selected"'); ?> >$6500 - $6999</option>
                  <option value="20" <?php if($cg == 20) print('selected="selected"'); ?> >$7000 - $7999</option>
                  <option value="21" <?php if($cg == 21) print('selected="selected"'); ?> >$8000 - $8999</option>
                  <option value="22" <?php if($cg == 22) print('selected="selected"'); ?> >$9000 - $9999</option>
                  <option value="23" <?php if($cg == 23) print('selected="selected"'); ?> >$10000 - $11999</option>
                  <option value="24" <?php if($cg == 24) print('selected="selected"'); ?> >$12000 - $12999</option>
                  <option value="25" <?php if($cg == 25) print('selected="selected"'); ?> >$13000 AND ABOVE</option>  
                </select>
              </td>
            </tr>

            <tr>
              <td><?php echo $entry_image; ?></td>
              <td valign="top"><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  <br />
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <!--tab-data-->
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
CKEDITOR.replace('description', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script> 

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script> 
<?php echo $footer; ?>