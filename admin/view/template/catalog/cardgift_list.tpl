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

  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($fail) { ?>
  <div class="warning"><?php echo $fail; ?></div>
  <?php } ?>

  <div class="box">
    <div class="heading">
      <h1><img src="view/image/gift.jpg" alt="" width="22" height="22" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="left"><?php echo 'Description';?></td>
              <td class="left"><?php echo 'Gift group';?></td>
              <td class="left"><?php echo 'Price';?></td>
              <td class="left"><?php echo 'Image';?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($cardgifts) { ?>
            <?php foreach ($cardgifts as $cardgift) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($cardgift['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $cardgift['cardgift_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $cardgift['cardgift_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $cardgift['name']; ?></td>
              <td class="left"><?php echo substr((html_entity_decode(sprintf($cardgift['description']), ENT_QUOTES, 'UTF-8')),0, 120);?></td> 
              <td class="left"><?php 
                switch ($cardgift['group_id']) {
                  case '1':
                    $text = 'BELOW $200'; break;
                  case '2':
                    $text = '$200- $399'; break;
                  case '3':
                    $text = '$400- $599'; break;
                  case '4':
                    $text = '$600 - $799'; break;
                  case '5':
                    $text = '$800 - $999'; break;
                  case '6':
                    $text = '$1000 - $1299'; break;
                  case '7':
                    $text = '$1300 - $1599'; break;
                  case '8':
                    $text = '$1600 - $1899'; break;
                  case '9':
                    $text = '$1900 - $2199'; break;
                  case '10':
                    $text = '$2200 - $2499'; break;
                  case '11':
                    $text = '$2500 - $2999'; break;
                  case '12':
                    $text = '$3000 - $3499'; break;
                  case '13':
                    $text = '$3500 - $3999'; break;
                  case '14':
                    $text = '$4000 - $4499'; break;
                  case '15':
                    $text = '$4500 - $4999'; break;
                  case '16':
                    $text = '$5000 - $5499'; break;
                  case '17':
                    $text = '$5500 - $5999'; break;
                  case '18':
                    $text = '$6000 - $6499'; break;
                  case '19':
                    $text = '$6500 - $6999'; break;
                  case '20':
                    $text = '$7000 - $7999'; break;
                  case '21':
                    $text = '$8000 - $8999'; break;
                  case '22':
                    $text = '$9000 - $9999'; break;
                  case '23':
                    $text = '$10000 - $11999'; break;
                  case '24':
                    $text = '$12000 - $12999'; break;
                  case '25':
                    $text = '$13000 AND ABOVE VOUCHER IS NEGOTIABLE'; break;                                          
                }
                echo $text; ?></td>
              <td class="left"><?php echo $cardgift['price']; ?></td>
              <td class="left"><img width="100" height="60" src="<?php echo HTTP_CATALOG; ?>image/<?php echo $cardgift['image']; ?>"/></td>
              <td class="right"><?php echo $cardgift['sort_order']; ?></td>
              <td class="right"><?php foreach ($cardgift['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>