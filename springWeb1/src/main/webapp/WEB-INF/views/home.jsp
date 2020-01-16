<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>안뇽하살법!</h1>
	<P>받아치기</P>

	<!-- 절대경로는 절대로 쓰지 말것 -->
	<!-- <a href="https://123.123.123.123:8888/web1/join">회원가입하러가기</a> -->
	<!-- <a href="/web1/join">회원가입하러가기</a> -->
	
	<!-- 상대경로 -->
	<p><a href="./join">회원가입</a></p>
	<p><a href="./login">로그인</a></p>
	<p><a href="./read">기사 읽기</a></p>
	<p><a href="param1">Form의 사용자 입력 데이터 서버로 전달</a></p>
	<p><a href="param3">서버로부터 사용자로부터 데이터 전달</a></p>
	<p>${id}님 환영합니다.</p>
<!-- 	<a href="join">회원가입하러가기</a> -->
	
</body>
</html>
