<?php
include "..\\DBConnection.php";

foreach ($_POST as $key => $value) {
	$query = "DELETE FROM classi WHERE `id_classe`='$key';";
	mysqli_query($conn, $query);
}
header("Location: classes.php");