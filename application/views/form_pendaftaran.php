<h3>Pendaftaran MSDNAA</h3><hr>
<form class="form-daftar" method = "POST" action="<?php site_url("control_pendaftaran/");?>" role="form" enctype="multipart/form-data">
	<label for="nim">NIM</label>
	<input type="text" name="nim" class="form-control" placeholder="Masukan NIM" required autofocus>
	<label for="nama">Nama</label>
	<input type="text" name="nama" class="form-control" placeholder="Masukkan Nama" required>
	<label for="email">Email</label>
	<input type="email" name="email" class="form-control" placeholder="Email" required><br>
	<div class="fileinput fileinput-new" data-provides="fileinput">
		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
		<div>
			<span class="btn btn-default btn-file"><span class="fileinput-new">Input KTM</span><span class="fileinput-exists">Ganti KTM</span><input type="file" name="ktm" accept="image/*" required></span>
			<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Hapus</a>
		</div>
	</div>
	<button class="btn btn-lg btn-primary btn-block" type="submit" name="submit" style="width: 120px">Submit</button><br>
	<?php
		if (!empty($data['submitErrors']) ) {
			echo "<div class= \"alert alert-danger\"><ol type='1'>";
			foreach ($data['submitErrors'] as $errorItem) {
				echo "<li>$errorItem</li>\n";
			}
			echo "</ol></div>";
		} 
		if (!empty($data['submitSukses']) ) {
			echo "<div class= \"alert alert-success\"><ol type='1'>";
			foreach ($data['submitSukses'] as $suksesItem) {
				echo "<li>$suksesItem</li>\n";
			}
			echo "</ol></div>";
		}
	?>
</form>