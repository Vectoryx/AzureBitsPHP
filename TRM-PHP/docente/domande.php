<!DOCTYPE html>
<html lang="it">

<head>
	<title>Gestione domande</title>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="../style/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<form method="POST" action="risposte.php" enctype="multipart/form-data">
		<?php
		session_start();

		include "..\\DBConnection.php";

		// Le materie sono selezionate automaticamente dalla materia insegnata, se esiste solo un'opzione metto un radio button checked e disabled
		$query = "SELECT * FROM materie_docenti WHERE id_docente={$_SESSION["user"]["ID"]};";
		$sql_result = mysqli_query($conn, $query);

		echo "<br>";
		echo "materie <br>";

		$num_rows = mysqli_num_rows($sql_result);
		if ($num_rows == 1) {
			$row = mysqli_fetch_assoc($sql_result);
			echo "<input type='radio' name='materia' value='{$row["id_materia"]}' required checked>{$row["id_materia"]}<br>";
		} else {
			for ($i = 0; $i < $num_rows; $i++) {
				$row = mysqli_fetch_assoc($sql_result);
				echo "<input type='radio' name='materia' value='{$row["id_materia"]}' required>{$row["id_materia"]}<br>";
			}
		}

		?>

		<br>
		<!-- Da usare label per prompt -->
		Testo della domanda <br>
		<textarea name="testo" cols=50 rows=10 required> </textarea> <br><br>
		<div id="Vero" hidden>
		<label for="v&f"> VERO FALSO </label><input id="v&f" type="checkbox" name="Vero">
		</div>
		Punti da assegnare alla domanda <input type="number" value="1" name="punteggio" min="0" required> <br><br>
		immagine relativa <input type="file" name="immagine" accept="image/*"> <br><br>

		<label for="tipo"> Tipo di domanda </label>
		<select name="selezione-tipo" id="tipo" onchange="change()">
			<option value="0" selected>Risposta multipla</option>
			<option value="1">Testo bucato</option>
			<option value="2">Vero e False</option>
		</select> <br><br>
		<div id="numeri-input">
			numero risposte <input type="number" min="1" max="15" value="1" name="n-risposte">
		</div>
		<br><br>
		<input type="submit" value="Invia">
	</form>
	<?php

	echo "<pre>";
	$query = "SELECT * FROM domande;";
	$sql_result = mysqli_query($conn, $query);

	for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
		$row = mysqli_fetch_assoc($sql_result);

		echo "<div>";
		echo "<a href='modifica_domande.php?id={$row['ID']}'>{$row['testo']}</a>";
		echo "<img src='/{$row['img_url']}' alt='' style='width: 40px; height: 40px' />";
		echo "</div>";
	}

	echo "</pre>";

	?>

	<script>
		document.addEventListener("DOMContentLoaded", function(event) {
			document.querySelectorAll('img').forEach(function(img) {
				img.onerror = function() {
					this.style.display = 'none';
				};
			})
		});

		/**
		 * Rimuove/aggiunge l'opzione numeri-input per la gestione di quante risposte devo prevedere nella prossima pagina.
		 * Questo perche' le domande vero/false hanno sempre due risposte
		 */
		function change() {

			// trovo il menu drop-down
			var selection = document.getElementById("tipo");

			// trovo la il tag che contiene le classi e gli input
			let n_domande = document.getElementById("numeri-input");
			let vero = document.getElementById("Vero");

			// per essere sicuro tolgo l'attributo hidden messo possibilmente precedentemente

			if (selection.value == 2) { // se e' un vero e false non c'e bisogno di specificare il numero di risposte
				n_domande.setAttribute("hidden", "hidden");
				vero.removeAttribute("hidden");
			} else {
				vero.setAttribute("hidden", "hidden");
				n_domande.removeAttribute("hidden");
			}

		}
	</script>

</body>

</html>