
<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-9<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>

<?php 
	if ((isset($this->request->get['path'])) && ($this->request->get['path'] =='70')) {
?> 
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="gift_form" class="contact-form row">
	<div class="product-info">
		<div class="row">
	<?php if ($thumb) { ?>
	<div class="col-sm-4">
			<h1 class="view"><?php echo $heading_title; ?></h1>
	
	<script type="text/javascript">
		jQuery(document).ready(function(){
		var myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
		});
	</script>
	
	<?php $i=0; if ($thumb || $images) { $i++  ?>
	
	<?php } ?>

		<?php if ($thumb || $images) { //var_dump($images_gift); ?>
		<div id="default_gallery" class="left spacing">
			<?php if ($thumb) { ?>
			<div class="image"> 
				<img src="<?php echo 'image/'. $images_gift; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
			</div>
			<?php } ?>
			
		</div>
		<?php } ?>
		
		</div>
	<div class="col-sm-8"><?php } else { ?><div class="col-sm-12"><?php } ?>
		<h1><?php echo $heading_title;?> <div style="color:#84BF49; display:inline; margin-left: 5px;  text-transform: capitalize;"><?php echo '(Worth: $' . $price . ')'; ?></div></h2>
	  <div class="description-add">
		<div class="product-section">
			<div class="options-add"> 

			<!--hidden fields-->
			<input type="hidden" name="cardgift_id" value="<?php echo $cardgift_id; ?>"/>
			<input type="hidden" name="gift" value="<?php echo $gift; ?>"/>
			<input type="hidden" name="price" value="<?php echo $price; ?>"/>
			<input type="hidden" name="name_gift" value="<?php echo $heading_title; ?>"/>

				<div id="option" class="option-add">
				<label>Salutation:</label>
				<select name="gift_salutation">
					<option value="mr">Mr</option>
					<option value="ms">Ms</option>
					<option value="dr">Dr</option>
					<option value="mrs">Mrs</option>
					<option value="mdm">Mdm</option>
				  </select> 
				</div>				
				<div id="option" class="option-add">
				  <label>Contact Person: </label>
				  <input type="text" name="gift_person" placeholder="Contact Person" class="validate[required,minSize[3]]"/>
				</div>	
				<div id="option" class="option-add">
				  <label>GIG Invoice No: </label>
				  <input type="text" name="gift_invoice" placeholder="GIG Invoice No" class="validate[required,minSize[3]]" />
				</div>	
				<div id="option" class="option-add">
				  <label>Company Name: </label>
				  <input type="text" name="gift_company" placeholder="Company Name"  class="validate[required,minSize[3]]"/>
				</div>	
				<div id="option" class="option-add">
				  <label>Delivery Address: </label>
				  <input type="text" name="gift_address" placeholder="Delivery Address" class="validate[required,minSize[3]]" />
				</div>		
				<div id="option" class="option-add">
				<label>Country:</label>
				  <select name="gift_country">
				  	<option value="Singapore">Singapore</option>
					<option value="Afghanistan">Afghanistan</option>
					<option value="Åland Islands">Åland Islands</option>
					<option value="Albania">Albania</option>
					<option value="Algeria">Algeria</option>
					<option value="American Samoa">American Samoa</option>
					<option value="Andorra">Andorra</option>
					<option value="Angola">Angola</option>
					<option value="Anguilla">Anguilla</option>
					<option value="Antarctica">Antarctica</option>
					<option value="Antigua and Barbuda">Antigua and Barbuda</option>
					<option value="AR">Argentina</option>
					<option value="Argentina">Armenia</option>
					<option value="Aruba">Aruba</option>
					<option value="Australia">Australia</option>
					<option value="Austria">Austria</option>
					<option value="AZ">Azerbaijan</option>
					<option value="BS">Bahamas</option>
					<option value="BH">Bahrain</option>
					<option value="BD">Bangladesh</option>
					<option value="BB">Barbados</option>
					<option value="BY">Belarus</option>
					<option value="BE">Belgium</option>
					<option value="BZ">Belize</option>
					<option value="BJ">Benin</option>
					<option value="BM">Bermuda</option>
					<option value="BT">Bhutan</option>
					<option value="BO">Bolivia, Plurinational State of</option>
					<option value="BQ">Bonaire, Sint Eustatius and Saba</option>
					<option value="BA">Bosnia and Herzegovina</option>
					<option value="BW">Botswana</option>
					<option value="BV">Bouvet Island</option>
					<option value="BR">Brazil</option>
					<option value="IO">British Indian Ocean Territory</option>
					<option value="BN">Brunei Darussalam</option>
					<option value="BG">Bulgaria</option>
					<option value="BF">Burkina Faso</option>
					<option value="BI">Burundi</option>
					<option value="KH">Cambodia</option>
					<option value="CM">Cameroon</option>
					<option value="CA">Canada</option>
					<option value="CV">Cape Verde</option>
					<option value="KY">Cayman Islands</option>
					<option value="CF">Central African Republic</option>
					<option value="TD">Chad</option>
					<option value="CL">Chile</option>
					<option value="CN">China</option>
					<option value="CX">Christmas Island</option>
					<option value="CC">Cocos (Keeling) Islands</option>
					<option value="CO">Colombia</option>
					<option value="KM">Comoros</option>
					<option value="CG">Congo</option>
					<option value="CD">Congo, the Democratic Republic of the</option>
					<option value="CK">Cook Islands</option>
					<option value="CR">Costa Rica</option>
					<option value="CI">Côte d'Ivoire</option>
					<option value="HR">Croatia</option>
					<option value="CU">Cuba</option>
					<option value="CW">Curaçao</option>
					<option value="CY">Cyprus</option>
					<option value="CZ">Czech Republic</option>
					<option value="DK">Denmark</option>
					<option value="DJ">Djibouti</option>
					<option value="DM">Dominica</option>
					<option value="DO">Dominican Republic</option>
					<option value="EC">Ecuador</option>
					<option value="EG">Egypt</option>
					<option value="SV">El Salvador</option>
					<option value="GQ">Equatorial Guinea</option>
					<option value="ER">Eritrea</option>
					<option value="EE">Estonia</option>
					<option value="ET">Ethiopia</option>
					<option value="FK">Falkland Islands (Malvinas)</option>
					<option value="FO">Faroe Islands</option>
					<option value="FJ">Fiji</option>
					<option value="FI">Finland</option>
					<option value="FR">France</option>
					<option value="GF">French Guiana</option>
					<option value="PF">French Polynesia</option>
					<option value="TF">French Southern Territories</option>
					<option value="GA">Gabon</option>
					<option value="GM">Gambia</option>
					<option value="GE">Georgia</option>
					<option value="DE">Germany</option>
					<option value="GH">Ghana</option>
					<option value="GI">Gibraltar</option>
					<option value="GR">Greece</option>
					<option value="GL">Greenland</option>
					<option value="GD">Grenada</option>
					<option value="GP">Guadeloupe</option>
					<option value="GU">Guam</option>
					<option value="GT">Guatemala</option>
					<option value="GG">Guernsey</option>
					<option value="GN">Guinea</option>
					<option value="GW">Guinea-Bissau</option>
					<option value="GY">Guyana</option>
					<option value="HT">Haiti</option>
					<option value="HM">Heard Island and McDonald Islands</option>
					<option value="VA">Holy See (Vatican City State)</option>
					<option value="HN">Honduras</option>
					<option value="HK">Hong Kong</option>
					<option value="HU">Hungary</option>
					<option value="IS">Iceland</option>
					<option value="IN">India</option>
					<option value="ID">Indonesia</option>
					<option value="IR">Iran, Islamic Republic of</option>
					<option value="IQ">Iraq</option>
					<option value="IE">Ireland</option>
					<option value="IM">Isle of Man</option>
					<option value="IL">Israel</option>
					<option value="IT">Italy</option>
					<option value="JM">Jamaica</option>
					<option value="Japan">Japan</option>
					<option value="JE">Jersey</option>
					<option value="JO">Jordan</option>
					<option value="KZ">Kazakhstan</option>
					<option value="KE">Kenya</option>
					<option value="KI">Kiribati</option>
					<option value="KP">Korea, Democratic People's Republic of</option>
					<option value="KR">Korea, Republic of</option>
					<option value="KW">Kuwait</option>
					<option value="KG">Kyrgyzstan</option>
					<option value="LA">Lao People's Democratic Republic</option>
					<option value="LV">Latvia</option>
					<option value="LB">Lebanon</option>
					<option value="LS">Lesotho</option>
					<option value="LR">Liberia</option>
					<option value="LY">Libya</option>
					<option value="LI">Liechtenstein</option>
					<option value="LT">Lithuania</option>
					<option value="LU">Luxembourg</option>
					<option value="MO">Macao</option>
					<option value="MK">Macedonia, the former Yugoslav Republic of</option>
					<option value="MG">Madagascar</option>
					<option value="MW">Malawi</option>
					<option value="MY">Malaysia</option>
					<option value="MV">Maldives</option>
					<option value="ML">Mali</option>
					<option value="MT">Malta</option>
					<option value="MH">Marshall Islands</option>
					<option value="MQ">Martinique</option>
					<option value="MR">Mauritania</option>
					<option value="MU">Mauritius</option>
					<option value="YT">Mayotte</option>
					<option value="MX">Mexico</option>
					<option value="FM">Micronesia, Federated States of</option>
					<option value="MD">Moldova, Republic of</option>
					<option value="MC">Monaco</option>
					<option value="MN">Mongolia</option>
					<option value="ME">Montenegro</option>
					<option value="MS">Montserrat</option>
					<option value="MA">Morocco</option>
					<option value="MZ">Mozambique</option>
					<option value="MM">Myanmar</option>
					<option value="NA">Namibia</option>
					<option value="NR">Nauru</option>
					<option value="NP">Nepal</option>
					<option value="NL">Netherlands</option>
					<option value="NC">New Caledonia</option>
					<option value="NZ">New Zealand</option>
					<option value="NI">Nicaragua</option>
					<option value="NE">Niger</option>
					<option value="NG">Nigeria</option>
					<option value="NU">Niue</option>
					<option value="NF">Norfolk Island</option>
					<option value="MP">Northern Mariana Islands</option>
					<option value="NO">Norway</option>
					<option value="OM">Oman</option>
					<option value="PK">Pakistan</option>
					<option value="PW">Palau</option>
					<option value="PS">Palestinian Territory, Occupied</option>
					<option value="PA">Panama</option>
					<option value="PG">Papua New Guinea</option>
					<option value="PY">Paraguay</option>
					<option value="PE">Peru</option>
					<option value="PH">Philippines</option>
					<option value="PN">Pitcairn</option>
					<option value="PL">Poland</option>
					<option value="PT">Portugal</option>
					<option value="PR">Puerto Rico</option>
					<option value="QA">Qatar</option>
					<option value="RE">Réunion</option>
					<option value="RO">Romania</option>
					<option value="RU">Russian Federation</option>
					<option value="RW">Rwanda</option>
					<option value="BL">Saint Barthélemy</option>
					<option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>
					<option value="KN">Saint Kitts and Nevis</option>
					<option value="LC">Saint Lucia</option>
					<option value="MF">Saint Martin (French part)</option>
					<option value="PM">Saint Pierre and Miquelon</option>
					<option value="VC">Saint Vincent and the Grenadines</option>
					<option value="WS">Samoa</option>
					<option value="SM">San Marino</option>
					<option value="ST">Sao Tome and Principe</option>
					<option value="SA">Saudi Arabia</option>
					<option value="SN">Senegal</option>
					<option value="RS">Serbia</option>
					<option value="SC">Seychelles</option>
					<option value="SL">Sierra Leone</option>
					
					<option value="SX">Sint Maarten (Dutch part)</option>
					<option value="SK">Slovakia</option>
					<option value="SI">Slovenia</option>
					<option value="SB">Solomon Islands</option>
					<option value="SO">Somalia</option>
					<option value="ZA">South Africa</option>
					<option value="GS">South Georgia and the South Sandwich Islands</option>
					<option value="SS">South Sudan</option>
					<option value="ES">Spain</option>
					<option value="LK">Sri Lanka</option>
					<option value="SD">Sudan</option>
					<option value="SR">Suriname</option>
					<option value="SJ">Svalbard and Jan Mayen</option>
					<option value="SZ">Swaziland</option>
					<option value="SE">Sweden</option>
					<option value="CH">Switzerland</option>
					<option value="SY">Syrian Arab Republic</option>
					<option value="TW">Taiwan, Province of China</option>
					<option value="TJ">Tajikistan</option>
					<option value="TZ">Tanzania, United Republic of</option>
					<option value="TH">Thailand</option>
					<option value="TL">Timor-Leste</option>
					<option value="TG">Togo</option>
					<option value="TK">Tokelau</option>
					<option value="TO">Tonga</option>
					<option value="TT">Trinidad and Tobago</option>
					<option value="TN">Tunisia</option>
					<option value="TR">Turkey</option>
					<option value="TM">Turkmenistan</option>
					<option value="TC">Turks and Caicos Islands</option>
					<option value="TV">Tuvalu</option>
					<option value="UG">Uganda</option>
					<option value="UA">Ukraine</option>
					<option value="AE">United Arab Emirates</option>
					<option value="GB">United Kingdom</option>
					<option value="US">United States</option>
					<option value="UM">United States Minor Outlying Islands</option>
					<option value="UY">Uruguay</option>
					<option value="UZ">Uzbekistan</option>
					<option value="VU">Vanuatu</option>
					<option value="VE">Venezuela, Bolivarian Republic of</option>
					<option value="Viet Nam">Viet Nam</option>
					<option value="VG">Virgin Islands, British</option>
					<option value="VI">Virgin Islands, U.S.</option>
					<option value="WF">Wallis and Futuna</option>
					<option value="EH">Western Sahara</option>
					<option value="YE">Yemen</option>
					<option value="Zambia">Zambia</option>
					<option value="Zimbabwe">Zimbabwe</option>
				  </select>
				</div>	
				<div id="option" class="option-add">
				  <label>Phone Number: </label>
				  <input type="text" name="gift_phone" placeholder="Phone Number" class="validate[required,minSize[6]]"/>
				</div>	
				<div id="option" class="option-add">
				  <label>Fax Number: </label>
				  <input type="text" name="gift_fax"  placeholder="Fax Number" class="validate[required,minSize[3]]" />
				</div>	
				<div id="option" class="option-add">
				  <label>E-mail: </label>
				  <input type="text" name="gift_email" placeholder="E-mail" class="validate[required,custom[email],minSize[5]]" />
				</div>			
			</div>
		</div> 
		
	    <div class="cart-add-gif">
			<a id="button-cart"  onclick="$('#gift_form').submit();" class="button-prod" ><i class="fa fa-gift"></i><span> confirm selection AND PROCEED TO submit</span></a> 
		</div>
		<div class="clear"></div>
	</div>
  </div>
  </div>
	<div class="tabs">
		<div class="tab-heading-add">
			<?php echo $tab_description; ?>
		</div>
		<div class="tab-content-add">
			<?php echo $description; ?>
		</div>

	</div>
	  
  </div>
  
  <?php echo $content_bottom; ?></div>
 
  <!--right add-->
	<div class="right-add">
		<aside class="col-sm-3" id="column-right">		
			<div class="box specials">
                            <div class="box-heading-custom special-heading"><a href="#">other Free Gifts</a></div>
					<div class="box-content">						
						<ul class="acount">	
						<!--use $gift set color current style="color:<?php //echo $color1; ?>"-->			
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G199">BELOW $200</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G399">$200- $399</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G599">$400- $599</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G799">$600 - $799</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G999">$800 - $999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G1299">$1000 - $1299</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G1599">$1300 - $1599</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G1899">$1600 - $1899</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G2199">$1900 - $2199</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G2499">$2200 - $2499</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G2999">$2500 - $2999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G3499">$3000 - $3499</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G3999">$3500 - $3999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G4499">$4000 - $4499</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G4999">$4500 - $4999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G5499">$5000 - $5499</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G5999">$5500 - $5999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G6499">$6000 - $6499</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G6999">$6500 - $6999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G7999">$7000 - $7999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G8999">$8000 - $8999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G9999">$9000 - $9999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G11999">$10000 - $11999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G12999">$12000 - $12999</a></li>
						<li><a href=<?php HTTP_SERVER;?>"index.php?route=product/category&path=70#G13000">$13000 and above</a></li>		
						</ul>
					</div>
				<div class="clear"></div>
			</div>

			<!--product-->
			<?php if(isset($randomproduct)) : ?>
			<div class="box specials">
                    <div class="box-heading-custom-1 special-heading"><a href="#">Shop now !</a></div>
					<div class="box-content">	
					<?php 
						$i = 0;
						foreach($randomproduct as $key => $row){
    						if(++$i > 2) break;
    						//echo '<pre>'; var_dump($row['thumb']);
					?>					
					<li class="first-in-line last_line col-sm-12 right-list">
						<div class="product_image image2">
							<a href="<?php echo $row['href'];?>">

							<?php if ($row['thumb']) { ?><img id="img_<?php echo $row['product_id']; ?>" src="<?php echo $row['thumb']; ?>" width="270" height="264" alt="<?php echo $row['name']; ?>" /><?php } else { ?><img src="catalog/view/theme/theme483/image/no-image.png" alt="" /><?php } ?>
							</a>
						</div>
						<div class="inner maxheight-feat" style="height: 140px;margin: 22px;">
							<div class="f-left">					
								<div class="product_name name"><a href="<?php echo $row['href'];?>"><?php echo $row['name']; ?></a></div>
								<div class="product_description description"><?php echo substr($row['description'],0,100); ?>...</div>
								<div class="product_price">
									<div class="price">
										$<?php echo $row['price'];?>	
									</div>
								</div>
							</div>				
							<div class="product_rating rating"></div>
							<div class="clear"></div>
							<div class="product_button" style="float: right;margin-right: -22px;margin-top: 40px;">
								<div class="cart">
									<a data-id="<?php echo $row['product_id']; ?>" title="" class="tooltip-1 button addToCart" data-original-title="Add to Cart"><span class="over"></span><span class="over"></span>
										<i class="fa fa-shopping-cart"></i>
									</a>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					<?php } ?>
					</div>
				<div class="clear"></div>
			</div>	
			<?php endif; ?>

		</aside>
	</div>

<?php } ?>
<script type="text/javascript">
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
</script> 
<script type="text/javascript">
  
  $('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
  
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
				if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span><i class="fa fa-times-circle"></i></span></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				$('#cart-total2').html(json['total']);
				$('#cart').load('index.php?route=module/cart #cart > *');
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
			setTimeout(function() {$('.success').fadeOut(1000)},3000)
		}
	});
});
</script>

<?php echo $footer; ?>