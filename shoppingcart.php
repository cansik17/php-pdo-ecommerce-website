<!-- End Top Search -->
<?php
if (isset($_SESSION["users"])) {




?>
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Sepetim</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Sepetim</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Resim</th>
                                    <th>Ürün Adı</th>
                                    <th>Beden</th>
                                    <th>Fiyatı</th>
                                    <th>Miktar</th>
                                    <th>Toplam</th>
                                    <th>Sepetten Çıkar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $cartProductsQuery    =    $db->prepare("SELECT * FROM shoppingcart WHERE userid = ? ORDER BY id DESC");
                                $cartProductsQuery->execute([$userid]);
                                $cartProductsCount        =    $cartProductsQuery->rowCount();
                                $cartRecords            =    $cartProductsQuery->fetchAll(PDO::FETCH_ASSOC);

                                if ($cartProductsCount > 0) {

                                    $cartTotalProductAmount        =    0;
                                    $cartTotalPrice            =    0;
                                    $cartTotalCargoPriceAccount    =    0;



                                    foreach ($cartRecords as $row) {
                                        $cartid            =    $row["id"];

                                        $productid            =    $row["productid"];
                                        $size                =    $row["size"];
                                        $productAmount        =    $row["productAmount"];

                                        $productInfoQuery            =    $db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
                                        $productInfoQuery->execute([$productid]);
                                        $productRecord                        =    $productInfoQuery->fetch(PDO::FETCH_ASSOC);
                                        $image            =    $productRecord["productimage1"];
                                        $name            =    $productRecord["productName"];
                                        $price            =    $productRecord["productPrice"];
                                        $cargo            =    $productRecord["cargoFee"];
                                        $taxRate            =    $productRecord["taxRate"];

                                          $lastPrice = $price + ($taxRate* $price * 0.01) ;






                                        $calcTotalProductPrice        =    ($lastPrice * $productAmount);


                                        $cartTotalProductAmount        +=    $productAmount;
                                        $cartTotalPrice            +=    ($lastPrice * $productAmount);

                                        $cartTotalCargoPriceAccount        +=    ($cargo * $productAmount);
                                            $cartTotalCargoPriceForm    =    ($cartTotalCargoPriceAccount);
                                        

                                        if ($cartTotalPrice >= $freeShippingDam) {
                                            $cartTotalCargoPriceAccount        =    0;
                                            $cartTotalCargoPriceForm    =    ($cartTotalCargoPriceAccount);

                                            $totalPayPriceForm        =    ($cartTotalPrice);
                                        } else {
                                            $calcTotalPayPrice            =    ($cartTotalPrice + $cartTotalCargoPriceAccount);
                                            $totalPayPriceForm        =    ($calcTotalPayPrice);
                                        }



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
                                            <td class="total-pr">
                                                <p><?php echo $size; ?></p>
                                            </td>
                                            <td class="price-pr">
                                                <p><?php echo $lastPrice; ?> TL</p>
                                            </td>
                                            <td class="quantity-box"><input type="number" size="4" value="<?php echo $productAmount; ?>" min="0" step="1" class="c-input-text qty text"></td>
                                            <td class="total-pr">
                                                <p><?php echo $lastPrice * $productAmount; ?></p>
                                            </td>
                                            <td class="remove-pr">
                                                <a href="configs/forms.php?cartDelete=ok&id=<?php echo $cartid; ?>">
                                                    <i class="fas fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>


                                    <?php
                                }
                                } else {
                                    $cartTotalProductAmount    =    0;
                                    $cartTotalPrice        =    0;


                                    ?>
                                    <tr height="30">
                                        <td valign="bottom" align="left">Alışveriş sepetinizde ürün bulunmamaktadır.</td>
                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

            <?php
            if ($cartTotalProductAmount    !=    0) {

            ?>

                <div class="row my-5">
                    <div class="col-lg-8 col-sm-12"></div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="order-box">
                            <h3>Sipariş Özeti</h3>
                            <div class="d-flex">
                                <h4>Toplam</h4>
                                <div class="ml-auto font-weight-bold"> <?php echo $cartTotalPrice; ?> TL</div>
                            </div>
                            <!-- <div class="d-flex">
                        <h4>İndirim</h4>
                        <div class="ml-auto font-weight-bold"> $ 40 </div>
                    </div> -->
                            <hr class="my-1">

                            <!-- <div class="d-flex">
                        <h4>Vergiler</h4>
                        <div class="ml-auto font-weight-bold"> $ 2 </div>
                    </div> -->
                            <div class="d-flex">
                                <h4>Kargo Bedeli</h4>
                                <div class="ml-auto font-weight-bold"> <?php echo $cartTotalCargoPriceAccount; ?> TL</div>
                            </div>
                            <hr>
                            <div class="d-flex gr-total">
                                <h5>Genel Toplam</h5>
                                <div class="ml-auto h5"> <?php echo $cartTotalCargoPriceAccount + $cartTotalPrice; ?> TL</div>
                            </div>
                            <hr>
                        </div>
                    </div>
                    <div class="col-12 d-flex shopping-box"><a href="checkout" class="ml-auto btn hvr-hover">Ödeme</a> </div>
                </div>

        </div>
    </div>
<?php
            }

?>


<!-- End Cart -->
<?php
} else {
    header("Location:./");
    exit();
}
?>