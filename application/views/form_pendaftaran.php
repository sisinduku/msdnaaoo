<div class="container-page">
	<div class="row">
		<h2>Pendaftaran MSDNAA</h2>
		<hr>
		<div class="col-md-6">
			<form class="form-daftar" method="POST"
				action="<?php site_url("control_pendaftaran/daftar_mahasiswa");?>" role="form"
				enctype="multipart/form-data">
				<label for="nim">NIM</label> <input type="text" name="nim"
					class="form-control" placeholder="Masukan NIM" required title="Mohon Isi NIM Anda" autofocus>
				<label for="nama">Nama</label> <input type="text" name="nama"
					class="form-control" placeholder="Masukkan Nama" required title="Mohon Isi Nama Anda"> <label
					for="email">Email</label> <input type="email" name="email"
					class="form-control" placeholder="Email" required title="Mohon Isi Email Anda"><br>
				<div class="fileinput fileinput-new" data-provides="fileinput">
					<div class="fileinput-preview thumbnail" data-trigger="fileinput"
						style="width: 200px; height: 150px;"></div>
					<div>
						<span class="btn btn-default btn-file" style="background-color: #6E3439; border: 0px; color: #fff;"><span class="fileinput-new">Masukkan
								KTM</span><span class="fileinput-exists" style="background-color: #6E3439; border: 0px; color: #fff;">Ganti KTM</span><input
							type="file" name="ktm" accept="image/*"  required title="Mohon Masukkan KTM Anda"></span> <a
							href="#" class="btn btn-default fileinput-exists"
							data-dismiss="fileinput" style="background-color: #6E3439; border: 0px; color: #fff;">Hapus</a>
					</div>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit"
					name="submit" style="width: 120px; background-color: #6E3439;">Daftar</button>
				<br>
		<?php
		if (! empty ( $data ['submitErrors'] )) {
			echo "<div class= \"alert alert-danger\"><ol type='1'>";
			foreach ( $data ['submitErrors'] as $errorItem ) {
				echo "<li>$errorItem</li>\n";
			}
			echo "</ol></div>";
		}
		if (! empty ( $data ['submitSukses'] )) {
			echo "<div class= \"alert alert-success\"><ol type='1'>";
			foreach ( $data ['submitSukses'] as $suksesItem ) {
				echo "<li>$suksesItem</li>\n";
			}
			echo "</ol></div>";
		}
		?>
	</form>
		</div>

		<div class="col-md-6">
			<h3>Selamat Datang di MSDNAA FSM Undip</h3>
			<p>Dengan mendaftarkan diri disini anda akan mendapatkan akun DreamSpark.</p>
			<p>Akun DreamSpark memberikan anda keuntungan yaitu berupa lisensi software-software Windows
			yang ada pada website DreamSpark.</p>
			<p>Pastikan himpunan jurusan anda mengkonfirmasi pendaftaran anda.</p>
			<p>Terima Kasih atas partisipasinya di MSDNAA FSM Undip</p>
			<p><sup>&copy;UP2TI</sup></p>
		</div>
	</div>
</div>