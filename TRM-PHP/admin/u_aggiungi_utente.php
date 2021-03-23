<?php
include "../DBConnection.php";

$selezione = $_POST["selezione-utenti"];
$username = $_POST["usr"];

// controlla che le variabili esistono
if ($selezione and $username) {

	$pwd = gen_password();

	// per uno studente basta aggiungere l'username e la classe nella tabella
	if ($selezione == "Studente") {
		$classe = $_POST["classi"];
		$query = "INSERT INTO  studenti (username, password, hasLoggedOnce, id_classe) VALUES ('$username', '$pwd', 0, '$classe');";
		mysqli_query($conn, $query);
	}

	// per un docente devo aggiungere l'username alla tabella docenti 
	// poi aggiungo la classe e l'id docente 
	if ($selezione == "Docente") {
		// inserisco il docente nella tabella
		$query = "INSERT INTO docenti (username, password, hasLoggedOnce, admin) VALUES ('$username', '$pwd', 0, 0);";
		mysqli_query($conn, $query);

		// ottengo l'id del docente appena inserito
		$query = "SELECT LAST_INSERT_ID() as ID;";
		$sql_result = mysqli_query($conn, $query);
		$row = mysqli_fetch_assoc($sql_result);
		$ID_doc = $row["ID"];

		// inserisco i collegamenti tra le classi e i docenti
		foreach ($_POST as $key => $value) {
			if (strpos($key, "classe") === 0) { // controllo di non inserire nel database i dati sbagliati
				$query = "INSERT INTO docenti_classi VALUES ('$ID_doc', '$value');";
				mysqli_query($conn, $query);
			}
			if (strpos($key, "materia") === 0) { // controllo di non inserire nel database i dati sbagliati
				$query = "INSERT INTO materia_docente VALUES ('$ID_doc', '$value');";
				mysqli_query($conn, $query);
			}
		}
	}

	// per l'amministratore basta aggiungere l'username e la password nella tablla
	if ($selezione == "Amministratore") {
		// inserisco il docente nella tabella
		$query = "INSERT INTO docenti (username, password, hasLoggedOnce, admin) VALUES ('$username', '$pwd', 0, 1);";
		mysqli_query($conn, $query);
	}
}
// e ritorno all pagina di partenza
header("Location: utenti.php");
