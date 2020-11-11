<!-- Start Shop Page  -->

<?php
$categoriesid = safe($_GET['categoriesid']);

$products  =    $db->prepare("SELECT * FROM products WHERE categoriesid=? AND status=1 ORDER BY id DESC ");
$products->execute([$categoriesid]);
$productsQuery = $products->fetchAll(PDO::FETCH_ASSOC);
$count = $products->rowcount();
?>

<div class="shop-box-inner">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                <div class="product-categori">
                    <div class="search-product">
                        <form method="POST" action="index.php?P=8">
                            <input class="form-control" name="q" placeholder="Arama yapınız..." type="text">
                            <button type="submit"> <i class="fa fa-search"></i> </button>
                        </form>
                    </div>
                    <div class="filter-sidebar-left">
                        <div class="title-left">
                            <h3>Kategoriler</h3>
                        </div>
                        <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                            <div class="list-group-collapse sub-men">
                                <a class="list-group-item list-group-item-action" href="#sub-men1" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1">Üst Giyim
                                </a>
                                <div class="collapse show" id="sub-men1" data-parent="#list-group-men">
                                    <div class="list-group">
                                        <?php
                                        foreach ($categories1Query as $rows1) {
                                        ?>

                                            <a href="index.php?P=5&categoriesid=<?php echo $rows1['id']; ?>" class="list-group-item list-group-item-action <?php if ($rows1['id'] == $_GET['categoriesid']) {
                                                                                                                                                                echo 'active';
                                                                                                                                                            } ?>"><?php echo $rows1['categoriesName']; ?> </a>

                                        <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men2" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men2">Alt Giyim
                                    </a>
                                    <div class="collapse show" id="sub-men2" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <?php
                                            foreach ($categories2Query as $rows2) {
                                            ?>

                                                <a href="index.php?P=5&categoriesid=<?php echo $rows2['id']; ?>" class="list-group-item list-group-item-action <?php if ($rows2['id'] == $_GET['categoriesid']) {
                                                                                                                                                                    echo 'active';
                                                                                                                                                                } ?>"><?php echo $rows2['categoriesName']; ?> </a>

                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men3" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men3">Ayakkabılar
                                    </a>
                                    <div class="collapse show" id="sub-men3" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <?php
                                            foreach ($categories3Query as $rows3) {
                                            ?>

                                                <a href="index.php?P=5&categoriesid=<?php echo $rows3['id']; ?>" class="list-group-item list-group-item-action <?php if ($rows3['id'] == $_GET['categoriesid']) {
                                                                                                                                                                    echo 'active';
                                                                                                                                                                } ?>"><?php echo $rows3['categoriesName']; ?> </a>

                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men4" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men4">Aksesuarlar
                                    </a>
                                    <div class="collapse show" id="sub-men4" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <?php
                                            foreach ($categories4Query as $rows4) {
                                            ?>

                                                <a href="index.php?P=5&categoriesid=<?php echo $rows4['id']; ?>" class="list-group-item list-group-item-action <?php if ($rows4['id'] == $_GET['categoriesid']) {
                                                                                                                                                                    echo 'active';
                                                                                                                                                                } ?>"><?php echo $rows4['categoriesName']; ?> </a>

                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="filter-price-left">
                            <div class="title-left">
                                <h3>Fiyat</h3>
                            </div>
                            <div class="price-box-slider">
                                <div id="slider-range"></div>
                                <p>
                                    <input type="text" id="amount" readonly style="border:0; color:#fbb714; font-weight:bold;">
                                    <button class="btn hvr-hover" type="submit">Filtrele</button>
                                </p>
                            </div>
                        </div>
                        <div class="filter-brand-left">
                            <div class="title-left">
                                <h3>Markalar</h3>
                            </div>
                            <div class="brand-box">
                                <ul>
                                    <?php foreach ($productsQuery as $row) {
                                    ?>
                                        <li>
                                            <div>
                                                <input name="<?php echo $row['productBrand']; ?>" id="checkbox" type="checkbox">
                                                <label for="checkbox"> <?php echo $row['productBrand']; ?> </label>
                                            </div>
                                        </li>
                                    <?php } ?>


                                </ul>
                            </div>
                        </div>
                        <br>
                        <div class="filter-brand-left">
                            <div class="title-left">
                                <h3>Türler</h3>
                            </div>
                            <div class="brand-box">
                                <ul>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios1" value="Yes" type="radio">
                                            <label for="Radios1"> Bay </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios2" value="No" type="radio">
                                            <label for="Radios2"> Bayan </label>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                <div class="right-product-box">
                    <div class="product-item-filter row">
                        <div class="col-12 col-sm-8 text-center text-sm-left">
                            <div class="toolbar-sorter-right">
                                <span>Sıralama </span>
                                <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                                    <option data-display="Select">Yok</option>
                                    <option value="1">Popüler olan ürünler</option>
                                    <option value="2">Pahalıdan → Ucuza</option>
                                    <option value="3">Ucuzdan → Pahalıya</option>
                                    <option value="4">En çok satanlar</option>
                                </select>
                            </div>
                            <p>(<?php echo $count; ?>) adet sonuç bulundu</p>
                        </div>
                        <!-- <div class="col-12 col-sm-4 text-center text-sm-right">
                            <ul class="nav nav-tabs ml-auto">
                                <li>
                                    <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                </li>
                                <li>
                                    <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                </li>
                            </ul>
                        </div> -->
                    </div>

                    <div class="row product-categorie-box">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                <div class="row">
                                    <?php foreach ($productsQuery as $row) {
                                    ?>

                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            <div class="products-single fix">
                                                <div class="box-img-hover">

                                                    <img src="<?php echo $row['productimage1']; ?>" class="img-fluid" alt="Image">
                                                    <div class="mask-icon">
                                                        <ul>
                                                            <li><a href="index.php?P=6&id=<?php echo $row['id']; ?>" data-toggle="tooltip" data-placement="right" title="Görüntüle"><i class="fas fa-eye"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Favorilere Ekle"><i class="far fa-heart"></i></a></li>
                                                        </ul>
            
                                                    </div>
                                                </div>
                                                <div class="why-text">
                                                    <h4><?php echo $row['productName']; ?></h4>
                                                    <h5> <?php echo $row['productPrice'] * $row['taxRate'] * 0.01 + ($row['productPrice']); ?> TL</h5>
                                                </div>
                                            </div>
                                        </div>
                                    <?php
                                    } ?>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Shop Page -->