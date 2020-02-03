<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="./resources/css/table.css">
<link rel="stylesheet" type="text/css" href="./resources/css/frame.css">
<style>
.item:hover{
	cursor: pointer;
	background-color: #eaeaea;
}
.board_title{
	cursor: pointer;
}
table{
	width: 100%;
	text-align: center;
}
table th, td{
	padding: 5px 10px;
}
td.title{
	text-align: left;	
}
p>span {
	cursor: pointer;
	margin: 0 5px;
}
.bottom{
	text-align: center;
}
.write_btn{
	float: right;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<h1 class="board_title" onclick="location.href='board'">연습 게시판</h1>
	<div>
		<span class="count">전체 : 241</span>
		<div class="write_btn">
			<input id="write_button" type="button" value="글쓰기" onclick="location.href='writeBoard'">
		</div>
	</div>
	<table>
		<colgroup>
		<col style="width: 7%">
		<col>
		<col style="width: 12%">
		<col style="width: 7%">
		<col style="width: 10%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="num" begin="253" end="262">
		<tr class="item" onclick="location.href='readBoard?num=${num}'">
			<td>${num}</td>
			<td class="title">연습 연습</td>
			<td>bbb</td>
			<td>0</td>
			<td>2017-02-12</td>
		</tr>
		</c:forEach>
	</table>
	<div class="bottom">
	<p>
		<span>◁◁</span><span>◀</span>
		<c:forEach var="num" begin="1" end="5">
		<span>${num}</span>
		</c:forEach>
		<span>▶</span><span>▷▷</span>
	</p>
	<p>
		<form action="search" method="get">
			제목 : <input type="text">
			<input type="submit" value="검색">
		</form>
	</div>
</section>
</body>
</html>