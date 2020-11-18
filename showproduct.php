<?php
if (isset($_GET["id"])) {

$id = $_GET['id'];

$productHitUpdateQuery    =    $db->prepare("UPDATE products SET numberOfViews=numberOfViews+1 WHERE id = ? AND status = ? LIMIT 1");
$productHitUpdateQuery->execute([$id, 1]);

$showproduct  =    $db->prepare("SELECT * FROM products WHERE id=? AND status=1 ");
$showproduct->execute([$id]);
$showproductCount = $showproduct->rowCount() ;
$showproductQuery = $showproduct->fetch(PDO::FETCH_ASSOC);
//echo $showproductQuery['id'];

$productid = $id;

$sizetableamount  =    $db->prepare("SELECT * FROM sizetableamount WHERE productid=?  ");
$sizetableamount->execute([$productid]);
$sizetableamountQuery = $sizetableamount->fetch(PDO::FETCH_ASSOC);

    if ($showproductCount > 0) {

?>


<div class="shop-detail-box-main">
    <div class="container">
        <div class="row">
            <div class="col-xl-5 col-lg-5 col-md-6">
                <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active"> <img class="d-block w-100" src="<?php echo $showproductQuery['productimage1']; ?> " alt="First slide"> </div>
                        <div class="carousel-item"> <img class="d-block w-100" src="<?php echo $showproductQuery['productimage2']; ?>" alt="Second slide"> </div>
                        <div class="carousel-item"> <img class="d-block w-100" src="<?php echo $showproductQuery['productimage3']; ?>" alt="Third slide"> </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                            <img class="d-block w-100 img-fluid" src="<?php echo $showproductQuery['productimage1']; ?>" alt="" />
                        </li>
                        <li data-target="#carousel-example-1" data-slide-to="1">
                            <img class="d-block w-100 img-fluid" src="<?php echo $showproductQuery['productimage2']; ?>" alt="" />
                        </li>
                        <li data-target="#carousel-example-1" data-slide-to="2">
                            <img class="d-block w-100 img-fluid" src="<?php echo $showproductQuery['productimage3']; ?>" alt="" />
                        </li>
                    </ol>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7 col-md-6">
                <div class="single-product-details">
                    <h2><?php echo $showproductQuery['productName']; ?></h2>
                    <!-- <h5> <del>$ 60.00</del> $40.79</h5> -->
                    <h5><?php echo $showproductQuery['productPrice'] * $showproductQuery['taxRate'] * 0.01 + ($showproductQuery['productPrice']); ?> TL</h5>
                    <p class="available-stock"><span> <?php echo $sizetableamountQuery['XS']+$sizetableamountQuery['S']+$sizetableamountQuery['M']+$sizetableamountQuery['L']+$sizetableamountQuery['XL']+$sizetableamountQuery['XXL']+$sizetableamountQuery['XXXL']; ?> kalan TOPLAM stok adedi / <a href="#"><?php echo $showproductQuery['totalSaleNumber']; ?> satıldı </a></span>
                        <p>
                            <h4>Kısa Açıklama:</h4>

                            <p><?php echo $showproductQuery['productDescription']; ?> </p>


                            <form action="configs/cart.php?id=<?php echo $showproductQuery['id']; ?>" method="post">

                                <ul>
                                    <li>
                                        <div class="form-group size-st">
                                            <label class="size-label">Beden</label>
                                            <select id="basic" name="size" class="selectpicker show-tick form-control">
                                                <option></option>
                                                <option value="XS">XS (<?php echo $sizetableamountQuery['XS']; ?> KALAN ADET )</option>
                                                <option value="S">S (<?php echo $sizetableamountQuery['S']; ?> KALAN ADET ) </option>
                                                <option value="M">M (<?php echo $sizetableamountQuery['M']; ?> KALAN ADET )</option>
                                                <option value="L">L (<?php echo $sizetableamountQuery['L']; ?> KALAN ADET )</option>
                                                <option value="XL">XL (<?php echo $sizetableamountQuery['XL']; ?> KALAN ADET )</option>
                                                <option value="XXL">XXL (<?php echo $sizetableamountQuery['XXL']; ?> KALAN ADET )</option>
                                                <option value="XXXL">XXXL (<?php echo $sizetableamountQuery['XXXL']; ?> KALAN ADET )</option>
                                            </select>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-group quantity-box">
                                            <label class="control-label">Miktar</label>
                                            <input class="form-control" name="productAmount" value="1" min="1" max="20" type="number">
                                        </div>
                                    </li>
                                </ul>

                                <div class="price-box-bar">
                                    <div class="cart-and-bay-btn">
                                        <button type="submit" name="addToCart" class="btn hvr-hover text-white font-weight-bold btn-lg">Sepete Ekle</button> <br> <br>
                                        <button type="submit" name="addToFav" class="btn hvr-hover text-white font-weight-bold btn-lg"><i class="fas fa-heart"></i> Favorilerime Ekle</button>

                                        <!-- <a class="btn hvr-hover" data-fancybox-close="" type="submit" name="addToCart">Sepete Ekle</a> -->
                            </form>
                </div>
            </div>
        </div>
    </div>
</div>



</div>
</div>
<!-- End Cart -->
<?php
	}else{
		header("Location:./");
		exit();
	}
}else{
	header("Location:./");
	exit();
}
?>