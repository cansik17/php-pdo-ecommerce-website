<?php
if (isset($_SESSION["Manager"])) {

    $id = safe($_GET['id']);

    $query  =    $db->prepare("SELECT * FROM intro WHERE id=? ");
    $query->execute([$id]);
    $intro = $query->fetch(PDO::FETCH_ASSOC);
?>

    <!-- içerik bölümü  -->



    <div class="mt-4">
        <h1>Slaydı Düzenle</h1>
        <a href="index.php?bp=1" class="float-right mb-3"><button class="btn btn-primary">Geri</button></a>
    </div>
    <form method="POST" action="../configs/backForms.php?id=<?php echo $id; ?>" enctype="multipart/form-data">
        <div class="form-group">
            <label for="formGroupExampleInput">Resim:</label><br>
            <img src="../<?php echo $intro['image']; ?>" width="250px" class="img-fluid" alt="Responsive image"><br>
            <input type="file" name="img" class="form-control-file" id="exampleFormControlFile1">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Başlık:</b> </label>
            <input type="text" name="title" class="form-control" value="<?php echo $intro['title']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="exampleFormControlTextarea1"><b>Açıklama:</b> </label>
            <textarea class="form-control" name="text" id="exampleFormControlTextarea1" rows="3"><?php echo $intro['text']; ?></textarea>
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Link Yazısı:</b> </label>
            <input type="text" name="linkText" class="form-control" value="<?php echo $intro['linkText']; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>



        <button type="submit" name="introUpdate" class="btn btn-primary ">Güncelle</button>
    </form>

<?php
} else {
    header("Location:../index.php");
}
?>