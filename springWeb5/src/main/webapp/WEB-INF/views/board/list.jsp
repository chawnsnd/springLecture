<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
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
.cur_page {
	font-weight: bold;
}
.bottom{
	text-align: center;
}
.write_btn{
	float: right;
}
</style>
<script>
function movePage(page){
	var searchText = document.getElementById("search_text").value;
	if(page==null){
		page = 1;
	}
	location.href="list?page="+page+"&searchText="+searchText;
}
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section>
	<h1 class="board_title" onclick="location.href='list'">연습 게시판</h1>
	<div>
		<span class="count">
		<c:if test="${searchText != '' }">		
		${searchText}(으)로 검색 : ${boardCount }
		</c:if>
		<c:if test="${searchText == '' }">		
		전체 : ${boardCount }
		</c:if>
		</span>
		<c:if test="${sessionScope.loginId != null }">
		<div class="write_btn">
			<input id="write_button" type="button" value="글쓰기" onclick="location.href='write'">
		</div>
		</c:if>
	</div>
	<table>
		<colgroup>
		<col style="width: 7%">
		<col>
		<col style="width: 12%">
		<col style="width: 7%">
		<col style="width: 7%">
		<col style="width: 10%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>추천수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="board" items="${boardList }">
		<tr class="item" onclick="location.href='read?boardnum=${board.boardnum}'">
			<td>${board.boardnum}</td>
			<td class="title">${board.title }</td>
			<td>${board.id }</td>
			<td>${board.hits }</td>
			<td>${board.likes }</td>
			<td>${board.inputdate }</td>
		</tr>
		</c:forEach>
	</table>
	<div class="bottom">
	<p>
		<span onclick="movePage(1)">처음</span><span onclick="movePage(${navi.currentPage-1})">◀</span>
		<c:forEach var="num" begin="${navi.startPageGroup }" end="${navi.endPageGroup}">
		<c:if test="${navi.currentPage == num}">
		<span class="cur_page" onclick="location.href='list?page=${num}'">${num}</span>
		</c:if>
		<c:if test="${navi.currentPage != num}">
		<span onclick="movePage(${num})">${num}</span>
		</c:if>
		</c:forEach>
		<span onclick="movePage(${navi.currentPage+1})">▶</span><span onclick="movePage(${navi.totalPageCount})">끝</span>
	</p>
	<p>
		제목 : <input type="text" id="search_text" value="${searchText }">
		<input type="submit" value="검색" onclick="movePage()">
	</p>
	</div>
</section>
<%-- <%@ include file="../layout/footer.jsp" %> --%>
</body>
</html>