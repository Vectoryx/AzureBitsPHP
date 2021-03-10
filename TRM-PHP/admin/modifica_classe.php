<?php

// include "../DBConnection.php";

// $stud_ids = "";

// foreach ($_POST as $key => $value) {
// 	$temp = explode("-", $key);
// 	if ($temp[0] == "stud") {
// 		$stud_ids .= "$value, ";
// 	}
// }

// if($_POST["ID"]) {
// 	// la classe non puo' esistere gia'
// 	$query = "SELECT * FROM classi WHERE ID='{$_POST["ID"]}';";
// 	$sql_result = mysqli_query($conn, $query);

// 	if (!$sql_result) {
// 		$query = "UPDATE classi SET ID='{$_POST["ID"]}';";
// 	}
// }

// echo $stud_ids;
// echo "<br>";
// echo substr($stud_ids, 0, -2);
header("Location: modifica_cls.php");
