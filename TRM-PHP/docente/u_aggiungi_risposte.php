<?php
include "../DBConnection.php";

for ($i = 0; $i < $_POST["n-risposte"]; $i++) {
	$testo = $_POST[$i];
	$correzzione = isset($_POST["risp-$i-corretta"]) ? 1 : 0;
	$img_url = "sources/TRM-PHP/images/" . $_FILES["immagine-$i"]["name"];

	if ($img_url != "sources/TRM-PHP/images/") { // quindi c'e' un'immagine
		move_uploaded_file($_FILES["immagine-$i"]["tmp_name"], "../images/" . $_FILES["immagine-$i"]["name"]);
	}
	$ID = $_POST['ID_domanda'];
	$query = "INSERT INTO risposte (testo, correzione, img_url, id_domanda) VALUES ('$testo', $correzzione, '$img_url', $ID);";
	mysqli_query($conn, $query);
}
header("Location: domande.php");
