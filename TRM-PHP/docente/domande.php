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

		include "../DBConnection.php";

		// Le materie sono selezionate automaticamente dalla materia insegnata
		$query = "SELECT * FROM materie_docenti WHERE id_docente={$_SESSION["user"]["ID"]};";
		$sql_result = mysqli_query($conn, $query);

		echo "<br>";
		// elenco e faccio selezionare la materia della domanda
		echo "materie <br>";

		$num_rows = mysqli_num_rows($sql_result);
		// se esiste una sola opzione la seleziono di default
		if ($num_rows == 1) {
			$row = mysqli_fetch_assoc($sql_result);
			echo "<input type='radio' name='materia' value='{$row["id_materia"]}' required checked>{$row["id_materia"]}<br>";
		} else {
			// se ne esiste più di una allora fornisco la selezione con i radio button
			for ($i = 0; $i < $num_rows; $i++) {
				$row = mysqli_fetch_assoc($sql_result);
				echo "<input type='radio' name='materia' value='{$row["id_materia"]}' required>{$row["id_materia"]}<br>";
			}
		}

		?>

		<br>
		<!-- Da usare label per prompt -->
		Testo della domanda <br>
		<textarea name="testo" cols=50 rows=10 required></textarea> <br><br>
		<!-- definisco un div per poter mostrare e nascondere sia il testo che l'input
			fornisco un metodo veloce per rispondere alle domande vero o falso -->
		<div id="Vero" hidden>
			<label for="v&f"> VERO FALSO </label><input id="v&f" type="checkbox" name="Vero">
			<br><br>
		</div>

		Punti da assegnare alla domanda <input type="number" value="1" name="punteggio" min="0" required> <br><br>
		<div onclick="click_image()">
			immagine relativa
			<img style="max-height: 100px; max-width: 100px" src="/" alt="immagina inserita" id="img_show">
		</div>
		<input type="file" name="immagine" accept="image/*" id="image_selector" oninput="show_img()"><br><br>

		<label for="tipo"> Tipo di domanda </label>
		<select name="selezione-tipo" id="tipo" onchange="change()">
			<option value="0" selected>Risposta multipla</option>
			<option value="1">Testo bucato</option>
			<option value="2">Vero e False</option>
		</select> <br><br>
		<!--  definisco un div per poter mostrare e nascondere sia il testo che l'input
			se è una domanda vero e falso il numero di risposte è già definito -->
		<div id="numeri-input">
			numero risposte <input type="number" min="1" max="15" value="1" name="n-risposte">
		</div>

		<input type="submit" value="Invia">
	</form>
	<br>

	<div>
		<input type="search" name="ricerca" id="ricerca_domande" oninput="search()">

		<?php

		echo "<pre id='lista-domade'>";

		$query = "SELECT * FROM domande ORDER BY testo ASC;";
		$sql_result = mysqli_query($conn, $query);

		// stampo le domande già inserite come link per modificarle
		for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
			$row = mysqli_fetch_assoc($sql_result);

			echo "<div id='dom-$i' class='container-domanda'>";
			echo "<a href='modifica_domande.php?id={$row['ID']}'>{$row['testo']}</a> <br>";
			echo "<img src='/{$row['img_url']}' alt='' style='max-width: 40px; max-height: 40px' />";
			echo "</div>";
		}

		echo "</pre>";

		?>
	</div>

	<script src="img_manager.js" crossorigin="anonymous"></script>
	<script>
		// gestisce domande senza le immagine togliendole, questo per evitare di vedere il simbolo di immagine mancante
		document.addEventListener("DOMContentLoaded", function(event) {
			document.querySelectorAll("img").forEach(function(img) {
				img.onerror = function() {
					this.style.display = "none";
				};
			});
		});

		// rende tutto il div che contiene la domanda capace di essere cliccato
		document.addEventListener("DOMContentLoaded", function(event) {
			var domande = document.getElementsByClassName("container-domanda");
			for (let i = 0; i < domande.length; i++) {
				let domanda = domande[i];
				domanda.addEventListener("click", function(event) {
					domanda.children[0].click();
				});
			}
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

		/**
		 * cerca la risposta tra quelle nella pagina tramite testo dopo farò anche, punteggio, creatore e materia
		 */
		function search() {
			var domande = document.getElementsByClassName("container-domanda");

			var da_cercare = document.getElementById("ricerca_domande");

			var aghi = da_cercare.value.split(" ");

			for (let i = 0; i < domande.length; i++) {
				for (let j = 0; j < aghi.length; j++) {
					// per ogni domanda prendi tutti i tag contenuti, dei quali il primo è il tag a il quale ha come contenuto il testo della domanda 
					var pagliaio = domande[i].children[0].innerHTML.toLocaleLowerCase();

					var ago = aghi[j].toLocaleLowerCase()

					if (pagliaio.indexOf(ago) < 0) {
						console.log(pagliaio + " " + ago);
						domande[i].style.display = "none";
					} else {
						domande[i].style.display = "block";
					}
				}

			}
		}
	</script>

</body>

</html>