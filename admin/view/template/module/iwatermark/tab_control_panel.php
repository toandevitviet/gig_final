<div id="tabs" class="htabs">
	<?php foreach ($stores as $store) : ?>
    <a href="#tab-watermark_<?php echo $store['store_id']; ?>"><?php echo $store['name'] ?></a>
    <?php endforeach; ?>
</div>
<?php foreach ($stores as $store) : ?>
<div id="tab-watermark_<?php echo $store['store_id']; ?>">
    <table class="form">
        <tr>
            <td><span class="required">*</span> <?php echo $entry_code; ?></td>
            <td>
                <select name="iWatermark[<?php echo $store['store_id']; ?>][Enabled]" class="iWatermarkEnabled_<?php echo $store['store_id']; ?>">
                    <option value="true" <?php echo (!empty($data['iWatermark'][$store['store_id']]['Enabled']) && $data['iWatermark'][$store['store_id']]['Enabled'] == 'true') ? 'selected=selected' : ''?>><?php echo $text_enabled; ?></option>
                    <option value="false" <?php echo (empty($data['iWatermark'][$store['store_id']]['Enabled']) || $data['iWatermark'][$store['store_id']]['Enabled'] == 'false') ? 'selected=selected' : ''?>><?php echo $text_disabled; ?></option>
                </select>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_watermark_limit; ?></td>
            <td>
                <select id="iWatermarkLimitSizeType_<?php echo $store['store_id']; ?>" name="iWatermark[<?php echo $store['store_id']; ?>][LimitSizeType]">
                	<option value="all"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitSizeType']) && $data['iWatermark'][$store['store_id']]['LimitSizeType'] == 'all' ? ' selected="selected"' : ''; ?>><?php echo $entry_all_images; ?></option>
                    <option value="bigger_than"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitSizeType']) && $data['iWatermark'][$store['store_id']]['LimitSizeType'] == 'bigger_than' ? ' selected="selected"' : ''; ?>><?php echo $entry_bigger_than; ?></option>
                    <option value="smaller_than"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitSizeType']) && $data['iWatermark'][$store['store_id']]['LimitSizeType'] == 'smaller_than' ? ' selected="selected"' : ''; ?>><?php echo $entry_smaller_than; ?></option>
                </select>
                <span id="iWatermarkLimitSizes_<?php echo $store['store_id']; ?>" style="display: none;">
                	<input size="4" type="text" name="iWatermark[<?php echo $store['store_id']; ?>][LimitSizeWidth]" value="<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitSizeWidth']) ? $data['iWatermark'][$store['store_id']]['LimitSizeWidth'] : '' ?>"> x <input size="4" type="text" name="iWatermark[<?php echo $store['store_id']; ?>][LimitSizeHeight]" value="<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitSizeHeight']) ? $data['iWatermark'][$store['store_id']]['LimitSizeHeight'] : '' ?>"> (W x H)
                </span>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_watermark_limit_categories; ?></td>
            <td>
                <select id="iWatermarkLimitCategories_<?php echo $store['store_id']; ?>" name="iWatermark[<?php echo $store['store_id']; ?>][LimitCategories]">
                	<option value="all"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitCategories']) && $data['iWatermark'][$store['store_id']]['LimitCategories'] == 'all' ? ' selected="selected"' : ''; ?>><?php echo $entry_all_categories; ?></option>
                    <option value="specific"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitCategories']) && $data['iWatermark'][$store['store_id']]['LimitCategories'] == 'specific' ? ' selected="selected"' : ''; ?>><?php echo $entry_following_categories; ?></option>
                </select>
                <div id="iWatermarkLimitCategory_<?php echo $store['store_id']; ?>" style="display: none;">
                	<input type="text" name="category_<?php echo $store['store_id']; ?>" value="" /><br />
                	<div id="product-category_<?php echo $store['store_id']; ?>" class="scrollbox">
						<?php $class = 'odd'; ?>
                        <?php foreach ($product_categories[$store['store_id']] as $product_category) { ?>
                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                        <div id="product-category_<?php echo $store['store_id']; ?>_<?php echo $product_category['category_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_category['name']; ?><img src="view/image/delete.png" alt="" />
                        <input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][LimitCategoriesList][]" value="<?php echo $product_category['category_id']; ?>" />
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_watermark_limit_related; ?></td>
            <td>
                <select id="iWatermarkLimitRelated_<?php echo $store['store_id']; ?>" name="iWatermark[<?php echo $store['store_id']; ?>][LimitRelated]">
                	<option value="all"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitRelated']) && $data['iWatermark'][$store['store_id']]['LimitRelated'] == 'all' ? ' selected="selected"' : ''; ?>><?php echo $entry_all_related; ?></option>
                    <option value="specific"<?php echo !empty($data['iWatermark'][$store['store_id']]['LimitRelated']) && $data['iWatermark'][$store['store_id']]['LimitRelated'] == 'specific' ? ' selected="selected"' : ''; ?>><?php echo $entry_following_related; ?></option>
                </select>
                <div id="iWatermarkLimitRelatedEntry_<?php echo $store['store_id']; ?>" style="display: none;">
                	<input type="text" name="related_<?php echo $store['store_id']; ?>" value="" /><br />
                	<div id="product-related_<?php echo $store['store_id']; ?>" class="scrollbox">
						<?php $class = 'odd'; ?>
                        <?php foreach ($products_related[$store['store_id']] as $product_related) { ?>
                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                        <div id="product-related_<?php echo $store['store_id']; ?>_<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_related['name']; ?><img src="view/image/delete.png" alt="" />
                        <input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][LimitRelatedList][]" value="<?php echo $product_related['product_id']; ?>" />
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_type; ?></td>
            <td>
                <input type="radio" data-affects=".iWatermarkImageTR_<?php echo $store['store_id']; ?>, .iWatermarkOpacityTR_<?php echo $store['store_id']; ?>" id="iWatermarkTypeImage_<?php echo $store['store_id']; ?>" name="iWatermark[<?php echo $store['store_id']; ?>][Type]" value="image"<?php echo !empty($data['iWatermark'][$store['store_id']]['Type']) && $data['iWatermark'][$store['store_id']]['Type'] == 'image' ? ' checked="checked"' : '' ?>><label for="iWatermarkTypeImage_<?php echo $store['store_id']; ?>"><?php echo $text_type_image; ?></label>
                <input type="radio" data-affects=".iWatermarkTextTR_<?php echo $store['store_id']; ?>, .iWatermarkOpacityTR_<?php echo $store['store_id']; ?>" id="iWatermarkTypeText_<?php echo $store['store_id']; ?>" name="iWatermark[<?php echo $store['store_id']; ?>][Type]" value="text"<?php echo !empty($data['iWatermark'][$store['store_id']]['Type']) && $data['iWatermark'][$store['store_id']]['Type'] == 'text' ? ' checked="checked"' : '' ?>><label for="iWatermarkTypeText_<?php echo $store['store_id']; ?>"><?php echo $text_type_text; ?></label>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkImageTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_image; ?></td>
            <td>
                <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $maxSize; ?>" /> 
                <input type="file" name="iWatermark[<?php echo $store['store_id']; ?>][Image]" /><span class="fileSizeInfo"><?php echo $text_max_size; ?> <?php echo $maxSizeReadable; ?><?php if ($maxSize < 1024) : ?><a class='needMoreSize' href="javascript:void(0)"><?php echo $text_max_size_learn; ?></a><?php endif; ?></span>
            </td>
        </tr>
        <?php if (!empty($data['iWatermark'][$store['store_id']]['Image']) && !empty($data['iWatermark'][$store['store_id']]['ImagePath'])) : ?>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkImageTR_<?php echo $store['store_id']; ?>">
            <td><?php echo $entry_current_image; ?></td>
            <td>
                <div><img src="<?php echo $data['iWatermark'][$store['store_id']]['Image'] ?>" alt="<?php echo $text_type_image; ?>"/></div>
                <input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][Image]" value="<?php echo $data['iWatermark'][$store['store_id']]['Image'] ?>" />
                <input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][ImagePath]" value="<?php echo $data['iWatermark'][$store['store_id']]['ImagePath'] ?>" />
            </td>
        </tr>
        <?php endif; ?>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkTextTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_text; ?></td>
            <td>
                <input type="text" name="iWatermark[<?php echo $store['store_id']; ?>][Text]" placeholder="My Watermark" value="<?php echo !empty($data['iWatermark'][$store['store_id']]['Text']) ? $data['iWatermark'][$store['store_id']]['Text'] : '' ?>">
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkTextTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_font; ?></td>
            <td>
            	<select name="iWatermark[<?php echo $store['store_id']; ?>][Font]">
                	<?php foreach ($fonts as $font) : ?>
                    <option value="<?php echo $font; ?>"<?php echo (!empty($data['iWatermark'][$store['store_id']]['Font']) && $data['iWatermark'][$store['store_id']]['Font'] == $font) ? ' selected=selected ' : ''?>><?php echo $font; ?></option>
                    <?php endforeach; ?>
                </select>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkTextTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_font_size; ?></td>
            <td>
                <select name="iWatermark[<?php echo $store['store_id']; ?>][FontSize]">
                	<?php for ($s = 8; $s <= 100; $s++) : ?>
                    <option value="<?php echo $s; ?>"<?php echo (!empty($data['iWatermark'][$store['store_id']]['FontSize']) && $data['iWatermark'][$store['store_id']]['FontSize'] == $s) ? ' selected=selected ' : ''?>><?php echo $s; ?></option>
                    <?php endfor; ?>
                </select>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkTextTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_text_color; ?></td>
            <td class="colorWidget">
            	<div class="colorSelectorWrapper">
                	<div class="colorSelector" id="colorSelector_<?php echo $store['store_id']; ?>">
                    	<div style="background-color: #<?php echo !empty($data['iWatermark'][$store['store_id']]['Color']) ? $data['iWatermark'][$store['store_id']]['Color'] : 'ffffff'; ?>"></div>
                	</div>
                	<div class="colorpickerHolder" id="colorpickerHolder_<?php echo $store['store_id']; ?>"></div>
                	<input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][Color]" value="<?php echo !empty($data['iWatermark'][$store['store_id']]['Color']) ? $data['iWatermark'][$store['store_id']]['Color'] : 'ffffff'; ?>">
            	</div>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_position; ?></td>
            <td>
                <select name="iWatermark[<?php echo $store['store_id']; ?>][Position]">
                    <option value="top_left" <?php echo !empty($data['iWatermark'][$store['store_id']]['Position']) && $data['iWatermark'][$store['store_id']]['Position'] == 'top_left' ? 'selected=selected' : ''?>><?php echo $text_top_left; ?></option>
                    <option value="top_right" <?php echo !empty($data['iWatermark'][$store['store_id']]['Position']) && $data['iWatermark'][$store['store_id']]['Position'] == 'top_right' ? 'selected=selected' : ''?>><?php echo $text_top_right; ?></option>
                    <option value="center" <?php echo !empty($data['iWatermark'][$store['store_id']]['Position']) && $data['iWatermark'][$store['store_id']]['Position'] == 'center' ? 'selected=selected' : ''?>><?php echo $text_center; ?></option>
                    <option value="bottom_left" <?php echo !empty($data['iWatermark'][$store['store_id']]['Position']) && $data['iWatermark'][$store['store_id']]['Position'] == 'bottom_left' ? 'selected=selected' : ''?>><?php echo $text_bottom_left; ?></option>
                    <option value="bottom_right" <?php echo !empty($data['iWatermark'][$store['store_id']]['Position']) && $data['iWatermark'][$store['store_id']]['Position'] == 'bottom_right' ? 'selected=selected' : ''?>><?php echo $text_bottom_right; ?></option>
                </select>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_rotation; ?></td>
            <td>
                <input type="number" name="iWatermark[<?php echo $store['store_id']; ?>][Rotation]" min="0" max="360" value="<?php echo isset($data['iWatermark'][$store['store_id']]['Rotation']) ? $data['iWatermark'][$store['store_id']]['Rotation'] : '0' ?>" /> &deg;
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkImageTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_image_opacity; ?></td>
            <td>
                <input type="checkbox" id="iWatermarkUseImageOpacity_<?php echo $store['store_id']; ?>" data-affects=".iWatermarkOpacityTR_<?php echo $store['store_id']; ?>" data-reversed="true" name="iWatermark[<?php echo $store['store_id']; ?>][UseImageOpacity]" value="true"<?php echo !empty($data['iWatermark'][$store['store_id']]['UseImageOpacity']) ? ' checked="checked"' : ''; ?>>
            </td>
        </tr>
        <tr class="iWatermarkActiveTR_<?php echo $store['store_id']; ?> iWatermarkOpacityTR_<?php echo $store['store_id']; ?>">
            <td><span class="required">*</span> <?php echo $entry_opacity; ?></td>
            <td>
                <input type="number" name="iWatermark[<?php echo $store['store_id']; ?>][Opacity]" min="0" max="100" value="<?php echo isset($data['iWatermark'][$store['store_id']]['Opacity']) ? $data['iWatermark'][$store['store_id']]['Opacity'] : '70' ?>" /> %
            </td>
        </tr>
    </table>
