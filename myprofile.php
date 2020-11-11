<?php
if (isset($_SESSION['users'])) {



?>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Hesabım</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php?P=0">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Hesabım</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start My Account  -->
    <div class="my-account-box-main">
        <div class="container">
            <div class="my-account-page">
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="index.php?P=12"><i class="fa fa-lock"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Hesap &amp; Ayarları</h4>
                                    <p>Hesap Bilgilerini Düzenle</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="index.php?P=13"> <i class="fa fa-truck"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Siparişlerim</h4>
                                    <p>Siparişlerini Takip et</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="index.php?P=10"> <i class="fa fa-heart"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>Favorilerim</h4>
                                    <p>Beğendiğin Ürünleri Görüntüle & Takip Et</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php
} else {
    header("Location:index.php?P=0");
    exit();
}
?>