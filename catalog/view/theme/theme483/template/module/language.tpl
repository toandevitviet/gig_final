<?php if (count($languages) > 1) { ?>
	<div class="box-language header-button">
		<div class="heading"><?php echo $text_language1; ?><i class="fa fa-caret-down"></i></div>
		<div class="heading1"><i class="fa fa-globe"></i><?php echo $text_language; ?><i class="fa fa-caret-down"></i></div>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="ul">
				<?php foreach ($languages as $language) { ?>
				<a  title="<?php echo $language['name']; ?>" onClick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>').submit(); $(this).parent().parent().submit();" ><span><?php echo $language['code']; ?></span></a>
				<?php } ?>
				<input type="hidden" name="language_code" value="" />
				<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
			</div>
		</form>
	</div>
<?php } ?>
