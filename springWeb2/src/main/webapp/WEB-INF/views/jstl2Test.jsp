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

person : ${person }<br>
list: ${list }<br>

<p>[Person 객체 출력]</p>
이름 : ${person.name }<br>
나이 : ${person.age }<br>
주소 : ${person.address }<br>

<p>[List 출력]</p>
<table border="1">
	<tr>
		<th>이름</th>
		<th>나이</th>
		<th>주소</th>
	</tr>
	<c:forEach var="p" items="${list}">
	<tr>
		<td>${p.name }</td>
		<td>${p.age }</td>
		<td>${p.address }</td>
	</tr>
	</c:forEach>
</table>	
	
</body>
</html>