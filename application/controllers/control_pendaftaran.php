<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class control_pendaftaran extends CI_Controller{
	
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
			
			$config['upload_path'] = FCPATH."/assets/uploads/";
			$config['allowed_types'] = 'gif|jpg|jpeg|png';
			$config['max_size'] = '2048';
			$config['overwrite'] = 'TRUE';
			$config['file_name'] = $nim;
			
			$this->load->library('upload', $config);
			$this->upload->initialize($config);
			
			if(! $this->upload->do_upload('ktm') || $this->form_validation->run() == FALSE || isset($data['nimError'])){
				$error = $this->upload->display_errors();
				if (! empty($error))
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
	
	public function tes(){
		$this->load->model('mahasiswa');
		
		$mahasiswa = $this->mahasiswa->getDataMahasiswa(1);
		
		foreach($mahasiswa as $row){
			if(file_exists(FCPATH."/assets/uploads/".$row['nim'].".png")){
				$ekstensi = ".png";
			}else if(file_exists(FCPATH."/assets/uploads/".$row['nim'].".jpeg")){
				$ekstensi = ".jpeg";
			}else{
				$ekstensi = ".jpg";
			}
			$linkBaru = "/assets/uploads/".$row['nim'].$ekstensi;
			$this->db->update('tbl_mahasiswa', array('linkKtm'=>$linkBaru), array('nim'=>$row['nim']));
		}
	}
}