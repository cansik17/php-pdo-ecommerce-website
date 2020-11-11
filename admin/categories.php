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
    <h1 class="mt-4">Kategorileri Düzenle</h1>
    <a href="index.php?bp=10" class="float-right mb-3"><button class="btn btn-primary">Yeni Kategori Ekle</button></a>
    </div>

    <div class="table-responsive-md ">

        <table class="table w-100 ">
            <thead class="bg-secondary text-white font-italic  ">

                <tr>

                    <th scope="col">
                        <h4>id</h4>
                    </th>
                    <th scope="col">
                        <h4>Ürün Türü</h4>
                    </th>
                    <th scope="col">
                        <h4>Kategori Adı</h4>
                    </th>
                  
                    <th scope="col">
                        <h4> &nbsp;&nbsp; İşlem Yap</h4>
                    </th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $categoriesQuery        =    $db->prepare("SELECT * FROM categories ORDER BY productType ASC");
                    $categoriesQuery->execute();
                    $categoriesCount        =    $categoriesQuery->rowCount();
                    $categoriesRecords    =    $categoriesQuery->fetchAll(PDO::FETCH_ASSOC);

                    if ($categoriesCount > 0) {
                        foreach ($categoriesRecords as $row) {
                ?>
                    <tr>
                    <td><?php echo $row['id']; ?></td>
                    <td><?php echo $row['productType']; ?></td>
                    <td><?php echo $row['categoriesName']; ?></td>
                    <td>
                        <a href="index.php?bp=11&id=<?php echo $row['id']; ?>" title="Düzenle" class="badge badge-primary ">Düzenle</a>
                        <a href="../configs/backForms.php?categoriesDelete=ok&id=<?php echo $row['id']; ?>" title="Sil" class="badge badge-danger ">Sil</a>
                    </td>
                    </tr>
                <?php
                }}else {
                   echo "kayıt bulunamadı";
                }
                ?>

            </tbody>
        </table>
    

    <?php
}  else {
    header("Location:../index.php");
}
    ?>