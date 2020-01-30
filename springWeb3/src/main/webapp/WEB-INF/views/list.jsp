<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 회원 조회</title>
</head>
<body>
<h1>[ 모든 회원 ]</h1>
<c:if test="${list==null}">
	<p>등록된 회원이 없습니다.</p>
</c:if>
<c:if test="${list!=null}">
	<c:forEach var="person" items="${list}">
		<p>이름 : ${person.name }</p>
		<p>나이 : ${person.age }</p>
		<p>주소 : ${person.address }</p>
		<hr/>
	</c:forEach>
</c:if>
<button onclick="location.href='<c:url value='/' />'">메인화면</button>
</body>
</html>