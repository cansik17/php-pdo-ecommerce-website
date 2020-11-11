<?php
if (isset($_SESSION["Manager"])) {


?>

    <?php
    if (isset($_GET['durum'])) {
        if ($_GET['durum'] == 'ok') { ?>

            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'İşlem başarıyla yapılmıştır...',
                    showConfirmButton: false,
                    timer: 2500
                })
            </script>

        <?php } elseif ($_GET['durum'] == 'no') { ?>

            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'İşlem başarısız...',
                    showConfirmButton: true,
                    timer: 5000
                })
            </script>
    <?php }
    } ?>
    <h1 class="mt-4">Metinler ve Sözleşmeler Bölümünü Düzenle</h1>
    <form method="POST" action="../configs/backForms.php" enctype="multipart/form-data">

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Hakkımızda Yazısı:</b> </label>
            <textarea class="form-control" name="aboutUs" id="exampleFormControlTextarea1" rows="3"><?php echo $contractsQuery['aboutUs']; ?></textarea>
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Müşteri Hizmetleri Yazısı:</b> </label>
            <textarea class="form-control" name="customerServices" id="exampleFormControlTextarea1" rows="3"><?php echo $contractsQuery['customerServices']; ?></textarea>
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Site Haritası:</b> </label>
            <textarea class="form-control" name="siteMap" id="exampleFormControlTextarea1" rows="3"><?php echo $contractsQuery['siteMap']; ?></textarea>
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Kullanıcı Sözleşmesi:</b> </label>
            <textarea class="form-control" name="userAggrement" id="exampleFormControlTextarea1" rows="3"><?php echo $contractsQuery['userAggrement']; ?></textarea>
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Kullanım Koşulları Yazısı:</b> </label>
            <textarea class="form-control" name="termsOfUse" id="exampleFormControlTextarea1" rows="3"><?php echo $contractsQuery['termsOfUse']; ?></textarea>
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Gizlilik Sözleşmesi:</b> </label>
            <textarea class="form-control" name="privacyPolicy" id="exampleFormControlTextarea1" rows="3"><?php echo $contractsQuery['privacyPolicy']; ?></textarea>
        </div>

        <button type="submit" name="contractsUpdate" class="btn btn-primary ">Güncelle</button>
    </form>
<?php
} else {
    header("Location:../index.php");
}
?>