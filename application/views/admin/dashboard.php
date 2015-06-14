<div class="container-fluid">
	<div class="row">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">Beranda</h1>
			
			<h4 align="left">Selamat Datang <?php echo $this->session->adminName." (".$this->session->sessionEmail.")";?></h4>
			<div class="row placeholders">
			<h3 align="left">Semua Mahasiswa</h3>
			<?php 
			foreach ($jumlahMahasiswa as $itemProdi){?>
				<div class="col-xs-6 col-sm-3 placeholder">
					<div class="panel panel-primary">
						<div class="panel-heading">
						    <h3 class="panel-title"><?php echo $itemProdi['namaJurusan'];?></h3>
						</div>
						<div class="panel-body">
						    <?php echo $itemProdi['jumlah'];?> Mahasiswa
						</div>
					</div>
				</div>
			<?php 	
			}
			?>
			</div>
			<div class="row placeholders">
			<?php 
			if ($jenisAdmin == "super"){
				echo '<h3 align="left">Mahasiswa Terkonfirmasi</h3>';
			}else {
				echo '<h3 align="left">Mahasiswa Terdaftar</h3>';
			}	
			?>
			<?php 
			
			if (! empty($jumlahMahasiswaByStat)){
				foreach ($jumlahMahasiswaByStat as $item){
			?>
				<div class="col-xs-6 col-sm-3 placeholder">
					<div class="panel panel-primary">
						<div class="panel-heading">
						    <h3 class="panel-title"><?php echo $item['namaJurusan'];?></h3>
						</div>
						<div class="panel-body">
						    <?php echo $item['jumlah'];?> Mahasiswa
						</div>
					</div>
				</div>	
			<?php 
				}
			}else{?>
				<div class="col-xs-6 col-sm-3 placeholder">
					<div class="panel panel-primary">
						<div class="panel-heading">
						</div>
						<div class="panel-body">
						<?php 
						if ($jenisAdmin == "super"){
							echo '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Tidak ada mahasiswa terkonfirmasi';
						}else {
							echo '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Tidak ada mahasiswa Terdaftar';
						}	
						?>
						</div>
					</div>
				</div>
			<?php 	
			}
			?>
			</div>
		</div>
	</div>
</div>