<?php
$orderid                  =    safe($_POST['cartid']);

$adressName               =    safe($_POST['adressName']);
$adressSurname            =    safe( $_POST['adressSurname']);
$addressPhone             =    safe($_POST['addressPhone']);
$addressType              =    safe($_POST['addressType']);
$addressDetails           =    safe($_POST['addressDetails']);
$paymentOptions           =    safe($_POST['paymentOptions']);
$ccName                   =    safe($_POST['ccName']);
$ccCardNumber             =    safe($_POST['ccCardNumber']);
$ccExpDate                =    safe($_POST['ccExpDate']);
$ccCVV                    =    safe($_POST['ccCVV']);


$cartQuery		=	$db->prepare("SELECT * FROM shoppingcart WHERE cartid = ?");
			$cartQuery->execute([$orderid]);
			$cartCount				=	$cartQuery->rowCount();
			$cartProducts				=	$cartQuery->fetchAll(PDO::FETCH_ASSOC);

			if($cartCount>0){
				foreach($cartProducts as $cartRows){
					$cartid					=	$cartRows["id"];
					$cartOrderId			=	$cartRows["cartid"];
					$cartUserId				=	$cartRows["userid"];
					$cartProductId			=	$cartRows["productid"];
					$cartSize			    =	$cartRows["size"];
					$productAmount			=	$cartRows["productAmount"];

					$productInfoQuery			=	$db->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
					$productInfoQuery->execute([$cartProductId]);
					$productRecord					=	$productInfoQuery->fetch(PDO::FETCH_ASSOC);
						$productName				=	$productRecord["productName"];
						$productPrice			=	$productRecord["productPrice"];
						$cargo		=	$productRecord["cargoFee"];
						$productImage			=	$productRecord["productimage1"];
						$taxRate				=	$productRecord["taxRate"];
		
		$lastPrice = $productPrice + ($taxRate * $productPrice * 0.01);
		//}

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

					$orderAddQuery	=	$db->prepare("INSERT INTO orders (userid, orderid, productid, productName, productPrice, productAmount, cargoFee , productimage1 , size, adressName, adressSurname, addressType, addressDetails, addressPhone, paymentOptions, ccName, ccCardNumber, ccExpDate, ccCVV, orderDate ,orderipAddress) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
					$orderAddQuery->execute([$cartUserId, $cartOrderId, $cartProductId, $productName, $calcTotalProductPrice, $productAmount, $cartTotalCargoPriceAccount, $productImage, $cartSize, $adressName, $adressSurname, $addressType, $addressDetails, $addressPhone, $paymentOptions, $ccName , $ccCardNumber, $ccExpDate, $ccCVV, $timeStamp , $ipAddress]);
					$addControl	=	$orderAddQuery->rowCount();

					if($addControl>0){
						$cartDeleteQuery	=	$db->prepare("DELETE FROM shoppingcart WHERE id = ? AND userid = ? LIMIT 1");
						$cartDeleteQuery->execute([$cartid, $cartUserId]);
					}
						
					$productSaleAmountPlusQuery	=	$db->prepare("UPDATE products SET totalSaleNumber=totalSaleNumber + ? WHERE id = ?");
					$productSaleAmountPlusQuery->execute([$productAmount, $cartProductId]);	

					$stockUpdateQuery	=	$db->prepare("UPDATE sizetableamount SET  $cartSize=$cartSize - ? WHERE productid = ? LIMIT 1");
					$stockUpdateQuery->execute([$productAmount, $cartProductId]);	
				}

				$cargoPriceProductQuery	=	$db->prepare("SELECT SUM(productPrice) AS totalPrice FROM orders WHERE userid = ? AND orderid = ?");
				$cargoPriceProductQuery->execute([$cartUserId, $cartOrderId]);
				$cargoPriceRecord					=	$cargoPriceProductQuery->fetch(PDO::FETCH_ASSOC);
					$totalPayPriceNoCargo	=	$cargoPriceRecord["totalPrice"];

					if($totalPayPriceNoCargo>= $freeShippingDam){
						$updateOrder	=	$db->prepare("UPDATE orders SET cargoFee = ?  WHERE userid = ? AND orderid = ?");
						$updateOrder->execute([0, $cartUserId, $cartOrderId]);
					}

						$totalPayPriceUpdate	=	$db->prepare("UPDATE orders SET totalPayPrice = ?  WHERE  orderid = ?");
						$totalPayPriceUpdate->execute([$totalPayPriceForm, $cartOrderId]);

				Header("Location:index.php?P=13");
			}	
		



?>

