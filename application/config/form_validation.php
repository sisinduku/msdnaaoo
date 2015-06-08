<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$config = array(
		'control_pendaftaran/daftar_mahasiswa' => array(
				array(
						'field' => 'nim',
						'label' => 'NIM',
						'rules' => 'trim|required|exact_length[14]|is_unique[tbl_mahasiswa.nim]|is_natural',
						'errors' => array(
								'required' => "Tolong isikan %s anda.",
								'exact_length' => "%s harus berisi %s karakter.",
								'is_unique' => "Maaf, %s Sudah terdaftar.",
								'is_natural' => "%s hanya boleh berisi angka"
						)
				),
				array(
						'field' => 'nama',
						'label' => 'Nama',
						'rules' => 'trim|required|valid_base64',
						'errors' => array(
								'required' => "Tolong isikan %s anda.",
								'valid_base64' => "Karakter pada %s Anda tidak valid."
						)
				),
				array(
						'field' => 'email',
						'label' => 'Email',
						'rules' => 'trim|required|valid_email',
						'errors' => array(
								'required' => "Tolong isikan %s anda.",
								'valid_email' => "%s Anda tidak valid."
						)
				)
		),
		'control_autentikasi/login' => array(
				array(
						'field' => 'username',
						'label' => 'Username',
						'rules' => 'trim|required',
						'errors' => array('required' => "Tolong isikan %s Anda.")
				),
				array(
						'field' => 'password',
						'label' => 'Password',
						'rules' => 'required',
						'errors' => array('required' => "Tolong isikan %s Anda.")
				)
		)
);