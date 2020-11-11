<?php
if (isset($_SESSION["users"])) {




?>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Favorilerim</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php?P=0">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Favorilerim</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Wishlist  -->
    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Resim</th>
                                    <th>Ürün adı</th>
                                    <th>Ürün Fiyatı </th>
                                    <th>Stok Durumu</th>
                                    <th>Link</th>
                                    <th>Favorilerimden Kaldır</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $favQuery    =    $db->prepare("SELECT * FROM favourites WHERE userid = ? ORDER BY id DESC");
                                $favQuery->execute([$userid]);
                                $favCount        =    $favQuery->rowCount();
                                $favRecords            =    $favQuery->fetchAll(PDO::FETCH_ASSOC);

                                if ($favCount > 0) {

                                    foreach ($favRecords as $favRecord) {
                                        $productid            =    $favRecord["productid"];

                                        $productInfoQuery            =    $db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
                                        $productInfoQuery->execute([$productid]);
                                        $productRecord                        =    $productInfoQuery->fetch(PDO::FETCH_ASSOC);
                                        $image            =    $productRecord["productimage1"];
                                        $name            =    $productRecord["productName"];
                                        $price            =    $productRecord["productPrice"];
                                        $taxRate            =    $productRecord["taxRate"];

                                        $stockFav            =    $db->prepare("SELECT * FROM sizetableamount WHERE productid = ? LIMIT 1");
                                        $stockFav->execute([$productid]);
                                        $stockFavRecord                        =    $stockFav->fetch(PDO::FETCH_ASSOC);
                                        $stock            =  $stockFavRecord['XS'] + $stockFavRecord['S'] + $stockFavRecord['M'] + $stockFavRecord['L'] + $stockFavRecord['XL'] + $stockFavRecord['XXL'] + $stockFavRecord['XXXL'];

                                    $lastPrice = $price + ($taxRate * $price * 0.01);


                                ?>
                                        <tr>
                                            <td class="thumbnail-img">
                                                <a href="index.php?P=6&id=<?php echo $productid; ?>">
                                                    <img class="img-fluid" src="<?php echo $image; ?>" alt="" />
                                                </a>
                                            </td>
                                            <td class="name-pr">
                                                <a href="index.php?P=6&id=<?php echo $productid; ?>">
                                                    <?php echo substr($name, '0', '28') . ".."; ?>
                                                </a>
                                            </td>
                                            <td class="price-pr">
                                                <p><?php echo $lastPrice; ?> TL</p>
                                            </td>
                                            <td class="quantity-box"><?php if ($stock > 1) {
                                                                            echo "Stokta var";
                                                                        } else {
                                                                            echo "Stokta Yok";
                                                                        } ?></td>
                                            <td class="add-pr">
                                                <a class="btn hvr-hover" href="index.php?P=6&id=<?php echo $productid; ?>">Ürüne Git</a>
                                            </td>
                                            <td class="remove-pr">
                                                <a href="configs/forms.php?favDelete=ok&id=<?php echo $productid; ?>">
                                                    <i class="fas fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>
                                <?php
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Wishlist -->
<?php
} else {
    header("Location:index.php");
    exit();
}
?>