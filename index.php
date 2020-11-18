<?php
if (!isset($_SESSION)) {
    session_start();
}
ob_start();
require_once("configs/config.php");
require_once("configs/pages.php");
require_once("configs/queries.php");



if (isset($_REQUEST["P"])) {
    $pageNumber    =    safe($_REQUEST["P"]);
} else {
    $pageNumber    =    0;
}

?>






<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title><?php echo $SiteName; ?> </title>
    <base href="/php/eticaret1/">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="assets/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>



    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="./"><img src="assets/images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="./">Anasayfa</a></li>
                        <li class="dropdown megamenu-fw">
                            <a href="#" class="nav-link dropdown-toggle " data-toggle="dropdown">Ürün Kategorileri</a>
                            <ul class="dropdown-menu megamenu-content" role="menu">
                                <li>
                                    <div class="row">
                                        <div class="col-menu col-md-3">
                                            <h6 class="title">Üst Giyim</h6>
                                            <div class="content">
                                                <ul class="menu-col">
                                                    <?php
                                                    foreach ($categories1Query as $rows1) {
                                                    ?>
                                                        <li><a href="categories/<?php echo SEO($rows1['categoriesName']); ?>/<?php echo $rows1['id']; ?>"><?php echo $rows1['categoriesName']; ?></a></li>

                                                    <?php
                                                    }
                                                    ?>

                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end col-3 -->
                                        <div class="col-menu col-md-3">
                                            <h6 class="title">Alt Giyim</h6>
                                            <div class="content">
                                                <ul class="menu-col">
                                                    <?php
                                                    foreach ($categories2Query as $rows2) {
                                                    ?>
                                                        <li><a href="categories/<?php echo SEO($rows2['categoriesName']); ?>/<?php echo $rows2['id']; ?>"><?php echo $rows2['categoriesName']; ?></a></li>

                                                    <?php
                                                    }
                                                    ?>

                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end col-3 -->
                                        <div class="col-menu col-md-3">
                                            <h6 class="title">Ayakkabılar</h6>
                                            <div class="content">
                                                <ul class="menu-col">
                                                    <?php
                                                    foreach ($categories3Query as $rows3) {
                                                    ?>
                                                        <li><a href="categories/<?php echo SEO($rows3['categoriesName']); ?>/<?php echo $rows3['id']; ?>"><?php echo $rows3['categoriesName']; ?></a></li>
                                                    <?php
                                                    }
                                                    ?>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-menu col-md-3">
                                            <h6 class="title">Aksesuarlar</h6>
                                            <div class="content">
                                                <ul class="menu-col">
                                                    <?php
                                                    foreach ($categories4Query as $rows4) {
                                                    ?>
                                                        <li><a href="categories/<?php echo SEO($rows4['categoriesName']); ?>/<?php echo $rows4['id']; ?>"><?php echo $rows4['categoriesName']; ?></a></li>

                                                    <?php
                                                    }
                                                    ?>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end col-3 -->
                                    </div>
                                    <!-- end row -->
                                </li>
                            </ul>
                        </li>


                        <!-- <li class="nav-item"><a class="nav-link" href="index.php?P=1">Hakkımızda</a></li> -->
                        <li class="nav-item"><a class="nav-link" href="contact-us">Bize Ulaşın</a></li>
                        <li class="nav-item"><a class="nav-link" href="shopping-cart">Sepetim&nbsp;<i class="fa fa-shopping-bag"></i></a></li>

                        <?php
                        if (isset($_SESSION["users"])) {
                        ?>
                            <li class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle " data-toggle="dropdown">Hesabım</a>
                                <ul class="dropdown-menu">
                                    <li><a href="my-profile">Profil</a></li>
                                    <li><a href="my-orders">Siparişlerim</a></li>
                                    <li><a href="my-favourites">Favorilerim</a></li>
                                    <li><a href="logout">Çıkış Yap</a></li>
                                </ul>
                            </li>
                        <?php
                        } else {
                        ?>
                            <li class="nav-item">
                                <a href="login" class="nav-link dropdown-toggle " data-toggle="dropdown">Giriş&nbsp;<i class="fas fa-user"></i></a>

                            </li>
                            <li class="nav-item">
                                <a href="register" class="nav-link dropdown-toggle " data-toggle="dropdown">Kayıt&nbsp;<i class="fas fa-user-plus"></i></a>

                            </li>
                        <?php
                        }
                        ?>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>

                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>

        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <form method="POST" action="search">
                <input class="form-control " name="q" placeholder="Arama yapınız..." type="text">
                <button class="btn btn-secondary" type="submit"> <i class="fa fa-search"></i> </button>
            </form>
        </div>
    </div>
    <!-- End Top Search -->


    <?php

    if ((!$pageNumber) or ($pageNumber == "") or ($pageNumber == 0)) {
        include($page[0]);
    } else {
        include($page[$pageNumber]);
    }

    ?>


    <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>xshop Hakkında</h4>
                            <p><?php echo $contractsQuery['aboutUs']; ?></p>
                            <ul>
                                <li><a href="<?php echo $Facebook ?>"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="<?php echo $Twitter ?>"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="<?php echo $Linkedin ?>"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="<?php echo $Pinterest ?>"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                <li><a href="<?php echo $YouTube ?>"><i class="fab fa-youtube" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Bilgi Sayfaları</h4>
                            <ul>
                                <li><a href="about-us">Hakkımızda</a></li>
                                <li><a href="customer-services">Müşteri Hizmetleri</a></li>
                                <li><a href="site-map">Site Haritası</a></li>
                                <li><a href="terms-of-use">Kullanım &amp; Koşulları</a></li>
                                <li><a href="privacy-policy">Gizlilik Politikası</a></li>
                                <li><a href="shipping-methods">Gönderim Seçenekleri</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Bize Ulaşın</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Açık Adres: <?php echo $SiteOfficeAddress ?></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Telefon: <a href="tel:<?php echo $SitePhone ?>"><?php echo $SitePhone ?></a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:<?php echo $SiteEmailAddress ?>"><?php echo $SiteEmailAddress ?></a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="assets/js/jquery.superslides.min.js"></script>
    <script src="assets/js/bootstrap-select.js"></script>
    <script src="assets/js/inewsticker.js"></script>
    <script src="assets/js/bootsnav.js."></script>
    <script src="assets/js/images-loded.min.js"></script>
    <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/baguetteBox.min.js"></script>
    <script src="assets/js/form-validator.min.js"></script>
    <script src="assets/js/contact-form-script.js"></script>
    <script src="assets/js/custom.js"></script>
</body>

</html>

<?php
$db    =    null;
ob_end_flush();
?>