<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Que a força esteja com você</title>
</head>
<body>
	<h1>Lista de Planetas</h1>
	<div>${sucesso}</div>
	<table>
		<tr>
			<td>Nome</td>
			<td>Clima</td>
			<td>Terreno</td>
		</tr>
		<c:forEach items="${planetas}" var="planeta">
			<tr>
				<td>${planeta.nome}</td>
				<td>${planeta.clima}</td>
				<td>${planeta.terreno}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>