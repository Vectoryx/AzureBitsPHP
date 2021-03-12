<?php
session_start();
print_r($_SESSION);
print_r($_POST);

include "DBConnection.php";

// controllo se le nuove password sono state inserite
if (isset($_POST["pwd_ori"]) and isset($_POST["pwd_cpy"])) {

	// e se sono uguali
	if ($_POST["pwd_ori"] == $_POST["pwd_cpy"]) {

		$query = "UPDATE {$_SESSION['user']['type']} SET password='{$_POST['pwd_ori']}', hasLoggedOnce=1 WHERE ID={$_SESSION['user']['ID']};";

		mysqli_query($conn, $query);

		// spedisco l'utente nell'home page corretta
		if ($_SESSION["user"]["type"] == "studenti") {
			header("Location: studente\\home.html");
		} else {
			if ($_SESSION["user"]["admin"]) {
				header("Location: admin\\home.html");
			} else {
				header("Location: docente\\home.html");
			}
		}
	}
}
