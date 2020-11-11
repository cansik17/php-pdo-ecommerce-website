<?php
if (isset($_SESSION["Manager"])) {

    $id = safe($_GET['id']);

    $query  =    $db->prepare("SELECT * FROM categories WHERE id=? ");
    $query->execute([$id]);
    $count = $query->rowCount();
    $row = $query->fetch(PDO::FETCH_ASSOC);

    if ($count > 0) {
?>

    <!-- içerik bölümü  -->



    <div class="mt-4">
        <h1>Kategoriyi Düzenle</h1>
        <a href="index.php?bp=3" class="float-right mb-1"><button class="btn btn-primary">Geri</button></a>
    </div>
    <form method="POST" action="../configs/backForms.php?id=<?php echo $id; ?>" >
      

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>kategori adı:</b> </label>
            <input type="text" name="categoriesName" class="form-control" value="<?php echo $row['categoriesName']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <button type="submit" name="categoriesUpdate" class="btn btn-primary ">Güncelle</button>
    </form>

<?php
        } else {
            echo "kategori yüklenemedi";
        }
} else {
    header("Location:../index.php");
}
?>