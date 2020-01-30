<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1명의 회원정보 보기</title>
</head>
<body>
<h1>[ 검색 결과 ]</h1>
<c:if test="${person==null}">
	<p>검색결과가 없습니다.</p>
</c:if>
<c:if test="${person!=null}">
	<p>이름 : ${person.name }</p>
	<p>나이 : ${person.age }</p>
	<p>주소 : ${person.address }</p>
</c:if>
<button onclick="location.href='<c:url value='/' />'">메인화면</button>
</body>
</html>