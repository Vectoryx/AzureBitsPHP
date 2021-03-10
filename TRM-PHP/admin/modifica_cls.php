<!DOCTYPE html>
<html lang="en">

<head>
	<title>Gestione utenti</title>
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

	<form method="POST" action="modifica_classe.php">
	<?php
		include "../DBConnection.php";

		$query = "SELECT * FROM classi WHERE ID='{$_GET["id"]}';";
		$sql_result = mysqli_query($conn, $query);

		$classe = $sql_result->fetch_assoc();

		echo "<input type='hidden' name='old_id' value='{$classe["ID"]}'>";
		echo "Numero e sezione <input type='text' name='ID' placeholder='{$classe["ID"]}'><br>";
		echo "Indirizzo <input type='text' name='indirizzo' placeholder='{$classe["indirizzo"]}'><br>";
		echo "anno_scolastico <input type='number' name='anno' placeholder='{$classe["anno_scolastico"]}'><br>";

		$query = "SELECT * FROM studenti WHERE id_classe='{$_GET["id"]}'";
		$sql_result = mysqli_query($conn, $query);
		
		for($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
			$row = $sql_result->fetch_assoc();

			echo "<input type='checkbox' name='stud-{$row["ID"]}' value='{$row["ID"]}' checked> {$row["username"]} <br>";
		}
	?>

		<input type='submit'>

	</form>
</body>

</html>