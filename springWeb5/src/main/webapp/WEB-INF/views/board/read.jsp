<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글읽기</title>
<script src="https://kit.fontawesome.com/74fba7f134.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/table.css"/>">
<style>
.board_title {
	cursor: pointer;
}

table.board {
	width: 100%;
}

table.board.board th, td {
	padding: 10px 20px;
}

table.board th {
	width: 20%;
}

table.board td {
	width: 80%;
	text-align: left;
}

td.contents {
	min-height: 100px;
}

.menu {
	text-align: center;
	margin: 20px 0;
}

.menu>span {
	cursor: pointer;
	margin: 0 10px;
}

.menu>span:hover {
	text-decoration: underline;
}

table.reply {
	width: 100%;
}

table.reply .reply_submit>* {
	text-align: center;
	padding: 10px 20px;
}

table.reply .reply_submit_input {
	width: 100%;
	height: 1.5em;
	border: none;
	outline: none;
}

table.reply .reply_submit_input:focus {
	border-bottom: 1px solid grey;
}

table.reply th, td {
	padding: 5px 10px;
}

table.reply th, td {
	padding: 5px 10px;
}

table.reply th {
	width: 15%;
	text-align: left;
}

table.reply td.reply_contents {
	width: 65%;
	text-align: left;
}

table.reply td.reply_modify {
	width: 10%;
	text-align: center;
	cursor: pointer;
}

table.reply td.reply_delete {
	width: 10%;
	text-align: center;
	cursor: pointer;
}

.like_box {
	margin: auto;
	width: 120px;
	height: 70px;
	border: 1px solid #dee3eb;
	border-radius: 3px;
	display: flex;
	margin-bottom: 10px;
	cursor: pointer;
}

.like_box>div {
	color: #666;
	text-align: center;
	font-size: 20px;
	margin: auto;
	flex: 1;
}
.like_box.like{
	border: 1px solid salmon;
	color: salmon;
}
.like_box.like>div{
	color: salmon;
}
.reply_modify_input{
	width: 100%
}
</style>
<script>
window.onload = function(){
	<c:if test="${like}">
		$("#like_box").addClass("like");
	</c:if>
	loadReply();
}
function clickLikes(){
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		url: "like",
		data: {boardnum: ${board.boardnum}},
		success: function( data ) {
			if(data.like){
				$("#like_box").addClass("like");
			}else{
				$("#like_box").removeClass("like");
			}
			document.getElementById("like_count").innerHTML = data.likeCount;
		},
		dataType: "json"
	});
}
function loadReply(){
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		url: "<c:url value='/reply/list'/>",
		data: {boardnum: ${board.boardnum}},
		success: function( data ) {
			document.getElementById("replys").innerHTML = "";
			data.replyList.forEach((reply)=>{
				document.getElementById("replys").innerHTML +=
					"<tr>"+
					"<th>"+reply.id+"</th>"+
					"<td class='reply_contents'>"+reply.text+"</td>"+
					<c:if test="${sessionScope.loginId != null && sessionScope.loginId == reply.id}">
					"<td class='reply_modify' id='modify"+reply.replynum+"' onclick='clickModify("+reply.replynum+")'>수정</td>"+
					"<td class='reply_delete' onclick='clickDelete("+reply.replynum+")'>삭제</td>"+
					</c:if>
					<c:if test="${sessionScope.loginId == null || sessionScope.loginId != reply.id}">
					"<td class='reply_modify'></td>"+
					"<td class='reply_delete'></td>"+
					</c:if>
					"</tr>"
				}
			);
		},
		dataType: "json"
	});
}
function clickReplySubmit(){
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		url: "<c:url value='/reply/write'/>",
		method: "post",
		data: {
			boardnum: ${board.boardnum},
			text: document.getElementById("reply_submit_input").value
		},
		complete: function(data){
			console.log(data);
			loadReply();
		},
		dataType: "json"
	});
}

function clickDelete(num){
	$.ajax({
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		url: "<c:url value='/reply/delete'/>",
		data: {
			replynum: num
		},
		complete: function( data ) {
			loadReply();
		},
		dataType: "json"
	});
}

function clickModify(num){
	var button = document.getElementById("modify"+num);
	var oldText = button.parentNode.childNodes[1].innerHTML;
	button.parentNode.childNodes[1].innerHTML =
		"<td><input type='text' class='reply_modify_input' id='reply_modify_input"+num+"' value='"+oldText+"' placeholder='리플 추가' onkeyup='modify("+num+")'></td>";
}
function modify(num){
	if (window.event.keyCode == 13){
		$.ajax({
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			url: "<c:url value='/reply/modify'/>",
			data: {
				replynum: num,
				text: document.getElementById("reply_modify_input"+num).value
			},
			complete: function( data ) {
				loadReply();
			},
			dataType: "json"
		});
	}
}
</script>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
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
				<td class="contents"><pre>${board.contents }</pre>
					<div id="like_box" class="like_box" onclick="clickLikes()">
						<div>
							<i class="far fa-thumbs-up"></i>
						</div>
						<div id="like_count">${board.likes }</div>
					</div></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${board.originalfile != null}">
						<a href="download?boardnum=${board.boardnum}">${board.originalfile }</a>
					</c:if></td>
			</tr>
		</table>
		<div class="menu">
			<c:if test="${sessionScope.loginId != null }">
				<span onclick="location.href='delete?boardnum=${board.boardnum}'">삭제</span>
				<span onclick="location.href='modify?boardnum=${board.boardnum}'">수정</span>
			</c:if>
			<span onclick="location.href='list'">목록보기</span>
		</div>
		<table id="reply" class="reply">
		<c:if test="${sessionScope.loginId !=null }">
			<tr class="reply_submit">
				<th class="reply_submit_id">${sessionScope.loginId }</th>
				<td colspan="2">
					<input id="reply_submit_input" class="reply_submit_input" type="text" placeholder="리플 추가">
				</td>
				<td><input type="button" value="확인" onclick="clickReplySubmit()"></td>
			</tr>
		</c:if>
		</table>
		<table id="replys" class="reply"></table>
	</section>
</body>
</html>