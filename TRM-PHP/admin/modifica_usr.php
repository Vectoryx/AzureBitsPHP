<!DOCTYPE html>
<html lang="it">

<head>
	<title>Modifica utenti</title>
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div>
		<form action="u_modifica_utente.php" method="POST">
			<?php

			include "../DBConnection.php";

			function insegna_in_classe($insegnante, $classe) {
				global $conn;

				$query = "SELECT * FROM docenti_classi WHERE id_docente=$insegnante";
				$sql_result = mysqli_query($conn, $query);

				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();
					if ($row["id_classe"] == $classe) {
						return true;
					}
				}

				return false;
			}

			function insegna_materia($insegnante, $materia) {
				global $conn;

				$query = "SELECT * FROM materie_docenti WHERE id_docente=$insegnante";
				$sql_result = mysqli_query($conn, $query);

				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();
					if ($row["id_materia"] == $materia) {
						return true;
					}
				}

				return false;
			}

			$temp = explode("-", $_GET["user"]);

			$table = $temp[0] == "doc" ? "docenti" : "studenti";

			$ID = $temp[1];

			$query = "SELECT * FROM $table WHERE ID=$ID;";
			$sql_result = mysqli_query($conn, $query);

			$user = $sql_result->fetch_assoc();

			// Per decidere che routine eseguire
			echo "<input type='hidden' name='type' value='$table'>";
			echo "<input type='hidden' name='id' value='$ID'>";

			echo "Username <input type='text' name='usr' placeholder='{$user["username"]}'><br>";
			echo "Reset password <input type='checkbox' name='rst-pwd'><br>";

			// ------------------------------------------------------------------------------------------- parte docenti
			if ($table == "docenti") {
				echo "E' un admin <input type='checkbox' name='admin' " . ($user["admin"] ? "checked" : null) . "><br>";

				echo "classi";
				echo "<pre id=\"class-list\">";

				// ottengo le classi del database
				$query = "SELECT * FROM classi";
				$sql_result = mysqli_query($conn, $query);

				// stampo le effettive righe
				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();

					// ogni input ha value che rappresenta la classe, nome e tipo variano a seconda del tipo di utente
					echo "<input type='checkbox' class='opzione-classe' name='classe-{$row["ID"]}' value='{$row["ID"]}'";
					echo (insegna_in_classe($ID, $row["ID"]) ? "checked" : null) . "> ";
					echo "{$row["ID"]} {$row["indirizzo"]}<br>";
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
					echo "<input type='checkbox' class='opzione-materia' name='materia-{$row["nome"]}' value='{$row["nome"]}'";
					echo (insegna_materia($ID, $row["nome"]) ? "checked" : null) . "> ";
					echo $row["nome"] . "<br>";
				}

				echo "</pre>";
				// ------------------------------------------------------------------------------------------ parte studenti
			} else {

				echo "<pre id=\"class-list\">";

				// ottengo le classi del database
				$query = "SELECT * FROM classi";
				$sql_result = mysqli_query($conn, $query);

				// stampo le effettive righe
				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();

					// ogni input ha value che rappresenta la classe, nome e tipo variano a seconda del tipo di utente
					echo "<input type='radio' class='opzione-classe' name='classi' value='{$row["ID"]}'";
					echo ($row["ID"] == $user["id_classe"] ? "checked" : null) . "> ";
					echo "{$row["ID"]} {$row["indirizzo"]}<br>";
				}

				echo "</pre>";
			}
			?>
			<input type="submit" value="Modifica">
		</form>
	</div>
</body>

</html>