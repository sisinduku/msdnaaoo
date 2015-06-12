/**
 * JavaScript custom yang dibutuhkan dijadikan satu dalam file ini
 */
$(document).ready(function(){
	var activePage = Globals.activePage;
	var spanNode = document.createElement("SPAN");
	var spanText = document.createTextNode("(current)");
	spanNode.className = "sr-only";
	spanNode.appendChild(spanText);
	
	document.getElementById(activePage).className = "active";
	document.getElementById(activePage).firstChild.appendChild(spanNode);
	
	$('#tableMahasiswa').DataTable({
		language: {
	        "search": "Cari:",
	        "emptyTable":     "Tidak ada data pada tabel",
	        "infoEmpty":      "Menampilkan 0 mahasiswa",
	        "info":           "Menampilkan _START_ - _END_ dari _TOTAL_ mahasiswa",
	        "infoFiltered":   "(Disortir dari _MAX_ total mahasiswa)",
	        "lengthMenu":     "Menampilkan _MENU_ mahasiswa",
	        "loadingRecords": "Memuat...",
	        "processing":     "Memproses...",
	        "zeroRecords":    "Pencarian tidak ditemukan",
	        "paginate": {
	            "first":      "Pertama",
	            "last":       "Terakhir",
	            "next":       "Selanjutnya",
	            "previous":   "Sebelumnya"
	        },
	        "aria": {
	            "sortAscending":  ": Mensortir kolom secara ascending",
	            "sortDescending": ": Mensortir kolom secara descending"
	        }
		}
	});
});
