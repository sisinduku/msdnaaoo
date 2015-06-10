<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Control_autentikasi extends CI_Controller{
	
	public function index(){
		if($this->load->cek_sesi(false)){
			$this->output->set_header("Location: ".site_url("/control_administrasi"));
			return;
		}
		if($this->input->get('url') !== null)
			$data['location'] = htmlspecialchars($this->input->get('url'));
		$data['useSimple'] = true;
		$data['pageTitle'] = "Halaman Login MSDNAA FSM Undip";
		$this->load->template_admin("form_login", $data);
	}
	
	public function login(){
		$data['pageTitle'] = "Halaman Login MSDNAA FSM Undip";
		$data['useSimple'] = true;
		if($this->input->post('location') !== null)
			$data['location'] = $this->input->post('location');
		
		if ($this->form_validation->run() == FALSE){
			
		}else{
			$this->load->model("admin");
			$data['errors'] = $this->admin->adminLogin();
			if (empty($data['errors']) && $this->input->post('location') == "")
				header("Location:".site_url("control_administrasi/dashboard"));
			if (empty($data['errors']) && $this->input->post('location') != "")
				header("Location:".base_url($this->input->post('location')));
		}
		$this->load->template_admin("form_login", $data);
	}

	public function logout(){
		$this->load->model('admin');
		$this->admin->adminLogout();
		$this->output->set_header("Location: ".site_url("/control_autentikasi"));
	}
}