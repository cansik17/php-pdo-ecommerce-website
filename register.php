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
                    <h2>Yeni Hesap Oluştur</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php?P=0">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Kayıt Ol</li>
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
                    <h3 class="login-heading mb-4">Kayıt Formu</h3>
                    <form method="POST" action="configs/forms.php">
                        <div class="form-label-group">
                            <label for="inputEmail">İsim ve Soyisim</label>

                            <input type="text" id="inputEmail" name="nameSurname" class="form-control" placeholder="Name & Surname" required autofocus>
                        </div><br>
                        <div class="form-label-group">
                            <label for="inputEmail">Email adresi</label>

                            <input type="email" id="inputEmail" name="mail" class="form-control" placeholder="Email address" required autofocus>
                        </div><br>

                        <div class="form-label-group">
                            <label for="inputPassword">Şifre</label>

                            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                        </div><br>
                        <div class="form-label-group">
                            <label for="inputPassword">Şifre Tekrarı</label>

                            <input type="password" id="inputPassword" name="repassword" class="form-control" placeholder="rePassword" required>
                        </div><br>
                        <div class="form-label-group">
                            <label for="inputPassword">Telefon Numarası</label>

                            <input type="number" id="inputPassword" name="phone" class="form-control" placeholder="phone number" required>
                        </div><br>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Cinsiyet</label>
                            </div>
                            <select class="custom-select" id="inputGroupSelect01" name="gender">
                                <option selected>Şeçim Yapınız...</option>
                                <option value="1">Erkek</option>
                                <option value="2">Kadın</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <a class="small" href="index.php?P=20">Kullanıcı Sözleşmesi</a>&nbsp; <p class="small" >&</p> &nbsp;
                            <a class="small" href="index.php?P=16">Kullanım Koşulları</a>
                        </div>
                 
            
            <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" name="checked" value="1" class="custom-control-input" id="customCheck1">

                <label class="custom-control-label" for="customCheck1">Okudum, onaylıyorum</label>
            </div>
            <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit" name="register">Kayıt ol</button>
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