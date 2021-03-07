<?php session_start(); ?>

<head>
	<title>Login</title>
	<link rel="icon" type="image/png" href="img/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
	<link rel="stylesheet" href="style.css" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<?php
	include "DBConnection.php";
	// variabile per mostrare il messaggio di fallimento di login
	$login_failure = null;

	// variabile per cambiare form tra login/reset password
	$change_pwd = false;

	// provo a fare il login, inserisco in sessione il risultato, una array se un successo, false se fallito
	if (isset($_POST["usr"]) and isset($_POST["pwd"])) {
		$_SESSION["user"] = login($_POST["usr"], $_POST["pwd"]);
	}

	// controllo se il login è stato eseguito e non è fallito (un qualsiasi oggetto viene valutato true se esiste)
	if (isset($_SESSION["user"]) and (!$_SESSION["user"])) {
		$login_failure = "Autenticazione fallita, username o password non corretti";
	}

	// Controlla se l'utente ha già fatto un login ed cambiato la password o no
	if (isset($_SESSION["user"]) and $_SESSION["user"]) {

		// controllo se ha già fatto il login almeno una volta e cambiato la password
		if ($_SESSION["user"]["hasLoggedOnce"] == 0) {

			// questa variabile controlla i form, mostra il form corretto
			$change_pwd = true;

			// controllo se le nuove password sono state inserite
			if (isset($_POST["pwd_1"]) and isset($_POST["pwd_2"])) {
				if ($_POST["pwd_1"] == $_POST["pwd_2"]) {

					$new_pwd = $_POST["pwd_1"];
					$table = $_SESSION["user"]["type"];
					$UID = $_SESSION["user"]["ID"];
					$query = "UPDATE $table SET password='$new_pwd', hasLoggedOnce=1 WHERE ID=$UID;";
					mysqli_query($conn, $query);
					$change_pwd = false;

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
				} else {

					unset($_POST["pwd_1"]);
					unset($_POST["pwd_2"]);
				}
			}
		} else {

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

	?>
	<div class="position-absolute top-50 start-50 translate-middle">

		<div class="login" id="login" <?php echo !$change_pwd ? null : "hidden" ?>>
			<img src="img/logo_nitido_p_o.png" class="img-fluid" alt="logo AzureBits">
			<h4>Inserisci le credenziali</h4>
			<br />
			<form method="POST">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingInput" placeholder="user.name" name="usr" required />
					<label for="floatingInput">Username</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword" placeholder="password" name="pwd" required />
					<label for="floatingPassword">Password</label>
				</div>
				<div class="text-danger">
					<?php
					echo $login_failure;
					?>
				</div>
				<div style="margin: 5px;">
					<button type="submit" value="Submit" class="btn btn-danger">
						Submit
					</button>
				</div>
			</form>
		</div>


		<div class="login" id="passwd_change" <?php echo $change_pwd ? null : "hidden" ?>>
			<img src="img/logo_nitido_p_o.png" class="img-fluid" alt="logo AzureBits">
			<h4>E' necessario cambiare la password dell'account</h4>
			<form method="POST">

				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="pwd_1" placeholder="password" required />
					<label for="floatingPassword">Password</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="pwd_2" placeholder="password" required />
					<label for="floatingPassword">Password</label>
				</div>
				<div style="margin: 5px;">
					<button type="submit" value="Submit" class="btn btn-danger">
						Submit
					</button>
				</div>
			</form>
		</div>


	</div>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>