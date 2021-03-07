<?php
include "..\\DBConnection.php";

foreach ($_POST as $key => $value) {
	$query = "DELETE FROM classi WHERE `ID`='$key';";
	mysqli_query($conn, $query);
}
header("Location: classi.php");
