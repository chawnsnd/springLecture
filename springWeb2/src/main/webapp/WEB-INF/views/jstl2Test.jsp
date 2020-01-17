<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtsl2</title>
</head>
<body>
	<h2>JSTL 연습</h2>
	${num}<br><br>
	${map}<br>
	${map.str}<br>
	${map.num}<br><br>
	<c:forEach var="element" items="${map}">
		${element}
	</c:forEach>
	<br>
	<c:forEach var="element" items="${map}">
		${element.key} / ${element.value}<br>
	</c:forEach>
	
</body>
</html>