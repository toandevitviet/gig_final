<?php echo $header; ?>
<?php echo $column_left; ?>
		<div class="<?php if ($column_left or $column_right) { ?>col-sm-12<?php } ?> <?php if (!$column_left & !$column_left) { ?>col-sm-12  <?php } ?> <?php if ($column_left & $column_right) { ?>col-sm-6<?php } ?>" id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" style="margin-left:3px" method="post" enctype="multipart/form-data" id="feedback_form" class="contact-form row">
	<h2 style="display:none"><?php echo $text_location; ?></h2>
	<div class="line-feedback"></div>
	<div class="feedback-info">
	<p class="text-header">
		<?php 
			$text_show = "At GIG, we value our customers. Thus, we are keen to listen to any feedback or suggestions that you have to continously improve our services. <br> Please help us to be better by submiting your feedback below.";
			echo $text_show;
		?>
	</p>
	</div>
	<div class="content feedback-f form-horizontal">
           
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
                                            <div class="buttons"><a style="width: 143px;height: 45px;background: #6C9B24;color: #fff;text-transform: uppercase;border-radius: 0 !important;font-size: 24px;" onclick="$('#feedback_form').submit();" class="btn pull-right" ><span>Submit</span></a></div>
		                        </div>
		                </div>
		            </div>
			</div> 
		  </div> <!-- end box-content -->
	</div>
            
  </form>
</div>
</form>

<?php echo $footer; ?>