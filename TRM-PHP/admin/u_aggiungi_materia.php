<?php

include "../DBConnection.php";

if ($_POST["materia"]) {
	$mat = $_POST["materia"];
	$query = "INSERT INTO materie VALUES ('$mat');";
	mysqli_query($conn, $query);
}
header("Location: domande.php");
