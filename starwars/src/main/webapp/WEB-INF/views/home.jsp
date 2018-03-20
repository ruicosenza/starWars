<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Star Wars</title>
</head>
<body style="width: 100%; height: 100%;">
	<div style="width: 100%">
		<img style="float: left; height: 100%; width: 100%;"
			src='<c:url value="/resources/images/sw_bg.jpg" />'>
	</div>
	<form action="${s:mvcUrl('PC#api').build() }" method="post" >
	<input name="idPlaneta" type="text"/>
	<input type="submit" value="Consultar"/>
<%-- 		<form:input path="id" />
		<!-- 		<input type="submit" value="Consultar" > -->
		<%-- <input type="button" value="Consultar API" onclick="${s:mvcUrl('PC#getPlanetaAPI').build() }"/> --%>
	</form>
	<div>${nome}</div>
</body>
</html>