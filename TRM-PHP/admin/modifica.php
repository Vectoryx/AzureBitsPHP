<!DOCTYPE html>
<html lang="en">

<head>
	<title>Modifica utenti</title>
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div>
		<form action="modifica_utente.php" method="POST">
			<?php

			include "../DBConnection.php";

			$temp = explode("-", $_GET["user"]);

			$table = $temp[0] == "doc" ? "docenti" : "studenti";

			$ID = $temp[1];

			$query = "SELECT * FROM $table WHERE ID=$ID;";
			$sql_result = mysqli_query($conn, $query);

			$row = $sql_result->fetch_assoc();

			// Per decidere che routine eseguire
			echo "<input type='hidden' name='type' value='$table'>";

			echo "Username <input type='text' name='usr' placeholder='{$row["username"]}'><br>";
			echo "Reset password <input type='checkbox' name='rst-pwd'><br>";

			if ($table == "docenti") {
				echo "E' un admin <input type='checkbox' name='admin'><br>";

				echo "classi";
				echo "<pre id=\"class-list\">";

				// ottengo le classi del database
				$query = "SELECT * FROM classi";
				$sql_result = mysqli_query($conn, $query);

				// stampo le effettive righe
				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();

					// ogni input ha value che rappresenta la classe, nome e tipo variano a seconda del tipo di utente
					echo "<input type='checkbox' class='opzione-classe' name='classe-{$row["id_classe"]}' value='{$row["id_classe"]}'> ";
					echo "{$row["id_classe"]} {$row["indirizzo"]}<br>";
				}

				echo "</pre>";

				echo "Materie";

				echo "<pre id=\"lista-materie\" >";

				$query = "SELECT * FROM materie;";
				$sql_result = mysqli_query($conn, $query);

				// stampo le effettive righe
				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();

					// ogni input ha value che rappresenta la classe, nome e tipo variano a seconda del tipo di utente
					echo "<input type='checkbox' class='opzione-materia' name='materia-{$row["nome"]}' value='{$row["nome"]}'> ";
					echo $row["nome"] . "<br>";
				}

				echo "</pre>";
			} else {

				echo "<pre id=\"class-list\">";

				// ottengo le classi del database
				$query = "SELECT * FROM classi";
				$sql_result = mysqli_query($conn, $query);

				// stampo le effettive righe
				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();

					// ogni input ha value che rappresenta la classe, nome e tipo variano a seconda del tipo di utente
					echo "<input type='radio' class='opzione-classe' name='classi' value='{$row["id_classe"]}'> ";
					echo "{$row["id_classe"]} {$row["indirizzo"]}<br>";
				}

				echo "</pre>";
			}
			?>
			<input type="submit" value="Modifica">
		</form>
	</div>
</body>

</html>