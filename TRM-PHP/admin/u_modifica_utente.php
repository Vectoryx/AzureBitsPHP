<?php

include "../DBConnection.php";

$ID = $_POST["id"];

if ($_POST["usr"]) {
	$query = "UPDATE docenti SET username='{$_POST["usr"]}' WHERE ID=$ID;";
	mysqli_query($conn, $query);
}
if (isset($_POST["rst-pwd"])) {
	$query = "UPDATE docenti SET password='{gen_password()}', hasLoggedOnce=0 WHERE ID=$ID;";
	mysqli_query($conn, $query);
}

if ($_POST["type"] == "docenti") {
	if (isset($_POST["admin"])) {
		$query = "UPDATE docenti SET admin=1 WHERE ID=$ID;";
		mysqli_query($conn, $query);
	} else {
		$query = "UPDATE docenti SET admin=0 WHERE ID=$ID;";
		mysqli_query($conn, $query);
	}

	$query = "DELETE FROM docenti_classi WHERE id_docenti=$ID;";
	mysqli_query($conn, $query);

	foreach ($_POST as $key => $value) {
		if (strpos($key, "classe") === 0) { // controllo di non inserire nel database i dati sbagliati
			$query = "INSERT INTO docenti_classi VALUES ($ID, '$value');";
			mysqli_query($conn, $query);
		}
		if (strpos($key, "materia") === 0) { // controllo di non inserire nel database i dati sbagliati
			$query = "INSERT INTO materie_docenti VALUES ($ID, '$value');";
			mysqli_query($conn, $query);
		}
	}
} else {
	if (isset($_POST["classi"])) {
		$query = "UPDATE studenti SET id_classe='{$_POST["classi"]}' WHERE ID=$ID;";
		mysqli_query($conn, $query);
	}
}
header("Location: utenti.php");
