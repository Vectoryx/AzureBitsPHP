<?php
session_start();
?>
<!DOCTYPE html>
<html lang="it">

<head>
	<title>Login</title>
	<link rel="icon" type="image/png" href="img/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
	<link rel="stylesheet" href="style/style.css" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div class="position-absolute top-50 start-50 translate-middle">

		<div class="login" id="passwd_change">
			<img src="img/logo_nitido_p_o.png" class="img-fluid" alt="logo AzureBits">
			<h4>E' necessario cambiare la password dell'account</h4>
			<form method="POST" action="u_nuova_pwd.php">
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="ori" name="pwd_ori" placeholder="password" required />
					<label for="ori">Password</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="cpy" name="pwd_cpy" placeholder="password" required />
					<label for="cpy">Password</label>
				</div>
				<div style="margin: 5px;">
					<button type="submit" value="Invia" class="btn btn-danger">
						Submit
					</button>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
<html>