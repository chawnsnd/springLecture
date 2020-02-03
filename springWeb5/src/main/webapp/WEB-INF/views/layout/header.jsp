<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
.header_title {
	padding: 20px;
	text-align: left;	
}
.header_title>span{
	display: inline-block;
	margin: auto;
	font-size: 30px;
	font-weight: 800;
	cursor: pointer;
}
.header_bottom{
	padding: 10px;
	background-color: salmon;
	text-align: right;
}
.header_bottom a{
	font-size: 14px;
	text-decoration: none;
	font-weight: bold;
	color: white;
	margin-left: 20px;
}
.header_bottom a:hover{
	text-decoration: underline;
}
</style>
</head>
<header>
	<div class="header_title"><span onclick="location.href='./'">[ SpringWeb5 - SE Bank Step 4 ]</span></div>
	<div class="header_bottom">
		<span><a href="join">회원 가입</a></span>
		<span><a href="login">로그인</a></span>
		<span><a href="userInfo">개인정보 수정</a></span>
	</div>
</header>
</html>