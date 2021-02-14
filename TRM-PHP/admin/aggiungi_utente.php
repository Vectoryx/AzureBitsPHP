<?php
include "..\\DBConnection.php";

// genera una password randomica per gli utenti
function gen_password() {
	$res = "";

	$res .= rand(100, 999);

	for ($i = 0; $i < 4; $i++) {
		$res .= chr(rand(97, 122));
	}

	return $res;
}

$selezione = $_POST["selezione-utenti"];
$username = $_POST["usr"];

// controlla che le variabili esistono
if ($selezione and $username) {

	$pwd = gen_password();

	// per uno studente basta aggiungere l'username e la classe nella tabella
	if ($selezione == "Studente") {
		$classe = $_POST["group"];
		$query = "INSERT INTO `studenti` (`username`, `password`, `hasLoggedOnce`, `id_classe`) VALUES ('leonardo', '498mhnk', 0, '1^A');";
		mysqli_query($conn, $query);
	}

	// per un docente devo aggiungere l'username alla tabella docenti 
	// poi aggiungo la classe e l'id docente 
	if ($selezione == "Docente") {
		// inserisco il docente nella tabella
		$query = "INSERT INTO `docenti` (`username`, `password`, `hasLoggedOnce`, `admin`) VALUES ('$username', '$pwd', 0, 0);";
		mysqli_query($conn, $query);

		// ottengo l'id del docente appena inserito
		$query = "SELECT ID FROM docenti WHERE username='$username' AND password='$pwd' AND hasLoggedOnce=0 AND admin=0;";
		$sql_result = mysqli_query($conn, $query);
		$row = $sql_result->fetch_assoc();
		$ID_doc = $row["ID"];

		// inserisco i collegamenti tra le classi e i docenti
		foreach ($_POST as $key => $value) {
			if ($_POST["usr"] != $key and $_POST["selezione-utenti"] != $key) { // controllo di non inserire nel database i dati sbagliati
				$query = "INSERT INTO docenti_classi VALUES ('$ID_doc', '$value');";
				mysqli_query($conn, $query);
			}
		}
	}

	// per l'amministratore basta aggiungere l'username e la password nella tablla
	if ($selezione == "Amministratore") {
		// inserisco il docente nella tabella
		$query = "INSERT INTO `docenti` (`username`, `password`, `hasLoggedOnce`, `admin`) VALUES ('$username', '$pwd', 0, 1);";
		mysqli_query($conn, $query);
	}
}
// e ritorno all pagina di partenza

header("Location: users.php");