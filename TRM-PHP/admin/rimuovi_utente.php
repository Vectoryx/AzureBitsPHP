<?php

include "../DBConnection.php";

print_r($_POST);

foreach ($_POST as $key => $value) {
	if (strpos($key, "stud-") === 0) {
		$query = "DELETE FROM studenti WHERE ID=$value";
		echo $query . "<br>";
		mysqli_query($conn, $query);
	}
}
header("Location: users.php");
