<?php
require_once("configs/config.php");

if(isset($_GET["activationCode"])){
	$activationCode	=	safe($_GET["activationCode"]);
}else{
	$activationCode	=	"";
}
if(isset($_GET["mail"])){
	$mail				=	safe($_GET["mail"]);
}else{
	$mail				=	"";
}

if(($activationCode!="") and ($mail!="")){
	$controlQuery		=	$db->prepare("SELECT * FROM users WHERE mail = ? AND activationCode = ? AND status = ?");
	$controlQuery->execute([$mail, $activationCode, 0]);
	$userCount	=	$controlQuery->rowCount();

	if($userCount>0){
		$userUpdateQuery		=	$db->prepare("UPDATE users SET status = 1 WHERE mail = ? ");
		$userUpdateQuery->execute([$mail]);
		$control		=	$userUpdateQuery->rowCount();

		if($control>0){
			header("Location:index.php?SK=0");
			exit();
		}else{
			header("Location:" . $SiteLink);
			exit();
		}
	}else{
		header("Location:" . $SiteLink);
		exit();
	}
}else{
	header("Location:" . $SiteLink);
	exit();
}

$db	=	null;
