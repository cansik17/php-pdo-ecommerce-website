<?php
if (isset($_SESSION["Manager"])) {

    if (isset($_REQUEST["searchInput"])) {
        $searchInput    =    safe($_REQUEST["searchInput"]);
        $searchQuery        =     " AND productName LIKE '%" . $searchInput . "%' ";
        $paginationTerm    =    "&searchInput=" . $searchInput;
    } else {
        $searchQuery        =    "";
        $paginationTerm    =    "";
    }

    $leftRightButtonCount        =    2;
    $resultsPerPage        =    10;
    $totalRecordCountQuery                =    $db->prepare("SELECT * FROM products WHERE status = ? $searchQuery ORDER BY id DESC");
    $totalRecordCountQuery->execute([1]);
    $totalRecordCountQuery                =    $totalRecordCountQuery->rowCount();
    $paginationStartRecordCount        =    ($pagination * $resultsPerPage) - $resultsPerPage;
    $pageCountResult                        =    ceil($totalRecordCountQuery / $resultsPerPage);

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
    <h1 class="mt-4">Ürünler</h1>
    <a href="index.php?bp=12" class="float-right mb-3"><button class="btn btn-primary">Yeni Ürün Ekle</button></a>
    </div>

    <div class="table-responsive-md ">

        <tr>
            <td>
                <div class="AramaAlani">
                    <form action="index.php?bp=4" method="post">

                        <div class="AramaAlaniInputKapsamaAlani">
                            <input type="text" name="searchInput" class="float-left" placeholder="ürünlerde ara">
                        </div>
                        <div class="">
                            <input type="submit" value="ara" class="btn btn-secondary btn-sm">
                        </div>
                    </form>
                </div>
            </td>
        </tr>

        <table class="table w-100 ">
            <thead class="bg-secondary text-white font-italic  ">

                <tr>

                    <th scope="col">
                        <h4>id</h4>
                    </th>
                    <th scope="col">
                        <h4>Ürün Resmi</h4>
                    </th>
                    <th scope="col">
                        <h4>Kategori Adı</h4>
                    </th>
                    <th scope="col">
                        <h4>Ürün Adı</h4>
                    </th>
                    <th scope="col">
                        <h4>Fiyatı(vergi hariç)</h4>
                    </th>
                    <th scope="col">
                        <h4>Satış Sayısı </h4>
                    </th>
                    <th scope="col">
                        <h4>Görüntülenme Sayısı </h4>
                    </th>



                    <th scope="col">
                        <h4> &nbsp;&nbsp; İşlem Yap</h4>
                    </th>
                </tr>
            </thead>
            <tbody>
                <?php
                $productsQuery        =    $db->prepare("SELECT * FROM products WHERE status = ? $searchQuery ORDER BY id DESC LIMIT $paginationStartRecordCount, $resultsPerPage");
                $productsQuery->execute([1]);
                $productsCount            =    $productsQuery->rowCount();
                $productsRecords        =    $productsQuery->fetchAll(PDO::FETCH_ASSOC);

                if ($productsCount > 0) {
                    foreach ($productsRecords as $products) {
                        $productsCategoriesQuery        =    $db->prepare("SELECT * FROM categories WHERE id = ? LIMIT 1");
                        $productsCategoriesQuery->execute([$products["categoriesid"]]);
                        $productsCategoriesRecord            =    $productsCategoriesQuery->fetch(PDO::FETCH_ASSOC);

                        //     if ($products["UrunTuru"] == "Erkek Ayakkabısı") {
                        //         $ResimKlasoru    =    "Erkek";
                        //     } elseif ($products["UrunTuru"] == "Kadın Ayakkabısı") {
                        //         $ResimKlasoru    =    "Kadin";
                        // } elseif ($products["UrunTuru"] == "Çocuk Ayakkabısı") {
                        //     $ResimKlasoru    =    "Cocuk";
                        // }
                ?>
                        <tr>
                            <td><?php echo $products['id']; ?></td>
                            <td>
                                <img src="../<?php echo $products['productimage1']; ?>" width="100px" class="img-fluid" alt="Responsive image"><br>

                            </td>
                            <td><?php echo $productsCategoriesRecord['categoriesName']; ?></td>
                            <td><?php echo $products['productName']; ?></td>
                            <td><?php echo $products['productPrice']; ?></td>
                            <td><?php echo $products['totalSaleNumber']; ?></td>
                            <td><?php echo $products['numberOfViews']; ?></td>
                            <td>
                                <a href="index.php?bp=13&id=<?php echo $products['id']; ?>" title="Düzenle" class="badge badge-primary ">Düzenle</a>
                                <a href="../configs/backForms.php?productsDelete=ok&id=<?php echo $products['id']; ?>" title="Sil" class="badge badge-danger ">Sil</a>
                            </td>
                        </tr>
                    <?php
                    }

                    if ($pageCountResult > 1) {
                    ?>

            </tbody>
        </table>


        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>

        <tr height="50">
            <td colspan="2" align="center">
                <div class="SayfalamaAlaniKapsayicisi">
                    <div class="SayfalamaAlaniIciMetinAlaniKapsayicisi">
                        Toplam <?php echo $pageCountResult; ?> sayfada, <?php echo $totalRecordCountQuery; ?> adet kayıt bulunmaktadır.
                    </div>

                    <div class="SayfalamaAlaniIciNumaraAlaniKapsayicisi">
                        <?php
                        if ($pagination > 1) {
                            echo "<span class='SayfalamaPasif'><a href='index.php?bp=4" . $paginationTerm . "&page=1'><<</a></span>";
                            $paginationMinusOne    =    $pagination - 1;
                            echo "<span class='SayfalamaPasif'><a href='index.php?bp=4" . $paginationTerm . "&page=" . $paginationMinusOne . "'><</a></span>";
                        }

                        for ($paginationIndexValue = $pagination - $leftRightButtonCount; $paginationIndexValue <= $pagination + $leftRightButtonCount; $paginationIndexValue++) {
                            if (($paginationIndexValue > 0) and ($paginationIndexValue <= $pageCountResult)) {
                                if ($pagination == $paginationIndexValue) {
                                    echo "<span class='SayfalamaAktif'>" . $paginationIndexValue . "</span>";
                                } else {
                                    echo "<span class='SayfalamaPasif'><a href='index.php?bp=4" . $paginationTerm . "&page=" . $paginationIndexValue . "'> " . $paginationIndexValue . "</a></span>";
                                }
                            }
                        }

                        if ($pagination != $pageCountResult) {
                            $paginationPlusOne    =    $pagination + 1;
                            echo "<span class='SayfalamaPasif'><a href='index.php?bp=4" . $paginationTerm . "&page=" . $paginationPlusOne . "'>></a></span>";
                            echo "<span class='SayfalamaPasif'><a href='index.php?bp=4" . $paginationTerm . "&page=" . $pageCountResult . "'>>></a></span>";
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
                    <td width="750">Kayıtlı ürün bulunmamaktadır.</td>
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