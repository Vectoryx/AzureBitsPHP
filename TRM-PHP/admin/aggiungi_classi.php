<?php
include "../DBConnection.php";

if ($_POST["id"] and $_POST["desc"]) {
	$id = $_POST["id"];
	$ind = $_POST["desc"];
	$query = "INSERT INTO classi VALUES ('$id', '$ind', YEAR(CURDATE()) )";
	mysqli_query($conn, $query);
	header("Location: classes.php");
} else {
	header("Location: classes.php?e=true");
}