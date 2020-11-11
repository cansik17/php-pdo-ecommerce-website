<?php
require_once 'config.php';


//    Formlardan gelen requestleri burada topladım...



if (isset($_POST['introUpdate'])) {
    if ($_FILES['img']["size"] > 0) {

        

        ////resim yükleme scripti
        $uploads_dir = '../assets/images';
        @$tmp_name = $_FILES['img']["tmp_name"];
        @$name = $_FILES['img']["name"];
        $benzersizsayi1 = rand(20000, 55000);
        $benzersizsayi2 = rand(20000, 55000);
        $benzersizad = $benzersizsayi1 . $benzersizsayi2;
        $refimgyol = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
        @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


        $id = safe($_GET['id']);

        $introBack  =    $db->prepare("SELECT * FROM intro WHERE id=?");
        $introBack->execute([$id]);
        $introBackQuery = $introBack->fetch(PDO::FETCH_ASSOC);

        $eskiAd = $introBackQuery['image'];

        $title = safe($_POST['title']);
        $text = safe($_POST['text']);
        $linkText = safe($_POST['linkText']);
        $image = $refimgyol;

        $duzenle = $db->prepare("UPDATE intro SET
            title=?,
            text=?,
            linkText=?,
            image=?
            WHERE id=?");
        $update = $duzenle->execute([
            $title,
            $text,
            $linkText,
            $image,
            $id
        ]);


       

        if ($update) {

            unlink("../$eskiAd");

            Header("Location:../admin/index.php?bp=1&durum=ok");
        } else {

            Header("Location:../admin/index.php?bp=1&durum=no");
        }
    } else {

        $id = safe($_GET['id']);
        $title = safe($_POST['title']);
        $text = safe($_POST['text']);
        $linkText = safe($_POST['linkText']);


        $duzenle = $db->prepare("UPDATE intro SET
            title=?,
            text=?,
            linkText=?
            WHERE id=?");
        $update = $duzenle->execute([
            $title,
            $text,
            $linkText,
            $id
        ]);


        if ($update) {


            Header("Location:../admin/index.php?bp=1&durum=ok");
        } else {

            Header("Location:../admin/index.php?bp=1&durum=no");
        }
    }
}


//////////////////






  



if (isset($_GET['introDelete'])) {


    $id = safe($_GET['id']);


    $query  =    $db->prepare("SELECT * FROM intro WHERE id=? ");
    $query->execute([$id]);
    $intro = $query->fetch(PDO::FETCH_ASSOC);
    $eskiAd = $intro['image'];

    
        $sil = $db->prepare("DELETE from intro where id=?");
        $kontrol = $sil->execute([$id]);


     

    if ($kontrol) {

        unlink("../$eskiAd");

        Header("Location:../admin/index.php?bp=1&durum=ok");
    } else {

        Header("Location:../admin/index.php?bp=1&durum=no");
    }
}


////*********************** */

////*********************** */

if (isset($_POST['introStore'])) {
    if ($_FILES['img']["size"] > 0) {

        ///resim eski yolu



        ////resim yükleme scripti
        $uploads_dir = '../assets/images';
        @$tmp_name = $_FILES['img']["tmp_name"];
        @$name = $_FILES['img']["name"];
        $benzersizsayi1 = rand(20000, 55000);
        $benzersizsayi2 = rand(20000, 55000);
        $benzersizad = $benzersizsayi1 . $benzersizsayi2;
        $refimgyol = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
        @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


        $text = safe($_POST['text']);
        $title = safe($_POST['title']);
        $link = safe($_POST['link']);
        $linkText = safe($_POST['linkText']);


        $image = $refimgyol;

        $duzenle = $db->prepare("INSERT INTO intro SET
            text=?,
            title=?,
            link=?,
            linkText=?,
            image=?
            ");
        $update = $duzenle->execute([
            $text,
            $title,
            $link,
            $linkText,
            $image,
        ]);



        if ($update) {


            Header("Location:../admin/index.php?bp=1&durum=ok");
        } else {

            Header("Location:../admin/index.php?bp=1&durum=no");
        }
    } else {

        $text = safe($_POST['text']);
        $title = safe($_POST['title']);
        $link = safe($_POST['link']);
        $linkText = safe($_POST['linkText']);

        $duzenle = $db->prepare("INSERT INTO intro SET
            text=?,
            title=?,
            link=?,
            linkText=?
        ");

        $update = $duzenle->execute([
            $text,
            $title,
            $link,
            $linkText,
        ]);



        if ($update) {


            Header("Location:../admin/index.php?bp=1&durum=ok");
        } else {

            Header("Location:../admin/index.php?bp=1&durum=no");
        }
    }
}


//////////////


if (isset($_POST['contractsUpdate'])) {
            $id = 1;
            $aboutUs = safe($_POST['aboutUs']);
            $customerServices = safe($_POST['customerServices']);
            $siteMap = safe($_POST['siteMap']);
            $userAggrement = safe($_POST['userAggrement']);
            $termsOfUse = safe($_POST['termsOfUse']);
            $privacyPolicy = safe($_POST['privacyPolicy']);

            $duzenle = $db->prepare("UPDATE contracts SET
            aboutUs=?,
            customerServices=?,
            siteMap=?,
            userAggrement=?,
            termsOfUse=?,
            privacyPolicy=?
        WHERE id=?");

            $update = $duzenle->execute([
                $aboutUs,
                $customerServices,
                $siteMap,
                $userAggrement,
                $termsOfUse,
                $privacyPolicy,
                $id
                ]);



            if ($update) {


                Header("Location:../admin/index.php?bp=2&durum=ok");
            } else {

                Header("Location:../admin/index.php?bp=2&durum=no");
            }
        }

/////////////////////


if (isset($_POST['categoriesUpdate'])) {

    $id = safe($_GET['id']);
    $categoriesName = safe($_POST['categoriesName']);
   

    $duzenle = $db->prepare("UPDATE categories SET
            categoriesName=?
        WHERE id=?");

    $update = $duzenle->execute([
            $categoriesName,
            $id
        ]);



    if ($update) {


        Header("Location:../admin/index.php?bp=3&durum=ok");
    } else {

        Header("Location:../admin/index.php?bp=3&durum=no");
    }
}
    
///////////////////////////


if (isset($_POST['categoriesStore'])) {




    $productType = safe($_POST['productType']);
    $categoriesName = safe($_POST['categoriesName']);
   

    $duzenle = $db->prepare("INSERT INTO categories SET
            productType=?,
            categoriesName=?
            
        ");

    $update = $duzenle->execute([
        $productType,
        $categoriesName
    
    ]);



    if ($update) {


        Header("Location:../admin/index.php?bp=3&durum=ok");
    } else {

        Header("Location:../admin/index.php?bp=3&durum=no");
    }



}

/////////////////

if (isset($_GET['categoriesDelete'])) {


    $id = safe($_GET['id']);
    $deleteCategoriesQuery        =    $db->prepare("DELETE FROM categories WHERE id = ? LIMIT 1");
    $deleteCategoriesQuery->execute([$id]);
    $deleteCount        =    $deleteCategoriesQuery->rowCount();

   

    if ($deleteCount > 0) {
        $productsQuery            =    $db->prepare("SELECT * FROM products WHERE categoriesid = ?");
        $productsQuery->execute([$id]);
        $productsQueryCount    =    $productsQuery->rowCount();
        $productsQueryRecords        =    $productsQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($productsQueryCount > 0) {
            foreach ($productsQueryRecords as $record) {
                $deleteProductId    =    $record["id"];

                $productUpdateQuery    =    $db->prepare("UPDATE products SET status = ? WHERE id = ? AND categoriesid = ?");
                $productUpdateQuery->execute([0, $deleteProductId, $id]);

                $deleteCartQuery            =    $db->prepare("DELETE FROM shoppingcart WHERE productid = ?");
                $deleteCartQuery->execute([$deleteProductId]);

                $deleteFavQuery        =    $db->prepare("DELETE FROM favourites WHERE productid = ?");
                $deleteFavQuery->execute([$deleteProductId]);
            }

         }


        Header("Location:../admin/index.php?bp=3&durum=ok");
    } else {

        Header("Location:../admin/index.php?bp=3&durum=no");
    }
}

//////////
if (isset($_POST['productsUpdate'])) {
    $id = safe($_GET['id']);
    $categoriesid    = safe($_POST['categoriesid']);
    $productName     = safe($_POST['productName']);
    $productPrice    = safe($_POST['productPrice']);
    $categoriesType  = safe($_POST['categoriesType']);
    $productBrand    = safe($_POST['productBrand']);

    $taxRate             = safe($_POST['taxRate']);
    $cargoFee            = safe($_POST['cargoFee']);
    $productDescription  = safe($_POST['productDescription']);

    $productimage1       =    $_FILES["productimage1"];
    $productimage2       =    $_FILES["productimage2"];
    $productimage3       =    $_FILES["productimage3"];
    $productimage4       =    $_FILES["productimage4"];


    if (($categoriesid != "") and ($productName != "") and ($productPrice != "") and ($categoriesType != "") and ($productBrand != "") and ($taxRate != "") and ($cargoFee != "") and ($productDescription != "") ) {
        $productsQuery    =    $db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
        $productsQuery->execute([$id]);
        $productsQueryCount    =    $productsQuery->rowCount();
        $productsQueryRecord    =    $productsQuery->fetch(PDO::FETCH_ASSOC);

        $eskiAd1 = $productsQueryRecord['productimage1'];
        $eskiAd2 = $productsQueryRecord['productimage2'];
        $eskiAd3 = $productsQueryRecord['productimage3'];
        $eskiAd4 = $productsQueryRecord['productimage4'];

        if ($productsQueryCount > 0) {

            $productsUpdateQuery = $db->prepare("UPDATE products SET
             categoriesid=?,
             productName=?,
             productPrice=?,
             categoriesType=?,
             productBrand=?,
             taxRate=?,
             cargoFee=?,
             productDescription=?
    
             WHERE id=?");
         $update = $productsUpdateQuery->execute([
             $categoriesid,
             $productName,
             $productPrice,
             $categoriesType,
             $productBrand,
             $taxRate,
             $cargoFee,
             $productDescription,
             $id
         ]);

            if (($productimage1["name"] != "") and ($productimage1["type"] != "") and ($productimage1["tmp_name"] != "") and ($productimage1["error"] == 0) and ($productimage1["size"] > 0)) {

                 ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage1']["tmp_name"];
                @$name = $_FILES['productimage1']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol1 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image1 = $refimgyol1;

                //önceki yolu silme
                unlink("../$eskiAd1");

                $duzenle = $db->prepare("UPDATE products SET

                    productimage1=?

                    WHERE id=?");
                $update = $duzenle->execute([

                    $image1,

                    $id
                ]);
            }

            if (($productimage2["name"] != "") and ($productimage2["type"] != "") and ($productimage2["tmp_name"] != "") and ($productimage2["error"] == 0) and ($productimage2["size"] > 0)) {

                ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage2']["tmp_name"];
                @$name = $_FILES['productimage2']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol2 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image2 = $refimgyol2;

                //önceki yolu silme
                unlink("../$eskiAd2");

                $duzenle = $db->prepare("UPDATE products SET

                    productimage2=?

                    WHERE id=?");
                $update = $duzenle->execute([

                    $image2,

                    $id
                ]);
            }

            if (($productimage3["name"] != "") and ($productimage3["type"] != "") and ($productimage3["tmp_name"] != "") and ($productimage3["error"] == 0) and ($productimage3["size"] > 0)) {

                ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage3']["tmp_name"];
                @$name = $_FILES['productimage3']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol3 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image3 = $refimgyol3;

                //önceki yolu silme
                unlink("../$eskiAd1");

                $duzenle = $db->prepare("UPDATE products SET

                    productimage3=?

                    WHERE id=?");
                $update = $duzenle->execute([

                    $image3,

                    $id
                ]);
            }

            if (($productimage4["name"] != "") and ($productimage4["type"] != "") and ($productimage4["tmp_name"] != "") and ($productimage4["error"] == 0) and ($productimage4["size"] > 0)) {

                ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage4']["tmp_name"];
                @$name = $_FILES['productimage4']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol4 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image4 = $refimgyol4;

                //önceki yolu silme
                unlink("../$eskiAd4");

                $duzenle = $db->prepare("UPDATE products SET

                    productimage4=?

                    WHERE id=?");
                $update = $duzenle->execute([

                    $image4,

                    $id
                ]);
            }
            Header("Location:../admin/index.php?bp=4&durum=ok");
        }else {
            Header("Location:../admin/index.php?bp=4&durum=no");
        }
        Header("Location:../admin/index.php?bp=4&durum=ok");
    }else {
        Header("Location:../admin/index.php?bp=4&durum=no");
    }

}


//////////////////


//////////
if (isset($_POST['productsStore'])) {
    //$id = safe($_GET['id']);
    $categoriesid    = safe($_POST['categoriesid']);
    $productName     = safe($_POST['productName']);
    $productPrice    = safe($_POST['productPrice']);
    $categoriesType  = safe($_POST['categoriesType']);
    $productBrand    = safe($_POST['productBrand']);

    $taxRate             = safe($_POST['taxRate']);
    $cargoFee            = safe($_POST['cargoFee']);
    $productDescription  = safe($_POST['productDescription']);

    $XS     = safe($_POST['XS']);
    $S      = safe($_POST['S']);
    $M      = safe($_POST['M']);
    $L      = safe($_POST['L']);
    $XL     = safe($_POST['XL']);
    $XXL    = safe($_POST['XXL']);
    $XXXL   = safe($_POST['XXXL']);


    $productimage1       =    $_FILES["productimage1"];
    $productimage2       =    $_FILES["productimage2"];
    $productimage3       =    $_FILES["productimage3"];
    $productimage4       =    $_FILES["productimage4"];


    if (($categoriesid != "") and ($productName != "") and ($productPrice != "") and ($categoriesType != "") and ($productBrand != "") and ($taxRate != "") and ($cargoFee != "") and ($productDescription != "") and ($productimage1["name"] != "") and ($productimage1["type"] != "") and ($productimage1["tmp_name"] != "") and ($productimage1["error"] == 0) and ($productimage1["size"] > 0)) {
       

        ////resim 1 yükleme scripti
        $uploads_dir = '../assets/images';
        @$tmp_name = $_FILES['productimage1']["tmp_name"];
        @$name = $_FILES['productimage1']["name"];
        $benzersizsayi1 = rand(20000, 55000);
        $benzersizsayi2 = rand(20000, 55000);
        $benzersizad = $benzersizsayi1 . $benzersizsayi2;
        $refimgyol1 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
        @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


        $image1 = $refimgyol1;

        //önceki yolu silme
       // unlink("../$eskiAd1");

        $productStoreQuery        =    $db->prepare("INSERT INTO products (categoriesid, productName, productPrice, categoriesType, productBrand, taxRate, cargoFee, productDescription, productimage1, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $productStoreQuery->execute([$categoriesid, $productName, $productPrice, $categoriesType, $productBrand, $taxRate, $cargoFee, $productDescription, $image1, 1]);
        $productStoreQueryCount        =    $productStoreQuery->rowCount();

        if ($productStoreQueryCount > 0) {
            $lastProductId        =    $db->lastInsertId();

        

            if (($productimage2["name"] != "") and ($productimage2["type"] != "") and ($productimage2["tmp_name"] != "") and ($productimage2["error"] == 0) and ($productimage2["size"] > 0)) {

                ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage2']["tmp_name"];
                @$name = $_FILES['productimage2']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol2 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image2 = $refimgyol2;

                //önceki yolu silme
                //unlink("../$eskiAd2");

                $storeQuery    =    $db->prepare("UPDATE products SET productimage2 = ? WHERE id = ? LIMIT 1");
                $storeQuery->execute([$image2, $lastProductId]);
                $storeQueryCount    =    $storeQuery->rowCount();
            }

            if (($productimage3["name"] != "") and ($productimage3["type"] != "") and ($productimage3["tmp_name"] != "") and ($productimage3["error"] == 0) and ($productimage3["size"] > 0)) {

                ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage3']["tmp_name"];
                @$name = $_FILES['productimage3']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol3 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image3 = $refimgyol3;

                //önceki yolu silme
                //unlink("../$eskiAd1");

                $storeQuery    =    $db->prepare("UPDATE products SET productimage3 = ? WHERE id = ? LIMIT 1");
                $storeQuery->execute([$image3, $lastProductId]);
                $storeQueryCount    =    $storeQuery->rowCount();
            }

            if (($productimage4["name"] != "") and ($productimage4["type"] != "") and ($productimage4["tmp_name"] != "") and ($productimage4["error"] == 0) and ($productimage4["size"] > 0)) {

                ////resim 1 yükleme scripti
                $uploads_dir = '../assets/images';
                @$tmp_name = $_FILES['productimage4']["tmp_name"];
                @$name = $_FILES['productimage4']["name"];
                $benzersizsayi1 = rand(20000, 55000);
                $benzersizsayi2 = rand(20000, 55000);
                $benzersizad = $benzersizsayi1 . $benzersizsayi2;
                $refimgyol4 = substr($uploads_dir, 3) . "/" . $benzersizad . $name;
                @move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");


                $image4 = $refimgyol4;

                //önceki yolu silme
                // unlink("../$eskiAd4");

                $storeQuery    =    $db->prepare("UPDATE products SET productimage4 = ? WHERE id = ? LIMIT 1");
                $storeQuery->execute([$image4, $lastProductId]);
                $storeQueryCount    =    $storeQuery->rowCount();
            }

           

             $sizeQuery        =    $db->prepare("INSERT INTO sizetableamount (id,productid,XS, S, M, L, XL, XXL, XXXL) values (?, ?, ?, ?, ?, ?, ?, ?, ?) ");
             $sizeQuery->execute([$lastProductId,$lastProductId,$XS, $S, $M, $L, $XL, $XXL, $XXXL]);
             $sizeQueryCount        =    $sizeQuery->rowCount();
          
        
        }
        Header("Location:../admin/index.php?bp=4&durum=ok");
    } else {
        Header("Location:../admin/index.php?bp=4&durum=no");
    }
}

/////////////////////////


/////////////////

if (isset($_GET['productsDelete'])) {


    $id = safe($_GET['id']);
    if ($id != "") {
        $productQuery            =    $db->prepare("SELECT * FROM products WHERE id = ?");
        $productQuery->execute([$id]);
        $productQueryCount    =    $productQuery->rowCount();
        $productsQueryRecord    =    $productQuery->fetch(PDO::FETCH_ASSOC);

        if ($productQueryCount > 0) {
          //  $SilinecekUrununMenuIDsi    =    $productsQueryRecord["MenuId"];

            $productsDeleteQuery    =    $db->prepare("UPDATE products SET status = ? WHERE id = ? LIMIT 1");
            $productsDeleteQuery->execute([0, $id]);
            $deleteCount    =    $productsDeleteQuery->rowCount();

            if ($deleteCount > 0) {
                $cartDeleteQuery        =    $db->prepare("DELETE FROM shoppingcart WHERE productid = ?");
                $cartDeleteQuery->execute([$id]);

                $favDeleteQuery    =    $db->prepare("DELETE FROM favourites WHERE productid = ?");
                $favDeleteQuery->execute([$id]);

                // $MenuGuncellemeSorgusu    =    $db->prepare("UPDATE menuler SET UrunSayisi=UrunSayisi-1 WHERE id = ?");
                // $MenuGuncellemeSorgusu->execute([$SilinecekUrununMenuIDsi]);

                Header("Location:../admin/index.php?bp=4&durum=ok");
                exit();
            } else {
                Header("Location:../admin/index.php?bp=4&durum=no");
                exit();
            }
        } else {
            Header("Location:../admin/index.php?bp=4&durum=no");
            exit();
        }
    } else {
        Header("Location:../admin/index.php?bp=4&durum=no");
        exit();
}
}



/////////////////////


if (isset($_POST['ordersUpdate'])) {

    if (isset($_GET["orderid"])) {
        $orderid        =    safe($_GET["orderid"]);
    } else {
        $orderid        =    "";
    }
    if (isset($_POST["cargoStatus"])) {
        $cargoStatus    =    safe($_POST["cargoStatus"]);
    } else {
        $cargoStatus    =    "";
    }
    if (isset($_POST["status"])) {
        $status    =    safe($_POST["status"]);
    } else {
        $status    =    "";
    }

    if (($orderid != "") and ($cargoStatus != "") and ($status != "")) {
        $orderUpdateQuery    =    $db->prepare("UPDATE orders SET status = ?, cargoStatus = ? WHERE orderid = ?");
        $orderUpdateQuery->execute([$status, $cargoStatus, $orderid]);
        $updateControl            =    $orderUpdateQuery->rowCount();

        if ($updateControl > 0) {
            //echo $orderid . " " . $cargoStatus . " " . $status." işlem ok";
            header("Location:../admin/index.php?bp=5&durum=ok");
            exit();
        } else {

            //echo $orderid." ".$cargoStatus." ".$status;
            header("Location:../admin/index.php?bp=5&durum=no");
            exit();
        }
    } else {
        //echo $orderid . " " . $cargoStatus . " " . $status;
        header("Location:../admin/index.php?bp=5&durum=no");
        exit();
    }
}

///////////////////////////

if (isset($_POST['settingsUpdate'])) {

    $id = safe($_GET['id']);
    $updateSiteName = safe($_POST['SiteName']);
    $updateSiteTitle = safe($_POST['SiteTitle']);
    $updateSiteDescription = safe($_POST['SiteDescription']);
    $updateSiteKeywords = safe($_POST['SiteKeywords']);
    $updateSiteCopyrightText = safe($_POST['SiteCopyrightText']);
    $updateSitePhone = safe($_POST['SitePhone']);
    $updateSiteOfficeAddress = safe($_POST['SiteOfficeAddress']);
    $updateSiteLink = safe($_POST['SiteLink']);
    $updateSiteEmailAddress = safe($_POST['SiteEmailAddress']);
    $updateSiteEmailPassword = safe($_POST['SiteEmailPassword']);
    $updateSiteEmailHostAddress = safe($_POST['SiteEmailHostAddress']);
    $updateFacebook = safe($_POST['Facebook']);
    $updateTwitter = safe($_POST['Twitter']);
    $updateLinkedin = safe($_POST['Linkedin']);
    $updateInstagram = safe($_POST['Instagram']);
    $updatePinterest = safe($_POST['Pinterest']);
    $updateYouTube = safe($_POST['YouTube']);
    $updateDolarKuru = safe($_POST['DolarKuru']);
    $updateEuroKuru = safe($_POST['EuroKuru']);
    $updatefreeShippingDam = safe($_POST['freeShippingDam']);



    $duzenle = $db->prepare("UPDATE settings SET
            SiteName=?,
            SiteTitle=?,
            SiteDescription=?,
            SiteKeywords=?,
            SiteCopyrightText=?,
            SitePhone=?,
            SiteOfficeAddress=?,
            SiteLink=?,
            SiteEmailAddress=?,
            SiteEmailPassword=?,
            SiteEmailHostAddress=?,
            Facebook=?,
            Twitter=?,
            Linkedin=?,
            Instagram=?,
            Pinterest=?,
            YouTube=?,
            DolarKuru=?,
            EuroKuru=?,
            freeShippingDam=?

        WHERE id=?");

    $update = $duzenle->execute([
        $updateSiteName,
        $updateSiteTitle,
        $updateSiteDescription,
        $updateSiteKeywords,
        $updateSiteCopyrightText,
        $updateSitePhone,
        $updateSiteOfficeAddress,
        $updateSiteLink,
        $updateSiteEmailAddress,
        $updateSiteEmailPassword,
        $updateSiteEmailHostAddress,
        $updateFacebook,
        $updateTwitter,
        $updateLinkedin,
        $updateInstagram,
        $updatePinterest,
        $updateYouTube,
        $updateDolarKuru,
        $updateEuroKuru,
        $updatefreeShippingDam,
        $id
    ]);



    if ($update) {


        Header("Location:../admin/index.php?bp=18&durum=ok");
    } else {

        Header("Location:../admin/index.php?bp=18&durum=no");
    }
}
