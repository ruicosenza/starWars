<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	.TFtable{
		width:100%; 
		border-collapse:collapse; 
	}
	.TFtable td{ 
		padding:7px; border:#4e95f4 1px solid;
	}
	/* provide some minimal visual accomodation for IE8 and below */
	.TFtable tr{
		background: #b8d1f3;
	}
	/*  Define the background color for all the ODD background rows  */
	.TFtable tr:nth-child(odd){ 
		background: #b8d1f3;
	}
	/*  Define the background color for all the EVEN background rows  */
	.TFtable tr:nth-child(even){
		background: #dae5f4;
	}
</style>

<meta charset="UTF-8">
<title>Que a força esteja com você</title>
</head>
<body>
	<h1 align="center">Lista de Planetas cadastrados manualmente</h1>
	<div>${sucesso}</div>
	<div style="width: 100%; overflow: auto;">
		<table
			style="width: 100%; align-self: center; border: 5px; border-collapse: collapse; overflow: auto;" border="1"
			class="TFtable">
			<tr>
				<td colspan="5"
					style="text-align: center; font-weight: bold; margin-bottom: 80px;">
					<a href="${s:mvcUrl('PC#form').build() }">Adicionar novo
						planeta</a>
				</td>
			</tr>
			<tr>
				<td style="width: 10%; text-align: center; font-weight: bold;">ID</td>
				<td style="width: 20%; text-align: center; font-weight: bold;">Nome</td>
				<td style="width: 35%; text-align: center; font-weight: bold;">Clima</td>
				<td style="width: 30%; text-align: center; font-weight: bold;">Terreno</td>
				<td style="width: 5%; text-align: center; font-weight: bold;"></td>
			</tr>
			<c:forEach items="${planetas}" var="planeta">
				<tr>
					<td>${planeta.id}</td>
					<td>${planeta.nome}</td>
					<td>${planeta.clima}</td>
					<td>${planeta.terreno}</td>
					<td><form:form
							action="${s:mvcUrl('PC#excluir').arg(0, planeta.id).build() }"
							method="POST">
							<input type="submit" value="Excluir" alt="Excluir"
								title="Excluir" />
						</form:form></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5" style="align-self:center; margin-top: 80px; text-align: center;">
				<a href="${s:mvcUrl('HC#home').build() }">Ir para a consulta da API</a></td>
			</tr>
		</table>
	</div>
</body>
</html>