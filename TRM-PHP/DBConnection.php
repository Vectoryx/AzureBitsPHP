<?php
// stabilizione della variabili per la connessione
$servername = "localhost";
$username = "root";
$password = "";
$database = "AzureBits";
$tables = array("docenti", "studenti");

// stabilisce la connessione con il database
$conn = mysqli_connect($servername, $username, $password, $database);

// controlla la connessione
if (!$conn) {
	die("Connection failed: " . mysqli_connect_error());
}

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
			$row = $sql_result->fetch_assoc();

			// add the table of the user
			$row["type"] = $tables[$i];
			return $row;
		}
	}
	return false;
}

// genera una password randomica per gli utenti
function gen_password() {
	$res = "";

	$res .= rand(100, 999);

	for ($i = 0; $i < 4; $i++) {
		$res .= chr(rand(97, 122));
	}

	return $res;
}
