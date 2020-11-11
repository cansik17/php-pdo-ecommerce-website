<?php

if (isset($_SESSION["Manager"])) {


?>

    <!-- içerik bölümü  -->
    <div class="mt-4">
        <h1>Yeni Slayt Ekleme Bölümü</h1>
        <a href="index.php?bp=1" class="float-right mb-3"><button class="btn btn-primary">Geri</button></a>
    </div>


    <form method="POST" action="../configs/backForms.php" enctype="multipart/form-data">
        <div class="form-group">
            <label for="formGroupExampleInput"><b> Resim: </b></label><br>
            <img id="resim" src="" width="250px" class="img-fluid" alt="Responsive image"><br>
            <!-- CANLI RESİM        -->
            <input type="file" name="img" class="form-control-file" onchange="$('#resim')[0].src = window.URL.createObjectURL(this.files[0])" id="exampleFormControlFile1">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Başlık:</b> </label>
            <input type="text" name="title" class="form-control" value="" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Açıklama:</b> </label>
            <textarea class="form-control" name="text" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Link Yazısı:</b> </label>
            <input type="text" name="linkText" class="form-control" value="" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Link:</b> </label>
            <input type="text" name="link" class="form-control" value="" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
     


        <button type="submit" name="introStore" class="btn btn-primary ">Ekle</button>
    </form>




<?php
} else {
    header("Location:../index.php");
}
?>