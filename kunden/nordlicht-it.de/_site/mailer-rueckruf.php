<?php 

require 'PHPMailerAutoload.php';

$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp.strato.de';                       // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'automation@nordlicht-it.de';       // SMTP username
$mail->Password = 'blackfist';                        // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;                                    // TCP port to connect to

$mail->From = $_POST['email'];
$mail->FromName = 'Mailer';
$mail->addAddress('nils@loewenrudel.net', 'Nils L�we');     // Add a recipient

$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'Formular: R�ckruf';
$mail->Body    = "Auf unserer Homepage wurde folgende Anfrage gestellt:\n\n<br><br>
Name: " . $_POST['name'] . "\n\n<br><br>
Email: " . $_POST['email'] . "\n\n<br><br>
Telefon: " . $_POST['phone'] . "\n\n<br><br>
Uhrzeit: " . $_POST['time'] . "\n\n<br><br>
Thema: " . $_POST['topic'];

$mail->send();
header('Location: /danke');

?>