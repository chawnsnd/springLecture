<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
.header_top {
	width: 65%;
	margin: auto;
	padding: 20px;
	text-align: left;	
}
.header_top>.header_title{
	display: inline-block;
	margin: auto;
	font-size: 30px;
	font-weight: 800;
	cursor: pointer;
	vertical-align: middle;
}
.header_top>.search_bar{
    margin-left: 18%;
    height: 40px;
    padding-left: 10px;
    font-size: 18px;
    vertical-align: middle;
    width: 400px;
    font-weight: 700;
    border: 2px solid grey;
    outline: none;
}
.header_top>.search_bar:focus{
	border: 2px solid salmon;
}
.fa-search{
	margin-left: 10px;
	font-size: 30px;
	cursor: pointer;
	vertical-align: middle;
}
.fa-search:hover{
	color: #FF5D4D;
}
.header_bottom{
	padding: 10px;
	background-color: #FF5D4D;
	text-align: right;
	border-bottom: 3px solid #eaeaea;
	border-top: 50px solid gray;
  	border-right: 50px solid transparent;
}
.header_menu{
	width: 65%;
	margin: auto;
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
<script src="https://kit.fontawesome.com/74fba7f134.js" crossorigin="anonymous"></script>
</head>
<header>
	<div class="header_top">
		<div class="header_title" onclick="location.href='<c:url value="/"/>'">SpringWeb5</div>
		<input type="text" class="search_bar">
		<i class="fas fa-search"></i>
	</div>
	<div class="header_bottom">
		<div class="header_menu">
			<c:if test="${sessionScope.authMember == null }">
				<span><a href="<c:url value="/member/join"/>">회원 가입</a></span>
				<span><a href="<c:url value="/member/login"/>">로그인</a></span>			
			</c:if>
			<c:if test="${sessionScope.authMember != null }">
				<span><a href="<c:url value="/member/info"/>">${authMember.id } 님</a></span>
				<span><a href="<c:url value="/member/logout"/>">로그아웃</a></span>
			</c:if>
		</div>
	</div>
</header>
</html>