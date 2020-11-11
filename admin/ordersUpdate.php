<?php
if (isset($_SESSION["Manager"])) {

    $id = safe($_GET['orderid']);

    $query  =    $db->prepare("SELECT * FROM orders WHERE orderid=? ");
    $query->execute([$id]);
    $count = $query->rowCount();
    $row = $query->fetch(PDO::FETCH_ASSOC);

    if ($count > 0) {

        // foreach ($rows as $row) {

        // $cargoStatus = $row['cargoStatus'];
        // $status = $row['status'];
        
?>

        <!-- içerik bölümü  -->



        <div class="mt-4">
            <h1>Siparişi Düzenle</h1>
            <a href="index.php?bp=5" class="float-right mb-1"><button class="btn btn-primary">Geri</button></a>
        </div>
        <form method="POST" action="../configs/backForms.php?orderid=<?php echo $id; ?>">


            <div class="form-group">
                <label for="formGroupExampleInput2"><b>Kargo Durumu:</b> </label>
                <select class="custom-select" name="cargoStatus" id="validationCustom04" required>
                    <option value="0" <?php if ($row['cargoStatus'] == '0') { ?>selected="selected" <?php } ?>>Beklemede</option>
                    <option value="1" <?php if ($row['cargoStatus'] == '1') { ?>selected="selected" <?php } ?>>Kargoya Verildi</option>

                </select>
            </div>

            <div class="form-group">
                <label for="formGroupExampleInput2"><b>Sipariş Durumu:</b> </label>
                <select class="custom-select" name="status" id="validationCustom04" required>
                    <option value="0" <?php if ($row['status'] == '0') { ?>selected="selected" <?php } ?>>İşlem Halinde</option>
                    <option value="1" <?php if ($row['status'] == '1') { ?>selected="selected" <?php } ?>>Sipariş Tamamlandı</option>

                </select>
            </div>



            <button type="submit" name="ordersUpdate" class="btn btn-primary ">Güncelle</button>
        </form>

<?php
        } else {
        echo "kategori yüklenemedi";
    }
} else {
    header("Location:../index.php");
}
?>