<?php
if (isset($_SESSION["Manager"])) {
    if (isset($_GET["orderid"])) {
        $orderid        =    safe($_GET["orderid"]);
    } else {
        $orderid        =    "";
    }
?>
    <table width="760" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr height="70">
            <td width="560" bgcolor="#FF9900" style="color: #FFFFFF;" align="left">
                <h3>&nbsp;SİPARİŞ DETAY</h3>
            </td>
            <td width="300" bgcolor="#FF9900" align="right"><a href="index.php?bp=15" style="color: #FFFFFF; text-decoration: none;">Tamamlanan Siparişlere Dön&nbsp;</a></td>
        </tr>
        <tr height="10">
            <td colspan="2" style="font-size: 10px;">&nbsp;</td>
        </tr>
        <?php
        $orderQuery        =    $db->prepare("SELECT * FROM orders WHERE orderid = ?");
        $orderQuery->execute([$orderid]);
        $orderCount        =    $orderQuery->rowCount();
        $records    =    $orderQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($orderCount > 0) {
            $loopCount    =    0;

            foreach ($records as $row) {
                // if ($SiparisBilgileri["UrunTuru"] == "Erkek Ayakkabısı") {
                //     $ResimKlasoru    =    "Erkek";
                // } elseif ($SiparisBilgileri["UrunTuru"] == "Kadın Ayakkabısı") {
                //     $ResimKlasoru    =    "Kadin";
                // } elseif ($SiparisBilgileri["UrunTuru"] == "Çocuk Ayakkabısı") {
                //     $ResimKlasoru    =    "Cocuk";
                // }

                $cargoStatus        =    ($row["cargoStatus"]);
                if ($cargoStatus == 0) {
                    $cargoStatusPrint    =    "Beklemede";
                } else {
                    $cargoStatusPrint    = "Ürün Kargoya Verilmiştir";
                }

                $orderStatus        =    ($row["status"]);
                if ($orderStatus == 0) {
                    $orderStatusPrint    =    "İşlem Halinde";
                } else {
                    $orderStatusPrint    =    "Teslim Edildi";
                }

                $productid = $row['productid'];


                $showproduct  =    $db->prepare("SELECT * FROM products WHERE id=? ");
                $showproduct->execute([$productid]);
                $showproductCount = $showproduct->rowCount();
                $showproductQuery = $showproduct->fetch(PDO::FETCH_ASSOC);

                $productPrice = ($showproductQuery['productPrice']) + ($showproductQuery['taxRate'] * $showproductQuery['productPrice'] * 0.01);
        ?>
                <tr>
                    <td colspan="2" style="border-bottom: 1px dashed #CCCCCC;" valign="top">
                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                            <?php
                            if ($loopCount == 0) {
                            ?>
                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b>Adı Soyadı</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($row["adressName"]); ?> <?php echo ($row["adressSurname"]); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b>Telefon</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($row["addressPhone"]); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b>Adres</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($row["addressDetails"]); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b>Sipariş Tutarı</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($row["totalPayPrice"]); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b>Sipariş Tarihi</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo dateFormat($row["orderDate"]); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b> İp Adresi</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($row["orderipAddress"]); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b> Kargo Durumu</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($cargoStatusPrint); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="120"><b> Sipariş Durumu</b></td>
                                                <td width="10"><b>:</b></td>
                                                <td width="540"><?php echo ($orderStatusPrint); ?></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                            <?php
                            }
                            ?>
                            <tr>
                                <td width="60" valign="top"><img src="../<?php echo ($row["productimage1"]); ?>" border="0" width="60" height="80"></td>
                                <td width="10">&nbsp;</td>
                                <td width="680" valign="top">
                                    <table width="680" align="right" border="0" cellpadding="0" cellspacing="0">
                                        <tr height="25">
                                            <td width="680">
                                                <table width="680" align="right" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="450" align="left"><?php echo ($row["productName"]); ?></td>
                                                        <td width="230" align="right">Beden : <?php echo ($row["size"]); ?></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr height="25">
                                            <td width="680">
                                                <table width="680" align="right" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="50"><b>Fiyat</b></td>
                                                        <td width="10"><b>:</b></td>
                                                        <td width="138"><?php echo (($productPrice)); ?> TL</td>
                                                        <td width="50"><b>Adet</b></td>
                                                        <td width="10"><b>:</b></td>
                                                        <td width="50"><?php echo ($row["productAmount"]); ?></td>
                                                        <td width="115"><b>Toplam Fiyat</b></td>
                                                        <td width="10"><b>:</b></td>
                                                        <td width="125"><?php echo (($row["productPrice"])); ?> TL</td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr height="25">
                                            <td width="680">
                                                <table width="680" align="right" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="50"><b>Ödeme</b></td>
                                                        <td width="10"><b>:</b></td>
                                                        <td width="135"><?php echo ($row["paymentOptions"]); ?></td>


                                                        <td width="105"><b>Kargo Ücreti</b></td>
                                                        <td width="10"><b>:</b></td>
                                                        <td width="65"><?php echo (($row["cargoFee"])); ?> TL</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            <?php
                $loopCount++;
            }
            ?>

            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>

            <tr>
                <td colspan="2">

                </td>
            </tr>
        <?php
        } else {
            header("Location:index.php?SKD=0&SKI=0");
            exit();
        }
        ?>
    </table>
<?php
} else {
    header("Location:index.php?SKD=1");
    exit();
}
?>