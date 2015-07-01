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
      <h1><img src="view/image/slider.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" size="100" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
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
      <tr>
            <td><?php echo $entry_caption; ?></td>
            <td><select name="caption">
                <?php if ($caption) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
        <table id="images" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_sorting; ?></td>
              <td class="left"><?php echo $entry_title; ?></td>
        <td class="left"><?php echo $entry_description; ?></td>


        <td class="left"><?php  echo $entry_price; ?></td>

        <td class="left"><?php echo $entry_gift; ?></td>



              <td class="left"><?php echo $entry_link; ?></td>
              <td class="left"><?php echo $entry_image; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $image_row = 0; ?>
          <?php foreach ($slider_images as $slider_image) { ?>
          <tbody id="image-row<?php echo $image_row; ?>">
            <tr>
        <!-- slider mod sorting-->
              <td class="left"><input type="text" size="2" id="image_sorting" name="slider_image[<?php echo $image_row; ?>][sorting]" value="<?php echo $slider_image['sorting']; ?>" /></td> 
        <!-- slider mod end-->        
              <td class="left">
              <?php //var_dump($languages);?>
              <?php foreach ($languages as $language) { if( $language['language_id']== 1 ) { ?>
                <input type="text" name="slider_image[<?php echo $image_row; ?>][slider_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($slider_image['slider_image_description'][$language['language_id']]) ? $slider_image['slider_image_description'][$language['language_id']]['title'] : ''; ?>" />
                <?php } } ?></td>
      <!-- slider mod description-->


        <td class="left"><?php foreach ($languages as $language) { if( $language['language_id']== 1 ) {  
          ?>
        <textarea  rows="6" cols="46" name="slider_image[<?php echo $image_row; ?>][slider_image_description][<?php echo $language['language_id']; ?>][description]">
        <?php echo isset($slider_image['slider_image_description'][$language['language_id']]) ? $slider_image['slider_image_description'][$language['language_id']]['description'] : ''; ?>
        </textarea>
        <?php } } ?></td>
      <!-- slider mod end-->


      <!-- slider mod price-->
        <td class="left"><?php foreach ($languages as $language) { if( $language['language_id']== 1 ) {  ?>
                <input type="text" name="slider_image[<?php echo $image_row; ?>][slider_image_description][<?php echo $language['language_id']; ?>][price]" value="<?php echo isset($slider_image['slider_image_description'][$language['language_id']]) ? $slider_image['slider_image_description'][$language['language_id']]['price'] : ''; ?>" />
                <?php } }?>

        </td>
      <!-- slider mod end-->


      <!-- slider mod group-->
        <td class="left">
          <select id="image_gift" name="slider_image[<?php echo $image_row; ?>][slider_image_description][<?php echo '1';//$language['language_id']; - now only english ?>][gift]">
          <?php foreach ($languages as $key => $_name) { ?>
          <?php 
            if($_name['language_id'] == '2') {
              unset($languages[$key]);
            } 
            if($_name['language_id'] == '3') {
              unset($languages[$key]);
            } 
          ?> 
          
          <?php $vvv = $slider_image['slider_image_description'][$language['language_id']]['gift']; ?>
          <?php } ?>
            <option value="199" <?php if($vvv == 199) print('selected="selected"'); ?> >BELOW $200</option>
            <option value="399" <?php if($vvv == 399) print('selected="selected"'); ?> >$200- $399</option>
            <option value="599" <?php if($vvv == 599) print('selected="selected"'); ?> >$400- $599</option>
            <option value="799" <?php if($vvv == 799) print('selected="selected"'); ?> >$600 - $799</option>
            <option value="999" <?php if($vvv == 999) print('selected="selected"'); ?> >$800 - $999</option>
            <option value="1299" <?php if($vvv == 1299) print('selected="selected"'); ?> >$1000 - $1299</option>
            <option value="1599" <?php if($vvv == 1599) print('selected="selected"'); ?> >$1300 - $1599</option>
            <option value="1899" <?php if($vvv == 1899) print('selected="selected"'); ?> >$1600 - $1899</option> 
            <option value="2199" <?php if($vvv == 2199) print('selected="selected"'); ?> >$1900 - $2199</option>
            <option value="2499" <?php if($vvv == 2499) print('selected="selected"'); ?> >$2200 - $2499</option>
            <option value="2999" <?php if($vvv == 2999) print('selected="selected"'); ?> >$2500 - $2999</option>
            <option value="3499" <?php if($vvv == 3499) print('selected="selected"'); ?> >$3000 - $3499</option>
            <option value="3999" <?php if($vvv == 3999) print('selected="selected"'); ?> >$3500 - $3999</option>
            <option value="4499" <?php if($vvv == 4499) print('selected="selected"'); ?> >$4000 - $4499</option>
            <option value="4999" <?php if($vvv == 4999) print('selected="selected"'); ?> >$4500 - $4999</option>
            <option value="5499" <?php if($vvv == 5499) print('selected="selected"'); ?> >$5000 - $5499</option>  
            <option value="5999" <?php if($vvv == 5999) print('selected="selected"'); ?> >$5500 - $5999</option> 
            <option value="6499" <?php if($vvv == 6499) print('selected="selected"'); ?> >$6000 - $6499</option>
            <option value="6999" <?php if($vvv == 6999) print('selected="selected"'); ?> >$6500 - $6999</option>
            <option value="7999" <?php if($vvv == 7999) print('selected="selected"'); ?> >$7000 - $7999</option>
            <option value="8999" <?php if($vvv == 8999) print('selected="selected"'); ?> >$8000 - $8999</option>
            <option value="9999" <?php if($vvv == 9999) print('selected="selected"'); ?> >$9000 - $9999</option>
            <option value="11999" <?php if($vvv == 11999) print('selected="selected"'); ?> >$10000 - $11999</option>
            <option value="12999" <?php if($vvv == 12999) print('selected="selected"'); ?> >$12000 - $12999</option>
            <option value="13000" <?php if($vvv == 13000) print('selected="selected"'); ?> >$13000 AND ABOVE</option>    
          </select>
        </td>
      <!-- slider mod end-->


      
              <td class="left"><input type="text" id="image_link" name="slider_image[<?php echo $image_row; ?>][link]" value="<?php echo $slider_image['link']; ?>" /><span class="help"><?php echo $text_link_help; ?></span></td>


              <td class="left"><div class="image"><img src="<?php echo $slider_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
                  <input type="hidden" name="slider_image[<?php echo $image_row; ?>][image]" value="<?php echo $slider_image['image']; ?>" id="image<?php echo $image_row; ?>"  />
                  <br />
                  <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
          <!--thumb-->

              <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $image_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="7"></td>
              <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_slider; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
  html += '<tr>';
  html += '<td class="left"><input type="text" id="image_sorting" name="slider_image[' + image_row + '][sorting]" value="'+image_row+'" /></td>';
    html += '<td class="left">';
  <?php foreach ($languages as $language) { ?>
  html += '<input type="text" name="slider_image[' + image_row + '][slider_image_description][<?php echo $language['language_id']; ?>][title]" value="" />';
    <?php } ?>
  html += '</td>';

    html += '<td class="left">';
  <?php foreach ($languages as $language) { ?>
  html += '<input type="text" name="slider_image[' + image_row + '][slider_image_description][<?php echo $language['language_id']; ?>][description]" value="" />';
    <?php } ?>
  html += '</td>';
    html += '<td class="left">';
  <?php foreach ($languages as $language) { ?>
  html += '<input type="text" name="slider_image[' + image_row + '][slider_image_description][<?php echo $language['language_id']; ?>][price]" value="" />';
    <?php } ?>
  html += '</td>';

  

  html += '<td class="left">';
  // <?php foreach ($languages as $language) { ?>
  // html += '<input type="text" name="slider_image[' + image_row + '][slider_image_description][<?php echo $language['language_id']; ?>][gift]" value="" />';
  //   <?php } ?>

  html += '<select id="image_gift" name="slider_image[' + image_row + '][slider_image_description][<?php echo $language['language_id']; ?>][gift]">';
      html += '<option value="199">BELOW $200</option>';
      html += '<option value="399">$200- $399</option>';
      html += '<option value="599">$400- $599</option>';
      html += '<option value="799">$600 - $799</option>';
      html += '<option value="999">$800 - $999</option>';
      html += '<option value="1299">$1000 - $1299</option>';
      html += '<option value="1599">$1300 - $1599</option>';
      html += '<option value="1899">$1600 - $1899</option>';
      html += '<option value="2199">$1900 - $2199</option>';
      html += '<option value="2499">$2200 - $2499</option>';
      html += '<option value="2999">$2500 - $2999</option>';
      html += '<option value="3499">$3000 - $3499</option>';
      html += '<option value="3999">$3500 - $3999</option>';
      html += '<option value="4499">$4000 - $4499</option>';
      html += '<option value="4999">$4500 - $4999</option>';
      html += '<option value="5499">$5000 - $5499</option>';
      html += '<option value="5999">$5500 - $5999</option>';
      html += '<option value="6499">$6000 - $6499</option>';
      html += '<option value="6999">$6500 - $6999</option>';
      html += '<option value="7999">$7000 - $7999</option>';
      html += '<option value="8999">$8000 - $8999</option>';
      html += '<option value="9999">$9000 - $9999</option>';
      html += '<option value="11999">$10000 - $11999</option>';
      html += '<option value="12999">$12000 - $12999</option>';
      html += '<option value="13000">$13000 AND ABOVE</option>';
  html += '</select>';

  
  html += '</td>';



  html += '<td class="left"><input type="text" id="image_link" name="slider_image[' + image_row + '][link]" value="" /><span class="help"><?php echo $text_link_help; ?></span></td>';  
  html += '<td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="slider_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';

  html += '</tr>';
  html += '</tbody>'; 
  
  $('#images tfoot').before(html);
  
  image_row++;
}
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
          url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
          dataType: 'text',
          success: function(data) {
            $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
          }
        });
      }
    },  
    bgiframe: false,
    width: 700,
    height: 400,
    resizable: false,
    modal: false
  });
};
//--></script> 
<script type="text/javascript"><!--
$('input[id=\'image_link\']').live('keydown', function(){

$('input[id=\'image_link\']').autocomplete({
  delay: 0,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {   
        response($.map(json, function(item) {
          return {
            label: item.name,
            value: item.product_id
          }
        }));
      }
    });
    
  }, 
  select: function(event, ui) {
  $(this).val('index.php?route=product/product&product_id='+ui.item.value);
    
    
        
    return false;
  }
});
});

//--></script> 


<?php echo $footer; ?>
