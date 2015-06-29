<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li id="dashboard"><a href="<?php echo site_url('control_administrasi/dashboard');?>">Beranda</a></li>
		<li id="all"><a href="<?php echo site_url('control_administrasi/lihat_mahasiswa');?>">Lihat Semua Mahasiswa</a></li>
		<ul class="nav nav-sidebar">
			<li id="unconf"><a href="<?php echo site_url('control_administrasi/lihat_mahasiswa/unconfirmed');?>">Lihat Mahasiswa Belum Dikonfirmasi</a></li>
			<li id="conf"><a href="<?php echo site_url('control_administrasi/lihat_mahasiswa/confirmed');?>">Lihat Mahasiswa Terkonfirmasi</a></li>
			<li id="reg"><a href="<?php echo site_url('control_administrasi/lihat_mahasiswa/registered');?>">Lihat Mahasiswa Terdaftar</a></li>
		</ul>
		<?php if($this->session->sessionType == 1){?>
		<li id=""><a href="#" onclick="daftarkan_mahasiswa()">Daftarkan Semua Mahasiswa</a></li>
		<?php }?>
		<?php if($this->session->sessionType == 1){?>
		<li id="reset"><a href="<?php echo site_url('control_autentikasi/reset_password');?>">Reset Password</a></li>
		<?php }?>
	</ul>
</div>