<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 - 뽕나무위키</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="../layout/header.jsp"%>
	<main>
		<%@ include file="../layout/aside.jsp"%>
		<article>
			<h1>회원정보</h1>
			<a href="update-password">비밀번호 수정</a>
			<a href="withdrawal">탈퇴</a>
			<div><b>아이디</b></div>
			<div>${user.id}</div>
			<div><b>타입</b></div>
			<div>${user.type}</div>
		</article>
	</main>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>