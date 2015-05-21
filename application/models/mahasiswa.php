<?php

/**
 * Kelas untuk model Mahasiswa
 * @author Saptanto Sindu K U
 *
 */
class Mahasiswa extends CI_Model{
	
	/**
	 * Fungsi untuk mendapatkan array of object mahasiswa
	 * @param int $filter
	 * @return array:Mahasiswa
	 */
	function get_data_mahasiswa($filter){
	
		if ($filter != 1){
			if ($filter == 2) {
				$where = "SUBSTR(`nim`,3,4) = '0103'"; //Informatika
			}if ($filter == 3) {
				$where = "SUBSTR(`nim`,3,4) = '0201'"; //Biologi
			}if ($filter == 4) {
				$where = "SUBSTR(`nim`,3,4) = '0102'"; //~Statistika
			}if ($filter == 5) {
				$where = "SUBSTR(`nim`,3,4) = '0401'"; //~fisika
			}if ($filter == 6) {
				$where = "SUBSTR(`nim`,3,4) = '0301'"; //~kimia
			}if ($filter == 7) {
				$where = "SUBSTR(`nim`,3,4) = '0101'"; //~matematika
			}if ($filter == 8) {
				$where = "SUBSTR(`nim`,3,4) = '0402'"; //~insel
			}
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
	 * @param int $filter
	 * @return array:Mahasiswa
	 */
	function get_data_mahasiswa_by_status($queryFilter = null, $filter) {
	
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
			
			if ($filter == 2) {
				$where = "SUBSTR(`nim`,3,4) = '0103'"; //Informatika
			}else if ($filter == 3) {
				$where = "SUBSTR(`nim`,3,4) = '0201'"; //Biologi
			}else if ($filter == 4) {
				$where = "SUBSTR(`nim`,3,4) = '0102'"; //~Statistika
			}else if ($filter == 5) {
				$where = "SUBSTR(`nim`,3,4) = '0401'"; //~fisika
			}else if ($filter == 6) {
				$where = "SUBSTR(`nim`,3,4) = '0301'"; //~kimia
			}else if ($filter == 7) {
				$where = "SUBSTR(`nim`,3,4) = '0101'"; //~matematika
			}else if ($filter == 8) {
				$where = "SUBSTR(`nim`,3,4) = '0402'"; //~insel
			}
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
	 * @param int $filter
	 * @return array:string,int
	 */
	function count_mahasiswa($filter = 1){
	
		if($filter == 1)
			$query = "SELECT SUBSTR(`nim`,3,4) AS prodi, COUNT(`nim`) AS jumlah FROM tbl_mahasiswa GROUP BY SUBSTR(`nim`,3,4)";
		else{
			$query = sprintf("SELECT SUBSTR(`nim`,3,4) AS prodi, COUNT(`nim`) AS jumlah FROM tbl_mahasiswa WHERE SUBSTR(`nim`,3,4) = %d GROUP BY SUBSTR(`nim`,3,4)", $filter);
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
	function get_mahasiswa_by_nim($nim){
	
		$result = $this->db->get_where('tbl_mahasiswa', array('nim'=>$nim), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk menambahkan mahasiswa
	 * @param string $nim
	 * @param string $nama
	 * @param string $email
	 * @param string $link_ktm
	 * @return NULL|string
	 */
	function daftar_mahasiswa($nim, $nama, $email, $link_ktm) {
	
		$query = $this->db->insert('tbl_mahasiswa', array('nim'=>$nim, 'nama'=>$nama, 'email'=>$email, 'link_ktm'=>$link_ktm));
		
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
	function delete_mahasiswa($nim){
		
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
	function cek_nim($nim){
	
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
	function konfirmasi_mahasiswa($nim) {
	
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
	function daftarkan_mahasiswa($nim = NULL){
	
		$date = date('Y-m-d', strtotime('+1 year'));
		$date = trim($date);
	
		//Update status konfirmasi
		if($nim == NULL)
			$this->db->update('tbl_mahasiswa', array('konfirmasi'=>2, 'expired'=>$date), "konfirmasi=1");
		else
			$this->db->update('tbl_mahasiswa', array('konfirmasi'=>2, 'expired'=>$date), array('konfirmasi'=>1, 'nim'=>$nim));
	
		if($this->db->affected_rows() != 0){
			return "ok";
		}else return $this->db->error;
	}
}
?>