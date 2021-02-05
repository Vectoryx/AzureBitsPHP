<?php session_start(); ?>

<head>
	<title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
	<link rel="stylesheet" href="style.css" />
</head>

<body>
	<?php
	include "login.php";

	// variabile per mostrare il messaggio di fallimento di login
	$login_failure = null;

	// variabile per cambiare form tra login/reset password
	$change_pwd = false;

	if (isset($_POST["usr"]) and isset($_POST["pwd"])) {
		$_SESSION["user"] = login($_POST["usr"], $_POST["pwd"]);
	}

	if (isset($_SESSION["user"]) and (!$_SESSION["user"])) {
		$login_failure = "Autenticazione fallita, username o password non corretti";
	}

	print_r($_SESSION);

	// Controlla se l'utente ha già fatto un login e cambiato la password o no
	if (isset($_SESSION["user"]) and $_SESSION["user"]) {
		if ($_SESSION["user"]["hasLoggedOnce"] == 0) {
			$change_pwd = true;

			if (isset($_POST["pwd_1"]) and isset($_POST["pwd_2"])) {
				if ($_POST["pwd_1"] == $_POST["pwd_2"]) {

					$new_pwd = $_POST["pwd_1"];
					$table = $_SESSION["user"]["type"];
					$UID = $_SESSION["user"]["ID"];
					$query = "UPDATE $table SET password='$new_pwd', hasLoggedOnce=1 WHERE ID=$UID;";
					mysqli_query($conn, $query);
					$change_pwd = false;
					header("Location: Success.php");
				} else {

					unset($_POST["pwd_1"]);
					unset($_POST["pwd_2"]);
				}
			}
		} else {
			header('Location: Success.php');
		}
	}

	?>
	<div class="position-absolute top-50 start-50 translate-middle">


		<div class="login" id="login" <?php echo !$change_pwd ? 'style="display: block"' : 'style="display: none"'; ?>>
			<img src="img/logo_nitido_p_o.png" class="img-fluid" alt="logo AzureBits">
			<h4>Inserisci le credenziali</h4>
			<br />
			<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" , method="POST">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingInput" placeholder="user.name" name="usr" />
					<label for="floatingInput">Username</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword" placeholder="password" name="pwd" />
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


		<div class="login" id="passwd_change" <?php echo $change_pwd ? 'style="display: block"' : 'style="display: none"'; ?>>
			<img src="img/logo_nitido_p_o.png" class="img-fluid" alt="logo AzureBits">
			<h4>E' necessario cambiare la password dell'account</h4>
			<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" , method="POST">

				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="pwd_1" placeholder="password" />
					<label for="floatingPassword">Password</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="pwd_2" placeholder="password" />
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