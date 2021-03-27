<?php

session_start();

include "DBConnection.php";

/**
 * Dati username e password controlla nel database se esiste un utente con quei paramentri, se esiste ritorna un array associativo con tutti i valori
 * dell'utente, se non esiste ritorna falso
 * 
 * @param string $username l'username dell' utente
 * @param string $password la password dell' utente
 * 
 * @return array|bool an array containing the users info, false otherwise
 */
function login($username, $password) {
	global $tables, $conn;

	for ($i = 0; $i < count($tables); $i++) {

		// esecute query
		$query = "SELECT * FROM $tables[$i] WHERE BINARY username='$username' AND password='$password';";
		$sql_result = mysqli_query($conn, $query);

		// actual check
		if ($sql_result && mysqli_num_rows($sql_result)) {
			$row = mysqli_fetch_assoc($sql_result);

			$res = array("type" => $tables[$i], "ID" => $row["ID"], "hasLoggedOnce" => $row["hasLoggedOnce"]);

			if ($tables[$i] == "docenti") {
				$res["admin"] = $row["admin"];
			}

			return $res;
		}
	}
	return false;
}

// provo a fare il login, inserisco in sessione il risultato, una array se un successo, false se fallito
if (isset($_POST["usr"]) and isset($_POST["pwd"])) {
	$_SESSION["user"] = login($_POST["usr"], $_POST["pwd"]);
}

// controllo se il login e' stato eseguito e non e' fallito (un qualsiasi oggetto viene valutato true se esiste)
if (isset($_SESSION["user"]) and (!$_SESSION["user"])) {
	header("Location: index.php?e=true");
}

if (isset($_SESSION["user"]) and $_SESSION["user"]) {

	// controllo se ha gia' fatto il login almeno una volta e cambiato la password
	if ($_SESSION["user"]["hasLoggedOnce"] == 0) {
		header("Location: rinnova_pwd.php");
	} else {

		// se e' gia registrato ufficialmente (quindi hasLoggedOnce == 1)
		// spedisco l'utente nell'home page corretta
		if ($_SESSION["user"]["type"] == "studenti") {
			header("Location: studente/home.html");
		} else {
			if ($_SESSION["user"]["admin"]) {
				header("Location: admin/home.html");
			} else {
				header("Location: docente/home.html");
			}
		}
	}
}
