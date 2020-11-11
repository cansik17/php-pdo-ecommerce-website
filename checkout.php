<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Ödeme Sayfası</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.php?P=7">Sepetim</a></li>
                    <li class="breadcrumb-item active">Ödeme Sayfası</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
        <?php
        if (isset($_SESSION["users"]) == null) {
        ?>
            <div class="row new-account-login">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3>Ödeme İçin Hesabına Giriş yapman Gerekmektedir</h3>
                    </div>
                    <div class="div">
                        <a href="index.php?P=3"><b>Giriş</b> Yapmak için Tıklayınız</a>
                    </div>
                    <div class="div">
                        <a href="index.php?P=4"><b>Yeni Hesap</b> Oluşturmak için Tıklayınız</a>
                    </div>
                </div>

            </div>
        <?php
        } else {
            $cartProductQuery    =    $db->prepare("SELECT * FROM shoppingcart WHERE userid = ? ORDER BY id DESC");
            $cartProductQuery->execute([$userid]);
            $cartProductCount        =    $cartProductQuery->rowCount();

            if ($cartProductCount > 0) {

        ?>
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Fatura & Kargo Adresi</h3>
                        </div>
                        <form action="index.php?P=11" method="POST" class="needs-validation" novalidate>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">İsim *</label>
                                    <input type="text" name="adressName" class="form-control" id="firstName" placeholder="" value="" required>
                                    <div class="invalid-feedback"> Valid first name is required. </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Soyisim *</label>
                                    <input type="text" name="adressSurname" class="form-control" id="lastName" placeholder="" value="" required>
                                    <div class="invalid-feedback"> Valid last name is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="username">Telefon *</label>
                                <div class="input-group">
                                    <input type="text" name="addressPhone" class="form-control" id="username" placeholder="" required>
                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="address">Adres Türü*</label>
                                <input type="text" name="addressType" class="form-control" id="address" placeholder="" required>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <label for="address2">Adres *</label>
                                <textarea name="addressDetails" id="" class="form-control" rows="3"></textarea> </div>

                            <hr class="mb-4">
                            <div class="title"> <span>Ödeme Yöntemi</span> </div>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentOptions" type="radio" value="Kredi/Banka Kartı" class="custom-control-input" checked required>
                                    <label class="custom-control-label" for="credit">Kredi/Banka Kartı</label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Kartın Üstünde Yazan İsim </label>
                                    <input type="text" name="ccName" class="form-control" id="cc-name" placeholder="" required> <small class="text-muted">Full name as displayed on card</small>
                                    <div class="invalid-feedback"> Kartın Üstünde Yazan İsim ve Soyisim </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Kredi/Banka Kart Numarası</label>
                                    <input type="text" name="ccCardNumber" class="form-control" id="cc-number" placeholder="" required>
                                    <div class="invalid-feedback"> Kredi/Banka Kart Numarası Gereklidir </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">Kartın Son Kullanma Tarihi</label>
                                    <input type="text" name="ccExpDate" class="form-control" id="cc-expiration" placeholder="" required>
                                    <div class="invalid-feedback"> Kartın Son Kullanma Tarihi Gereklidir </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">CVV</label>
                                    <input type="text" name="ccCVV" class="form-control" id="cc-cvv" placeholder="kartınızın arkasında bulunan kodu giriniz." required>
                                    <div class="invalid-feedback"> Güvenlik kodu Gereklidir </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="payment-icon">
                                        <ul>
                                            <li><img class="img-fluid" src="assets/images/payment-icon/1.png" alt=""></li>
                                            <li><img class="img-fluid" src="assets/images/payment-icon/2.png" alt=""></li>
                                            <li><img class="img-fluid" src="assets/images/payment-icon/3.png" alt=""></li>
                                            <li><img class="img-fluid" src="assets/images/payment-icon/5.png" alt=""></li>
                                            <li><img class="img-fluid" src="assets/images/payment-icon/7.png" alt=""></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-1">
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">

                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">

                                <?php
                                $cartProductQuery    =    $db->prepare("SELECT * FROM shoppingcart WHERE userid = ? ORDER BY id DESC");
                                $cartProductQuery->execute([$userid]);
                                $cartProductCount        =    $cartProductQuery->rowCount();
                                $cartRecords            =    $cartProductQuery->fetchAll(PDO::FETCH_ASSOC);

                                if ($cartProductCount > 0) {
                                    $cartTotalProductCount            =    0;
                                    $cartTotalPrice                =    0;
                                    $cartTotalCargoPrice            =    0;
                                    $cartTotalCargoPriceAccount    =    0;

                                    foreach ($cartRecords as $cartRecord) {
                                        $id                       =    $cartRecord["id"];
                                        $cartid                   =    $cartRecord["cartid"];
                                        $productid                =    $cartRecord["productid"];
                                        $size                     =    $cartRecord["size"];
                                        $productAmount            =    $cartRecord["productAmount"];

                                        $productInfoQuery        =    $db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
                                        $productInfoQuery->execute([$productid]);
                                        $productRecord           =    $productInfoQuery->fetch(PDO::FETCH_ASSOC);
                                        $productPrice            =    $productRecord["productPrice"];
                                        $productName            =    $productRecord["productName"];

                                        $cargoFee                =    $productRecord["cargoFee"];

                                        $taxRate            =    $productRecord["taxRate"];

                                        $lastPrice = $productPrice + ($taxRate * $productPrice * 0.01);



                                        $productTotalPriceAccount                =    ($lastPrice * $productAmount);

                                        $cartTotalProductCount                +=    $productAmount;
                                        $cartTotalPrice                    +=    ($lastPrice * $productAmount);

                                        $cartTotalCargoPriceAccount        +=    ($cargoFee * $productAmount);
                                        $cartTotalCargoPriceFormat    =    ($cartTotalCargoPriceAccount);
                                    }

                                    if ($cartTotalPrice >= $freeShippingDam) {
                                        $cartTotalCargoPriceAccount        =    0;
                                        $cartTotalCargoPriceFormat    =    ($cartTotalCargoPriceAccount);

                                        $payableTotalPrice        =    ($cartTotalPrice);
                                    } else {
                                        $payableTotalPriceAccount            =    ($cartTotalPrice + $cartTotalCargoPriceAccount);
                                        $payableTotalPrice        =    ($payableTotalPriceAccount);
                                    }
                                ?>

                                <?php
                                }
                                ?>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12">
                        <div class="order-box">
                            <div class="title-left">
                                <h3>Siparişiniz</h3>
                            </div>
                            <div class="d-flex">
                                <div class="font-weight-bold"></div>
                                <div class="ml-auto font-weight-bold">Toplam</div>
                            </div>
                            <hr class="my-1">
                            <div class="d-flex">
                                <h4>Ara Toplam</h4>
                                <div class="ml-auto font-weight-bold"> <?php echo $cartTotalPrice; ?> </div>
                            </div>
 
                            <div class="d-flex">
                                <h4>Kargo Bedeli</h4>
                                <div class="ml-auto font-weight-bold"> <?php echo $cartTotalCargoPriceAccount; ?> </div>
                            </div>
                            <hr>
                            <div class="d-flex gr-total">
                                <h5>Genel Toplam</h5>
                                <div class="ml-auto h5"> <?php echo $cartTotalCargoPriceAccount + $cartTotalPrice; ?> </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                    <input type="hidden" name="cartid" value="<?= $cartid ?>" />
                    <button type="submit" class="ml-auto btn hvr-hover">Siparişi Tamamla</button>
                    </form>
                </div>
            </div>
    </div>
<?php
        }else {
            header("Location:index.php?P=0");
        }}
?>
</div>
</div>
<!-- End Cart -->