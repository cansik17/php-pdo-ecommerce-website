<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../assets/PHPMailer/src/Exception.php';
require '../assets/PHPMailer/src/PHPMailer.php';
require '../assets/PHPMailer/src/SMTP.php';

require_once 'config.php';


if (isset($_POST['login'])) {
    if (isset($_POST["mail"])) {
        $mail        =    safe($_POST["mail"]);
    } else {
        $mail        =    "";
    }
    if (isset($_POST["password"])) {
        $password                =    safe($_POST["password"]);
    } else {
        $password                =    "";
    }

    $MD5password                    =    md5($password);

    if (($mail != "") and ($password != "")) {
        $controlQuery        =    $db->prepare("SELECT * FROM users WHERE mail = ? AND password = ? AND deleteAbleStatus = ?");
        $controlQuery->execute([$mail, $MD5password, 0]);
        $userCount    =    $controlQuery->rowCount();
        $userRecord        =    $controlQuery->fetch(PDO::FETCH_ASSOC);

        if($userCount>0){
		if($userRecord["status"]==1){
			$_SESSION["users"]	=	$mail;
			
			if($_SESSION["users"]==$mail){
				header("Location:.././");
				exit();
			}else{
				header("Location:../login");
				exit();
			}
		}else{
			$prepareMailContent		=	"Merhaba Sayın " . $userRecord["nameSurname"] . "<br /><br />Sitemize yapmış olduğunuz üyelik kaydını tamamlamak için lütfen <a href='" . $SiteLink . "activation.php?activationCode=" . $userRecord["activationCode"] . "&mail=" . $userRecord["mail"] . "'>BURAYA TIKLAYINIZ</a>.<br /><br />Saygılarımızla, iyi çalışmalar...<br />" . $SiteName;

			$sendMail		= new PHPMailer(true);

			try{
				$sendMail->SMTPDebug			= 0;
				$sendMail->isSMTP();
				$sendMail->Host				=  $SiteEmailHostAddress;
				$sendMail->SMTPAuth			=	true;
				$sendMail->CharSet			=	"UTF-8";
				$sendMail->Username			=    $SiteEmailAddress;
				$sendMail->Password			=    $SiteEmailPassword;
				$sendMail->SMTPSecure			=    PHPMailer::ENCRYPTION_STARTTLS;
				$sendMail->Port				=	465;
				$sendMail->SMTPOptions		=	array(
														'ssl' => array(
															'verify_peer' => false,
															'verify_peer_name' => false,
															'allow_self_signed' => true
														)
													);
				$sendMail->setFrom($SiteEmailAddress, $SiteName);
				$sendMail->addAddress($userRecord["mail"], $userRecord["nameSurname"]);					
				$sendMail->addReplyTo($SiteEmailAddress, $SiteName);
				$sendMail->isHTML(true);
				$sendMail->Subject			=	$SiteName . ' Yeni Üyelik Aktivasyonu';
				$sendMail->MsgHTML($prepareMailContent);
				$sendMail->send();

				header("Location:.././");
				exit();
			}catch(Exception $e){
				header("Location:../login");
				exit();
			}			
		}
	}else{
		header("Location:../login");
		exit();
	}
}else{
	header("Location:../login");
	exit();
}
}

/////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////


if ($_GET['userlogout'] == "ok") {
    unset($_SESSION["users"]);
    session_destroy();

    header("Location:./");
    exit();
}

////////////////////////////////////////////////


/////////////////////////////////////////////////


