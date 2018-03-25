<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/resources/js/swapi.js"/>"></script>
<script>
	document.addEventListener("DOMContentLoaded", init, false);

	function init() {
		console.log("load");
		var idPlaneta = document.getElementById("idPlaneta").value;

		swapiModule.getPlanet(idPlaneta, function(data) {
			change_myselect(data);
		});

	}

	function change_myselect(data) {
		var obj, dbParam, xmlhttp, myObj, x, txt = "";
		obj = {
			"table" : data,
			"limit" : 20
		};
		dbParam = JSON.stringify(obj);
		txt += "<table border='1' margin-top='10px'>"
		txt += "<tr><td><b>Planeta:</b> </td><td>" + data.name + "</td></tr>";

		txt += "<tr><td><b>Total de:</b> </td><td>" + data.films.length.trim;

		if (data.films.length == 1) {
			txt += "</td><td><b> aparição</b></td></tr>"
		} else {
			txt += "</td><td><b> aparições</b></td></tr>"
		}

		txt += "<tr><td><b>Filme(s) que o planeta apareceu: </b></td></tr>";

		for (i = 0; i < data.films.length; i++) {
			txt += "<tr><td style='margin-left: 20px'><li>" + data.films[i]
					+ "</li></td></tr>";
		}

		txt += "</table>"
		document.getElementById("tb").innerHTML = txt;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consulta a API pública do Star Wars</title>
</head>
<body>
	<h1 align="center">Consulta a API pública do Star Wars</h1>

	<table align="center">
		<tr>
			<td><a href="${s:mvcUrl('HC#planetas').build() }">Ir para lista de planetas</a></td>
		</tr>
	</table>


	Digite um ID de planeta:
	<input type="text" id="idPlaneta">
	<button onclick="init()">Consulte</button>

	<table id="tb" style="border: 1; margin-top: 30px;">

	</table>
</body>
</html>