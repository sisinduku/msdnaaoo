<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Control_administrasi extends CI_Controller{
	
	public function index(){
		if(!$this->load->cek_sesi()) exit;
		
		$this->dashboard();
	}
	
	public function dashboard(){
		if(!$this->load->cek_sesi()) exit;
		
		$this->load->model("mahasiswa");
		$data['jumlahMahasiswa'] = $this->mahasiswa->countMahasiswa($this->session->sessionType);
		$data['jumlahMahasiswaByStat'] = $this->mahasiswa->countMahasiswa($this->session->sessionType, true);
		if ($this->session->sessionType == 1)
			$data['jenisAdmin'] = "super";
		else
			$data['jenisAdmin'] = "jurusan";
		$data['pageTitle'] = "Dashboard Administrator";
		$data['activePage'] = "dashboard";
		$this->load->template_admin("dashboard", $data, true);
	}
	
	public function lihat_mahasiswa(){
		if(!$this->load->cek_sesi()) exit;
		
		$data['pageTitle'] = "Dashboard Administrator";
		$data['activePage'] = "semua";
	}
}