<?php
if (isset($_SESSION["Manager"])) {


?>

    <!-- içerik bölümü  -->



    <div class="mt-4">
        <h1>Yeni Ürün Ekle</h1>
        <a href="index.php?bp=4" class="float-right mb-1"><button class="btn btn-primary">Geri</button></a>
    </div>
    <form method="POST" action="../configs/backForms.php" enctype="multipart/form-data">



        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Ürün Türü:</b> </label>
            <select class="custom-select" name="categoriesid" id="validationCustom04" required>
                <?php
                $categoriesQuery            =    $db->prepare("SELECT * FROM categories  ORDER BY productType ASC, categoriesName ASC");
                $categoriesQuery->execute([]);
                $categoriesCount            =    $categoriesQuery->rowCount();
                $categoriesRecord        =    $categoriesQuery->fetchAll(PDO::FETCH_ASSOC);

                foreach ($categoriesRecord as $row) {
                ?>
                    <option value="<?php echo $row['id']; ?>"><?php echo $row['productType']; ?> => <?php echo $row['categoriesName']; ?></option>
                <?php
                }
                ?>
            </select>
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>ürün adı (max. 255 karakter) :</b> </label>
            <input type="text" name="productName" class="form-control" value="" id="formGroupExampleInput2" placeholder="">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>ürün fiyatı(vergi hariç) TL:</b> </label>
            <input type="text" name="productPrice" class="form-control" value="" id="formGroupExampleInput2" placeholder="">
        </div>



        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Cinsiyet:</b> </label>
            <select class="custom-select" name="categoriesType" id="validationCustom04" required>
                <option value="M">ERKEK</option>
                <option value="F">KADIN</option>

            </select>
        </div>



        <div class="form-group">
            <label for="formGroupExampleInput2"><b>ürün markası (max. 55 karakter):</b> </label>
            <input type="text" name="productBrand" class="form-control" value="" id="formGroupExampleInput2" placeholder="">
        </div>

        <div class="form-group quantity-box">
            <label class="control-label"><b>Vergi Oranı TL (0-35)</b></label>
            <input class="form-control" name="taxRate" value="0" min="0" max="35" type="number">
        </div>

        <div class="form-group quantity-box">
            <label class="control-label"><b>Kargo bedeli TL (0-25)</b></label>
            <input class="form-control" name="cargoFee" value="0" min="0" max="25" type="number">
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Ürün Açıklama Yazısı:</b> </label>
            <textarea class="form-control" name="productDescription" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput"><b> Resim 1: </b></label><br>
            <img id="resim1" src="" width="250px" class="img-fluid" alt="Responsive image"><br>
            <!-- CANLI RESİM        -->
            <input type="file" name="productimage1" class="form-control-file" onchange="$('#resim1')[0].src = window.URL.createObjectURL(this.files[0])" id="exampleFormControlFile1">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput"><b> Resim 2: </b></label><br>
            <img id="resim2" src="" width="250px" class="img-fluid" alt="Responsive image"><br>
            <!-- CANLI RESİM        -->
            <input type="file" name="productimage2" class="form-control-file" onchange="$('#resim2')[0].src = window.URL.createObjectURL(this.files[0])" id="exampleFormControlFile1">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput"><b> Resim 3: </b></label><br>
            <img id="resim3" src="" width="250px" class="img-fluid" alt="Responsive image"><br>
            <!-- CANLI RESİM        -->
            <input type="file" name="productimage3" class="form-control-file" onchange="$('#resim3')[0].src = window.URL.createObjectURL(this.files[0])" id="exampleFormControlFile1">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput"><b> Resim 4: </b></label><br>
            <img id="resim4" src="" width="250px" class="img-fluid" alt="Responsive image"><br>
            <!-- CANLI RESİM        -->
            <input type="file" name="productimage4" class="form-control-file" onchange="$('#resim4')[0].src = window.URL.createObjectURL(this.files[0])" id="exampleFormControlFile1">
        </div>
        <hr>
        <div>
            <h4 class="text-danger">Stok Sayısı (Bedene Göre)</h4>
        </div>
        <hr>

        <div class="form-group quantity-box">
            <label class="control-label"><b>XS</b></label>
            <input class="form-control" name="XS" value="0" min="0" max="500" type="number">
        </div>
        <div class="form-group quantity-box">
            <label class="control-label"><b>S</b></label>
            <input class="form-control" name="S" value="0" min="0" max="500" type="number">
        </div>
        <div class="form-group quantity-box">
            <label class="control-label"><b>M</b></label>
            <input class="form-control" name="M" value="0" min="0" max="500" type="number">
        </div>
        <div class="form-group quantity-box">
            <label class="control-label"><b>L</b></label>
            <input class="form-control" name="L" value="0" min="0" max="500" type="number">
        </div>
        <div class="form-group quantity-box">
            <label class="control-label"><b>XL</b></label>
            <input class="form-control" name="XL" value="0" min="0" max="500" type="number">
        </div>
        <div class="form-group quantity-box">
            <label class="control-label"><b>XXL</b></label>
            <input class="form-control" name="XXL" value="0" min="0" max="500" type="number">
        </div>
        <div class="form-group quantity-box">
            <label class="control-label"><b>XXXL</b></label>
            <input class="form-control" name="XXXL" value="0" min="0" max="500" type="number">
        </div>



        <button type="submit" name="productsStore" class="btn btn-primary ">Kaydet</button>
    </form>

<?php

} else {
    header("Location:../index.php");
}
?>