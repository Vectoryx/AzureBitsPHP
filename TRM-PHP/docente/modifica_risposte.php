<?php

session_start();

include "../DBConnection.php";

$creatore = $_SESSION["user"]["ID"];
$testo = $_POST["testo"];
$punteggio = $_POST["punteggio"];
if ($_FILES["immagine"]["error"] != 0) {
	$img_url = $_POST['img'];
} else {
	$img_url = "sources/TRM-PHP/images/" . $_FILES["immagine"]["name"];
}

echo "<pre>";

print_r($_FILES);

print_r($_POST);

echo "</pre>";
$tipo = $_POST["selezione-tipo"];
$materia = $_POST["materia"];

// tutti questi campi devono esistere, quindi
if (isset($creatore) and isset($punteggio) and isset($testo) and isset($tipo)) {

	$query = "INSERT INTO domande (`testo`,  `img_url`, `punteggio`, `tipo`, `creatore`, `materia`) 
						   VALUES ('$testo', '$img_url', $punteggio,  $tipo,  $creatore, '$materia');";
	echo $query;
	// mysqli_query($conn, $query);
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
	<link rel="stylesheet" href="../style/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<form method="POST" action="u_aggiungi_risposte.php" enctype="multipart/form-data">
		<?php

		$query = "SELECT * FROM risposte WHERE id_domanda={$_POST['ID_domanda']}";
		echo $query;
		$sql_result = mysqli_query($conn, $query);
		echo "<br>";

		if ($tipo != 2) {

			echo "<input type='hidden' name='n-risposte' value='{$_POST['n-risposte']}'>";
			echo "<input type='hidden' name='ID_domanda' value='" . mysqli_insert_id($conn) . "'>";

			for ($i = 0; $i < $_POST["n-risposte"]; $i++) {

				$old = mysqli_fetch_assoc($sql_result);
				echo "<div>";

				echo "<label for='risp-$i'> Risposta " . ($i + 1) . ") </label>";
				echo "<br> <textarea cols=60 rows=7 id='risp-$i' name='$i' required>{$old['testo']}</textarea> ";

				echo "<br> <label for='chkbox-$i'> Corretta </label>";
				echo "<input type='checkbox' id='chkbox-$i' name='risp-$i-corretta' ";
				echo $old['correzione'] ? 'checked' : '';
				echo "><br>";

				echo "<label for='img'> Immagine relativa </label>";
				echo "<input type='hidden' name='img-$i' value='{$old['img_url']}'>";
				echo "<input type='file' name='immagine-$i' id='img' accept='image/*'>";
				echo "<br><br>";

				echo "</div>";
			}
		}
		?>
		<input type="submit" value="Invia">
	</form>


</body>

</html>