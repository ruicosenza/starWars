<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de planeta</title>
</head>
<body>
	<h1>Cadastro de um novo planeta</h1>
	<form:form action="${s:mvcUrl('PC#gravar').build() }" method="POST" commandName="planeta">
		<div>
			<label>Nome</label> 
			<form:input path="nome" />
			<form:errors path="nome"/>
		</div>
		<div>
			<label>Clima</label> 
			<form:input path="clima" />
			<form:errors path="clima"/>
		</div>
		<div>
			<label>Terreno</label> 
			<form:input path="terreno"/>
			<form:errors path="terreno"/>
		</div>
		<button type="submit">Cadastrar</button>
	</form:form>
</body>
</html>