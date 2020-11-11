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
    <h1 class="mt-4">İntro (Giriş Slaytları) Bölümünü Düzenle</h1>
    <a href="index.php?bp=8" class="float-right mb-3"><button class="btn btn-primary">Yeni Slayt Ekle</button></a>
    </div>

    <div class="table-responsive-md ">

        <table class="table w-100 ">
            <thead class="bg-secondary text-white font-italic  ">

                <tr>

                    <th scope="col">
                        <h4>id</h4>
                    </th>
                    <th scope="col">
                        <h4>Başlık</h4>
                    </th>
                    <th scope="col">
                        <h4>Açıklama</h4>
                    </th>
                    <th scope="col">
                        <h4>Resim</h4>
                    </th>
                    <th scope="col">
                        <h4>Link Yazısı</h4>
                    </th>
                    <th scope="col">
                        <h4>Link</h4>
                    </th>
                    <th scope="col">
                        <h4>Tarih</h4>
                    </th>


                    <th scope="col">
                        <h4> &nbsp;&nbsp; İşlem Yap</h4>
                    </th>
                </tr>
            </thead>
            <tbody>
                <?php


                foreach ($introBackQuery as $row) {
                ?>

                    <td><?php echo $row['id']; ?></td>
                    <td><?php echo $row['title']; ?></td>
                    <td><?php echo $row['text']; ?></td>
                    <td>
                        <img src="../<?php echo $row['image']; ?>" width="100px" class="img-fluid" alt="Responsive image"><br>

                    </td>
                    <td><?php echo $row['linkText']; ?></td>
                    <td><?php echo $row['link']; ?></td>
                    <td><?php echo $row['date']; ?></td>


                    <td>
                        <a href="index.php?bp=9&id=<?php echo $row['id']; ?>" title="Düzenle" class="badge badge-primary ">Düzenle</a>
                        <a href="../configs/backForms.php?introDelete=ok&id=<?php echo $row['id']; ?>" title="Sil" class="badge badge-danger ">Sil</a>


                    </td>
                    </tr>
                <?php
                }
                ?>

            </tbody>
        </table>

    <?php
} else {
    header("Location:../index.php");
}
    ?>