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

			$query = "SELECT domande.*, COUNT(*) AS num 
					  FROM domande JOIN risposte ON (risposte.id_domanda = domande.ID) 
					  GROUP BY domande.ID 
					  HAVING domande.ID={$_GET['id']};";
			$sql_result = mysqli_query($conn, $query);
			$old = mysqli_fetch_assoc($sql_result);


			// Le materie sono selezionate automaticamente dalla materia insegnata, se esiste solo un'opzione metto un radio button checked e disabled
			$query = "SELECT * FROM materie_docenti WHERE id_docente={$_SESSION["user"]["ID"]};";
			$sql_result = mysqli_query($conn, $query);

			echo "<br>";
			echo "<input type='hidden' name='ID_domanda' value='{$_GET['id']}'>";
			echo "materie <br>";

			$num_rows = mysqli_num_rows($sql_result);
			if ($num_rows == 1) {
				$row = mysqli_fetch_assoc($sql_result);
				echo "<input type='radio' name='materia' value='{$row['id_materia']}' checked>{$row['id_materia']}<br>";
			} else {
				for ($i = 0; $i < $num_rows; $i++) {
					$row = mysqli_fetch_assoc($sql_result);
					echo "<input type='radio' name='materia' value='{$row['id_materia']}'";
					echo ($old['materia'] == $row['id_materia'] ? 'checked' : ''); // reinserisco il vecchio valore
					echo ">{$row['id_materia']}<br>";
				}
			}

			?>

			<br>
			<!-- Da usare label per prompt -->
			Testo della domanda <br>
			<textarea name="testo" cols=50 rows=10><?php echo $old['testo'] ?></textarea> <br><br>
			Punti da assegnare alla domanda <input type="number" value="<?php echo $old['punteggio'] ?>" name="punteggio" min="0"> <br><br>
			<input type="hidden" name="img" value="<?php echo $old['img_url'] ?>">
			immagine relativa <input type="file" name="immagine" accept="image/*"> <br><br>

			<label for="tipo"> Tipo di domanda </label>
			<select name="selezione-tipo" id="tipo" onchange="change()">
				<option value="0" <?php echo $old['tipo'] == 0 ? "selected" : "" ?>>Risposta multipla</option>
				<option value="1" <?php echo $old['tipo'] == 1 ? "selected" : "" ?>>Testo bucato</option>
				<option value="2" <?php echo $old['tipo'] == 2 ? "selected" : "" ?>>Vero e False</option>
			</select> <br><br>

			<div id="numeri-input">
				numero risposte <input type="number" min="1" max="15" value="<?php echo $old['num']?>" name="n-risposte">
			</div>
			<br><br>
			<input type="submit" value="Invia">
		</form>
	</div>
</body>