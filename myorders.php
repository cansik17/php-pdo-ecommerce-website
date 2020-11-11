<?php
if (isset($_SESSION["users"])) {

?>


    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Siparişlerim</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php?P=0">Anasayfa</a></li>
                        <li class="breadcrumb-item active">Siparişlerim</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Wishlist  -->
    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Sipariş No</th>
                                    <th>İsim Soyisim</th>
                                    <th>Sipariş Tarihi</th>
                                    <th>Toplam Fiyat</th>
                                    <th>Sipariş Adresi</th>
                                    <th>Kargo Durumu</th>
                                    <th>Sipariş Sonucu</th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $orderIdQuery        =    $db->prepare("SELECT DISTINCT orderid FROM orders WHERE userid = ? ORDER BY orderid DESC ");
                                $orderIdQuery->execute([$userid]);
                                $orderIdCount        =    $orderIdQuery->rowCount();
                                $orderIdRecords        =    $orderIdQuery->fetchAll(PDO::FETCH_ASSOC);

                                if ($orderIdCount > 0) {
                                    foreach ($orderIdRecords as $orderRecord) {
                                        $orderid        =    ($orderRecord["orderid"]);

                                        $orderQuery                =    $db->prepare("SELECT * FROM orders WHERE userid = ? AND orderid = ? ORDER BY id ASC");
                                        $orderQuery->execute([$userid, $orderid]);
                                        $orderQueryRecords    =    $orderQuery->fetchAll(PDO::FETCH_ASSOC);

                                        foreach ($orderQueryRecords as $row) {
                                

                                            $cargoStatus        =    ($row["cargoStatus"]);
                                            if ($cargoStatus == 0) {
                                                $cargoStatusPrint    =    "Beklemede";
                                            } else {
                                                $cargoStatusPrint    =    "Kargoya Verildi";
                                            }

                                            $orderStatus        =    ($row["status"]);
                                            if ($orderStatus == 0) {
                                                $orderStatusPrint    =    "İşlem Halinde";
                                            } else {
                                                $orderStatusPrint    =    "Teslim Edildi";
                                            }
                                        }
                                ?>
                                        <tr>
                                            <td> <a href="#" class="font-weight-bold"><?php echo $row['orderid']; ?></a> </td>
                                            <td class="quantity-box"><?php echo $row['adressName']; ?> <?php echo $row['adressSurname']; ?></td>
                                            <td class="quantity-box font-weight-bold"><?php echo dateFormat($row['orderDate']); ?></td>
                                            <td class="price-pr font-weight-bold">
                                                <p><?php echo $row['totalPayPrice']; ?> TL</p>
                                            </td>
                                            <td class="quantity-box"><?php echo $row['addressDetails']; ?></td>
                                            <td class="quantity-box font-weight-bold"><?php echo $cargoStatusPrint; ?></td>
                                            <td class="quantity-box font-weight-bold"><?php echo $orderStatusPrint; ?></td>

                                        </tr>
                                    <?php
                                    }
                                    ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Wishlist -->
<?php
                                }
                            } else {
                                header("Location:index.php");
                                exit();
                            }
?>