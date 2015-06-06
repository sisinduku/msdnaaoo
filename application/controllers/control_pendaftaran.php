<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Control_pendaftaran extends CI_Controller{
	
	public function index(){
		$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
		$this->load->template("form_pendaftaran", $data);		
	}
	
	/**
	 * Fungsi untuk 
	 */
	public function daftar_mahasiswa(){
		$this->load->library('upload');
		
		if(! $this->upload->do_upload() || $this->form_validation->run() == FALSE){
			$data = array('error' => $this->upload->display_errors('<li>', '</li>'));
			$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
			$this->load->template("form_pendaftaran", $data);
		}else{
			$linkKtm = $this->upload->data('full_path');
			
			$this->load->model("mahasiswa");
			$this->mahasiswa->daftarMahasiswa($linkKtm);
			$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
			$data['submitSukses'] = "Selamat, Anda berhasil terdaftar. Pastikan pendaftaran Anda dikonfirmasi oleh HM jurusan Anda.<br>Terima Kasih.";
			$this->load->template("form_pendaftaran", $data);
		}
	}
}