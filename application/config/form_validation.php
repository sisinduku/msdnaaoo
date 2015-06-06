<?php
$config = array(
		array(
				'field' => 'nim',
				'label' => 'NIM',
				'rules' => 'required|exact_length[14]|is_unique[tbl_mahasiswa.nim]|is_natural',
				'errors' => array(
						'required' => "Tolong isikan %s anda.",
						'exact_length' => "%s harus berisi %s karakter.",
						'is_unique[tbl_mahasiswa.nim]' => "Maaf, %s Sudah terdaftar.",
						'is_natural' => "%s hanya boleh berisi angka"
				)
		),
		array(
				'field' => 'nama',
				'label' => 'Nama',
				'rules' => 'required|valid_base64',
				'errors' => array(
						'required' => "Tolong isikan %s anda.",
						'valid_base64' => "Karakter pada %s Anda tidak valid."
				)
		),
		array(
				'field' => 'email',
				'label' => 'Email',
				'rules' => 'required|valid_email',
				'errors' => array(
						'required' => "Tolong isikan %s anda.",
						'valid_email' => "%s Anda tidak valid."
				)
		)
);