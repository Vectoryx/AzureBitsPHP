<!DOCTYPE html>
<html lang="it">

<head>
	<title>Gestione test</title>
	<link rel="icon" type="image/png" href="../img/favicon.png" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<?php

	include "..\\DBConnection.php";


	$query = "SELECT * FROM domande";
	$sql_result = mysqli_query($conn, $query);

	echo "<br>";
	echo "domande <br>";

	for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
		$row = mysqli_fetch_assoc($sql_result);
		$testo = $row["testo"];
		$punteggio = $row["punteggio"];
		$id = $row["ID"];

		echo "<input type='checkbox' name='$id' required>$testo - $materia - $argomento - $punteggio<br>";
	}

	?>

</body>

</html>