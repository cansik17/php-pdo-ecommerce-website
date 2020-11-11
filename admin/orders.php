<?php
if (isset($_SESSION["Manager"])) {


?>

    <!-- içerik bölümü  -->
    <?php
    if (isset($_GET['durum'])) {
        if ($_GET['durum'] == 'ok') { ?>

            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'İşlem başarıyla yapılmıştır...',
                    showConfirmButton: false,
                    timer: 2500
                })
            </script>

        <?php } elseif ($_GET['durum'] == 'no') { ?>

            <script>
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'İşlem başarısız...',
                    showConfirmButton: true,
                    timer: 5000
                })
            </script>
    <?php }
    } ?>
    <h1 class="mt-4">Bekleyen Siparişler</h1>
    <a href="index.php?bp=15" class="float-right mb-3"><button class="btn btn-primary">Tamamlanmış Siparişler</button></a>
    </div>

    <div class="table-responsive-md ">

        <table class="table w-100 ">
            <thead class="bg-secondary text-white font-italic  ">

                <tr>

                    <th scope="col">
                        <h4>Sipariş NO</h4>
                    </th>
                    <th scope="col">
                        <h4>Sipariş Tarihi</h4>
                    </th>
                    <th scope="col">
                        <h4>Sipariş Tutarı</h4>
                    </th>

                    <th scope="col">
                        <h4>Alıcı İsim</h4>
                    </th>

                    <th scope="col">
                        <h4>Alıcı Adres</h4>
                    </th>

                    <th scope="col">
                        <h4>Kargo Durumu</h4>
                    </th>

                    <th scope="col">
                        <h4>Sipariş Durumu</h4>
                    </th>

                    <th scope="col">
                        <h4> &nbsp;&nbsp; İşlem Yap</h4>
                    </th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $orderidQuery        =    $db->prepare("SELECT DISTINCT orderid FROM orders WHERE status = ?  ORDER BY id ASC");
                    $orderidQuery->execute([0]);
                    $orderidCount        =    $orderidQuery->rowCount();
                    $orderidRecords        =    $orderidQuery->fetchAll(PDO::FETCH_ASSOC);

                    if ($orderidCount > 0) {
                        foreach ($orderidRecords as $row) {
                            $ordersQuery    =    $db->prepare("SELECT * FROM orders WHERE orderid = ? AND status = ? ");
                            $ordersQuery->execute([$row["orderid"], 0]);
                            $ordersCount        =    $ordersQuery->rowCount();
                            $ordersRecords    =    $ordersQuery->fetchAll(PDO::FETCH_ASSOC);

                            if ($ordersCount > 0) {
                               // $ToplamFiyat        =    0;
                                foreach ($ordersRecords as $record) {
                    $date            =     dateFormat($record["orderDate"]);
                    $thePrice        =    $record["totalPayPrice"];



                                $cargoStatus        =    ($record["cargoStatus"]);
                                if ($cargoStatus == 0) {
                                    $cargoStatusPrint    =    "Beklemede";
                                } else {
                                    $cargoStatusPrint    = "Ürün Kargoya Verilmiştir";
                                }

                                $orderStatus        =    ($record["status"]);
                                if ($orderStatus == 0) {
                                    $orderStatusPrint    =    "İşlem Halinde";
                                } else {
                                    $orderStatusPrint    =    "Teslim Edildi";
                                }
                            }
                ?>
                        <tr>
                            <td><?php echo $record['orderid']; ?></td>
                            <td><?php echo $date; ?></td>
                            <td><?php echo $thePrice; ?> TL</td>
                            <td><?php echo $record['adressName']; ?> <?php echo $record['adressSurname']; ?></td>
                            <td><?php echo $record['addressDetails']; ?></td>
                            <td><?php echo $cargoStatusPrint; ?></td>
                            <td><?php echo $orderStatusPrint; ?></td>
                            <td>
                                <a href="index.php?bp=14&orderid=<?php echo $record['orderid']; ?>" title="Düzenle" class="badge badge-primary ">Düzenle</a>
                                <a href="index.php?bp=17&orderid=<?php echo $record['orderid']; ?>" title="Detay" class="badge badge-secondary ">Detay</a>
                            </td>
                        </tr>
                <?php
                    }else {
                        echo "bekleyen sipariş bulunmamaktadır :(";
                    }}
                }
                ?>

            </tbody>
        </table>


    <?php
} else {
    header("Location:../index.php");
}
    ?>