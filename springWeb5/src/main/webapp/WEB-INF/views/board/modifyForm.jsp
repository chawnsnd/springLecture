<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
<style>
table {
	width: 100%;
}
table th, td{
	padding: 10px 20px;
}
table td *{
	width: 100%;
}
.bottom{
	margin-top: 30px;
	text-align: right;
}
</style></head>
<body>
	<%@ include file="../layout/header.jsp" %>
	<section>
	<h1>글수정</h1>
	<form action="modify" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" value="글쓰기 연습입니다."></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" style="resize: none;">글쓰기 연습입니다.
					글쓰기 연습입니다.</textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
					<input type="file">
				</td>
			</tr>
		</table>
		<div class="bottom">
			<input type="submit" value="수정">
		</div>
	</form>
	</section>
</body>
</html>