<head>
	<title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
	<link rel="stylesheet" href="style.css" />
</head>

<body>
	<?php
	// stabilizione della connessione
	$servername = "localhost";
	$username = "root";
	$password = "";
	$database = "AzureBits";
	$success = "";
	$tables = array("docenti", "studenti");
	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $database);

	// Check connection
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}

	if (isset($_POST["usr"]) and isset($_POST["usr"])) {

		for ($i = 0; $i < count($tables); $i++) {
			$sql = 'SELECT * FROM ' . $tables[$i] . ' WHERE BINARY username=\'' . $_POST["usr"] . '\'  AND BINARY password=\'' . $_POST["pwd"] . '\';';
			echo $sql . "<br>";
			$res = mysqli_query($conn, $sql);
			if (mysqli_num_rows($res) > 0) {
				header('Location: Success.php');
			} else {
				$success = "Login failed";
			}
		}
	}
	?>
	<div class="position-absolute top-50 start-50 translate-middle">
		<div class="login">
			<img src="img/logo_nitido_p_o.png" class="img-fluid" alt="logo AzureBits">
			<h4>Inserisci le credenziali</h4>
			<br />
			<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>", method="POST">
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
					echo $success;
					?>
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