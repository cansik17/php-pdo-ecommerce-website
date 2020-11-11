<?php
if (!isset($_SESSION)) {
	session_start();
}
ob_start();

if (isset($_SESSION["Manager"])) {

	require_once '../configs/config.php';
	require_once '../configs/backPages.php';
	require_once '../configs/queries.php';




	if (isset($_REQUEST["bp"])) {
		$pageNumber    =    safe($_REQUEST["bp"]);
	} else {
		$pageNumber    =    0;
	}

	if (isset($_REQUEST["page"])) {
		$pagination			=	safe($_REQUEST["page"]);
	} else {
		$pagination			=	1;
	}

?>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<title>Yönetim Paneli</title>
		<link href="dist/css/styles.css" rel="stylesheet" />
		<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	</head>

	<body class="sb-nav-fixed">
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<a class="navbar-brand" href="index.php">Yönetim Paneli</a>
			<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
			<!-- Navbar Search-->

			<!-- Navbar-->

		</nav>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link" href="../index.php" target="_blank">
								<div class="sb-nav-link-icon"><i class="fas fa-eye"></i></div>
								Siteyi Görüntüle
							</a>
							<div class="sb-sidenav-menu-heading">Bölümleri Düzenle</div>
							<a class="nav-link" href="index.php?bp=1">
								<div class="sb-nav-link-icon"><i class="fas fa-forward"></i></div>
								İntro (Giriş)
							</a>
							<a class="nav-link" href="index.php?bp=2">
								<div class="sb-nav-link-icon"><i class="fas fa-file-alt"></i></div>
								Metinler ve Sözleşmeler
							</a>
							<a class="nav-link" href="index.php?bp=3">
								<div class="sb-nav-link-icon"><i class="fas fa-compass"></i></div>
								Kategoriler
							</a>
							<a class="nav-link" href="index.php?bp=4">
								<div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
								Ürünler
							</a>
							<a class="nav-link" href="index.php?bp=5">
								<div class="sb-nav-link-icon"><i class="fas fa-dollar-sign"></i></div>
								Siparişler
							</a>
							<div class="sb-sidenav-menu-heading">Ayarlar</div>
							<a class="nav-link" href="index.php?bp=18">
								<div class="sb-nav-link-icon"><i class="fas fa-cog"></i></div>
								Site Ayarları
							</a>
							<!-- <a class="nav-link" href="index.php?bp=6">
								<div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
								Üyeler
							</a>
							<a class="nav-link" href="index.php?bp=7">
								<div class="sb-nav-link-icon"><i class="fas fa-user-tie"></i></div>
								Yöneticiler
							</a> -->

							<a class="nav-link" href="../configs/forms.php?logout=ok">
								<div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
								Çıkış Yap
							</a>
						</div>
					</div>
					<div class="sb-sidenav-footer">
						<div class="small">Giriş Yapıldı:</div>
						<?php echo $ManagerNameSurname; ?>
					</div>
				</nav>
			</div>
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid">

						<!-- içerik bölümü  -->
						<?php
						if (isset($_GET['login'])) {
							if ($_GET['login'] == 'ok') { ?>

								<script>
									Swal.fire({
										position: 'center',
										icon: 'success',
										title: 'Giriş başarıyla yapılmıştır...',
										showConfirmButton: false,
										timer: 2500
									})
								</script>

							<?php } elseif ($_GET['login'] == 'no') { ?>

								<script>
									Swal.fire({
										position: 'center',
										icon: 'error',
										title: 'Giriş başarısız...',
										showConfirmButton: true,
										timer: 5000
									})
								</script>
						<?php }
						} ?>



						<?php

						if ((!$pageNumber) or ($pageNumber == "") or ($pageNumber == 0)) {
							include($page[0]);
						} else {
							include($page[$pageNumber]);
						}

						?>



					</div>
				</main>
				<footer class="py-4 bg-light mt-auto">
					<div class="container-fluid">
						<div class="d-flex align-items-center justify-content-between small">
							<div class="text-muted">Copyright &copy; Your Website 2020</div>
							<div>
								<a href="#">Privacy Policy</a>
								&middot;
								<a href="#">Terms &amp; Conditions</a>
							</div>
						</div>
					</div>
				</footer>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="dist/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="dist/assets/demo/chart-area-demo.js"></script>
		<script src="dist/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
		<script src="dist/assets/demo/datatables-demo.js"></script>
	</body>

	</html>



<?php

} else {
	header("Location:../index.php?P=21");
	exit();
}


$db    =    null;
ob_end_flush();


?>