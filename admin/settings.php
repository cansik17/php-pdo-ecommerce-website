<?php
if (isset($_SESSION["Manager"])) {


?>

    <!-- içerik bölümü  -->



    <div class="mt-4">
        <h1>Ayarları Düzenle</h1>
    </div><hr>
    <form method="POST" action="../configs/backForms.php?id=1">


        <div class="form-group">
            <label for="formGroupExampleInput2"><b>site adı:</b> </label>
            <input type="text" name="SiteName" class="form-control" value="<?php echo $SiteName; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteTitle:</b> </label>
            <input type="text" name="SiteTitle" class="form-control" value="<?php echo $SiteTitle; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteDescription:</b> </label>
            <input type="text" name="SiteDescription" class="form-control" value="<?php echo $SiteDescription; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteKeywords:</b> </label>
            <input type="text" name="SiteKeywords" class="form-control" value="<?php echo $SiteKeywords; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteCopyrightText:</b> </label>
            <input type="text" name="SiteCopyrightText" class="form-control" value="<?php echo $SiteCopyrightText; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

       
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SitePhone:</b> </label>
            <input type="text" name="SitePhone" class="form-control" value="<?php echo $SitePhone; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteOfficeAddress:</b> </label>
            <input type="text" name="SiteOfficeAddress" class="form-control" value="<?php echo $SiteOfficeAddress; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteLink:</b> </label>
            <input type="text" name="SiteLink" class="form-control" value="<?php echo $SiteLink; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteEmailAddress</b> </label>
            <input type="text" name="SiteEmailAddress" class="form-control" value="<?php echo $SiteEmailAddress; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteEmailPassword:</b> </label>
            <input type="text" name="SiteEmailPassword" class="form-control" value="<?php echo $SiteEmailPassword; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>SiteEmailHostAddress:</b> </label>
            <input type="text" name="SiteEmailHostAddress" class="form-control" value="<?php echo $SiteEmailHostAddress; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Facebook</b> </label>
            <input type="text" name="Facebook" class="form-control" value="<?php echo $Facebook; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Twitter:</b> </label>
            <input type="text" name="Twitter" class="form-control" value="<?php echo $Twitter; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Linkedin:</b> </label>
            <input type="text" name="Linkedin" class="form-control" value="<?php echo $Linkedin; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Instagram</b> </label>
            <input type="text" name="Instagram" class="form-control" value="<?php echo $Instagram; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>Pinterest:</b> </label>
            <input type="text" name="Pinterest" class="form-control" value="<?php echo $Pinterest; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>YouTube:</b> </label>
            <input type="text" name="YouTube" class="form-control" value="<?php echo $YouTube; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>

        <div class="form-group">
            <label for="formGroupExampleInput2"><b>DolarKuru</b> </label>
            <input type="text" name="DolarKuru" class="form-control" value="<?php echo $DolarKuru; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>EuroKuru:</b> </label>
            <input type="text" name="EuroKuru" class="form-control" value="<?php echo $EuroKuru; ?>" id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2"><b>freeShippingDam:</b> </label>
            <input type="text" name="freeShippingDam" class="form-control" value="<?php echo $freeShippingDam; ?> " id="formGroupExampleInput2" placeholder="Another input placeholder">
        </div>



        <button type="submit" name="settingsUpdate" class="btn btn-primary ">Güncelle</button>
    </form>

<?php

} else {
    header("Location:../index.php");
}
?>