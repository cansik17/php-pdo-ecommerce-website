<?php

require_once 'config.php';

///////////////////


$param1 = 'ÜST GİYİM';

$categories1  =    $db->prepare("SELECT * FROM categories WHERE productType=? ORDER BY id ASC ");
$categories1->execute([$param1]);
$categories1Query = $categories1->fetchAll(PDO::FETCH_ASSOC);
////

$param2 = 'ALT GİYİM';

$categories2  =    $db->prepare("SELECT * FROM categories WHERE productType=? ORDER BY id ASC ");
$categories2->execute([$param2]);
$categories2Query = $categories2->fetchAll(PDO::FETCH_ASSOC);
////

$param3 = 'AYAKKABILAR';

$categories3  =    $db->prepare("SELECT * FROM categories WHERE productType=? ORDER BY id ASC ");
$categories3->execute([$param3]);
$categories3Query = $categories3->fetchAll(PDO::FETCH_ASSOC);
////

$param4 = 'AKSESUARLAR';

$categories4  =    $db->prepare("SELECT * FROM categories WHERE productType=? ORDER BY id ASC ");
$categories4->execute([$param4]);
$categories4Query = $categories4->fetchAll(PDO::FETCH_ASSOC);
////

$contracts  =    $db->prepare("SELECT * FROM contracts WHERE id=?  ");
$contracts->execute([1]);
$contractsQuery = $contracts->fetch(PDO::FETCH_ASSOC);

/////


/////
$intro  =    $db->prepare("SELECT * FROM intro  ORDER BY id DESC ");
$intro->execute();
$introQuery = $intro->fetchAll(PDO::FETCH_ASSOC);
////
/////
$bestseller  =    $db->prepare("SELECT * FROM products  WHERE status=1 ORDER BY totalSaleNumber DESC LIMIT 12");
$bestseller->execute();
$bestsellerQuery = $bestseller->fetchAll(PDO::FETCH_ASSOC);
/////////
$popular  =    $db->prepare("SELECT * FROM products WHERE status=1 ORDER BY numberOfViews DESC LIMIT 12");
$popular->execute();
$popularQuery = $popular->fetchAll(PDO::FETCH_ASSOC);
////


/*<<<<<<<<<<<<< BACKEND QUERIES >>>>>>>>>>>*/


// Pdo sorgularını burada topladım...


$introBack  =    $db->prepare("SELECT * FROM intro ORDER BY id DESC");
$introBack->execute();
$introBackQuery = $introBack->fetchAll(PDO::FETCH_ASSOC);

// ***

$contracts  =    $db->prepare("SELECT * FROM contracts WHERE id=?");
$contracts->execute([1]);
$contractsQuery = $contracts->fetch(PDO::FETCH_ASSOC);

// ***



$settings  =    $db->prepare("SELECT * FROM settings WHERE id=?");
$settings->execute([1]);
$settingsQuery = $settings->fetch(PDO::FETCH_ASSOC);






?>