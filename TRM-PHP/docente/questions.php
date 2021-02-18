<!DOCTYPE html>
<html lang="en">

<head>
	<title>Gestione domande</title>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<form method="POST" action="aggiungi_domanda.php" enctype="multipart/form-data">
		<?php

		include "..\\DBConnection.php";

		$query = "SELECT * FROM materie";
		$sql_result = mysqli_query($conn, $query);

		echo "<br>";
		echo "materie <br>";

		for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
			$row = mysqli_fetch_assoc($sql_result);
			$nome = $row["nome"];

			echo "<input type=\"radio\" name=\"materia\" value=\"$nome\" required>$nome<br>";
		}

		$query = "SELECT * FROM argomenti";
		$sql_result = mysqli_query($conn, $query);

		echo "<br>";
		echo "argomenti <br>";

		for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
			$row = mysqli_fetch_assoc($sql_result);
			$titolo = $row["titolo"];

			echo "<input type=\"radio\" name=\"argomento\" value=\"$titolo\" required>$titolo<br>";
		}

		?>

		<br>
		<!-- Da usare label per prompt -->
		Testo della domanda <input type="text" name="testo" required> <br><br>
		Punti da assegnare alla domanda <input type="number" name="punteggio" min="0" required> <br><br>
		immagine relativa <input type="file" name="immagine" accept="image/*"> <br><br>
		Tipo di domanda <select name="selezione-tipo" id="tipo">
			<option value="0" selected>Risposta multipla</option>
			<option value="1">Testo bucato</option>
			<option value="2">Vero e False</option>
		</select>
		<br><br>
		<input type="submit" value="submit">
	</form>

	<br><br><br>
	<form method="POST" action="aggiungi_materia.php">

		Nome materia <input type="text" name="materia" id="input-materia">
		<input type="submit" value="submit">
	</form>

	</form>
	<br><br><br>
	<form method="POST" action="aggiungi_argomento.php">

		Titolo argomento <input type="text" name="argomento" id="input-argomento">
		<input type="submit" value="submit">
	</form>


</body>

</html>