<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1</title>
</head>
<body>
<h1>[ JSP의 기본 문법 ]</h1>
<!-- 페이지 설정 -->
<p>- 지시자 : page, taglib, include</p>

<!-- 자바코드를 자유롭게 쓸수있음 -->
<p>- 스크립틀릿</p>
<%
	// 이곳은 스크립틀릿 영역, 자바 주석 사용
%>

<p>- 주석</p>
<!-- HTML 주석 -->
<!-- <style> -->
<!--  /* css 주석 */ -->
<!-- </style> -->
<!-- <script> -->
<!--  //JavaScript 주석 -->
<!--  /* JavaScript 주석 -->
<!-- </script> -->
<%-- 이건 JSP 주석, 프론트에서 볼 수 없음 --%>

<p>- EL, JSTL</p>
</body>
</html>