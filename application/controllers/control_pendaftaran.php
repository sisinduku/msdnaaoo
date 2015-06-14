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
		if (isset($_POST['submit'])){
			$nim =  $this->input->post('nim');
			$data = array();
			if (substr($nim, 0, 2) != "24")
				$data['nimError'] = "NIM pendaftar harus berasal dari FSM.";
			
			$this->load->library('upload');
			if(! $this->upload->do_upload('ktm') || $this->form_validation->run() == FALSE || isset($data['nimError'])){
				if (! empty($this->upload->display_errors()))
					$data['error'] = $this->upload->display_errors('<li>', '</li>');
				$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
				$this->load->template("form_pendaftaran", $data);
			}else{
				$linkKtm = "/assets/uploads/";
				$linkKtm .= $this->upload->data('file_name');
					
				$this->load->model("mahasiswa");
				$this->mahasiswa->daftarMahasiswa($linkKtm);
				$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
				$data['submitSukses'] = "Selamat, Anda berhasil terdaftar. Pastikan pendaftaran Anda dikonfirmasi oleh HM jurusan Anda.<br>Terima Kasih.";
				$this->load->template("form_pendaftaran", $data);
			}
		}else{
			$data['pageTitle'] = "Form Pendafraran MSDNAA FSM";
			$this->load->template("form_pendaftaran", $data);
		}	
	}
}