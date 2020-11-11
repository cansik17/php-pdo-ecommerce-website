



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Giriş Formu</title>
    <link href="admin/dist/css/styles.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <?php
                if (isset($_GET['login'])) {
                    if ($_GET['login'] == 'no') { ?>

                        <script>
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Kullanıcı adı ve/veya şifreyi hatalı girdiniz Tekrar Deneyin...',
                                showConfirmButton: true,
                                timer: 3500
                            })
                        </script>

                    <?php } elseif ($_GET['login'] == 'null') { ?>

                        <script>
                            Swal.fire({
                                position: 'center',
                                icon: 'info',
                                title: 'Boş bırakmayınız...',
                                showConfirmButton: true,
                                timer: 5000
                            })
                        </script>
                <?php }
                } ?>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Yönetici Giriş Formu</h3>
                                </div>
                                <div class="card-body">
                                    <form action="configs/forms.php" method="POST">
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Kullanıcı Adı</label>
                                            <input class="form-control py-4" id="inputEmailAddress" name="username" type="text" placeholder="Enter username" />
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputPassword">Şifre</label>
                                            <input class="form-control py-4" id="inputPassword" name="password" type="password" placeholder="Enter password" />
                                        </div>

                                        <div class="form-group d-flex align-items-center justify-content-center mt-4 mb-0">
                                            <button type="submit" name="managerLogin" class="btn btn-primary">Giriş Yap</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2020</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="admin/dist/js/scripts.js"></script>
</body>

</html>