if (isset($_POST['register'])) {
    if (isset($_POST["mail"])) {
        $mail        =    safe($_POST["mail"]);
    } else {
        $mail        =    "";
    }
    if (isset($_POST["password"])) {
        $password                =    safe($_POST["password"]);
    } else {
        $password                =    "";
    }
    if (isset($_POST["repassword"])) {
        $repassword        =    safe($_POST["repassword"]);
    } else {
        $repassword        =    "";
    }
    if (isset($_POST["nameSurname"])) {
        $nameSurname        =    safe($_POST["nameSurname"]);
    } else {
        $nameSurname        =    "";
    }
    if (isset($_POST["phone"])) {
        $phone    =    safe($_POST["phone"]);
    } else {
        $phone    =    "";
    }
    if (isset($_POST["gender"])) {
        $gender            =    safe($_POST["gender"]);
    } else {
        $gender            =    "";
    }
    if (isset($_POST["checked"])) {
        $checked        =    safe($_POST["checked"]);
    } else {
        $checked        =    "";
    }

    $activationCode                =    activeCode();
    $MD5password                    =    md5($password);

    if (($mail != "") and ($password != "") and ($repassword != "") and ($nameSurname != "") and ($phone != "") and ($gender != "")) {
        if ($checked == 0) {
            header("Location:../register");
            exit();
        } else {
            if ($password != $repassword) {
                header("Location:../register");
                exit();
            } else {
                $controlQuery        =    $db->prepare("SELECT * FROM users WHERE mail = ?");
                $controlQuery->execute([$mail]);
                $userCount    =    $controlQuery->rowCount();

                if ($userCount > 0) {
                    header("Location:../register");
                    exit();
                } else {
                    $userAddQuery        =    $db->prepare("INSERT INTO users (mail, password, nameSurname, phone, gender, status, registerDate, registeripAddress, activationCode) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    $userAddQuery->execute([$mail, $MD5password, $nameSurname, $phone, $gender, 0, $timeStamp, $ipAddress, $activationCode]);
                    $recordControldelete        =    $userAddQuery->rowCount();

                    if ($recordControldelete > 0) {

                        $prepareMailContent        =    "Merhaba Sayın " . $nameSurname . "<br /><br />Sitemize yapmış olduğunuz üyelik kaydını tamamlamak için lütfen <a href='" . $SiteLink . "activation.php?activationCode=" . $activationCode . "&mail=" . $mail . "'>BURAYA TIKLAYINIZ</a>.<br /><br />Saygılarımızla, iyi çalışmalar...<br />" . $SiteName;

                        $sendMail        =    new PHPMailer(true);

                        try {
                            $sendMail->SMTPDebug           = 0;
                            $sendMail->isSMTP();
                            $sendMail->Host                =  $SiteEmailHostAddress;
                            $sendMail->SMTPAuth            =    true;
                            $sendMail->CharSet             =    "UTF-8";
                            $sendMail->Username            =    $SiteEmailAddress;
                            $sendMail->Password            =    $SiteEmailPassword;
                            $sendMail->SMTPSecure          =    PHPMailer::ENCRYPTION_STARTTLS;
                            $sendMail->Port                =    465;
                            $sendMail->SMTPOptions         =    array(
                                'ssl' => array(
                                    'verify_peer' => false,
                                    'verify_peer_name' => false,
                                    'allow_self_signed' => true
                                )
                            );
                            $sendMail->setFrom($SiteEmailAddress, $SiteName);
                            $sendMail->addAddress($mail, $nameSurname);
                            $sendMail->addReplyTo($SiteEmailAddress, $SiteName);
                            $sendMail->isHTML(true);
                            $sendMail->Subject            =    $SiteName . ' Yeni Üyelik Aktivasyonu';
                            $sendMail->MsgHTML($prepareMailContent);
                            $sendMail->send();

                            header("Location:.././");
                            exit();
                        } catch (Exception $e) {
                            header("Location:../register");
                            exit();
                        }
                    } else {
                        header("Location:.././");
                        exit();
                    }
                }
            }
        }
    } else {
        header("Location:../register");
        exit();
    }
}

//////////////////////////////////////////


////////////////////////////////////////////

if (isset($_GET['favDelete'])) {


    $id = safe($_GET['id']);

    $delete = $db->prepare("DELETE from favourites where productid=?");
    $control = $delete->execute([$id]);




    if ($control) {


        Header("Location:../index.php?P=10&durum=ok");
    } else {

        Header("Location:../index.php?P=10&durum=no");
    }
}

/////////////////////////////


if (isset($_GET['cartDelete'])) {


    $id = safe($_GET['id']);

    $delete = $db->prepare("DELETE from shoppingcart where id=?");
    $control = $delete->execute([$id]);




    if ($control) {


        Header("Location:../index.php?P=7&durum=ok");
    } else {

        Header("Location:../index.php?P=7&durum=no");
    }
}

//////////////////////////////


if (isset($_POST['editProfileUser'])) {
    if (isset($_SESSION['users'])) {
 
        $id =safe($_GET['id']);

        $nameSurname = safe($_POST['nameSurname']);
        $phone = safe($_POST['phone']);

        $controlQuery        =    $db->prepare("SELECT * FROM users WHERE id = ? ");
        $controlQuery->execute([$id]);
        $userCount    =    $controlQuery->rowCount();
         

        if ($userCount > 0) {
            $userUpdateQuery        =    $db->prepare("UPDATE users SET  nameSurname=?, phone=? WHERE id=?");
            $userUpdateQuery->execute([$nameSurname,$phone,$id]);
            $control        =    $userUpdateQuery->rowCount();

            if ($control > 0) {
                header("Location:../edit-profile");
                exit();
            } else {
                header("Location:../edit-profile");
                exit();
            }
        } else {
            
            header("Location:.././");
            exit();
        }

       
    } else {
        echo " lütfen üye girişi yapınız";
    }
}


//////////////////////////////////


require_once 'config.php';



if (isset($_POST['managerLogin'])) {


    if (empty($_SESSION["Manager"])) {

        if (isset($_POST["username"])) {
            $username        =    safe($_POST["username"]);
        } else {
            $username        =    "";
        }
        if (isset($_POST["password"])) {
            $password            =    safe($_POST["password"]);
        } else {
            $password            =    "";
        }

        $md5Password                    =    md5($password);

        if (($username != "") and ($password != "")) {
            $controlQuery        =    $db->prepare("SELECT * FROM managers WHERE username = ? AND password = ?");
            $controlQuery->execute([$username, $md5Password]);
            $managerCount    =    $controlQuery->rowCount();
            $KullaniciKaydi        =    $controlQuery->fetch(PDO::FETCH_ASSOC);

            if ($managerCount > 0) {
                $_SESSION["Manager"]    =    $username;

                header("Location:../admin/index.php?login=ok");
                exit();
            } else {
                header("Location:../managerLogin.php?login=no");
                exit();
            }
        } else {
            header("Location:../managerLogin.php?login=null");
            exit();
        }
    } else {
        header("Location:../admin/index.php");
        exit();
    }
}
///////////////////////////////////

if ($_GET['logout'] == "ok") {
    unset($_SESSION["Manager"]);
    session_destroy();

    header("Location:../managerLogin.php");
    exit();
}

///////////////


    ////*********************** */


?>

