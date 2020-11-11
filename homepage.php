<div id="slides-shop" class="cover-slides">
    <ul class="slides-container">
        <?php
        foreach ($introQuery as $row) {
        ?>
            <li class="text-left">
                <img src="<?php echo $row['image']; ?>" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong><?php echo $row['title']; ?></strong></h1>
                            <p class="m-b-40"><?php echo $row['text']; ?>.</p>
                            <p><a class="btn hvr-hover" href="<?php echo $row['link']; ?>" target="_blank"><?php echo $row['linkText']; ?></a></p>
                        </div>
                    </div>
                </div>
            </li>
        <?php
        }
        ?>
    </ul>
    <div class="slides-navigation">
        <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
        <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
</div>
<!-- End Slider -->



<!-- Start Products  -->
<div class="products-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>Öne Çıkan Ürünler</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="special-menu text-center">
                    <div class="button-group filter-button-group">
                        <button class="active" data-filter="*">Tümü</button>
                        <button data-filter=".popular">Öne Çıkanlar</button>
                        <button data-filter=".bestseller">En çok satanlar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row special-list">
            <?php
            foreach ($bestsellerQuery as $row) {
            ?>
                <div class="col-lg-3 col-md-6 special-grid bestseller">
                    <div class="products-single fix">
                        <div class="box-img-hover">

                            <img src="<?php echo $row['productimage1']; ?>" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="index.php?P=6&id=<?php echo $row['id']; ?>" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="#">Add to Cart</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4><?php echo $row['productName']; ?></h4>
                            <h5> <?php echo $row['productPrice']; ?> TL</h5>
                        </div>
                    </div>
                </div>
            <?php
            }
            ?>
            <?php
            foreach ($popularQuery as $row) {
            ?>
                <div class="col-lg-3 col-md-6 special-grid popular">
                    <div class="products-single fix">
                        <div class="box-img-hover">

                            <img src="<?php echo $row['productimage1']; ?>" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="index.php?P=6&id=<?php echo $row['id']; ?>" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="#">Add to Cart</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4><?php echo $row['productName']; ?></h4>
                            <h5> <?php echo $row['productPrice']; ?> TL</h5>
                        </div>
                    </div>
                </div>
            <?php
            }
            ?>

        </div>
    </div>
</div>
<!-- End Products  -->