<?php

session_start();

include "../DBConnection.php";

$creatore = $_SESSION["user"]["ID"];
$testo = $_POST["testo"];
$punteggio = $_POST["punteggio"];
$img_url = "sources/TRM-PHP/images/" . $_FILES["immagine"]["name"];
$tipo = $_POST["selezione-tipo"];
$materia = $_POST["materia"];
$vero = isset($_POST['Vero']);

// tutti questi campi devono esistere, quindi
if (isset($creatore) and isset($punteggio) and isset($testo) and isset($tipo)) {

	$query = "INSERT INTO domande  ( testo,    img_url,    punteggio,   tipo,   creatore,   materia)
							VALUES ('$testo', '$img_url', $punteggio,  $tipo,  $creatore, '$materia');";
	// mysqli_query($conn, $query);
	move_uploaded_file($_FILES["immagine"]["tmp_name"], "..\\images\\" . $_FILES["immagine"]["name"]);
}

// Non è necessario caricare una pagina intera per chiederti un checkbox, quindi lo faccio nella pagina precedente
if ($tipo == 2) {

	$query = "INSERT INTO risposte ( testo, correzione, id_domanda) VALUES ( '', $vero, " . mysqli_insert_id($conn) . ")";
	echo $query;
	// header("Location: domande.php"); 
}
?>
<!DOCTYPE html>
<html lang="it">

<head>
	<title>Gestione risposte</title>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="../style/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<form method="POST" action="u_aggiungi_risposte.php" enctype="multipart/form-data">
		<?php
		echo "<input type='hidden' name='ID_domanda' value='" . mysqli_insert_id($conn) . "'>";

		echo "<pre>";

		print_r($_POST);

		echo "</pre>";


		if ($tipo != 2) {
			echo "<input type='hidden' name='n-risposte' value='{$_POST['n-risposte']}'>";
			for ($i = 0; $i < $_POST["n-risposte"]; $i++) {

				echo "<label for='risp-$i'> Risposta " . ($i + 1) . ") </label>";
				echo "<br> <textarea cols=60 rows=7 id='risp-$i' name='$i' required></textarea> ";

				if ($tipo == 0) {
					echo "<br> <label for='chkbox-$i'> Corretta </label>";
					echo "<input type='checkbox' id='chkbox-$i' name='risp-$i-corretta'><br>";
				} else {
					echo "<br> <input type='number' min=1 name='risp-$i-corretta' > <br>";
				}

				echo "<label for='img'> Immagine relativa </label>";
				echo "<input type='file' name='immagine-$i' id='img' accept='image/*'>";
				echo "<br><br>";
			}
		}

		?>
		<input type="submit" value="Invia">
	</form>

</body>

</html>