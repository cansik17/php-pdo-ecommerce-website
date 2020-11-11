<?php
if (isset($_SESSION['users'])) {



?>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Hesabımı Düzenle</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php?P=0">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Hesabımı Düzenle</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <div class="container rounded bg-white mt-5">
        <div class="row">
            
            <div class="col-md-12">
                <form action="configs/forms.php?id=<?php echo $userid; ?>" method="post">
                    <div class="p-3 py-5">

                        <div class="row mt-2">
                            <div class="col-md-6"><input type="text" class="form-control" name="nameSurname" placeholder="first name" value=" <?php echo $nameSurname ?>"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6"><input type="text" class="form-control" name="phone" value="<?php echo $phone ?>" placeholder="Phone number"></div>
                        </div>


                        <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="submit" name="editProfileUser">Bilgileri Güncelle</button></div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php
} else {
    header("Location:index.php?P=0");
    exit();
}
?>