<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>[ springWeb2 ]</h1>
	<c:if test="${sessionScope.loginId != null}">
	<h3>${sessionScope.loginId }님 환영합니다.</h3>
	</c:if>
	<ul>
	<li><p>JSP 기본 연습</p></li>
		<ol>
			<li><a href="jsp1">JSP의 기본문법</a></li>
			<li><a href="jsp2">Resource의 사용</a></li>
		</ol>
	</ul>
	<ul>
	<li><p>JSTL 연습</p></li>
		<ol>
			<li><a href="jstl1">코어 라이브러리</a></li>
			<li><a href="jstl2">코어 라이브러리2</a></li>
		</ol>
	</ul>
	<ul>
	<li><p>Parameter 연습</p></li>
		<ol>
			<li><a href="param1">POST 방식의 Form 전달</a></li>
			<li><a href="param2">POST 방식의 Form 전달2</a></li>
			<li><a href="param3?num=100&name=abc">GET 방식의 전달</a></li>
			<!-- get 방식은 길이 제한이 있음 -->
		</ol>
	</ul>
	<ul>
	<li><p>session 연습</p></li>
		<ol>
			<li><a href="session1">세션에 값 저장</a></li>
			<li><a href="session2">세션의 값 삭제</a></li>
			<li><a href="session3">세션의 값 확인</a></li>
		</ol>
	</ul>
	<ul>
	<li><p>로그인 연습</p></li>
		<ol>
			<c:if test="${sessionScope.loginId == null}">
			<li><a href="login">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.loginId != null}">
			<li><a href="logout">로그아웃</a></li>
			</c:if>
		</ol>
	</ul>
	<ul>
	<li><p>cookie 연습</p></li>
		<ol>
			<li><a href="cookie1">쿠키에 값 저장</a></li>
			<li><a href="cookie2">쿠키의 값 삭제</a></li>
			<li><a href="cookie3">쿠키의 값 확인 1</a></li>
			<li><a href="cookie4">쿠키의 값 확인 2</a></li>
		</ol>
	</ul>

</body>
</html>