<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Que a força esteja com você</title>
</head>
<body>
	<h1 align="center">Lista de Planetas</h1>
	<div>${sucesso}</div>
	<div style="width: 50px;">
		<table style="width: 100%; align-self: center; border: 5px; border-collapse: collapse;">
			<tr>
				<td colspan="3"
					style="text-align: center; font-weight: bold; margin-bottom: 10px;">
					<%-- 				<form action="${s:mvcUrl('PC#form').build() }" method="get"> --%>
					<%-- 					<input type="button" value="Adicionar novo planeta" onclick="${s:mvcUrl('PC#form').build() }"/> --%>
					<%-- 				</form> --%> 
					<a href="${s:mvcUrl('PC#form').build() }">Adicionar novo planeta</a>
				</td>

			</tr>
			<tr>
				<td style="width: 30%; text-align: center; font-weight: bold;">Nome</td>
				<td style="width: 35%; text-align: center; font-weight: bold;">Clima</td>
				<td style="width: 35%; text-align: center; font-weight: bold;">Terreno</td>
			</tr>
			<c:forEach items="${planetas}" var="planeta">
				<tr>
					<td>${planeta.nome}</td>
					<td>${planeta.clima}</td>
					<td>${planeta.terreno}</td>
					<td><form:form
							action="${s:mvcUrl('PC#excluir').arg(0, planeta.id).build() }"
							method="POST">
							<input type="submit" value="Excluir" alt="Excluir"
								title="Excluir" />
						</form:form></td>
					<%-- 					<td><a href="${s:mvcUrl('PC#excluir').arg(0, planeta.id).build() }" >Excluir</a></td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>