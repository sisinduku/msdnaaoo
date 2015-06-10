<?php

/**
 * Kelas untuk model Mahasiswa
 * @author Saptanto Sindu K U
 *
 */
class Mahasiswa extends CI_Model{

	private $nim, $nama, $email, $linkKtm;
	
	public function __construct(){
		// Call the CI_Model constructor
		parent::__construct();
	}
	

	/**
	 * Fungsi untuk mendapatkan data mahasiswa
	 * @param int $filter id dari jurusan
	 * @return multitype:Mahasiswa array dari semua record Mahasiswa 
	 */
	public function getDataMahasiswa($filter){
		$this->load->model('jurusan');
		
		if ($filter != 1){
			$kode = $this->jurusan->getJurusanbyId($filter);
			$where = "SUBSTR(`nim`,3,4) = ".$kode['nimJurusan'];
			$this->db->where($where);
		}
		
		$result = $this->db->get('tbl_mahasiswa');
	
		$index = 0;
		$query_result = array();
		
		foreach ($result->result_array() as $row){
			$query_result[$index] = $row;
			$index++;
		}
	
		return $query_result;
	}
	
	/**
	 * Fungsi untuk mendapatkan array of object mahasiswa berdasarkan statusnya
	 * @param string $queryFilter
	 * @param int $filter id dari jurusan
	 * @return multitype:Mahasiswa array dari semua record Mahasiswa
	 */
	public function getDataMahasiswabyStatus($queryFilter = null, $filter) {
	
		if($filter == 1){
			if ($queryFilter == "confirmed") {
				$this->db->where('konfirmasi',1);
			} else if ($queryFilter == "unconfirmed") {
				$this->db->where('konfirmasi', 0);
			} else if ($queryFilter == "registered") {
				$this->db->where('konfirmasi', 2);
			}
		}else{
			if ($queryFilter == "confirmed") {
				$this->db->where('konfirmasi',1);
			} else if ($queryFilter == "unconfirmed") {
				$this->db->where('konfirmasi', 0);
			}
			
			$kode = $this->jurusan->getJurusanbyId($filter);
			$where = "SUBSTR(`nim`,3,4) = ".$kode['nimJurusan'];
			$this->db->where($where);
			
		}
		
		$result = $this->db->get('tbl_mahasiswa');
	
		$index = 0;
		$query_result = array();
	
		foreach ($result->result_array() as $row){
			$query_result[$index] = $row;
			$index++;
		}
		return $query_result;
	}
	
	/**
	 * Fungsi untuk mendapatkan array dengan elemen nama prodi dan jumlah mahasiswanya
	 * @param int $filter id dari jurusan
	 * @return array:string,int
	 */
	public function countMahasiswa($filter = 1, $byStatus = FALSE){
		
		if(! $byStatus){
			if($filter == 1)
				$query = "SELECT tbl_jurusan.namaJurusan, COUNT(`nim`) AS jumlah FROM tbl_mahasiswa, tbl_jurusan WHERE SUBSTR(`nim`,3,4) = tbl_jurusan.nimJurusan GROUP BY SUBSTR(`nim`,3,4)";
			else{
				$query = sprintf("SELECT tbl_jurusan.namaJurusan, COUNT(`nim`) AS jumlah FROM tbl_mahasiswa, tbl_jurusan WHERE SUBSTR(`nim`,3,4) = tbl_jurusan.nimJurusan AND tbl_jurusan.id = %s GROUP BY SUBSTR(`nim`,3,4)", $filter);
			}
		}else{
			if($filter == 1)
				$query = "SELECT tbl_jurusan.namaJurusan, COUNT(`nim`) AS jumlah FROM tbl_mahasiswa, tbl_jurusan WHERE SUBSTR(`nim`,3,4) = tbl_jurusan.nimJurusan AND tbl_mahasiswa.konfirmasi = 1 GROUP BY SUBSTR(`nim`,3,4)";
			else{
				$query = sprintf("SELECT tbl_jurusan.namaJurusan, COUNT(`nim`) AS jumlah FROM tbl_mahasiswa, tbl_jurusan WHERE SUBSTR(`nim`,3,4) = tbl_jurusan.nimJurusan AND tbl_mahasiswa.konfirmasi = 0 AND tbl_jurusan.id = %s GROUP BY SUBSTR(`nim`,3,4)", $filter);
			}
		}
		
		
		$result = $this->db->query($query);
	
		$index = 0;
		$query_result = array();
	
		foreach ($result->result_array() as $row){
			$query_result[$index] = $row;
			$index++;
		}
	
		return $query_result;
	}
	
