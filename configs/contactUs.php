<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../assets/PHPMailer/src/Exception.php';
require '../assets/PHPMailer/src/PHPMailer.php';
require '../assets/PHPMailer/src/SMTP.php';

require_once 'config.php';




///////////////

if (isset($_POST['contactUs'])) {

    $name = safe($_POST['name']);
    $email = safe($_POST['mail']);
    $title = safe($_POST['subject']);
    $text = safe($_POST['message']);

    // Burada mail gönderim işlemi de yapılacaktır

    $mail = new PHPMailer(true);

    try {
        //Server settings
        $mail->SMTPDebug = 0;                      // Enable verbose debug output
        $mail->isSMTP();                                            // Send using SMTP
        $mail->Host       = $SiteEmailHostAddress;                    // Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username   = $SiteEmailAddress;;                     // SMTP username
        $mail->Password   = $SiteEmailPassword;;                               // SMTP password
        $mail->CharSet    = "utf8";
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
        $mail->Port       = 465;                                    // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

        //Recipients
        $mail->setFrom('xxx@gmail.com', $name);
        $mail->addAddress('xxx@gmail.com',);     // Add a recipient
        $mail->addCC('xxx@gmail.com');

        // Attachments
        // $mail->addAttachment("files/" . $file["name"]);

        // Content
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = $title;
        $mail->Body    = "gönderen adress : $email".$text;

        $mail->send();
        Header("Location:../index.php?mailSend=ok");
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }



    // $name = safe($_POST['name']);
    // $mail = safe($_POST['mail']);
    // $title = safe($_POST['title']);
    // $text = safe($_POST['text']);

    // $duzenle = $db->prepare("INSERT INTO messages SET
    //         name=?,
    //         mail=?,
    //         title=?,
    //         text=?
    //     ");

    // $update = $duzenle->execute([
    //     $name,
    //     $mail,
    //     $title,
    //     $text,
    // ]);



    // if ($update) {



    //     Header("Location:../index.php?durum=ok");
    // } else {

    //     Header("Location:../index.php?durum=no");
    // }
}








?>