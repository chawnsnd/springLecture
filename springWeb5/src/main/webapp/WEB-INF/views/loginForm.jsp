<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="./resources/css/table.css">
<link rel="stylesheet" type="text/css" href="./resources/css/frame.css">
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
</style>
</head>
<body>
<%@ include file="header2.jsp" %>
<section>
<h1>로그인</h1>
<form action="login" method="post">
<table>
	<tr>
		<td>ID</td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password"></td>
	</tr>
</table>
<div class="bottom">
	<input type="submit" value="login">
</div>
</form>
</section>
</body>
</html>