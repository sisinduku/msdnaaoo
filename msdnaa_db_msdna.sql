-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2015 at 07:01 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `msdnaa_db_msdna`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
`idAdmin` int(8) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `fullname` varchar(128) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `lastIp` varchar(16) DEFAULT NULL,
  `privilege` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`idAdmin`, `username`, `password`, `email`, `fullname`, `lastLogin`, `lastIp`, `privilege`) VALUES
(1, 'administrator', '$2a$10$LMOK2vSKY9njGXozeYr8xeBctbCCZbEY/4kZzWg7qq5YkftIghynu', 'saptanto.sindu@gmail.com', 'Saptanto Sindu K U', '2015-06-15 05:08:39', '::1', 1),
(2, 'informatika', '$2a$10$2gQsH.vFSaePvOnCM3FgoO9UADbnF4X.DuZkrTwdBcRdRb/QG69sK', 'informatika@if.undip.ac.id', 'Informatika Undip', '2015-02-18 04:21:31', '36.73.19.74', 2),
(3, 'biologi', '$2a$10$Ud6hrvgatf0BbiJfZRa4Tu0/MfgzapFDFpoO/qyMR5ReCKdmall4S', 'biologi@biologi.undip.ac.id', 'Biologi Undip', '2015-01-16 05:55:22', '182.255.2.44', 3),
(4, 'statistika', '$2a$10$Ud6hrvgatf0BbiJfZRa4Tu0/MfgzapFDFpoO/qyMR5ReCKdmall4S', 'statistika@stat.undip.ac.id', 'Statistika Undip', '2015-05-28 08:46:12', '23.94.96.122', 4),
(5, 'Fisika', '$2a$10$Ud6hrvgatf0BbiJfZRa4Tu0/MfgzapFDFpoO/qyMR5ReCKdmall4S', 'fisika@fisika.undip.ac.id', 'Fisika Undip', '2015-02-06 00:38:10', '223.255.230.44', 5),
(6, 'kimia', '$2a$10$Ud6hrvgatf0BbiJfZRa4Tu0/MfgzapFDFpoO/qyMR5ReCKdmall4S', 'kimia@kimia.undip.ac.id', 'Kimia Undip', NULL, NULL, 6),
(7, 'matematika', '$2a$10$Ud6hrvgatf0BbiJfZRa4Tu0/MfgzapFDFpoO/qyMR5ReCKdmall4S', 'matematika@math.undip.ac.id', 'Matematika Undip', NULL, NULL, 7),
(8, 'insel', '$2a$10$Ud6hrvgatf0BbiJfZRa4Tu0/MfgzapFDFpoO/qyMR5ReCKdmall4S', 'insel@insel.undip.ac.id', 'Instrumentasi Elektronik Undip', '2015-05-26 05:03:49', '182.255.0.34', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE IF NOT EXISTS `tbl_jurusan` (
`id` int(32) NOT NULL,
  `namaJurusan` varchar(128) NOT NULL,
  `nimJurusan` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`id`, `namaJurusan`, `nimJurusan`) VALUES
(2, 'Informatika', '0103'),
(3, 'Biologi', '0201'),
(4, 'Statistika', '0102'),
(5, 'Fisika', '0401'),
(6, 'Kimia', '0301'),
(7, 'Matematika', '0101'),
(8, 'Instrumentasi dan Elektronika', '0402');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `tbl_mahasiswa` (
  `nim` char(14) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `linkKtm` varchar(64) NOT NULL,
  `expired` date DEFAULT NULL,
  `konfirmasi` smallint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`nim`, `nama`, `email`, `linkKtm`, `expired`, `konfirmasi`) VALUES
('24010110130069', 'Rizkullilah', 'rizkulillah@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010110141010', 'Ryansah Afifathurrahman', 'ryansah_celsee@yahoo.co.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010111130025', 'mohamad ervan s', 'mohamadervan@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010111130053', 'Naufal Hadiyanto', 'naufal16hadi@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010112120017', 'JOSEPHUS PIGNATELI ANDITYA T.', 'anditya27@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010112130041', 'MARLIA ULFA', 'marliaulfa31@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010112130071', 'RIYAN HIDAYAT', 'presidentri26@yahoo.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010112130092', 'FITRIA EKA NURFARIDA', 'nurfaridafitria@yahoo.coid', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010113120015', 'hendry sagita', 'hendrysagita@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010113130057', 'Uni Nur Cahyowati', 'unione.nci@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010113140061', 'Yulvi Anisahara', 'anisaharay@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010113140066', 'Hafidh Khoerul Fata', 'hafidz_fata@live.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010114130065', 'Jafar Muhammad Azam', 'jafarmuhammadazam@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010114130077', 'Sitta Nurfitri Dairabiy', 'sittadairabiy@student.undip.ac.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010212130023', 'Iyan Antono', 'iyanantono8@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010212140043', 'Lugas Putranti Winastiti', 'putrantilugas@yahoo.co.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010212140048', 'Nabila Ghaida Zia', 'nabilaghaidazia@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010213120002', 'sandra wijaya', 'thesanads_mile182757@rocketmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010213120014', 'Muhammad Fuad Hasbi', 'fuadhasbi13@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010213120033', 'Puja Sukma Indriana', 'pujasukmaindriana@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010213140059', 'Rahmad dipinto', 'yugitolastname@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010213140082', 'Cyntia Surya Utami', 'cyntia.espero@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010214120028', 'Ria Epelina Situmorang', 'riasitumorang673@yahoo.co.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010214120039', 'Farhah Izzatul Jannah', 'farhah.izzatul@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010214130067', 'Desi Nur Rahma', 'desinr87_8@yahoo.co.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010214140054', 'Merinda Pangestikasari', 'pangestika.merin8@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010214140062', 'FRIEDA HESTY FARININGTYAS', 'friedahestyfariningtyas@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010310110005', 'Stefanus Sendana', 'stepisendana@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24010310120006', 'Andhica Surya Anggara', 'andhica@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310120023', 'Rahmat Kurniawan', 'rahmatkaa@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310120029', 'Anggoro Wicaksono', 'anggoro.w27@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310120036', 'DEFA HANIFTA PUTRA', 'defahaniftaputra@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310120042', 'Ozalif Routing B.S.', 'oz_routerz@hotmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310120049', 'Eko Widiyanto', 'eko.widiyanto24@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310120051', 'KRISMAWAN IBNU HANIF', 'ibnu.hanif92@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310130058', 'Asni Furoida', 'asnifuroida@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310130060', 'DENNY HERNADINATA NUGRAHA', 'denny.hernadinata.02@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310130071', 'kukuh wicaksono', 'kukuh.if@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310130073', 'Ahmad Misbah Zulfa', 'misbahputrapiliank@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310141002', 'Taufan Yan Akbar', 'taufan.yan@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310141032', 'Mazaya Galva Santoso', 'mazaya.galva_21@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310141034', 'Ahmad Syarifuddin Latif', 'asyarifuddinl@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-04-01', 2),
('24010310141035', 'Mutiara Rizqi Priyana', 'emerpe1809@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310141036', 'rizqi estu putra', 'rizqi.ep@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310141037', 'TRI MURTI SARI DEWI', 'three_126@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310141044', 'Herlin Anna Riasari', 'herlinaif@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310141047', 'Gigih Adi Prabowo', 'gigihadip.if@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010310141057', 'Danny Andrianto', 'dannyandri@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010310141058', 'DWI SURYO KUSUMA DEWI', 'kdwisuryo@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120002', 'Alsio Rachmad Alamsyah', 'alsioalam@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120005', 'Kriswara Citra', 'kresna.iswara@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120006', 'Milata Khanifah', 'milatakhanifah@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311120007', 'Muhammad Syaiful Bahri', 'syaiful.msdnaa@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120010', 'Ade Yuni Triyanto', 'ade.yuni.triyanto@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120012', 'Rahmawati Ita P.', 'rahmawatiitap@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120013', 'Rico Estrada', 'ricoexstrada@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120015', 'FACHRIZAL LUKMAN HAKIM', 'fachrizallukman@live.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120016', 'Dwiyan Panji P', 'panjikid@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311120018', 'Yermia Soedarwati Sarira', 'yermia.soedarwati@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-05-07', 2),
('24010311120019', 'Titis Triwijayanti', 'titis.triwijayanti@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120020', 'Tiara Fajrin', 'erin.bajaan@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311120022', 'Afifatul Mukaroh', 'afifatul.mukaroh@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311120023', 'Rizka Ella Setyani', 'rizka.ella@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130026', 'Prasasto Adi Wismoyo', 'prasastoadi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130031', 'Dwi Prabowo Apriansyah', 'dwiprabowo13@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130033', 'Arif Tri Pambudi', 'ariftripambudi.atp@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130035', 'Fatkhur Ridlwan', 'fridlwan@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130037', 'Anggi Meri Pratiwi', 'anggimery@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130038', 'Haris Dwi Arfianto', 'haris_arfiants@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130040', 'Indra Maulana Husni Mubarok', 'indra.maulana08@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130042', 'Bayu Arasyi', 'bayu.arasyi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130043', 'Adib Adipraditya', 'adhinepraditya@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130044', 'Andrew Hans Ritdrix', 'andrewhansr@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311130045', 'Satria Utomo Dananjaya', 'hexaludira@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311130046', 'Reza Ardiansyah', 'reza.if@student.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130048', 'Sidiq Aldi Ginanjar', 'sidiq.aldi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130052', 'Ade Pondra Kurdianto', 'adepondra@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24010311130057', 'Benediktus Wijayanto', 'djajtjozj@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130063', 'Indiati Restu Putri', 'indiastradi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130064', 'firda emilia', 'firdacepalouw@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130068', 'Ratna Puspita Sari Putri', 'reddevil.fromhell2@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130069', 'Sandhy Nurlaila Rahmawaty', 'nurlaila.sandy@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130070', 'SUSI YULI ERSITHA DIANA OLIVIA', 'ao.no.spade@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130071', 'Abdul Azis Muttaqin', 'dhulzm@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311130073', 'Muhammad Rifky Yudistiro', 'mr.yudistiro@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311130075', 'lutfiarani safitri', 'lutfiaranis@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140080', 'ANDREAS SYAHPUTRA SINURAT', 'akun.andreas@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140084', 'Muhammad Hammam', 'hammammuhammad@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140085', 'Sahid Nur Afrizal', 'thurevsky@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140086', 'Wendi Rudiyanto', 'wendi.aqq@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140088', 'Zaki Fuadi', 'zaki.d.fuadi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140091', 'Reza Noor Boudiaf', 'rezadiaf@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140093', 'Yanna Hanifati', 'yannahanifati@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140094', 'Eka Septiana', 'ekaseptiaana@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140098', 'Christian Tirta Saputra', 'chris.saputra@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140099', 'ALEX IKHTIYATH', 'ikhtiyath@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010311140103', 'Risa Septiani', 'risaseptiani0809@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140106', 'Deta Teguh Satrio', 'detatsatrio@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010311140107', 'MUHAMMAD MUKHTAR', 'Mukhtararmy@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312110039', 'inayah rahman', 'inayahrahman94@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312110041', 'Gugun Ksatria Wijaya', 'gugunksaif12@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312110056', 'TRIANI AYU LESTARI', 'trianyayu18@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312110078', 'Sunnas Ginanjar', 'sunnas.ginanjar@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312110080', 'Gumilar Lingga Pamungkas', 'gumilarlingga182@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312110105', 'Amin Nudin', 'aminnudin@student.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312120001', 'Muhammad Nur Hardyanto', 'nurhardyanto@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120002', 'Mohammad Fajar Ainul Bashri', 'fajarainul14@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120005', 'RAJA IBRAHIM', 'GetMyFuture.99@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120007', 'Yusuf Dwi Santoso', 'kulitinta13@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120008', 'Rosita Sofiana', 'Rositasofiana@student.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120009', 'Novia Ferina Putri', 'novicung@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120012', 'Cut Fauziah Nur', 'cut.fauziahnur8@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120014', 'Ari Setiawan', 'ariisetiawan5@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120016', 'Ridwan Sobirin', 'ridwan.sobirin@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120017', 'Muhammad Fikri Mukhlishin', 'ikkymukhlishin@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120018', 'Vania Zerlina Susela Devi', 'vaniazerlinasuseladevi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120019', 'Weny Ariska Yulianty', 'wenyariskayulianty@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120020', 'Alfin Lathifatul Arifah', 'alfin.arifah@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120021', 'SITI AZIZAH NUR AMALIA S', 'azizahnuramali06@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120022', 'Muchammad Febra Setyawan', 'm.febras@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312120025', 'winda tri wahyuni', 'windatriwahyuni@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120026', 'Muhammad Haiqal F', 'haiqal.fuadi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312120027', 'Muhammad Arief Kurniawan', 'ariefkurniawan.muhammad@hotmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130033', 'Charisma Annisa', 'charisma.annisa@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130035', 'Kevin Prabowo Tedjo', 'kevinprabowotedjo@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130037', 'Annisa Apriliani', 'annisa.apriliani4@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130042', 'Eko Wahyudi', 'eko.wahyudi.9a@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312130044', 'Fachry Adhya Kusuma', 'fachrykusuma@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130046', 'ADIK ISTANTO', 'adikistanto1@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312130053', 'Hanna T. Pardede', 'hanna.theresia19@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130054', 'Faqih Arifian Ajipradana', 'faqiharifianaji@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312130059', 'INDRI APRIASTUTI', 'indriapriastuti@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130060', 'Bayu Aji', 'bayu.xiii@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130066', 'Bery Orindi', 'the.bryz.2@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130072', 'Risma Mustika C.', 'rismamustika@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130081', 'Dionysius Dimas Sukmahutama Arindra Putra', 'dionysiusdimas@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130088', 'septi intan prathami', 'septiintanprathami@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130089', 'Deasy Febriasari', 'deasyfbs@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130097', 'Wahyu Heri Irawan', 'heri.whi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130100', 'Dwiyan Yogaswara', 'dwiyanyogaswara@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130101', 'Yasir Abdurrahman', 'sir.yasirabd@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312130110', 'David Natalia S', 'david.if2012@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130113', 'Dimas Iqbal Pradana', 'dimasiqbal69@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130114', 'Seza Dio Firmansyah', 'sefirman12@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130119', 'Fitri Dewi Ardiani', 'fitridewia@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130122', 'Dhemma Ratayanajaya', 'fakewarszero@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130123', 'Ulil Albab', 'ulilalbab04@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312130128', 'Danu Permadi Rendra', 'permadirendradanu@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140028', 'Muhammad Khaerul Anam', 'khaerulanam21@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140030', 'FIRNA ADITYA YUANGGA', 'firna.aditya@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140031', 'Fiker Aofa', 'fiker.aofa@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140032', 'MUHAMMAD RIFQI M.', 'rifqimaulana15@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312140034', 'Ficky Hidayat', 'fickyhidayat@live.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140036', 'Arfan Firmansyah', 'arfan.astral@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140043', 'Dhamir Hanif Nugraha', 'dhmrhn@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140045', 'Cahaya Sanubari', 'cahayasanubari@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140050', 'Muhammad Ihsan Aji Wiedjayanto', 'ihsan.ajiw@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140057', 'Gilang Luthfi Aji Muzaki', 'gilang.luthfi11@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140061', 'ROZKY MAHARDHITYA', 'rozkym@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140062', 'Dewangga Rizky Rachmadan', 'dewanggarizky@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140063', 'Diandra Putri Nara Widias', 'diandra.diandrum@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140065', 'Aning Wahyu Fatma Ariana', 'aningw09@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140068', 'Khairul Habibie', 'habibiek@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140070', 'Rizky Bachtiar Irwanto', 'rizkybachtiar7@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140074', 'Rifq Ramadhani Muhammad', 'rifqi.ramadhani.m@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140082', 'Muhammad Sofi Yuniarto', 'msyuniarto@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140096', 'Awaliza Abdi Sareat', 'gandog7@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140102', 'Putri Wulandari', 'putri2304@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140108', 'Utari Dwi Mitrawati', 'utari.mitrawati@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140109', 'WILDAN AZKA ADZANI', 'wildanazkax5@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312140112', 'Aditya Dwi Nugraha', 'adityadwinugraha94@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140116', 'Muhammad Zainudin Azis', 'zenazis@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140117', 'Gumilang Hanggoro Narendro Aji', 'gum.alexandria@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010312140121', 'Andika Putra Pratama', 'dika.blogger@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010312140132', 'Falah Ibrahim Yazidulhaq', 'alfalah.ibrahim@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120001', 'Rahmat Hidayat', 'rhidayat63@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120002', 'Dini Aulia Dewi', 'auliadini07@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120004', 'Fany Herlina', 'fany.herlina@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120008', 'BAGAS CAKRA PERDANA', 'bagascakraperdana@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120012', 'Muhammad Fikri Hasani', 'mfikrihasani@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120013', 'Mulki Rosyadi Hidayat', 'ukyocady@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120015', 'dhimas nandista', 'dhimaswift@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120020', 'Izzun Abdussalam', 'izzunabdussalam@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120023', 'Hevrida Sianturi', 'hevridasianturi2@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120030', 'NUR AMALINA', 'nuramalina2911.na@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120031', 'Septian Yudi Pratama', 'septian.yudip@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010313120032', 'Lina Annisa Widyasari', 'lina07ann@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120033', 'Puty Dwi Amanda', 'puty.dwi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120034', 'BAGUS APRILIANSYAH', 'comshexe@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120035', 'Hemas Ayu Nurul Handayani', 'hemasayu.nh@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120036', 'Alfitra Zaki Azhari', 'alfitrazaki@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120039', 'Darmawan Nur Kusuma', 'darmawannurkusuma@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010313120041', 'Prayoga Priyanto Putra', 'jyoga91@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120043', 'Muhammad Luqman Fikri', 'lukmanfikri46@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24010313120046', 'Nora Herna Nurfortuna', 'noraherna89@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120052', 'Muhammad Fakhrian Putra', 'muhammad.fakhrian@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120053', 'Selvi Ratna Istiana', 'selviratnaistiana@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120054', 'Hilmi Keigi Naafi', 'hilmikeigi@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120056', 'Ishaq Tanjung', 'ishaqtanjung@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313120057', 'Dicky Fabro Sahara', 'dickyfabrosahara@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130068', 'Anjar Giri Prayogo', 'anjargrp@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130071', 'Dimas Dwi Prasetya', 'dimasprasetya35@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010313130072', 'Faisal Ma''rifat', 'faisalmarifat19@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130073', 'Muhamad Doddy Zaki J', 'doddyzaki@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130078', 'Ananda Beniva Ellian', 'beniva9@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130079', 'Amriza Wibowo Putra', 'amrizap@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130081', 'Muhamad Subhan Efendi', 'fendysubhan@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130084', 'Julius Evans', 'j.julius.evans@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130085', 'Fadil Maulana', 'fadilmaulana9000@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130087', 'Zakaria Medianta', 'alviss.totempole@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130090', 'Aqil Fakhrian', 'aqilfakhrian@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130091', 'Rizki Ramadiansyah Nurhady', 'rizki.ramadiansyah.n@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130097', 'Shiddiq Abdilah Masyani', 'shiddiq.abl@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130098', 'jihad kamil', 'jihadeui@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130103', 'M. Rizaldi Wiratama', 'rizalwiratama@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130104', 'Reyhan Syarif', 'Reyhansyarif1411@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130112', 'Ditya Hanggara Wilis Saputra', 'adit.saputra84@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130115', 'Widya Mas Septiawan', 'widyamasseptiawan@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130117', 'Cahya Aji Permana', 'cahyaajipermana@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130118', 'Ranu Wijaya Putra', 'ranu.khemi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130119', 'Nida Muhamad', 'nidamuhamad@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130120', 'Andre Mangara', 'rajaampat9@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130121', 'Laatansa', 'slowmotionlaatansa@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313130125', 'Jafar Abdurrahman Albasyir', 'jafarabdurrahman50@outlook.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140065', 'Dzulfikar Fauzi', 'dzulfikar.fauzi@student.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140070', 'Miqdad Izzudin', 'miqdadizzudin@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140074', 'Ressas Selsabil', 'ressaselsabil@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140077', 'Arief Ramadhani Wisaksono', 'arieframadhaniii@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010313140083', 'Fadhli Ramadhana', 'ramadhanafadhli@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140086', 'Octareno Heddy Hendrawan', 'renocth@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140088', 'Mirza Chilman Garin', 'socket3d@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140096', 'Muhammad Luthfiadi Setiapratama', 'setiapratamadupi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140099', 'Samuel Adi Prasetyo', 'samueladi.manutd@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140102', 'Iman Setya Adji', 'imansa_ikishim@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140105', 'Kadek Yobi Wardianta', 'wardiantayobi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140107', 'Kharis Khasburrahman', 'khasburrahman@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010313140122', 'Aditya Sandrian Prapanca', 'aditya.prapanca123@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-05-07', 2),
('24010313140123', 'Aditya Sandrian Prapanca', 'aditya.prapanca123@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24010314120001', 'Khalid Fajri', 'khalidfjie@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120003', 'Eri Irawan', 'irawanect@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120007', 'ANGGUN CAHYA  NINGRUM', 'anggun.cahya6@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120008', 'Dian Parda Haryadi Simalango', 'dian.haryadi@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120012', 'RIZKI MUTIARA SARI', 'rmutiaras@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120014', 'Wiladhianty Yulianova', 'razhou1412@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120015', 'Anggit Gusti Nugraheni', 'hsralove1@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120016', 'MUHAMMAD SYAHRIR ARILIANTO', 'ayyilaril.aa@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120022', 'LUSY OCTARIA SITANGGANG', 'lusi_sitanggang@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120026', 'LEONARD TIMON LUMBAN GAOL', 'leonardtimon@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120028', 'YOHANA AGUSTINA BR GINTING', 'yohanaginting449@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120031', 'Anggit Frans Sad Dhewa', 'anggitfrans5@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120032', 'Nisa Ulfa Saida', 'nisa.us.nus@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120035', 'Wahyu Fachri Akbar', 'wahyufa97@gmail', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120037', 'Paskaria Sirait', 'paskaria_sirait@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120039', 'Sherian Faiz Miftah Pratama', 'sherrfaiz@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120043', 'Zulfikar Awan Kurniawan', 'zulfikaraka@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120045', 'Aisyah Jehan Ahmad', 'aisyahjehann@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120049', 'Dwi Setianto', 'dwisetianto123@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120053', 'Fourman M. Sihotang', 'ojahanshtg@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120054', 'Aditia Prasetio', 'myaxesonline@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120055', 'SRI MARIANI BARASA', 'srimariani.smb@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314120057', 'RIZAL MUHAMMAD', 'ir.muh28@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120059', 'Devia Meliana Indrasari', 'deviameliasari@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314120064', 'Diwan Prasetiyo', 'diwanprasetiyo@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314130069', 'Muhammad Jundana Al-Basyir', 'jalbasyir1@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314130075', 'rizka putri nawangsari', 'rizkaputrinawangsari@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130078', 'Shiva Twinandilla', 'shivatwinandilla@yahoo.co.id', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130081', 'Alfi fadel majid', 'fadelmajid@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130087', 'Aditiya Dwi Putra Sidabutar', 'aditiyasidabutar@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130088', 'LUTHFI AHMAD NASHER', 'nasherqw@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130090', 'Belva fahrozi Chiangmaitri', 'belvahector@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130098', 'Salman Dziyaul Azmi', 's.azmi29@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130106', 'NABILLA RAMADHANTI', 'bdhanti0102@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130107', 'Johan Eko Purnomo', 'johanrahar@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130110', 'Nadhila Tantri Saraswati', 'sarastantri@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130114', 'Muhammad Wage Juli Saputra', 'waghe.putra@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314130116', 'Muhammad Chirzul Maula', 'chimaula04@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24010314130126', 'Arniz Awinda Hutami', 'rnzwnd@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140077', 'amanda kristiya wulandari', 'amandakristiya@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140089', 'Fauzanil Zaki', 'fauzanil@live.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140094', 'Khanif Fauzi Pambudi', 'khanifauzi@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140096', 'Ferry Simangunsong', 'simangunsong.ferry@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140120', 'Muhammad Afif Aminulyo', 'afifaminulyo@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140123', 'Amazona Adorada', 'Amazona.ada@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24010314140129', 'Ratih Pematasari', 'permataranit@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-16', 2),
('24020111120002', 'Graha Permana', 'grahapermana19@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020111130064', 'Rudi juandi Gultom', 'rgultome@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020112120004', 'nikmatus salamah', 'nikmatussalamah10@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020112120007', 'tony abdillah gumilar', 'tonyabdillah21@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24020112130120', 'Marliyah', 'lia99marliyah@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020112140071', 'Aisah Juliantri', 'aisahjuliantri@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020112140093', 'Luthfian Nur Afifi', 'n_ceismc2@yahoo.co.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020112140108', 'Nasrul Fathoni', 'toninasrul@yahoo.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020113120044', 'Aniza Rachmawati', 'aniza_rachma@yahoo.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020113130127', 'indira agustin', 'indiraagustin11ipa7@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020114130084', 'ANA RITA ERVIANNA', 'anarita164@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020114130086', 'AMALIA AZHARI JANNAH', 'amaliaazhari@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020114130101', 'Galih Pertiwi Akbar', 'galihpertiwia@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24020114130105', 'M. Bismar Iskandar Putra', 'bismariskandar07@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030111130030', 'Budi Kusuma Putra', 'budikusumaputra@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030111130035', 'Rizka Dwiyanti', 'hero_rizka@yahoo.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030111130048', 'Rosihan Azwar', 'rosi.han.azwar@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030111140097', 'fauzanul ngibad', 'edhillmild@yahoo.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030112120006', 'Irma Eviana', 'imaviana16@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030112130042', 'Zenima Patris', 'zenimapm@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24030112130134', 'SELINA SHOFIA KUMILA', 'selina.shofia@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030112140071', 'Intan Dewi Salmah', 'intandewislmh@ymail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030112140097', 'WIDYA FARAH AFIAH', 'wfarahafiah@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24030112140127', 'Farida Zulfah Fitriani', 'farida.zulfah@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030112140135', 'Alfiyatur Rohmah', 'alfiyaturrohmah7@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24030113130118', 'Siti Nur Milatus Salimah', 'milla.alim@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24040110110030', 'Kilat Permana Putra', 'kilatpermana@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24040111130018', 'Laurentius Pranata', 'pranata@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040111130020', 'Istajib Sulton Hakim', 'i.s.hakim@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040111130025', 'Arifin Budi Putro', 'arifinbp@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040111130027', 'Rima Ayuning Ratri', 'rimaaratri@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040111130028', 'Muhammad Burhanudin Arifin', 'burhan28@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040111130048', 'Ratu Bilqis', 'ratu.bilqis@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112120012', 'RIZKY AYOMI SYIFA', 'piscesadis1395@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040112120019', 'Feni Musriah', 'fenimusriah@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112130053', 'Chenchen', 'chenchen@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112130061', 'BN MICHAEL GP', 'michael.marbun.16@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040112130068', 'Agus sulistiyo', 'agus.sulistiyo@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112130102', 'Khanif Pramusinto', 'khanif.pramusinto@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112140040', 'andri', 'andri@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112140043', 'Nurul Huda Prasetyo', 'hudaprasetyo08@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112140057', 'ika meylia fairayanti', 'ikameylia12@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040112140071', 'Vifaldi Agti', 'vifaldiagti@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040112140096', 'Prasetyo Abdi', 'prasetyoabdi@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040112140109', 'FIGUR HUMANI', 'figurhumani5@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113120007', 'Andi Hariyadi', 'andihariyadiaha@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113120010', 'MUHAMMAD SYARIF MUHTADI', 'm.syarifmuhtadi@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113120018', 'OKI ADE PUTRA', 'okiadep@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113120019', 'SISWOYO PRASETYO', 'siswoyoprasetyo@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113120043', 'SULISTIYANI HAYU PRATIWI', 'Sulistiyani@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113120047', 'Alam Hudi', 'alam.hudi@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113120048', 'Arifin', 'arifin@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113120052', 'Aisyah Sholehah', 'aisyah.sholehah@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113120059', 'Zaenal Abidin', 'zaenalabidin@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113130067', 'Muhammad Irwanto', 'muhammad.irwanto@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113130069', 'YUYU WAHYUDIN', 'yuyu.wahyudin@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113130080', 'Alvin Muhammad Habieb', 'alvinmhabieb@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113130087', 'Rizky Yakub', 'arsitekmasadepan@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113130095', 'Nidia Kharisma Putri', 'nidiakharisma@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040113130102', 'Eva Yulianti', 'evayulianti@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113130109', 'DEDI NUGROHO', 'dedi_nugroho@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113130110', 'Yanuar Aji Saputro', 'yanuarajisaputro@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113130116', 'Yunita Indriyani', 'yunita.indriyani@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113140076', 'Aisyah Azizah Amirah', 'aisyahazizah@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040113140088', 'Maisyita Azizah Oetomo', 'maisyita@st.fisika.undip.ac.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040114120005', 'AGUS SHOLEH HIDAYAH', 'agussholeh@st.fisika.undip.co.id', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040114120040', 'Mukhammad Fahmi', 'justfahmi24@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24040114120042', 'Ledi Anggara', 'langgara30@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040114120049', 'Algi Figal Ramadhan', 'sixthrinnegan@yahoo.com', '/assets/uploads/24040214060001.jpg', '2016-02-18', 2),
('24040114140103', 'WISNU INDRAWAN', 'prof.wisnuindrawan@gmial.com', '/assets/uploads/24040214060001.jpg', '2016-01-26', 2),
('24040213060011', 'Mohamad Trio Handoko', 'mohamad.trio.handoko.96@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24040213060015', 'Ahmad Nur Falah', 'ahmadnfalah@gmail.com', '/assets/uploads/24040214060001.jpg', '2016-05-26', 2),
('24040213060029', 'NUR SIDIQ WIBOWO', 'nursidiqwibowo@yahoo.com', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24040213060039', 'abdul hakim', 'hkyim_1@yahoo.co.id', '/assets/uploads/24040214060001.jpg', NULL, 0),
('24040214060001', 'Hudzaifah Hazazi Zia Kusuma', 'ziahazazi@gmail.com', '/assets/uploads/24040214060001.jpg', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
 ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
 ADD PRIMARY KEY (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
MODIFY `idAdmin` int(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
MODIFY `id` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
DELIMITER $$
--
-- Events
--
CREATE DEFINER=`msdnaa_db_msdna`@`localhost` EVENT `konfirmasi_status` ON SCHEDULE EVERY 24 HOUR STARTS '2015-01-26 13:05:27' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tbl_mahasiswa
    SET konfirmasi = 1
    WHERE expired >= now( ) AND expired IS NOT NULL$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
