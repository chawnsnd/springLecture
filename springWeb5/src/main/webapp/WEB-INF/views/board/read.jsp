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
.board_title{
	cursor: pointer;
}
table.board{
	width: 100%;
}
table.board.board th, td{
	padding: 10px 20px;
}
table.board th{
	width: 20%;
}
table.board td{
	width: 80%;
	text-align: left;
}
td.contents{
	min-height: 100px;
}
.menu{
	text-align: center;
	margin:20px 0;
}
.menu > span{
	cursor: pointer;
	margin: 0 10px;
}
table.reply{
	width: 100%;
}
table.reply .reply_submit > *{
	text-align: center;
	padding: 10px 20px;
}
table.reply .reply_submit_input{
	width: 100%;
	height: 1.5em;
	border: none;
	outline: none;
}
table.reply .reply_submit_input:focus{
	border-bottom: 1px solid grey;
}
table.reply th, td{
	padding: 5px 10px;
}
table.reply th, td{
	padding: 5px 10px;
}
table.reply th{
	width: 15%;
	text-align: left;
}
table.reply td.reply_contents{
	width: 65%;
	text-align: left;
}
table.reply td.reply_modify{
	width: 10%;
	text-align: center;
}
table.reply td.reply_delete{
	width: 10%;
	text-align: center;
}
.like_box{
	margin: auto;
	width: 120px;
	height: 70px;
	border: 1px solid #dee3eb;
	border-radius: 3px;
	display: flex;
	margin-bottom: 10px;
	cursor: pointer;
}
.like_box>div{
	color: #666;
	text-align: center;
	font-size: 20px;
	margin: auto;
	flex: 1;
}
</style>
</head>
<body>
	<%@ include file="../layout/header.jsp" %>
	<section>
	<h1 class="board_title" onclick="location.href='./list'">연습 게시판</h1>
	<table class="board">
		<tr>
			<th>작성자</th>
			<td>${board.id}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.inputdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.hits }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="contents">
				<pre>${board.contents }</pre>
				<div class="like_box">
					<div><i class="far fa-thumbs-up"></i></div>
					<div>${board.likes }</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td>
				<c:if test="${board.originalfile != null}">
					<a href="${board.savedfile }">${board.originalfile }</a>
				</c:if>
			</td>
		</tr>
	</table>
	<div class="menu">
		<span>삭제</span>
		<span onclick="location.href='modify?boardnum=${board.boardnum}'">수정</span>
		<span onclick="location.href='list'">목록보기</span>
	</div>
	<table class="reply">
		<tr class="reply_submit">
			<th class="reply_submit_id">aaa</th>
			<td colspan="2"><input class="reply_submit_input" type="text" placeholder="리플 추가"></td>
			<td><input type="submit" value="확인"></td>
		</tr>
		<tr>
			<th>bbb</th>
			<td class="reply_contents">bbb가 작성한 리플입니다.22</td>
			<td class="reply_modify"></td>
			<td class="reply_delete"></td>
		</tr>
	</table>
	<table class="reply">
		<tr>
			<th>bbb</th>
			<td class="reply_contents">bbb가 작성한 리플입니다.</td>
			<td class="reply_modify"></td>
			<td class="reply_delete"></td>
		</tr>
	</table>
	<table class="reply">
		<tr>
			<th>aaa</th>
			<td class="reply_contents">리플 내용입니다.</td>
			<td class="reply_modify">[수정]</td>
			<td class="reply_delete">[삭제]</td>
		</tr>
	</table>
	</section>
</body>
</html>