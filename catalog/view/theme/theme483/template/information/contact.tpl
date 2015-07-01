<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-12<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>"  method="post" enctype="multipart/form-data" id="contact" class="form-horizontal">
	<h2 style="display:none"><?php echo $text_location; ?></h2>
	<div class="contact-info">
		<div class="content row">
			<div class="map-left col-sm-6">      
				<div class="contact-box"><i class="fa fa-home"></i><b class="green-color"><?php echo $text_address; ?></b>
					<b class="black-color"><?php echo $address; ?></b> 
				</div>
				<div class="contact-box">
					<?php if ($telephone) { ?>
					<i class="fa fa-phone"></i><b class="green-color"><?php echo $text_telephone; ?></b>
					<b class="black-color"><?php echo $telephone; ?></b> 
					<?php } ?>
				</div>
				<div class="contact-box">
					<?php if ($fax) { ?>
					<i class="fa fa-phone"></i><b class="green-color"><?php echo $text_fax; ?></b>
					<b class="black-color"><?php echo $fax; ?></b> 
					<?php } ?>
				</div>
				<div class="contact-box">
					<?php if ($text_email_add) { ?>
					<i class="fa fa-envelope"></i><b class="green-color"><?php echo $text_email; ?></b>
					<b class="black-color"><?php echo $text_email_add; ?></b> 
					<?php } ?>
				</div>
			</div>
			<div class="map-content col-sm-6">         
				<figure>
				<!-- <iframe width="100%" height="200px"  src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3988.7354239402207!2d103.860624!3d1.334948!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da177a6c9cd785%3A0xe1d27edd89ec6bec!2sGig+Printing+Co+Pte.+Ltd.!5e0!3m2!1sen!2ssg!4v1422514359976" width="600" height="450" frameborder="0" style="border:0"></iframe> -->
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63819.53347773014!2d103.75221699999999!3d1.3439061283403484!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1014d3aa72bd%3A0x8c48080bc820126b!2sGig+Printing+Co+Pte+Ltd!5e0!3m2!1sen!2ssg!4v1429506088617" width="100%" height="200px" frameborder="0" style="border:0"></iframe>
				</figure>
			</div>
		</div>
	</div>
	<div class="content contact-f form-horizontal">
		<div class="box-content-es">
		        <div class="row">  	
		            <div class="col-sm-12">
		                <div class="query-form-contact">
		                    <div class="status alert alert-success" style="display: none"></div>
		                        <div class="form-group-es col-md-6">
                                            <div class="row">
                                                <label class="col-md-4" for="name"><?php echo $entry_name; ?></label>
                                                <span class="col-md-8"><input type="text" name="name" value="<?php echo $name; ?>" class="validate[required,minSize[3]]" ></span>
                                            </div>
                                        </div>           
                                        
                                        <div class="form-group-es col-md-6">
                                            <div class="row">
                                                <label class="col-md-4" for="company"><?php echo $entry_company; ?></label>
                                                <span class="col-md-8"><input type="text" name="company" value="<?php echo $company; ?>" class="validate[required,minSize[3]]" ></span>
                                            </div>
                                        </div>  

                                    	<div class="form-group-es col-md-6">
                                            <div class="row">
                                                <label class="col-md-4" for="tel"><?php echo $entry_tel; ?></label>
                                                <span class="col-md-8"><input type="text" name="tel" value="<?php echo $tel; ?>" class="validate[required,minSize[3]]" ></span>
                                            </div>
                                        </div> 
                                    
                                        <div class="form-group-es col-md-6">
                                            <div class="row">
                                                <label class="col-md-4" for="company"><?php echo $entry_email; ?></label>
                                                <span class="col-md-8"><input type="text" name="email" value="<?php echo $email; ?>" class="validate[required,custom[email],minSize[5]]" ></span>
                                            </div>
                                        </div>
                                           
		                        <div class="form-group-es col-md-12">
		                            <div class="row">
		                                <label class="col-md-2" for="enquiry" style="width:19.5%"><?php echo $entry_enquiry; ?></label>
		                                <span class="col-md-10" style="width:80.5%"><textarea name="enquiry" id="enquiry" class="form-control" rows="10"><?php echo $enquiry; ?></textarea></span>
                                            </div>
		                        </div>   
                                                                      
		                        <div class="form-group-es col-md-12">
                                            <div class="buttons"><a style="width: 143px;height: 45px;background: #6C9B24;color: #fff;text-transform: uppercase;border-radius: 0 !important;font-size: 24px;" onclick="$('#contact').submit();" class="btn pull-right" ><span>Submit</span></a></div>
		                        </div>
		                </div>
		            </div>
			</div> 
		  </div> <!-- end box-content -->
	</div>
</form>
</div>
<?php echo $footer; ?>