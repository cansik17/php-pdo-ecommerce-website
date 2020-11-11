<?php
if (isset($_SESSION['users'])) {
    header("Location:index.php?P=0");
    exit();
} else {
   


?>
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Hesabına Giriş Yap</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php?P=0">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Giriş Yap</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start About Page  -->
    <div class="about-box-main">


        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4 mx-auto">
                    <h3 class="login-heading mb-4">Yönetici Giriş Formu</h3>
                    <form method="POST" action="configs/forms.php">
                        <div class="form-label-group">
                            <label for="inputEmail">Email adresi</label>

                            <input type="email" id="inputEmail" name="mail" class="form-control" placeholder="Email address" required autofocus>
                        </div><br>

                        <div class="form-label-group">
                            <label for="inputPassword">Şifre</label>

                            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                        </div><br>


                        <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit" name="login">Giriş</button>
                        <div class="text-center">
                            <a class="small" href="#">Şifreni mi unuttun?</a></div>
                    </form>
                </div>
            </div>
        </div>


    </div>
    <!-- End About Page -->
<?php
}
?>