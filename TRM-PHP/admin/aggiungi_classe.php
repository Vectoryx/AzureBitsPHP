<?php
include "../DBConnection.php";

// controllo che le variabili esistano
if ($_POST["id"] and $_POST["desc"]) {
	$id = $_POST["id"];
	$ind = $_POST["desc"];
	$query = "INSERT INTO classi VALUES ('$id', '$ind', YEAR(CURDATE()) )";
	mysqli_query($conn, $query);
	header("Location: classi.php");
} else {

	// ----- Non più utile, il controllo sulla presenza dei dati avviene attraverso html
	// se fallisce ritorno alla pagina precendente e segnalo un errore attraverso GET
	header("Location: classi.php?e=true");
}
