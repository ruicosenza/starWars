<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de planeta</title>
</head>
<body>
	<h1>Cadastro de um novo planeta</h1>
	<form action="/starWars/planetas" method="POST">
		<div>
			<label>Nome</label> <input type="text" name="nome">
		</div>
		<div>
			<label>Clima</label> <input type="text" name="clima">
		</div>
		<div>
			<label>Terreno</label> <input type="text" name="terreno">
		</div>
		<button type="submit">Cadastrar</button>
	</form>
</body>
</html>