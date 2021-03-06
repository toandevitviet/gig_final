<?php 
class export_ControllerCommonHeader extends ControllerCommonHeader {

	// overridden method
	protected function preRender( $templateBuffer ) {
		if ($this->template != 'common/header.tpl') {
			return parent::preRender( $templateBuffer );
		}
		if (!$this->user->isLogged() || !isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
			return parent::preRender( $templateBuffer );
		}

		// add the export menus to the header
		$this->load->helper( 'modifier' );
		$search = '<li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>';
		$templateBuffer = Modifier::modifyStringBuffer( $templateBuffer,$search,$add,'after' );
		return parent::preRender($templateBuffer);
	}
}
?>
