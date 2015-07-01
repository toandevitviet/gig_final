<?php if (count($currencies) > 1) { ?>
<div class="box-currency header-button">
	<div>
		<div class="heading-1"><i class="fa fa-money"></i><?php echo $text_currency; ?><i class="fa fa-caret-down"></i></div>
		<div class="heading">
		<?php foreach ($currencies as $currency) { ?>
			<?php if ($currency['code'] == $currency_code) { ?>
			<?php if ($currency['symbol_left']) { ?>
			<?php echo $currency['symbol_left']; ?><i class="fa fa-caret-down"></i>
			<?php } else { ?>
			<?php echo $currency['symbol_right']; ?><i class="fa fa-caret-down"></i>
			<?php } ?>
			<?php } ?>
		<?php } ?>
		</div>
	</div>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="ul">
		<?php foreach ($currencies as $currency) { ?>
			<?php if ($currency['code'] == $currency_code) { ?>
			<?php if ($currency['symbol_left']) { ?>
			<a title="<?php echo $currency['title']; ?>"><span class="act"><?php echo $currency['symbol_left']; ?></span></a>
			<?php } else { ?>
			<a title="<?php echo $currency['title']; ?>"><span class="act"><?php echo $currency['symbol_right']; ?></span></a>
			<?php } ?>
			<?php } else { ?>
			<?php if ($currency['symbol_left']) { ?>
			<a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><span><?php echo $currency['symbol_left']; ?></span></a>
			<?php } else { ?>
			<a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><span><?php echo $currency['symbol_right']; ?></span></a>
			<?php } ?>
			<?php } ?>
		<?php } ?>
		<input type="hidden" name="currency_code" value="" />
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</div>
	</form>
	</div>
<?php } ?>
