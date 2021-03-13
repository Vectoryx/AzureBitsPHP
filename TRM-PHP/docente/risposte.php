<?php

session_start();

include "../DBConnection.php";

$creatore = $_SESSION["user"]["ID"];
$testo = $_POST["testo"];
$punteggio = $_POST["punteggio"];
$img_url = "TRM-PHP\\\\images\\\\" . $_FILES["immagine"]["name"]; // quadruplo backslash perche anche sql tratta il backslash singolo come carattere escape 
$tipo = $_POST["selezione-tipo"];

// tutti questi campi devono esistere, quindi
if (isset($creatore) and isset($punteggio) and isset($testo) and isset($tipo)) {

	$query = "INSERT INTO domande (`testo`,  `img_url`, `punteggio`, `tipo`, `creatore`) VALUES ('$testo', '$img_url', $punteggio,  $tipo,  $creatore);";
	mysqli_query($conn, $query);
	move_uploaded_file($_FILES["immagine"]["tmp_name"], "..\\images\\" . $_FILES["immagine"]["name"]);
}
?>
<!DOCTYPE html>
<html lang="it">

<head>
	<title>Gestione risposte</title>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<form method="POST" action="u_aggiungi_domande.php" enctype="multipart/form-data">
		<?php

		if ($tipo != 2) {
			echo "<input type='hidden' name='n-risposte' value='{$_POST['n-risposte']}'>";
			echo "<input type='hidden' name='ID_domanda' value='" . mysqli_insert_id($conn) . "'>";
			for ($i = 0; $i < $_POST["n-risposte"]; $i++) {

				echo "<label for='risp-$i'> Risposta " . ($i + 1) . ") </label>";
				echo "<input type='text' id='risp-$i' name='$i' required> ";
				echo "<label for='chkbox-$i'> Corretta </label>";
				echo "<input type='checkbox' id='chkbox-$i' name='risp-$i-corretta'><br>";
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