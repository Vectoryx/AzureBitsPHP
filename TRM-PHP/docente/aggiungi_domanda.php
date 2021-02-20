<?php

session_start();

include "..\\DBConnection.php";

$creatore = $_SESSION["user"]["ID"];
$testo = $_POST["testo"];
$materia = $_POST["materia"];
$argomento = $_POST["argomento"];
$punteggio = $_POST["punteggio"];
$img_url = "TRM-PHP\\\\images" . $_FILES["immagine"]["name"]; // quadruplo backslash perche anche sql tratta il backslash singolo come carattere escape 
$tipo = $_POST["selezione-tipo"];
$n_risposte = $_POST["n-risposte"];

// tutti questi campi devono esistere, quindi
if (isset($argomento) and isset($creatore) and isset($materia) and isset($punteggio) and isset($testo) and isset($tipo)) {

	$query = "INSERT INTO domande (`testo`, `img_url`, `id_materia`, `punteggio`, `tipo`, `creatore`, `id_argomento`) 
					VALUES ('$testo', '$img_url', '$materia', $punteggio, $tipo, $creatore, '$argomento');";
	mysqli_query($conn, $query);
	move_uploaded_file($_FILES["immagine"]["tmp_name"], "..\\images\\" . $_FILES["immagine"]["name"]);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Gestione risposte</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<p> pagina non finita </p>
	<form method="POST" action="aggiungi_risposte.php">
		<?php

		if ($tipo != 2) {
			for ($i = 0; $i < $n_risposte; $i++) {
				echo "";
			}
		}

		?>
	</form>


</body>

</html>