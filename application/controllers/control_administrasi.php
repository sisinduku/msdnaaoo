<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Control_administrasi extends CI_Controller{
	public function dashboard(){
		if(!$this->load->cek_sesi()) exit;
		
		$data['pageTitle'] = "Dashboard Administrator";
		$this->load->template_admin("dashboard", $data);
	}
}