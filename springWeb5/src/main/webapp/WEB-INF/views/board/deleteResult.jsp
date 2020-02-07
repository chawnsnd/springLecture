<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글읽기</title>
<script src="https://kit.fontawesome.com/74fba7f134.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
<style>
section{
	text-align: center;
}
.bottom>span{
	cursor: pointer;
}
.bottom>span:hover{
	text-decoration: underline;
}
</style>
</head>
<body>
	<%@ include file="../layout/header.jsp" %>
	<section>
	<c:if test="${deleteSuccess == 'true'}">
	<h1>삭제하였습니다.</h1>
	</c:if>
	<c:if test="${deleteSuccess == 'false'}">
	<h1>삭제할 수 없습니다.</h1>
	</c:if>
	<c:if test="${authSuccess == 'false'}">
	<p>삭제할 수 있는 권한이 없습니다.</p>
	</c:if>
	<div class="bottom">
		<span onclick="location.href='<c:url value="/board/list"/>'">목록보기</span>
	</div>
	</section>
</body>
</html>