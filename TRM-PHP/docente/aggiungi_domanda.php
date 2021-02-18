<?php

session_start();

include "..\\DBConnection.php";

// print_r($_SESSION);
// echo "<br> <br>";
// print_r($_POST);

$creatore = $_SESSION["user"]["ID"];
$testo = $_POST["testo"];
$materia = $_POST["materia"];
$argomento = $_POST["argomento"];
$punteggio = $_POST["punteggio"];
$img_url = "TRM-PHP\\images" . $_FILES["immagine"]["name"];
$tipo = $_POST["selezione-tipo"];

// tutti questi campi devono esistere, quindi
if ($argomento and $creatore and $img_url and $materia and $punteggio and $testo and $tipo) {

	$query = "INSERT INTO domande (`testo`, `img_url`, `id_materia`, `punteggio`, `tipo`, `creatore`, `id_argomento`) 
						VALUES ('$testo', '$img_url', '$materia', $punteggio, $tipo, $creatore, '$argomento');";
	mysqli_query($conn, $query);
	move_uploaded_file($_FILES["immagine"]["tmp_name"], "..\\images\\" . $_FILES["immagine"]["name"]);
}
// header("Location: questions.php");
