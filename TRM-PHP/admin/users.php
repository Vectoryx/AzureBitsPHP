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
	<form action="aggiungi_utente.php" method="POST">
		<!-- lista per selezionare il tipo di utente, ogni tipo di utente ha input diversi -->
		<select name="selezione-utenti" id="Utenti" onchange="change()">
			<option value="Studente" selected="selected">Studente</option>
			<option value="Docente">Docente</option>
			<option value="Amministratore">Amministratore</option>
		</select>

		<label for="Utenti">Tipo di utente</label>
		<input type="text" name="usr" required> Username <br>

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
			echo '<input type="radio" class="opzione-classe" name="group" value="' . $row["id_classe"] . '" > ';
			echo $row["id_classe"] . "  " . $row["indirizzo"] . "<br>";
		}

		echo "</pre>";
		?>

		<script>
			// questo script è necessario per cambiare il tipo di dato per ogni utente
			// Per cambiare tipo di input devo stare attento all'attributo nome, quando spedisco il form l'attributo nome indica un solo valore
			// quindi, nel caso del docente, quando devo spedire più classi ciò non è possibile perchè tutti i valori vengono raggruppati in
			// uno. Ma se cambio il nome per ogni input i radio button non sarebbero più mutualmente esclusivi.
			// Per questo motivo se seleziono studente il nome di tutti gli input è uguale a "group", ed il valore è diverso (il server php 
			// riceve "group" => id_classe ). Quando seleziono docente pongo nome uguale a valore, diverso per ogni input. (il server php
			// riceve id_classe => id_classe).
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
					return;

				}

				// trovo tutti gli input
				var classi = document.getElementsByClassName("opzione-classe");

				for (let i = 0; i < classi.length; i++) {
					// metto il nuovo attributo definito prima
					classi[i].setAttribute("type", type);

					if (selection.value == "Docente") { // se è docente metto come nome il valore della classe
						classi[i].setAttribute("name", classi[i].getAttribute("value"));

					} else if (selection.value == "Studente") { // se è studente metto tutti i valori uguali
						classi[i].setAttribute("name", "group");

					}

				}
			}
		</script>
		<input type="submit" value="submit">
	</form>
</body>

</html>