	/**
	 * Fungsi untuk mendapatkan array mahasiswa
	 * @param string $nim
	 * @return Mahasiswa
	 */
	public function getMahasiswabyNim($nim){
	
		$result = $this->db->get_where('tbl_mahasiswa', array('nim'=>$nim), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk menambahkan mahasiswa
	 * @param string $link_ktm
	 * @return NULL|string
	 */
	public function daftarMahasiswa($linkKtm) {
		$this->nim = $this->input->post('nim');
		$this->nama = $this->input->post('nama');
		$this->email = $this->input->post('email');
		$this->linkKtm = $linkKtm;
	
		$query = $this->db->insert('tbl_mahasiswa', array('nim'=>$this->nim, 'nama'=>$this->nama, 'email'=>$this->email, 'linkKtm'=>$this->linkKtm));
		
		if($this->db->affected_rows() != 0){
			return null;
		} else{
			return "Data gagal ditambahkan : ".$this->db->error;
		}
	}
	
	
	/**
	 * Fungsi untuk menghapus mahasiswa yang sudah ada
	 * @param string $nim
	 * @return string
	 */
	public function deleteMahasiswa($nim){
		
		$this->db->delete('tbl_mahasiswa', array('nim'=>$nim, 'konfirmasi !='=>3));
	
		if($this->db->affected_rows() != 0){
			return "ok";
		}else return $this->db->error;
	}
	
	/**
	 * Fungsi untuk memeriksa apakah nim tersebut sudah ada
	 * @param string $nim
	 * @return string|0
	 */
	public function cekNim($nim){
	
		$this->db->select('nim');
		$result = $this->db->get_where('tbl_mahasiswa', array('nim'=>$nim), 1);
	
		if ($row = $result->row_array()) {
			return $row['nim'];
		}
		return 0;
	}
	
	/**
	 * Fungsi ini digunakan untuk melakukan konfirmasi mahasiswa. Membuat status konfirmasi menjadi 1
	 * @param string $nim
	 * @return string
	 */
	public function konfirmasiMahasiswa($nim) {
	
		$this->db->update('tbl_mahasiswa', array('konfirmasi'=>1), array('nim'=>$nim));
	
		if($this->db->affected_rows() != 0){
			return "ok";
		}else return $this->db->error;
	}
	
	/**
	 * Fungsi ini digunakan untuk mendaftarkan mahasiswa. Membuat status konfirmasi menjadi 2 dan mengeset tanggal expired accountnya
	 * @param string $nim
	 * @return string
	 */
	public function daftarkanMahasiswa($nim = NULL){
	
		$date = date('Y-m-d', strtotime('+1 year'));
		$date = trim($date);
	
		//Update status konfirmasi
		if($nim == NULL)
			$this->db->update('tbl_mahasiswa', array('konfirmasi'=>2, 'expired'=>$date), "konfirmasi=1");
		else
			$this->db->update('tbl_mahasiswa', array('konfirmasi'=>2, 'expired'=>$date), array('konfirmasi'=>1, 'nim'=>$nim));
	
		if($this->db->affected_rows() != 0){
			return "ok";
		}else if($this->db->error){
			return $this->db->error;
		}
	}
}
?>