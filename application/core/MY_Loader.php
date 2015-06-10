<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MY_Loader extends CI_Loader {
	
	public function template($template_name, $vars, $return = FALSE){
		$this->view('skin/header', $vars, $return);
		$this->view($template_name, $vars, $return);
		$this->view('skin/footer', $vars, $return);
	}
	
	public function template_admin($template_name, $vars, $sidebar = FALSE, $return = FALSE){
		$this->view('skin/header_admin', $vars, $return);
		if ($sidebar) $this->view('skin/sidebar', $vars);
		$this->view('admin/'.$template_name, $vars, $return);
		$this->view('skin/footer_admin', $vars, $return);
	}
	
	public function cek_sesi($enableRedirect = true){	
		if(isset($_SESSION['sessionType'])){
			return true;
		}else{
			if ($enableRedirect)
				header("Location:".site_url('control_autentikasi/index/?url='.urlencode($_SERVER['REQUEST_URI'])));
		}
		return false;
	}
}