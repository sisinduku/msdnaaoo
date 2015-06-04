<?php

class MY_Loader extends CI_Loader {
	
	public function template($template_name, $vars, $return = FALSE){
		$this->view('skin/header', $vars, $return);
		$this->view($template_name, $vars, $return);
		$this->view('skin/footer', $vars, $return);
	}
}