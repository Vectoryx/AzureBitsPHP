<!DOCTYPE html>

<head>
	<title>Admin</title>
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


	$sql = "SELECT * FROM studenti";
	echo $sql . "<br>";
	$res = mysqli_query($conn, $sql);
	for ($i = 0; mysqli_num_rows($res); $i++) {
		$row = $res->fetch_assoc();
		echo $row["username"] . "  " . $row["password"] . "<br>";
	}
	?>
</body>