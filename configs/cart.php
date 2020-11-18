<?php


require_once 'config.php';

$id                =    safe($_GET["id"]);

if (isset($_POST['addToCart'])) {
    if (isset($_SESSION["users"])){

    // if (isset($_POST["id"])) {
    //     $id                =    safe($_POST["id"]);
    // } else {
    //     $id                =    "";
    // }

    if (isset($_POST["productAmount"])) {
        $productAmount                =    safe($_POST["productAmount"]);
    } else {
        $productAmount                =    "";
    }

    if (isset($_POST["size"])) {
        $size                =    safe($_POST["size"]);
    } else {
        $size                =    "";
    }


        // echo $id."<br>" . $productAmount."<br>" . $size ;
        if (($productAmount != "" ) and ($size != ""  )) {
            $userCartControlQuery    =    $db->prepare("SELECT * FROM shoppingcart WHERE userid = ? ORDER BY id DESC ");
            $userCartControlQuery->execute([$userid]);
            $userCartCount        =    $userCartControlQuery->rowCount();

            if ($userCartCount > 0) {
                $productCartControlQuery    =    $db->prepare("SELECT * FROM shoppingcart WHERE userid = ? AND productid = ?  AND size = ? ");
                $productCartControlQuery->execute([$userid, $id, $size]);
                $productCartCount            =    $productCartControlQuery->rowCount();
                $productCartRecord                =    $productCartControlQuery->fetch(PDO::FETCH_ASSOC);

                if ($productCartCount > 0) {
                    $productCartid                        =    $productCartRecord["id"];
                    $productCartAmount        =    $productCartRecord["productAmount"];
                    $productNewRecord                =    $productCartAmount + $productAmount;

                    $productUpdateQuery    =    $db->prepare("UPDATE shoppingcart SET productAmount = ?  WHERE id = ? AND userid = ? AND productid = ? LIMIT 1");
                    $productUpdateQuery->execute([$productNewRecord, $productCartid, $userid, $id
                    ]);
                    $productUpdateCount        =    $productUpdateQuery->rowCount();

                    if ($productUpdateCount > 0) {
                        header("Location:../shopping-cart");
                        exit();
                    } else {
                        echo "BİR HATA OLUŞTU..";
                        exit();
                    }
                } else {
                    $productInsertQuery        =    $db->prepare("INSERT INTO shoppingcart (userid, productid, productAmount, size) values (?, ?, ?, ?)");
                    $productInsertQuery->execute([$userid, $id, $productAmount, $size]);
                    $productInsertCount        =    $productInsertQuery->rowCount();
                    $lastId            =    $db->lastInsertId();

                    if ($productInsertCount > 0) {
                        $cartIdUpdate        =    $db->prepare("UPDATE shoppingcart SET cartid = ? WHERE userid = ?");
                        $cartIdUpdate->execute([$lastId, $userid]);
                        $cartIdUpdateCount        =    $cartIdUpdate->rowCount();
                        if ($cartIdUpdateCount > 0) {
                            header("Location:../shopping-cart");
                            exit();
                        } else {
                            echo "BİR HATA OLUŞTU..";
                            exit();
                        }
                    } else {
                        echo "BİR HATA OLUŞTU..";
                        exit();
                    }
                }
            } else {
                $productInsertQuery        =    $db->prepare("INSERT INTO shoppingcart (userid, productid, size, productAmount) values (?, ?, ?, ?)");
                $productInsertQuery->execute([$userid, $id, $size, $productAmount]);
                $productInsertCount        =    $productInsertQuery->rowCount();
                $lastId            =    $db->lastInsertId();

                if ($productInsertCount > 0) {
                    $cartIdUpdate        =    $db->prepare("UPDATE shoppingcart SET cartid = ? WHERE userid = ?");
                    $cartIdUpdate->execute([$lastId, $userid]);
                    $cartIdUpdateCount        =    $cartIdUpdate->rowCount();
                    if ($cartIdUpdateCount > 0) {
                        header("Location:../shopping-cart");
                        exit();
                    } else {
                        echo "BİR HATA OLUŞTU.xxxx.";
                        exit();
                    }
                } else {
                    echo "BİR HATA OLUŞTU.zzzzzzz.";
                    exit();
                }
            }
        } else {
            echo "seçimleri atlamayınız";
            exit();
        }
    }else {
        echo "giriş yapmadan sepete ekleme olmazz";
    }



}elseif (isset($_POST['addToFav'])) {
   if (isset($_SESSION['users'])) {

        $favControlQuery    =    $db->prepare("SELECT * FROM favourites WHERE userid = ? AND productid = ?  ");
        $favControlQuery->execute([$userid, $id]);
        $favCartCount            =    $favControlQuery->rowCount();
        $favCartRecord                =    $favControlQuery->fetch(PDO::FETCH_ASSOC);

        if ($favCartCount > 0) {
            echo "HAta aynı ürünü yeniden ekleyemezsiniz favlara";
        }else {
            $favAddQuery        =    $db->prepare("INSERT INTO favourites (userid, productid) values (?, ?)");
            $favAddQuery->execute([$userid, $id]);
            $favAddCount        = $favAddQuery->rowcount();

            if ($favAddCount > 0) {
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit();
            } else {
                echo "fava ekleme yaparken bir hata oluştu";
            }
        }
   } else {
       echo "fava eklemek için lütfen üye girişi yapınız";
   }
   
}

?> 