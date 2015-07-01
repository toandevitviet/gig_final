<?php
class Image {
	private $file;
	private $image;
	private $info;

	public function __construct($file) {
		if (file_exists($file)) {
			$this->file = $file;

			$info = getimagesize($file);

			$this->info = array(
				'width'  => $info[0],
				'height' => $info[1],
				'bits'   => $info['bits'],
				'mime'   => $info['mime']
			);

			$this->image = $this->create($file);
		} else {
			exit('Error: Could not load image ' . $file . '!');
		}
	}

	private function create($image) {
		$mime = $this->info['mime'];

		if ($mime == 'image/gif') {
			return imagecreatefromgif($image);
		} elseif ($mime == 'image/png') {
			return imagecreatefrompng($image);
		} elseif ($mime == 'image/jpeg') {
			return imagecreatefromjpeg($image);
		}
	}

	public function save($file, $quality = 90) {
		$info = pathinfo($file);

		$extension = strtolower($info['extension']);

		if (is_resource($this->image)) {
			if ($extension == 'jpeg' || $extension == 'jpg') {
				imagejpeg($this->image, $file, $quality);
			} elseif($extension == 'png') {
				imagepng($this->image, $file);
			} elseif($extension == 'gif') {
				imagegif($this->image, $file);
			}

			imagedestroy($this->image);
		}
	}

	public function resize($width = 0, $height = 0, $default = '') {
		if (!$this->info['width'] || !$this->info['height']) {
			return;
		}

		$xpos = 0;
		$ypos = 0;
		$scale = 1;

		$scale_w = $width / $this->info['width'];
		$scale_h = $height / $this->info['height'];

		if ($default == 'w') {
			$scale = $scale_w;
		} elseif ($default == 'h'){
			$scale = $scale_h;
		} else {
			$scale = min($scale_w, $scale_h);
		}

		if ($scale == 1 && $scale_h == $scale_w && $this->info['mime'] != 'image/png') {
			return;
		}

		$new_width = (int)($this->info['width'] * $scale);
		$new_height = (int)($this->info['height'] * $scale);			
		$xpos = (int)(($width - $new_width) / 2);
		$ypos = (int)(($height - $new_height) / 2);

		$image_old = $this->image;
		$this->image = imagecreatetruecolor($width, $height);

		if (isset($this->info['mime']) && $this->info['mime'] == 'image/png') {		
			imagealphablending($this->image, false);
			imagesavealpha($this->image, true);
			$background = imagecolorallocatealpha($this->image, 255, 255, 255, 127);
			imagecolortransparent($this->image, $background);
		} else {
			$background = imagecolorallocate($this->image, 255, 255, 255);
		}

		imagefilledrectangle($this->image, 0, 0, $width, $height, $background);

		imagecopyresampled($this->image, $image_old, $xpos, $ypos, 0, 0, $new_width, $new_height, $this->info['width'], $this->info['height']);
		imagedestroy($image_old);

		$this->info['width']  = $width;
		$this->info['height'] = $height;
	}

	// Begin iWatermark - from iwatermark.xml vqmod file
	
	public function iWatermark(&$setting) {
		if ($setting['Enabled'] != 'true') return;
		
		$text_size = $setting['FontSize'];
		
		$font = IMODULE_ROOT.'vendors/iwatermark/font/'.$setting['Font'];
		
		if ($setting['Type'] == 'text') {
			$text = $setting['Text'];
			
			$size = imagettfbbox($text_size, 0, $font, $text);
		
			$watermark_width = $size[4] - $size[6] + 5;
			$watermark_height = $size[1] - $size[7] + 5;
			
			$im = imagecreatetruecolor($watermark_width, $watermark_height);
			$backgroundalpha = imagecolorallocatealpha($im,0x00,0x00,0x00,127); 
			$coloralpha = imagecolorallocatealpha($im,$setting['ColorRGB']['r'],$setting['ColorRGB']['g'],$setting['ColorRGB']['b'],round(127*(100-$setting['Opacity'])/100)); 
			
			imagefill($im, 0, 0, $backgroundalpha);
			
			if (function_exists('imagettftext')) {
				imagettftext($im, $text_size, 0, 0, $text_size, $coloralpha, $font, $text);
			} else {
				imagestring($im, 5, 5, 5, $text, $coloralpha);
			}
			
			$setting['UseImageOpacity'] = true;
			
		} else if ($setting['Type'] == 'image') {
			$type = strtolower(substr($setting['ImagePath'], strrpos($setting['ImagePath'], '.') + 1));
			if ($type == 'jpg' || $type == 'jpeg') $im = imagecreatefromjpeg($setting['ImagePath']);
			else if ($type == 'png') $im = imagecreatefrompng($setting['ImagePath']);
			
			if (isset($im)) {
				$watermark_width = imagesx($im);
				$watermark_height = imagesy($im);
			
				if (empty($setting['UseImageOpacity'])) {
					$background = imagecreatetruecolor($watermark_width, $watermark_height);
					$black = imagecolorallocate($background, 0, 0, 0);
					imagefilledrectangle($background, 0, 0, $watermark_width, $watermark_height, $black);
					
					imagecopy($background, $im, 0, 0, 0, 0, $watermark_width, $watermark_height);
					$im = $background;
				}
			}
		}
		
		// Rotate watermark
		$im = imagerotate($im, (int)$setting['Rotation'], imagecolorallocatealpha($im,0x00,0x00,0x00,127));
		
		$watermark_width = imagesx($im);
		$watermark_height = imagesy($im);
		
		// Resize watermark
		$imageWidth = $this->info['width'];
		
		if ($imageWidth < $watermark_width) {
			$proportion = $setting['ConfigWidth']/$watermark_width;
			$watermark_proportion = $watermark_width/$watermark_height;
			$watermark_new_width = ($proportion <= 1) ? $imageWidth*$proportion : $imageWidth/$proportion;
			$watermark_new_height = $watermark_new_width/$watermark_proportion;
			$im_new = imagecreatetruecolor($watermark_new_width, $watermark_new_height);
			$coloralpha = imagecolorallocatealpha($im_new,0x00,0x00,0x00,127); 
			imagefill($im_new, 0, 0, $coloralpha);
			imagecopyresampled($im_new, $im, 0, 0, 0, 0, $watermark_new_width, $watermark_new_height, $watermark_width, $watermark_height);
			$watermark_width = $watermark_new_width;
			$watermark_height = $watermark_new_height;
			$im = $im_new;
		}
		
		if (isset($im)) {
			switch($setting['Position']) {
				case 'top_left':
					$watermark_pos_x = 0;
					$watermark_pos_y = 0;
					break;
				case 'top_right':
					$watermark_pos_x = $this->info['width'] - $watermark_width;
					$watermark_pos_y = 0;
					break;
				case 'center':
					$watermark_pos_x = floor($this->info['width']/2 - $watermark_width/2);
					$watermark_pos_y = floor($this->info['height']/2 - $watermark_height/2);;
					break;
				case 'bottom_left':
					$watermark_pos_x = 0;
					$watermark_pos_y = $this->info['height'] - $watermark_height;
					break;
				case 'bottom_right':
					$watermark_pos_x = $this->info['width'] - $watermark_width;
					$watermark_pos_y = $this->info['height'] - $watermark_height;
					break;
			}
			
			imagealphablending($this->image, true);
			imagealphablending($im, true);
			
			if (!empty($setting['UseImageOpacity'])) imagecopy($this->image, $im, $watermark_pos_x, $watermark_pos_y, 0, 0, $watermark_width, $watermark_height);
			else imagecopymerge($this->image, $im, $watermark_pos_x, $watermark_pos_y, 0, 0, $watermark_width, $watermark_height, $setting['Opacity']);
			imagedestroy($im);
		}
	}
	
