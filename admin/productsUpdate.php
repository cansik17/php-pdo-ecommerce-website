<?php
if (isset($_SESSION["Manager"])) {

    $id = safe($_GET['id']);

    $productQuery    =    $db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
    $productQuery->execute([$id]);
    $productCount        =    $productQuery->rowCount();
    $productRecord    =    $productQuery->fetch(PDO::FETCH_ASSOC);


    $sizetableamount  =    $db->prepare("SELECT * FROM sizetableamount WHERE productid=?  ");
    $sizetableamount->execute([$id]);
    $sizetableamountQuery = $sizetableamount->fetch(PDO::FETCH_ASSOC);


    if ($productCount > 0) {
?>

        <!-- içerik bölümü  -->



        <div class="mt-4">
            <h1>Ürünü Düzenle</h1>
            <a href="index.php?bp=4" class="float-right mb-1"><button class="btn btn-primary">Geri</button></a>
        </div>
        <form method="POST" action="../configs/backForms.php?id=<?php echo $id; ?>" enctype="multipart/form-data">



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
                        <option value="<?php echo $row['id']; ?>" <?php if ($productRecord["categoriesid"] == $row["id"]) { ?>selected="selected" <?php } ?>><?php echo $row['productType']; ?> => <?php echo $row['categoriesName']; ?></option>
                    <?php
                    }
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>ürün adı (max. 255 karakter) :</b> </label>
                <input type="text" name="productName" class="form-control" value="<?php echo $productRecord['productName']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>ürün fiyatı(vergi hariç) TL:</b> </label>
                <input type="text" name="productPrice" class="form-control" value="<?php echo $productRecord['productPrice']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>Ürün Cinsiyeti:</b> </label>
                <select class="custom-select" name="categoriesType" id="validationCustom04" required>
                    <option value="M" <?php if ($productRecord["categoriesType"] == 'M') { ?>selected="selected" <?php } ?>>ERKEK</option>
                    <option value="F" <?php if ($productRecord["categoriesType"] == 'F') { ?>selected="selected" <?php } ?>>KADIN</option>

                </select>
            </div>

   

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>ürün markası (max. 55 karakter):</b> </label>
                <input type="text" name="productBrand" class="form-control" value="<?php echo $productRecord['productBrand']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>Vergi Oranı (0 ile 100 arası yazın) :</b> </label>
                <input type="text" name="taxRate" class="form-control" value="<?php echo $productRecord['taxRate']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>Kargo Bedeli TL :</b> </label>
                <input type="text" name="cargoFee" class="form-control" value="<?php echo $productRecord['cargoFee']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
            </div>

            <div class="form-group">
                <label for="exampleFormControlTextarea1"><b>Ürün Açıklama Yazısı:</b> </label>
                <textarea class="form-control" name="productDescription" id="exampleFormControlTextarea1" rows="3"><?php echo $productRecord['productDescription']; ?></textarea>
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput"> <b> Resim 1: </b> </label><br>
                <img src="../<?php echo $productRecord['productimage1']; ?>" width="250px" class="img-fluid" alt="Responsive image"><br>
                <input type="file" name="productimage1" class="form-control-file" id="exampleFormControlFile1">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput"> <b> Resim 2: </b> </label><br>
                <img src="../<?php echo $productRecord['productimage2']; ?>" width="250px" class="img-fluid" alt="Responsive image"><br>
                <input type="file" name="productimage2" class="form-control-file" id="exampleFormControlFile1">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput"> <b> Resim 3: </b> </label><br>
                <img src="../<?php echo $productRecord['productimage3']; ?>" width="250px" class="img-fluid" alt="Responsive image"><br>
                <input type="file" name="productimage3" class="form-control-file" id="exampleFormControlFile1">
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput"> <b> Resim 4: </b> </label><br>
                <img src="../<?php echo $productRecord['productimage4']; ?>" width="250px" class="img-fluid" alt="Responsive image"><br>
                <input type="file" name="productimage4" class="form-control-file" id="exampleFormControlFile1">
            </div>


            <button type="submit" name="productsUpdate" class="btn btn-primary ">Güncelle</button>
        </form>

<?php
    } else {
        echo "ürün yüklenemedi";
    }
} else {
    header("Location:../index.php");
}
?>