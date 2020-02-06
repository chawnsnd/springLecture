<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
<style>
section{
	width: 30%;
	margin: auto;
	margin-top: 100px;
}
table{
	width: 100%;
}
table td{
	padding: 10px 20px;
}
.bottom{
	text-align: center;
	margin-top: 30px;
}
.err{
	color: red;
}
</style>
</head>
<body>
<%@ include file="../layout/header2.jsp" %>
<section>
<h1>로그인</h1>
<form action="login" method="post">
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password"></td>
	</tr>
</table>
<c:if test="${loginFailed }">
	<div class="err">아이디와 비밀번호를 확인해주세요.</div>
</c:if>
<div class="bottom">
	<input type="submit" value="login">
	<fieldset style="margin-top: 20px; border: 1px solid #dee3eb;">
		<legend style="color: grey; text-align: left;">Sign in with</legend> 
		<img style="vertical-align: middle; cursor: pointer;" width="50%" src="<c:url value="/resources/img/naver_login.PNG"/>" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Bh9GX6eaqwK4vmyWdvGV&state=STATE_STRING&redirect_uri=http://localhost:8888/web5/member/naverLogin'"/>
	</fieldset>
	</div>
</form>
</section>
</body>
</html>