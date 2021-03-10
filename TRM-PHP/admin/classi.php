<!DOCTYPE html>
<html lang="en">

<head>
	<title>Gestione classi</title>
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
</head>

<body>
</body>
<div class="container">
	<div class="float-start">
		<form action="cancella_classe.php" method="POST">
			<?php
			include ".\\..\\DBConnection.php";

			session_start();

			// inizio a stampare le classi
			echo "<pre>";

			$query = "SELECT * FROM classi";
			$sql_result = mysqli_query($conn, $query);

			for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
				$row = $sql_result->fetch_assoc();

				echo "<input type='checkbox' name='classe-{$row["ID"]}'> ";
				echo "{$row["ID"]} {$row["indirizzo"]}<br>";
			}

			echo "</pre>";
			?>
			<p>Dani con JS metti un pulsante seleziona tutti</p>
			<input type="submit" value="cancella" name="op">

			<!-- Per ora inutile -->
			<input type="submit" value="promuovi" name="op">
		</form>

		<?php

		echo "<pre class=lista-classi>";

		$query = "SELECT * FROM classi";
		$sql_result = mysqli_query($conn, $query);

		for ($i = 0; $i < mysqli_num_rows($sql_result); $i++) {
			$row = $sql_result->fetch_assoc();

			echo "<a href='modifica_cls.php?id={$row["ID"]}'>{$row["ID"]}</a><br>";
		}

		echo "</pre>";

		?>

	</div>
	<div class="float-start">
		<form method="POST" action="aggiungi_classe.php">
			<input type="text" name="id" required> Identificatore classe
			<br>
			<input type="text" name="desc" required> indirizzo della classe
			<br>
			<input type="submit" value="Aggiungi">
		</form>
		<p>
			<?php echo isset($_GET["e"]) ? "uno o più valori mancanti" : ""; ?>
		</p>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</html>