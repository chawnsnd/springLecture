<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>SpringWeb5 - SE Bank Step 4</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
</head>
<style>
.menu{
	text-align: center;
	margin-top: 50px;
	font-size: 20px;
}
.menu > a {
	color: grey;
	text-decoration: none;
}
.menu > a:hover{
	color: black;
}
</style>
<body>
<%@ include file="layout/header.jsp" %>

<div class="menu"><a href="board/list">게시판 바로가기</a></div>
</body>
</html>
