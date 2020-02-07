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
.bottom>span{
	float: left;
	cursor: pointer;
}
.bottom>span:hover{
	text-decoration: underline;
}
</style>
<script>
window.onload = function(){
	<c:if test="${authSuccess != null}">
	if(!${authSuccess}){
		alert("권한이 없습니다.");
		location.href="list";
	}
	</c:if>
	<c:if test="${modifySuccess != null}">
	if(!${modifySuccess}){
		alert("제목과 내용을 입력해주세요.");
	}
	</c:if>
}
function checkForm(){
	var title = document.getElementById("title");
	var contents = document.getElementById("contents");
	if(title.value == "" || contents.value == ""){
		alert("제목과 내용을 입력해주세요.")
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<%@ include file="../layout/header.jsp" %>
	<section>
	<h1>글수정</h1>
	<form action="modify" method="post" onsubmit="return checkForm()">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" value="${board.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" id="contents" name="contents" style="resize: none;">${board.contents }</textarea>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
					<input type="file" name="originalfile">
				</td>
			</tr>
		</table>
		<div class="bottom">
			<span onclick="history.back()">뒤로가기</span>
			<input type="submit" value="수정">
		</div>
	</form>
	</section>
</body>
</html>