<?php 

include "..\\DBConnection.php";

if ($_POST["argomento"]) {
	$arg = $_POST["argomento"];
	$query = "INSERT INTO argomenti VALUES ('$arg');";
}
header("Location: questions.php");