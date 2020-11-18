<?php
date_default_timezone_set('Europe/Istanbul');


try {
    $db    =    new PDO("mysql:host=localhost;dbname=eticaret1;charset=UTF8", "root", "");
} catch (PDOException $Hata) {
    //echo "Bağlantı Hatası<br />" . $Hata->getMessage(); // Bu alanı kapatın çünkü site hata yaparsa kullanıcılar hata değerini görmesin.
    die();
}



$ipAddress              =    $_SERVER["REMOTE_ADDR"];
$timeStamp            =    time();


function safe($Deger)
{
    $BoslukSil            =    trim($Deger);
    $TaglariTemizle       =    strip_tags($BoslukSil);
    $EtkisizYap           =    htmlspecialchars($TaglariTemizle, ENT_QUOTES);
    $Sonuc                =    $EtkisizYap;
    return $Sonuc;
}

function dateFormat($Deger)
{
    $Cevir                =    date("d.m.Y H:i:s", $Deger);
    $Sonuc                =    $Cevir;
    return $Sonuc;
}

// function priceFormat($Deger)
// {
//     $Bicimlendir    =    number_format($Deger, "2", ",", ".");
//     $Sonuc            =    $Bicimlendir;
//     return $Sonuc;
// }

function activeCode()
{
    $IlkBesli            =    rand(10000, 99999);
    $IkinciBesli        =    rand(10000, 99999);
    $UcuncuBesli        =    rand(10000, 99999);
    $DorduncuBesli        =    rand(10000, 99999);
    $Kod                =    $IlkBesli . "-" . $IkinciBesli . "-" . $UcuncuBesli . "-" . $DorduncuBesli;
    $Sonuc                =    $Kod;
    return $Sonuc;
}

function SEO($Deger)
{
    $Icerik            =    trim($Deger);
    $Degisecekler      =    array("ç", "Ç", "ğ", "Ğ", "ı", "İ", "ö", "Ö", "ş", "Ş", "ü", "Ü");
    $Degisenler        =    array("c", "c", "g", "g", "i", "i", "o", "o", "s", "s", "u", "u");
    $Icerik            =    str_replace($Degisecekler, $Degisenler, $Icerik);
    $Icerik            =    mb_strtolower($Icerik, "UTF-8");
    $Icerik            =    preg_replace("/[^a-z0-9]/", "-", $Icerik);
    $Icerik            =    preg_replace("/-+/", "-", $Icerik);
    $Icerik            =    trim($Icerik, "-");
    return $Icerik;
}



$settingsQuery        =    $db->prepare("SELECT * FROM settings LIMIT 1");
$settingsQuery->execute();
$settingsCount            =    $settingsQuery->rowCount();
$settings            =    $settingsQuery->fetch(PDO::FETCH_ASSOC);

if ($settingsCount > 0) {
    $SiteName                =    $settings["SiteName"];
    $SiteTitle               =    $settings["SiteTitle"];
    $SiteDescription         =    $settings["SiteDescription"];
    $SiteKeywords            =    $settings["SiteKeywords"];
    $SiteCopyrightText       =    $settings["SiteCopyrightText"];
    $SiteLogo                =    $settings["SiteLogo"];
    $SitePhone               =    $settings["SitePhone"];
    $SiteOfficeAddress       =    $settings["SiteOfficeAddress"];
    $SiteLink                =    $settings["SiteLink"];
    $SiteEmailAddress        =    $settings["SiteEmailAddress"];
    $SiteEmailPassword       =    $settings["SiteEmailPassword"];
    $SiteEmailHostAddress    =    $settings["SiteEmailHostAddress"];
    $Facebook                =    $settings["Facebook"];
    $Twitter                 =    $settings["Twitter"];
    $Linkedin                =    $settings["Linkedin"];
    $Instagram               =    $settings["Instagram"];
    $Pinterest               =    $settings["Pinterest"];
    $YouTube                 =    $settings["YouTube"];
    $DolarKuru               =    $settings["DolarKuru"];
    $EuroKuru                =    $settings["EuroKuru"];
    $freeShippingDam         =    $settings["freeShippingDam"];
    //$ClientID                =    $Ayarlar["ClientID"];
    //$StoreKey                =    $Ayarlar["StoreKey"];
   // $ApiKullanicisi            =    $Ayarlar["ApiKullanicisi"];
   // $ApiSifresi                =    $Ayarlar["ApiSifresi"];
} else {
    //echo "Site Ayar Sorgusu Hatalı"; // Bu alanı kapatın çünkü site hata yaparsa kullanıcılar hata değerini görmesin.
    die();
}





if (isset($_SESSION["users"])) {
    $usersQuery        =    $db->prepare("SELECT * FROM users WHERE mail = ? LIMIT 1");
    $usersQuery->execute([$_SESSION["users"]]);
    $usersCount        =    $usersQuery->rowCount();
    $users                =    $usersQuery->fetch(PDO::FETCH_ASSOC);


    if ($usersCount > 0) {
        $userid             =    $users["id"];
        $mail               =    $users["mail"];
        $password           =    $users["password"];
        $nameSurname        =    $users["nameSurname"];
        $phone              =    $users["phone"];
        $gender             =    $users["gender"];
        $status             =    $users["status"];
        $registerDate       =    $users["registerDate"];
        $registeripAddress  =    $users["registeripAddress"];
        $activationCode     =    $users["activationCode"];
    } else {
        //echo "Kullanıcı Sorgusu Hatalı"; // Bu alanı kapatın çünkü site hata yaparsa kullanıcılar hata değerini görmesin.
        die();
    }
}

if (isset($_SESSION["Manager"])) {
    $managerQuery        =    $db->prepare("SELECT * FROM managers WHERE username = ? LIMIT 1");
    $managerQuery->execute([$_SESSION["Manager"]]);
    $managerCount            =    $managerQuery->rowCount();
    $manager                =    $managerQuery->fetch(PDO::FETCH_ASSOC);

    if ($managerCount > 0) {
        $ManagerID               =    $manager["id"];
        $ManagerUsername         =    $manager["username"];
        $ManagerPassword         =    $manager["password"];
        $ManagerNameSurname      =    $manager["nameSurname"];
        $ManagerMail             =    $manager["mail"];
        $ManagerPhone            =    $manager["phone"];
    } else {
        //echo "Yönetici Sorgusu Hatalı"; // Bu alanı kapatın çünkü site hata yaparsa kullanıcılar hata değerini görmesin.
        die();
    }
}







///////////////////




?>