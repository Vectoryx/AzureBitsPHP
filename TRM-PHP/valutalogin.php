<html>

<head>
	<title>PHP validation</title>
	<link rel="stylesheet" href="style.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
</head>

<body>
	<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$database = "AzureBits";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $database);

	// Check connection
	if ($conn->errno) {
		die("Connection failed: " . $conn->connect_error);
	}

	echo "Connected successfully <br><br>";
	echo $_POST["usr"];

	?>
	<table style="margin: 10px;">


		<thead class="table-header">
			<tr>
				<th scope="col">#</th>
				<th scope="col">Username</th>
				<th scope="col">Password</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$sql = "SELECT * FROM `docenti`; # WHERE `username`='" . $_POST["usr"] . "' AND `password`='" . $_POST["pwd"] . "';";

			$res = $conn->query($sql);
			if ($res->num_rows > 0) {

				while ($row = $res->fetch_assoc()) {
					echo '<tr> <th scope="row">' . $row["ID"] . '</th><td>' . $row["username"] . '</td> <td>' . $row["password"] . '</td>';
				}
			} else {
				echo "no results";
			}

			$conn->close();

			?>
		</tbody>
	</table>
</body>

</html>