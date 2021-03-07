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
	<p>LE TRE COLONNE DOVRANNO ESSERE UNA IN FIANCO ALL'ALTRA</p>
	<div class="aggiungi-utente">
		<h3>Aggiungi utente</h3>
		<form action="aggiungi_utente.php" method="POST">
			<!-- lista per selezionare il tipo di utente, ogni tipo di utente ha input diversi -->
			<label for="Utenti">Tipo di utente</label>
			<select name="selezione-utenti" id="Utenti" onchange="change()">
				<option value="Studente" selected="selected">Studente</option>
				<option value="Docente">Docente</option>
				<option value="Amministratore">Amministratore</option>
			</select><br><br>


			<?php
			include ".\\..\\DBConnection.php";

			session_start();

			// inizio a stampare le classi, utilizzo pre perchè non formatta il testo
			echo "<pre id=\"class-list\">";

			// ottengo le classi del database
			$query = "SELECT * FROM classi";
			$sql_result = mysqli_query($conn, $query);

			// stampo le effettive righe
			for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
				$row = $sql_result->fetch_assoc();

				// ogni input ha value che rappresenta la classe, nome e tipo variano a seconda del tipo di utente
				echo "<input type='radio' class='opzione-classe' name='classi' value='{$row["ID"]}'> ";
				echo "{$row["ID"]} {$row["indirizzo"]}<br>";
			}

			echo "</pre>";

			echo "<pre id=\"lista-materie\" hidden>";

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

			?>
			<input type="text" name="usr" required> Username <br>
			<input type="submit" value="submit">
		</form>

		<form method="POST" action="aggiungi_materia.php">

			<label for="input-materia">Inserisci nuova materia</label>
			<input type="text" name="materia" id="input-materia">
			<input type="submit" value="submit">
		</form><br><br>
	</div>

	<div class="rimuovi-utente">
		<h3>Rimuovi utente</h3>

		<form action="rimuovi_utente.php" method="POST">
			<div style="overflow: auto; height: 500px; width: 500px">
				<?php

				echo "<pre class='lista-utenti'>";

				echo "<input type='search' name='ricerca' id='ricerca-utenti' placeholder='user.name' onchange=search()><br><br>";

				echo "<br>Docenti<br><br>";

				$query = "SELECT * FROM docenti";
				$sql_result = mysqli_query($conn, $query);

				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();
					echo "<input type='checkbox' name='doc-{$row["username"]}' value='{$row["ID"]}'> {$row["username"]}<br>";
				}

				echo "<br>Studenti<br><br>";

				$query = "SELECT * FROM studenti";
				$sql_result = mysqli_query($conn, $query);

				for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
					$row = $sql_result->fetch_assoc();
					echo "<input type='checkbox' name='stud-{$row["username"]}' value='{$row["ID"]}'> {$row["username"]}<br>";
				}

				echo "</pre>";

				?>
			</div>
			<input type="submit" value="Cancella">
		</form>
	</div>

	<div class="modifica-utenti">
		<br><br>
		<h3>Modifica utenti</h3>
		<div style="overflow: auto; height: 500px; width: 500px; text-decoration: none">
			<?php

			echo "<pre class='lista-utenti'>";

			echo "<br>Docenti<br><br>";

			$query = "SELECT * FROM docenti";
			$sql_result = mysqli_query($conn, $query);

			for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
				$row = $sql_result->fetch_assoc();
				echo "<a href='modifica.php?user=doc-{$row["ID"]}'>{$row["username"]}</a><br>";
			}

			echo "<br>Studenti<br><br>";

			$query = "SELECT * FROM studenti";
			$sql_result = mysqli_query($conn, $query);

			for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
				$row = $sql_result->fetch_assoc();
				echo "<a href='modifica.php?user=stud-{$row["ID"]}'>{$row["username"]}</a><br>";
			}

			echo "</pre>";
			?>
		</div>
	</div>

	<script>
		// questo script è necessario per cambiare il tipo di dato per ogni utente
		// Per cambiare tipo di input devo stare attento all'attributo nome, quando spedisco il form l'attributo nome indica un solo valore
		// quindi, nel caso del docente, quando devo spedire più classi ciò non è possibile perchè tutti i valori vengono raggruppati in
		// uno. Ma se cambio il nome per ogni input i radio button non sarebbero più mutualmente esclusivi.
		// Per questo motivo se seleziono studente il nome di tutti gli input è uguale a "group", ed il valore è diverso (il server php 
		// riceve "group" => ID ). Quando seleziono docente pongo nome uguale a valore, diverso per ogni input. (il server php
		// riceve ID => ID).
		// Fare ciò è facilmente fattibile in javascript 
		function change() {

			// trovo il menu drop-down
			var selection = document.getElementById("Utenti");
			var type = "";

			// trovo la il tag che contiene le classi e gli input
			let temp = document.getElementById("class-list");

			// per essere sicuro tolgo l'attributo hidden messo possibilmente precedentemente
			temp.removeAttribute("hidden");

			if (selection.value == "Studente") { // Gli studenti possono essere solo in una classe, quindi c'è bisogno di un radio button
				type = "radio";

			} else if (selection.value == "Docente") { // I docenti possono avere più classi, quindi checkbox
				type = "checkbox"

			} else if (selection.value == "Amministratore") { // gli amministratori non insegnano, quindi non hanno classi
				// quindi nascono tutta la lista
				temp.setAttribute("hidden", "hidden");
			}

			// trovo tutti gli input
			var classi = document.getElementsByClassName("opzione-classe");
			var materie = document.getElementById("lista-materie");

			if (selection.value != "Docente") {
				materie.setAttribute("hidden", "hidden");
			} else {
				materie.removeAttribute("hidden");
			}

			for (let i = 0; i < classi.length; i++) {
				// metto il nuovo attributo definito prima
				classi[i].setAttribute("type", type);

				if (selection.value == "Docente") { // se è docente metto come nome il valore della classe
					classi[i].setAttribute("name", "classe-" + classi[i].getAttribute("value"));

				} else if (selection.value == "Studente") { // se è studente metto tutti i valori uguali
					classi[i].setAttribute("name", "classi");

				}

			}
		}
	</script>

</body>

</html>