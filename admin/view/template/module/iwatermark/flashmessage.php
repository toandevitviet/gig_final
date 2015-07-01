<?php if (!empty($this->session->data['flash_success'])) { ?>
	<div class="success slidesUp"><?php echo implode('<br />', $this->session->data['flash_success']); ?></div>
	<script type="text/javascript">
		$('.slidesUp').delay(3000).fadeOut(600, function(){ $(this).show().css({'visibility':'hidden'}); }).slideUp(600);
    </script>
<?php unset($this->session->data['flash_success']); } ?>

<?php if (!empty($this->session->data['flash_error'])) { ?>
	<div class="warning"><?php echo implode('<br />', $this->session->data['flash_error']); ?></div>
<?php unset($this->session->data['flash_error']); } ?>