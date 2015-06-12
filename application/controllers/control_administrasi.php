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
	
	public function lihat_mahasiswa($status = "all"){
		if(!$this->load->cek_sesi()) exit;
		
		$this->load->model('mahasiswa');
		$data['listMahasiswa'] = $this->mahasiswa->getListDataMahasiswa($this->session->sessionType, $status);
		if($status == "all"){
			$data['pageTitle'] = "Daftar Mahasiswa";
			$data['activePage'] = "all";
		}else if($status == "unconfirmed"){
			$data['pageTitle'] = "Daftar Mahasiswa Belum Dikonfirmasi";
			$data['activePage'] = "unconf";
		}else if($status == "confirmed"){
			$data['pageTitle'] = "Daftar Mahasiswa Sudah Dikonfirmasi";
			$data['activePage'] = "conf";
		}else if($status == "registered" && $this->session->sessionType == 1){
			$data['pageTitle'] = "Daftar Mahasiswa Sudah Terdaftar";
			$data['activePage'] = "reg";
		}else{
			$data['pageTitle'] = "Halaman tidak ditemukan";
			$this->load->template_admin("tidak_ditemukan", $data, true);
		}
		$this->load->template_admin("lihat_mahasiswa", $data, true);
	}
}