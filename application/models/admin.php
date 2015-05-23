<?php

/**
 * Kelas untuk Admin
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
	 * Fungsi untuk mendapatkan baris admin berdasarkan idnya
	 * @param int $idAdmin
	 * @return row of array Admin
	 */
	function getAdminbyId($idAdmin) {
	
		$result = $this->db->get_where('tbl_admin', array('idAdmin'=>$idAdmin), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk mendapatkan baris admin berdasarkan usernamenya
	 * @param string $uName
	 * @return row of array Admin
	 */
	function getAdminbyUsername($username) {
	
		$result = $this->db->get_where('tbl_admin', array('username'=>$username), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk mengubah password Admin
	 * @param int $idAdmin
	 * @param string $oldPassWord
	 * @param string $newPassWord
	 * @return string|NULL
	 */
	function changePassword() {
		
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
			
			$this->db->update('tbl_admin', array('password'=>$passwordHash),array('idAdmin'=>$adminData['id']));
			
			if ($this->db->affected_rows() === 0) return ("Query failed!");
	
		} else return "Password lama salah! Pastikan ditulis dengan benar.";
		return null;
	}
	
	/**
	 * Fungsi untuk admin melakukan login. Fungsi ini akan membuat sesi admin tersebut. Sesi yang terbuat:
	 * $_SESSION['sessionType'], $_SESSION['sessionEmail'], $_SESSION['sdminName'], $_SESSION['id']
	 * @param string $uName
	 * @param string $passLogin
	 * @param boolean $updateRecord
	 * @return NULL|string
	 */
	function adminLogin($uName, $passLogin, $updateRecord = true) {
		
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
					$this->db->update('tbl_admin', array('lastLogin'=>$this->lastLogin, 'lastIp'=>$this->lastIp), array('id'=>$adminData['idAdmin']));
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
	function adminLogout() {
		unset($_SESSION['id']);
		unset($_SESSION['sessionType']);
		unset($_SESSION['sessionEmail']);
		unset($_SESSION['sdminName']);
	}
}
?>