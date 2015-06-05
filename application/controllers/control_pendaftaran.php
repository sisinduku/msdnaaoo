<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Control_pendaftaran extends CI_Controller{
	
	public function index(){
		$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
		$this->load->template("form_pendaftaran", $data);		
	}
	
	public function daftar_mahasiswa(){
		$this->load->model("mahasiswa");
		$this->mahasiswa->daftarMahasiswa();
		$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
	}
}