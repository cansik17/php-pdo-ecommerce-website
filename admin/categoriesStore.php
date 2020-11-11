<?php

if (isset($_SESSION["Manager"])) {


?>

    <!-- içerik bölümü  -->
    <div class="mt-4">
        <h1>Yeni Kategori Ekleme Bölümü</h1>
        <a href="index.php?bp=3" class="float-right mb-3"><button class="btn btn-primary">Geri</button></a>
    </div>


    <form method="POST" action="../configs/backForms.php" >

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Ürün Türü:</b> </label>
            <select class="custom-select" name="productType" id="validationCustom04" required>
                <option value="ÜST GİYİM">ÜST GİYİM</option>
                <option value="ALT GİYİM">ALT GİYİM</option>
                <option value="AYAKKABILAR">AYAKKABILAR</option>
                <option value="AKSESUARLAR">AKSESUARLAR</option>
            </select>
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Kategori Adı:</b> </label>
            <input type="text" name="categoriesName" class="form-control" value="" id="formGroupExampleInput2" placeholder="Kategori adı">
        </div>

        <button type="submit" name="categoriesStore" class="btn btn-primary ">Ekle</button>
    </form>




<?php
} else {
    header("Location:../index.php");
}
?>