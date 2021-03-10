<?php
include "..\\DBConnection.php";

print_r($_POST);

if ($_POST["op"] == "cancella") {
	foreach ($_POST as $key => $value) {
		$query = "DELETE FROM classi WHERE `ID`='$value';";
		mysqli_query($conn, $query);
	}
} else if ($_POST["op"] == "promuovi") {
	foreach ($_POST as $key => $value) { // per ogni classe
		$query = "UPDATE studenti SET id_classe";
		//mysqli_query($conn, $query);
	}
}
header("Location: classi.php");
