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

// genera una password randomica per gli utenti
function gen_password() {
	$res = "";

	$res .= rand(100, 999);

	for ($i = 0; $i < 4; $i++) {
		$res .= chr(rand(97, 122));
	}

	return $res;
}
