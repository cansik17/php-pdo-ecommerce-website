<?php
if (isset($_SESSION["Manager"])) {
    $leftRightButtonCount        =    2;
    $resultsPerPage        =    10;
    $totalRecordCountQuery                =    $db->prepare("SELECT DISTINCT orderid FROM orders WHERE status = ? AND cargoStatus = ? ORDER BY id DESC");
    $totalRecordCountQuery->execute([1,1]);
    $totalRecordCountQuery                =    $totalRecordCountQuery->rowCount();
    $paginationStartRecordCount        =    ($pagination * $resultsPerPage) - $resultsPerPage;
    $pageCountResult                        =    ceil($totalRecordCountQuery / $resultsPerPage);

?>
    <table width="760" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr height="70">
            <td width="560" bgcolor="#FF9900" style="color: #FFFFFF;" align="left">
                <h3>&nbsp;SİPARİŞLER (TAMAMLANAN)</h3>
            </td>
            <td width="200" bgcolor="#FF9900" align="right"><a href="index.php?bp=5" style="color: #FFFFFF; text-decoration: none;">Bekleyen Siparişler&nbsp;</a></td>
        </tr>
        <tr height="10">
            <td colspan="2" style="font-size: 10px;">&nbsp;</td>
        </tr>
        <?php
        $orderidQuery        =    $db->prepare("SELECT DISTINCT orderid FROM orders WHERE status = ? AND cargoStatus = ? ORDER BY id DESC LIMIT $paginationStartRecordCount, $resultsPerPage");
        $orderidQuery->execute([1, 1]);
        $orderCount        =    $orderidQuery->rowCount();
        $orderidRecords        =    $orderidQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($orderCount > 0) {
            foreach ($orderidRecords as $record) {
                $orderQuery    =    $db->prepare("SELECT * FROM orders WHERE orderid = ? AND status = ? AND cargoStatus = ?");
                $orderQuery->execute([$record["orderid"], 1, 1]);
                $ordersCount        =    $orderQuery->rowCount();
                $ordersRecords    =    $orderQuery->fetchAll(PDO::FETCH_ASSOC);

                if ($ordersCount > 0) {
                  //  $ToplamFiyat        =    0;
                    foreach ($ordersRecords as $orders) {
                        $orderDate            =     ($orders["orderDate"]);
                        $totalPayPrice        =    $orders["totalPayPrice"];

                      //  $ToplamFiyat            +=    $UrunToplamFiyati;
                    }
        ?>
                    <tr>
                        <td colspan="2" style="border-bottom: 1px dashed #CCCCCC;" valign="top">
                            <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                                <tr height="30">
                                    <td align="left" width="120"><b>Sipariş Tarihi</b></td>
                                    <td align="left" width="20"><b>:</b></td>
                                    <td align="left" width="225"><?php echo dateFormat($orderDate); ?></td>
                                    <td align="left" width="120"><b>Sipariş Tutarı</b></td>
                                    <td align="left" width="20"><b>:</b></td>
                                    <td align="left" width="170"><?php echo $totalPayPrice; ?> TL</td>
                                    <td align="left" width="75">
                                        <table width="75" align="right" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="25"><a href="index.php?bp=16&orderid=<?php echo $record["orderid"]; ?>"><img src="../Resimler/DokumanKirmiziKalemli20x20.png" border="0" style="margin-top: 5px;"></a></td>
                                                <td width="50"><a href="index.php?bp=16&orderid=<?php echo $record["orderid"]; ?>" style="color: #0000FF; text-decoration: none;">Detay</a></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                <?php

                } else {
                    header("Location:index.php?bp=0");
                    exit();
                }
            }

            if ($pageCountResult > 1) {
                ?>
                <tr height="50">
                    <td colspan="8" align="center">
                        <div class="SayfalamaAlaniKapsayicisi">
                            <div class="SayfalamaAlaniIciMetinAlaniKapsayicisi">
                                Toplam <?php echo $pageCountResult; ?> sayfada, <?php echo $totalRecordCountQuery; ?> adet kayıt bulunmaktadır.
                            </div>

                            <div class="SayfalamaAlaniIciNumaraAlaniKapsayicisi">
                                <?php
                                if ($pagination > 1) {
                                    echo "<span class='SayfalamaPasif'><a href='index.php?bp=5&page=1'><<</a></span>";
                                    $paginationMinusOne    =    $pagination - 1;
                                    echo "<span class='SayfalamaPasif'><a href='index.php?bp=5&page=" . $paginationMinusOne . "'><</a></span>";
                                }

                                for ($paginationIndexValue = $pagination - $leftRightButtonCount; $paginationIndexValue <= $pagination + $leftRightButtonCount; $paginationIndexValue++) {
                                    if (($paginationIndexValue > 0) and ($paginationIndexValue <= $pageCountResult)) {
                                        if ($pagination == $paginationIndexValue) {
                                            echo "<span class='SayfalamaAktif'>" . $paginationIndexValue . "</span>";
                                        } else {
                                            echo "<span class='SayfalamaPasif'><a href='index.php?bp=5&page=" . $paginationIndexValue . "'> " . $paginationIndexValue . "</a></span>";
                                        }
                                    }
                                }

                                if ($pagination != $pageCountResult) {
                                    $paginationPlusOne    =    $pagination + 1;
                                    echo "<span class='SayfalamaPasif'><a href='index.php?bp=5&page=" . $paginationPlusOne . "'>></a></span>";
                                    echo "<span class='SayfalamaPasif'><a href='index.php?bp=5&page=" . $pageCountResult . "'>>></a></span>";
                                }
                                ?>
                            </div>
                        </div>
                    </td>
                </tr>
            <?php
            }
        } else {
            ?>
            <tr>
                <td colspan="2">
                    <table width="750" align="right" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="750">Kayıtlı tamamlanan sipariş bulunmamaktadır.</td>
                        </tr>
                    </table>
                </td>
            </tr>
        <?php
        }
        ?>
    </table>
<?php
} else {
    header("Location:index.php?bp=0");
    exit();
}
?>