</div>
<?php endforeach; ?>
<script type="text/javascript">
$(document).ready(function() {
	<?php foreach ($stores as $store) : ?>
		var dependable_<?php echo $store['store_id']; ?> = $('#iWatermarkTypeImage_<?php echo $store['store_id']; ?>, #iWatermarkTypeText_<?php echo $store['store_id']; ?>, #iWatermarkUseImageOpacity_<?php echo $store['store_id']; ?>');
		var widt_<?php echo $store['store_id']; ?> = false;
		
		var toggleiWatermarkActive_<?php echo $store['store_id']; ?> = function(animated) {
			if ($('.iWatermarkEnabled_<?php echo $store['store_id']; ?>').val() == 'true') {
				$('.iWatermarkActiveTR_<?php echo $store['store_id']; ?>').each(function(index, element) {
					if ($(element).attr('data-hidden') != 'true') {
						if (animated) 
							$(element).fadeIn();
						else 
							$(element).show();
					}
				});
				
			} else {
				if (animated) 
					$('.iWatermarkActiveTR_<?php echo $store['store_id']; ?>').fadeOut();
				else 
					$('.iWatermarkActiveTR_<?php echo $store['store_id']; ?>').hide();
			}
		}
		
		$('.iWatermarkEnabled_<?php echo $store['store_id']; ?>').change(function() {
			toggleiWatermarkActive_<?php echo $store['store_id']; ?>(true);
		});
		
		$('#iWatermarkLimitSizeType_<?php echo $store['store_id']; ?>').change(function() {
			if ($(this).val() != 'all') $('#iWatermarkLimitSizes_<?php echo $store['store_id']; ?>').fadeIn();
			else {
				$('#iWatermarkLimitSizes_<?php echo $store['store_id']; ?>').fadeOut();
				$('#iWatermarkLimitSizes_<?php echo $store['store_id']; ?> input').val('');
			}
		});
		
		$('#iWatermarkLimitCategories_<?php echo $store['store_id']; ?>').change(function() {
			if ($(this).val() != 'all') $('#iWatermarkLimitCategory_<?php echo $store['store_id']; ?>').fadeIn();
			else {
				$('#iWatermarkLimitCategory_<?php echo $store['store_id']; ?>').fadeOut();
				$('#iWatermarkLimitCategory_<?php echo $store['store_id']; ?> input').val('');
			}
		});
		
		$('#iWatermarkLimitRelated_<?php echo $store['store_id']; ?>').change(function() {
			if ($(this).val() != 'all') $('#iWatermarkLimitRelatedEntry_<?php echo $store['store_id']; ?>').fadeIn();
			else {
				$('#iWatermarkLimitRelatedEntry_<?php echo $store['store_id']; ?>').fadeOut();
				$('#iWatermarkLimitRelatedEntry_<?php echo $store['store_id']; ?> input').val('');
			}
		});
	
		$('#colorpickerHolder_<?php echo $store['store_id']; ?>').ColorPicker({
			flat: true,
			color: '#<?php echo !empty($data['iWatermark'][$store['store_id']]['Color']) ? $data['iWatermark'][$store['store_id']]['Color'] : 'ffffff'; ?>',
			onSubmit: function(hsb, hex, rgb) {
				$('#colorSelector_<?php echo $store['store_id']; ?> div').css('backgroundColor', '#' + hex);
			},
			onShow: function (colpkr) {
				$(colpkr).fadeIn(500);
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).fadeOut(500);
				return false;
			},
			onChange: function (hsb, hex, rgb) {
				$('#colorSelector_<?php echo $store['store_id']; ?> div').css('backgroundColor', '#' + hex);
				$('input[name="iWatermark[<?php echo $store['store_id']; ?>][Color]"]').val(hex);
			}
		});
		
		$('#colorSelector_<?php echo $store['store_id']; ?>').bind('click', function() {
			$('#colorpickerHolder_<?php echo $store['store_id']; ?>').css({height: widt_<?php echo $store['store_id']; ?> ? 0 : 173}, 500);
			widt_<?php echo $store['store_id']; ?> = !widt_<?php echo $store['store_id']; ?>;
		});
		
		$(dependable_<?php echo $store['store_id']; ?>).each(function(index, element) {
			var selector = $(element).attr('data-affects');
			var selected = $(element).is(':checked') && !$(element).is(':hidden') && $(element).attr('data-hidden') != 'true';
			if ($(element).attr('data-reversed') == 'true') selected = !selected;
			if (selected) $(selector).attr('data-hidden', false).show(); else $(selector).attr('data-hidden', true).hide();
			$(element).bind('change', function() {
				$(dependable_<?php echo $store['store_id']; ?>).each(function(index, element) {
					var selected = $(element).is(':checked') && !$(element).is(':hidden') && $(element).attr('data-hidden') != 'true';
					if ($(element).attr('data-reversed') == 'true') selected = !selected;
					var selector = $(element).attr('data-affects');
					if (selected) $(selector).attr('data-hidden', false).fadeIn();
					else $(selector).attr('data-hidden', true).hide();
				});
			});
		});
		
		// Category
		$('input[name=\'category_<?php echo $store['store_id']; ?>\']').autocomplete({
			delay: 500,
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=module/iwatermark/autocomplete_category&token=<?php echo $this->session->data['token']; ?>&filter_name=' +  encodeURIComponent(request.term),
					dataType: 'json',
					success: function(json) {		
						response($.map(json, function(item) {
							return {
								label: item.name,
								value: item.category_id
							}
						}));
					}
				});
			}, 
			select: function(event, ui) {
				$('#product-category_<?php echo $store['store_id']; ?>_' + ui.item.value).remove();
				
				$('#product-category_<?php echo $store['store_id']; ?>').append('<div id="product-category_<?php echo $store['store_id']; ?>_' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][LimitCategoriesList][]" value="' + ui.item.value + '" /></div>');
		
				$('#product-category_<?php echo $store['store_id']; ?> div:odd').attr('class', 'odd');
				$('#product-category_<?php echo $store['store_id']; ?> div:even').attr('class', 'even');
						
				return false;
			},
			focus: function(event, ui) {
			  return false;
		   }
		});
		
		$('#product-category_<?php echo $store['store_id']; ?> div img').live('click', function() {
			$(this).parent().remove();
			
			$('#product-category_<?php echo $store['store_id']; ?> div:odd').attr('class', 'odd');
			$('#product-category_<?php echo $store['store_id']; ?> div:even').attr('class', 'even');	
		});
		
		// Related
		$('input[name=\'related_<?php echo $store['store_id']; ?>\']').autocomplete({
			delay: 500,
			source: function(request, response) {
				$.ajax({
					url: 'index.php?route=module/iwatermark/autocomplete_product&token=<?php echo $this->session->data['token']; ?>&filter_name=' +  encodeURIComponent(request.term),
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
				$('#product-related_<?php echo $store['store_id']; ?>_' + ui.item.value).remove();
				
				$('#product-related_<?php echo $store['store_id']; ?>').append('<div id="product-related_<?php echo $store['store_id']; ?>_' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="iWatermark[<?php echo $store['store_id']; ?>][LimitRelatedList][]" value="' + ui.item.value + '" /></div>');
		
				$('#product-related_<?php echo $store['store_id']; ?> div:odd').attr('class', 'odd');
				$('#product-related_<?php echo $store['store_id']; ?> div:even').attr('class', 'even');
						
				return false;
			},
			focus: function(event, ui) {
			  return false;
		   }
		});
		
		$('#product-related_<?php echo $store['store_id']; ?> div img').live('click', function() {
			$(this).parent().remove();
			
			$('#product-related_<?php echo $store['store_id']; ?> div:odd').attr('class', 'odd');
			$('#product-related_<?php echo $store['store_id']; ?> div:even').attr('class', 'even');	
		});
		
		toggleiWatermarkActive_<?php echo $store['store_id']; ?>(false);
		$('#iWatermarkLimitSizeType_<?php echo $store['store_id']; ?>').trigger('change');
		$('#iWatermarkLimitCategories_<?php echo $store['store_id']; ?>').trigger('change');
		$('#iWatermarkLimitRelated_<?php echo $store['store_id']; ?>').trigger('change');
	<?php endforeach; ?>
	
	$('#tabs a').tabs();
	
	$('.needMoreSize').click(function() {
		window.open('../vendors/iwatermark/help_increase_size.php', '_blank', 'location=no,width=830,height=420,resizable=no');
	});
});
</script>