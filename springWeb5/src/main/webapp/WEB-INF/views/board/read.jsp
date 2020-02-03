<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글읽기</title>
<link rel="stylesheet" type="text/css" href="./resources/css/table.css">
<link rel="stylesheet" type="text/css" href="./resources/css/frame.css">
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
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
	<h1 class="board_title" onclick="location.href='board'">연습 게시판</h1>
	<table class="board">
		<tr>
			<th>작성자</th>
			<td>aaa</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>2017-02-19 20:11:18</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>5</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>파일 첨부 테스트입니다.</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="contents">
				파일 첨부 테스트입니다.
				파일 첨부 테스트입니다.
				파일 첨부 테스트입니다.
				파일 첨부 테스트입니다.
			</td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td><a href="#">flower.png</a></td>
		</tr>
	</table>
	<div class="menu">
		<span>삭제</span>
		<span>수정</span>
		<span onclick="location.href='board'">목록보기</span>
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