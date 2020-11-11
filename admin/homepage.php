<?php
if (isset($_SESSION["Manager"])) {


?>


    <h1 class="mt-4">Yönetim Paneli</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Sol Taraftaki seçenekleri kullanarak web sitenizi yönetebilirsiniz...</li>
    </ol>

<?php
} else {
    header("Location:../index.php");
}
?>