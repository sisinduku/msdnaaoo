<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if (isset($pageTitle)) echo $pageTitle; else echo "Untitled"; ?></title>
	
    <!-- Bootstrap -->
    <link href= "<?php echo base_url("/assets/css/bootstrap.css"); ?>" rel="stylesheet">
    <link href= "<?php echo base_url("/assets/css/style.css"); ?>" rel="stylesheet">
    <link href= "<?php echo base_url("/assets/css/jasny-bootstrap.min.css"); ?>" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
		<script type='text/javascript' src='<?php echo base_url('/assets/js/jquery.min.js'); ?>'></script>
	
  </head>
  <body>
	<!-- top navbar -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	   <div class="container">
		<div class="navbar-header">
		   <a class="navbar-brand" href="">MSDNAA - UP2TI</a>
		</div>
	   </div>
	</div>	
	<div class="container">