	// End iWatermark
			
	public function watermark($file, $position = 'bottomright') {
		$watermark = $this->create($file);

		$watermark_width = imagesx($watermark);
		$watermark_height = imagesy($watermark);

		switch($position) {
			case 'topleft':
				$watermark_pos_x = 0;
				$watermark_pos_y = 0;
				break;
			case 'topright':
				$watermark_pos_x = $this->info['width'] - $watermark_width;
				$watermark_pos_y = 0;
				break;
			case 'bottomleft':
				$watermark_pos_x = 0;
				$watermark_pos_y = $this->info['height'] - $watermark_height;
				break;
			case 'bottomright':
				$watermark_pos_x = $this->info['width'] - $watermark_width;
				$watermark_pos_y = $this->info['height'] - $watermark_height;
				break;
		}

		imagecopy($this->image, $watermark, $watermark_pos_x, $watermark_pos_y, 0, 0, 120, 40);

		imagedestroy($watermark);
	}

	public function crop($top_x, $top_y, $bottom_x, $bottom_y) {
		$image_old = $this->image;
		$this->image = imagecreatetruecolor($bottom_x - $top_x, $bottom_y - $top_y);

		imagecopy($this->image, $image_old, 0, 0, $top_x, $top_y, $this->info['width'], $this->info['height']);
		imagedestroy($image_old);

		$this->info['width'] = $bottom_x - $top_x;
		$this->info['height'] = $bottom_y - $top_y;
	}

	public function rotate($degree, $color = 'FFFFFF') {
		$rgb = $this->html2rgb($color);

		$this->image = imagerotate($this->image, $degree, imagecolorallocate($this->image, $rgb[0], $rgb[1], $rgb[2]));

		$this->info['width'] = imagesx($this->image);
		$this->info['height'] = imagesy($this->image);
	}

	private function filter($filter) {
		imagefilter($this->image, $filter);
	}

	private function text($text, $x = 0, $y = 0, $size = 5, $color = '000000') {
		$rgb = $this->html2rgb($color);

		imagestring($this->image, $size, $x, $y, $text, imagecolorallocate($this->image, $rgb[0], $rgb[1], $rgb[2]));
	}

	private function merge($file, $x = 0, $y = 0, $opacity = 100) {
		$merge = $this->create($file);

		$merge_width = imagesx($image);
		$merge_height = imagesy($image);

		imagecopymerge($this->image, $merge, $x, $y, 0, 0, $merge_width, $merge_height, $opacity);
	}

	private function html2rgb($color) {
		if ($color[0] == '#') {
			$color = substr($color, 1);
		}

		if (strlen($color) == 6) {
			list($r, $g, $b) = array($color[0] . $color[1], $color[2] . $color[3], $color[4] . $color[5]);   
		} elseif (strlen($color) == 3) {
			list($r, $g, $b) = array($color[0] . $color[0], $color[1] . $color[1], $color[2] . $color[2]);    
		} else {
			return false;
		}

		$r = hexdec($r); 
		$g = hexdec($g); 
		$b = hexdec($b);    

		return array($r, $g, $b);
	}	
}
?>