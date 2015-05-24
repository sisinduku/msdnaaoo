<?php

/**
 * Kelas untuk model Admin
 * @author Saptanto Sindu K U
 *
 */
class Admin extends CI_Model{
		
	private $idAdmin, $username, $password, $email, $lastLogin, $lastIp, $privilege;
	
	public function __construct(){
		// Call the CI_Model constructor
		parent::__construct();
	}
	
	/**
	 * Fungsi untuk menambah admin
	 * @return string keterangan sukses atau gagal
	 */
	public function addAdmin(){
		$this->load->model('jurusan');
		
		$this->username = $this->input->post('username');
		$this->password = $this->input->post('password');
		$this->email = $this->input->post('email');
		$namaJurusan = $this->input->post('jurusan');
		$jurusan = $this->jurusan->getJurusanbyName($namaJurusan);
		$this->privilege = $jurusan['id'];
		
		$cost = 10;
		$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
		$salt = sprintf("$2a$%02d$", $cost) . $salt;
		$passwordHash = crypt($this->password, $salt);
		
		if($this->cekUsername($username) == 0){
			$this->db->insert('tbl_admin', array('username'=>$this->db->escape($this->username), 'password'=>$this->db->escape($passwordHash),
					'email'=>$this->db->escape($this->email),'$privilege'=>$this->privilege)
			);
			
			if($this->db->affected_rows() != 0){
				return "ok";
			}else return $this->db->error;
		}else return "Username sudah terdaftar";
	}
	
	/**
	 * Fungsi untuk mendapatkan baris admin berdasarkan idnya
	 * @param int $idAdmin
	 * @return row of array Admin
	 */
	public function getAdminbyId($idAdmin) {
	
		$result = $this->db->get_where('tbl_admin', array('idAdmin'=>$idAdmin), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk mendapatkan baris admin berdasarkan usernamenya
	 * @param string $username
	 * @return row of array Admin
	 */
	public function getAdminbyUsername($username) {
	
		$result = $this->db->get_where('tbl_admin', array('username'=>$this->db->escape($username)), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk mengubah password Admin
	 * @return string|NULL
	 */
	public function changePassword() {
		
		$this->idAdmin = $this->input->post('idAdmin');
		$oldPassWord = $this->input->post('oldPassword');
		$newPassWord = $this->input->post('newPassword');
		
		$adminData = $this->getAdminbyId($this->idAdmin);
		if ($adminData == null) return "Admin ID not found!";
	
		// if password OK
		if ((crypt($oldPassWord, $adminData['password'])) === $adminData['password']) {
			// == Generate hash untuk password baru
			$cost = 10;
			$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
			$salt = sprintf("$2a$%02d$", $cost) . $salt;
			$passwordHash = crypt($newPassWord, $salt);
			
			$this->db->update('tbl_admin', array('password'=>$this->db->escape($passwordHash)),array('idAdmin'=>$adminData['idAdmin']));
			
			if ($this->db->affected_rows() === 0) return ("Query failed!");
	
		} else return "Password lama salah! Pastikan ditulis dengan benar.";
		return null;
	}
	
	/**
	 * Fungsi untuk merubah email admin
	 * @return string|NULL
	 */
	public function changeEmail(){
		$this->idAdmin = $this->input->post('idAdmin');
		$password = $this->input->post('password');
		$email = $this->input->post('email');
		
		$adminData = $this->getAdminbyId($this->idAdmin);
		if ($adminData == null) return "Admin ID not found!";
		
		// if password OK
		if ((crypt($password, $adminData['password'])) === $adminData['password']) {
			$this->db->update('tbl_admin', array('email'=>$this->db->escape($email)), array('idAdmin'=>$adminData['idAdmin']));
			if ($this->db->affected_rows() === 0) return ("Query failed!");
		}else return "Password tidak tepat.";
		return null;
	}
	
	/**
	 * Fungsi untuk mereset password admin
	 * @return string
	 */
	public function resetPassword(){
		$username = $this->input->post('username');
		$newPassword = $this->input->post('newPassword');
		
		$adminData = getAdminbyUsername($username);
		
		$cost = 10;
		$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
		$salt = sprintf("$2a$%02d$", $cost) . $salt;
		$passwordHash = crypt($newPassword, $salt);
			
		$this->db->update('tbl_admin', array('password'=>$this->db->escape($passwordHash)),array('idAdmin'=>$adminData['idAdmin']));
			
		if ($this->db->affected_rows() === 0) return ("Query failed!");
	}
	
	/**
	 * Fungsi untuk memeriksa username sudah ada atau belum
	 * @param string $username
	 * @return string|number
	 */
	public function cekUsername($username){
		
		$this->db->select('username');
		$result = $this->db->get_where('tbl_admin', array('username'=>$this->db->escape($username)), 1);
		
		if ($row = $result->row_array()) {
			return $row['username'];
		}
		return 0;
	}
	
	/**
	 * Fungsi untuk admin melakukan login. Fungsi ini akan membuat sesi admin tersebut. Sesi yang terbuat:
	 * $_SESSION['sessionType'], $_SESSION['sessionEmail'], $_SESSION['sdminName'], $_SESSION['id']
	 * @param boolean $updateRecord
	 * @return NULL|string
	 */
	public function adminLogin($updateRecord = true) {
		
		$this->username = $this->input->post('username');
		$this->password = $this->input->post('password');
		
		$adminData = $this->getAdminbyUsername($this->username);
		if ($adminData != null) {
			// if password OK
			if ((crypt($this->password, $adminData['password'])) === $adminData['password']) {
				$data = array('sessionType'=>$adminData['privilege'], 'sessionEmail'=>$adminData['email'],
								'sdminName'=>$adminData['fullname'], 'id'=>$adminData['idAdmin']);
				
				$this->session->set_userdata($data);
					
				if ($updateRecord) {
					$this->lastLogin = date("Y-m-d H:i:s");
					$this->lastIp = $_SERVER['REMOTE_ADDR'];
					$this->db->update('tbl_admin', array('lastLogin'=>$this->db->escape($this->lastLogin), 'lastIp'=>$this->db->escape($this->lastIp)), array('idAdmin'=>$adminData['idAdmin']));
				}
				return null;
			}
		}
		return "Username atau password salah. Pastikan ditulis dengan benar.";
	}
	
	/**
	 * Fungsi untuk admin melakukan logout. Fungsi ini akan mengakhiri sesi dari admin tersebut
	 * 
	 */
	public function adminLogout() {
		unset($_SESSION['id']);
		unset($_SESSION['sessionType']);
		unset($_SESSION['sessionEmail']);
		unset($_SESSION['sdminName']);
	}
}
?>