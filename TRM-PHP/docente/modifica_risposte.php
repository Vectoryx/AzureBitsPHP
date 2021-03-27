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
$tipo = $_POST["selezione-tipo"];
$materia = $_POST["materia"];
$vero = isset($_POST['Vero']);

// tutti questi campi devono esistere, quindi
if (isset($creatore) and isset($punteggio) and isset($testo) and isset($tipo)) {

	$query = "INSERT INTO domande (testo, img_url, punteggio, tipo, creatore, materia, precedente) 
						   VALUES ('$testo', '$img_url', $punteggio, $tipo, $creatore, '$materia', {$_POST['ID_domanda']});";
	mysqli_query($conn, $query);
	// "scarico" l'immagine richiesta nel form e la metto nella cartella source/TRM-PHP/images
	move_uploaded_file($_FILES["immagine"]["tmp_name"], "../images/" . $_FILES["immagine"]["name"]);
}
// Non e' necessario caricare una pagina intera per chiederti un checkbox, quindi lo faccio nella pagina precedente
if ($tipo == 2) {

	$query = "INSERT INTO risposte ( testo, correzione, id_domanda, ordine_modifica) VALUES ( '', $vero, " . mysqli_insert_id($conn) . ");";
	header("Location: domande.php");
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
	<form method="POST" action="u_mod_aggiungi_risposte.php" enctype="multipart/form-data">
		<?php

		echo "<input type='hidden' name='ID_domanda' value='" . mysqli_insert_id($conn) . "'>";

		$query = "SELECT * FROM risposte WHERE id_domanda={$_POST['ID_domanda']}";
		$sql_result = mysqli_query($conn, $query);

		if ($tipo != 2) {
			// se non e' una domanda vero falso stampo le risposte precedenti e passo un paio di informazioni per inserire le domande

			echo "<input type='hidden' id='n-risposte' name='n-risposte' value='{$_POST['n-risposte']}'>";

			for ($i = 0; $i < $_POST["n-risposte"]; $i++) {
				$old = mysqli_fetch_assoc($sql_result);

				echo "<div>";

				// stampo il testo della risposta
				echo "<label for='risp-$i'> Risposta " . ($i + 1) . ") </label>";
				echo "<br> <textarea cols=60 rows=7 id='risp-$i' name='$i' required>";
				echo (isset($old['testo']) ? $old['testo'] : '') . "</textarea> ";

				// se e' a risposta multipla mostro un checkbox per la correttezza della risposta,
				// se invece e' un testo bucato chiedo un numero per l'ordine delle risposte nel testo
				if ($tipo == 0) {
					echo "<br> <label for='chkbox-$i'> Corretta </label>";
					echo "<input type='checkbox' id='chkbox-$i' name='risp-$i-corretta'";
					echo (isset($old['correzione']) and $old['correzione']) ? 'checked' : '';
					echo "><br>";
				} else {
					echo "<br> <input type='number' min=1 value='$i' name='risp-$i-corretta' value='{$old['correzzione']}' > <br>";
				}

				// e nascondo la vecchia immagine

				echo "<input type='hidden' name='img-$i' value='";
				echo isset($old["img_url"]) ? $old["img_url"] : '';
				echo "'>";

				echo "<div onclick='click_image_id($i)'>";

				echo "<label for='img'> Immagine relativa </label> <br>";
				echo "<img src='/";
				echo isset($old["img_url"]) ? $old["img_url"] : '';
				echo "' style='max-height: 100px; max-width: 100px' alt='immagine inserita' id='img_show-$i'>";

				echo "</div>";
				echo "<input type='file' name='immagine-$i' id='image_selector-$i' oninput='show_img_id($i)' accept='image/*'>";
				echo "<br><br>";

				echo "</div>";
			}
		}
		?>
		<input type="submit" value="Invia">
	</form>

	<script src="img_manager.js" crossorigin="anonymous"></script>
	<script>
		// gestisce le risposte senza le immagine togliendole, questo per evitare di vedere il simbolo di immagine mancante
		document.addEventListener("DOMContentLoaded", function(event) {
			document.querySelectorAll("img").forEach(function(img) {
				img.onerror = function() {
					this.style.display = "none";
				};
			});
		});

		var loop = document.getElementById("n-risposte").value;

		for (let i = 0; i < loop; i++) {
			fix_default_img_id(i);
		}
	</script>

</body>

</html>