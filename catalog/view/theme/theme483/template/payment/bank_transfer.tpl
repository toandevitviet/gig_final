<div style="color:#000" >
<h2><?php echo $text_instruction; ?></h2>
<p><?php echo $text_description; ?></p>
<p><?php echo $bank; ?></p>

<p>Please Input your bank account details for verification:</p>

<form class="form-horizontal content-border" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="address">

<p>Your Bank Organisation Name:</p>
<p><input type="text" name="bank_name" value="" id="bank_name"></p>

<p>Your Account Name:</p>
<p><input type="text" name="account_name" value="" id="account_name"></p>

<p>Your Account Type:</p>
<p><input type="text" name="account_type" value="" id="account_type"></p>

<p>Your Account Number:</p>
<p><input type="text" name="account_number" value="" id="account_number"></p>


<p><?php echo $text_payment; ?></p>
<div class="buttons">
	<div class="right">
		<a id="button-confirm" class="button"><span><?php echo $button_confirm; ?></span></a>
	</div>
</div>
</form>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
var bank_name = $("#bank_name").val();
var account_name = $("#account_name").val();
var account_type = $("#account_type").val();
var account_number = $("#account_number").val();
	$.ajax({ 
		type: 'POST',
		data: {
			'bank_name':bank_name,
			'account_name':account_name,
			'account_type':account_type,
			'account_number':account_number
		},
		url: 'index.php?route=payment/bank_transfer/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script> 
