<?php

/**
 * Kelas untuk Admin
 * @author Saptanto Sindu K U
 *
 */
class Admin extends CI_Model{
	
	/**
	 * Fungsi untuk mendapatkan baris admin berdasarkan idnya
	 * @param int $idAdmin
	 * @return row of array Admin
	 */
	function get_admin_by_id($idAdmin) {
	
		$idAdmin_safe = intval($idAdmin);
		$result = $this->db->get_where('tbl_admin', array('id'=>$idAdmin_safe), 1);
	
		$row = $result->row_array();
		return $row;
	}
	
	/**
	 * Fungsi untuk mendapatkan baris admin berdasarkan usernamenya
	 * @param string $uName
	 * @return row of array Admin
	 */
	function get_admin_by_username($uName) {
	
		$uName_safe = $this->db->escape($uName);
		$result = $this->db->get_where('tbl_admin', array('username'=>$uName_safe), 1);
	
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
	function admin_change_password($idAdmin, $oldPassWord, $newPassWord) {
	
		$adminData = get_admin_by_id($idAdmin);
		if ($adminData == null) return "Admin ID not found!";
	
		// if password OK
		if ((crypt($oldPassWord, $adminData['password'])) === $adminData['password']) {
			// == Generate hash untuk password baru
			$cost = 10;
			$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
			$salt = sprintf("$2a$%02d$", $cost) . $salt;
			$passwordHash = crypt($newPassWord, $salt);
			
			$this->db->update('tbl_admin', array('password'=>$passwordHash),array('id'=>$adminData['id']));
			
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
	function admin_login($uName, $passLogin, $updateRecord = true) {
		$adminData = get_admin_by_username($uName);
		if ($adminData != null) {
			// if password OK
			if ((crypt($passLogin, $adminData['password'])) === $adminData['password']) {
				$_SESSION['sessionType']		= $adminData['privilege'];
				$_SESSION['sessionEmail']	= $adminData['email'];
				$_SESSION['sdminName']	= $adminData['fullname'];
				$_SESSION['id']	= $adminData['id'];
					
				if ($updateRecord) {
	
					$tanggal		= date("Y-m-d H:i:s");
					$clientIPaddr	= $_SERVER['REMOTE_ADDR'];
					$this->db->update('tbl_admin', array('last_login'=>$tanggal, 'last_ip'=>$clientIPaddr), array('id'=>$adminData['id']));
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
	function admin_logout() {
		unset($_SESSION['sessionType']);
		unset($_SESSION['sessionEmail']);
		unset($_SESSION['sdminName']);
		session_destroy();
	}
}
?>