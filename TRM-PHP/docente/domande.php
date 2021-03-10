<!DOCTYPE html>
<html lang="en">

<head>
	<title>Gestione domande</title>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="../img/favicon.png">
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

		?>

		<br>
		<!-- Da usare label per prompt -->
		Testo della domanda <input type="text" name="testo" required> <br><br>
		Punti da assegnare alla domanda <input type="number" name="punteggio" min="0" required> <br><br>
		immagine relativa <input type="file" name="immagine" accept="image/*"> <br><br>

		Tipo di domanda <select name="selezione-tipo" id="tipo" onchange="change()">
			<option value="0" selected>Risposta multipla</option>
			<option value="1">Testo bucato</option>
			<option value="2">Vero e False</option>
		</select> <br><br>
		<div id="numeri-input">
			numero risposte <input type="number" min="0" name="n-risposte">
		</div>
		<br><br>
		<input type="submit" value="submit">
	</form>

	<script>
		/**
		 * Rimuove/aggiunge l'opzione numeri-input per la gestione di quante risposte devo prevedere nella prossima pagina.
		 * Questo perche' le domande vero/false hanno sempre due risposte
		 */
		function change() {

			// trovo il menu drop-down
			var selection = document.getElementById("tipo");
			var type = "";

			// trovo la il tag che contiene le classi e gli input
			let temp = document.getElementById("number-input");

			// per essere sicuro tolgo l'attributo hidden messo possibilmente precedentemente

			if (selection.value == 2) { // se e' un vero e false non c'e bisogno di specificare il numero di risposte
				temp.setAttribute("hidden", "hidden");
			} else {
				temp.removeAttribute("hidden", "hidden");
			}

		}
	</script>

</body>

</html>