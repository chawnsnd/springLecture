<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
.header_bottom{
	padding: 30px 10px 10px 10px;
	background-color: #FF5D4D;
	border-bottom: 3px solid #eaeaea;
}
.header_bottom span{
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
	color: white;
	margin-left: 20px;
}
</style>
</head>
<header>
	<div class="header_bottom">
		<span onclick="location.href='<c:url value="/"/>'">[ SpringWeb5 - SE Bank Step 4 ]</span>
	</div>
</header>
</html>