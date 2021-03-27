<!DOCTYPE html>
<html lang="it">

<head>
	<title>Modifica utenti</title>
	<link rel="icon" type="image/png" href="../img/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="../style/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div>
		<form method="POST" action="modifica_risposte.php" enctype="multipart/form-data">
			<?php
			session_start();

			include "../DBConnection.php";

			// ottengo la domanda da modificare piu' il numero di risposte
			$query = "SELECT domande.*, COUNT(*) AS num 
					  FROM domande JOIN risposte ON (risposte.id_domanda = domande.ID) 
					  GROUP BY domande.ID 
					  HAVING domande.ID={$_GET['id']};";
			$sql_result = mysqli_query($conn, $query);
			$old = mysqli_fetch_assoc($sql_result);

			if (!isset($old)) {
				$query = "SELECT * FROM domande WHERE ID={$_GET['id']}";
				$sql_result = mysqli_query($conn, $query);
				$old = mysqli_fetch_assoc($sql_result);
			}

			// Le materie sono selezionate automaticamente dalla materia insegnata, se esiste solo un'opzione metto un radio button checked e disabled
			$query = "SELECT * FROM materie_docenti WHERE id_docente={$_SESSION["user"]["ID"]};";
			$sql_result = mysqli_query($conn, $query);

			echo "<br>";
			echo "<input type='hidden' name='ID_domanda' value='{$_GET['id']}'>"; // passo l'id della domanda a cui riferirsi alla pagina successiva
			echo "materie <br>";

			$num_rows = mysqli_num_rows($sql_result);
			// se esiste una sola opzione la seleziono di default
			if ($num_rows == 1) {
				$row = mysqli_fetch_assoc($sql_result);
				echo "<input type='radio' name='materia' value='{$row['id_materia']}' checked>{$row['id_materia']}<br>";
			} else {
				// se ne esiste piu' di una allora fornisco la selezione con i radio button
				for ($i = 0; $i < $num_rows; $i++) {
					$row = mysqli_fetch_assoc($sql_result);
					echo "<input type='radio' name='materia' value='{$row['id_materia']}'";
					echo ($old['materia'] == $row['id_materia'] ? 'checked' : ''); // reinserisco la vecchia materia selezionata
					echo ">{$row['id_materia']}<br>";
				}
			}

			?>

			<br>
			<!-- Da usare label per prompt -->
			Testo della domanda <br>
			<textarea name="testo" cols=50 rows=10><?php echo $old['testo'] ?></textarea> <br><br>
			Punti da assegnare alla domanda <input type="number" value="<?php echo $old['punteggio'] ?>" name="punteggio" min="0"> <br><br> <!-- inserisco il vecchio unteggio -->

			<input type="hidden" name="img" value="<?php echo $old['img_url'] ?>">
			<!-- non posso mettere un valore all'input file per motivi di sicurezza,
			 quindi mi passo l'url attraverso un input hidden e gestisco quale usare nella pagina successiva -->
			<div onclick="click_image()">
				immagine relativa
				<img style="max-height: 100px; max-width: 100px" src="/<?php echo $old['img_url'] ?>" alt="immagine inserita" id="img_show">
			</div>
			<input type="file" name="immagine" accept="image/*" id="image_selector" oninput="show_img()"><br><br>


			<label for="tipo"> Tipo di domanda </label>
			<select name="selezione-tipo" id="tipo" onchange="change()">
				<!-- come al solito seleziono nel dropdown il valore usato precedentemente -->
				<option value="0" <?php echo $old['tipo'] == 0 ? "selected" : "" ?>>Risposta multipla</option>
				<option value="1" <?php echo $old['tipo'] == 1 ? "selected" : "" ?>>Testo bucato</option>
				<option value="2" <?php echo $old['tipo'] == 2 ? "selected" : "" ?>>Vero e False</option>
			</select> <br><br>

			<div id="numeri-input">
				<!-- infine reinserisco il precedente di risposte -->
				numero risposte <input type="number" min="1" max="15" value="<?php echo isset($old['num']) ? $old['num'] : '' ?>" name="n-risposte" required>
			</div>
			<br><br>
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

			fix_default_img();
		</script>

	</div>
</body>