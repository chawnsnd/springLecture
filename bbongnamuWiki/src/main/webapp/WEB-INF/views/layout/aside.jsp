<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뽕나무위키</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
<link href="../resources/css/layout.css" type="text/css" rel="stylesheet">
<style>
ul{
	padding: 0 20px;
	list-style:none;
}
</style>
</head>
<aside>
	<ul>
		<li><a href="<c:url value="/" />">대문</a></li>
	</ul>
	<hr>
	<form action="<c:url value="/wiki/search" />" method="get" style="display: flex;">
		<input type="text" id="search_wiki" name="keyword" placeholder="위키 검색" style="flex: 3;">
		<input type="submit" id="search_wiki_submit" value="검색" style="flex: 1;">
	</form>
	<hr>
	<div>최근 편집문서</div>
	<ul>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
		<li><a href="#">어쩌구목업</a></li>
	</ul>
	<hr>
	<div>특수기능</div>
	<ul>
		<li><a href="#" onclick="location.href='<c:url value="/wiki/random" />';">랜덤문서</a></li>
		<li><a href="#" onclick="alert('준비중인 기능입니다.');">편집된지 오래된 문서</a></li>
		<li><a href="#" onclick="alert('준비중인 기능입니다.');">내용이 짧은 문서</a></li>
		<li><a href="#" onclick="alert('준비중인 기능입니다.');">내용이 긴 문서</a></li>
	</ul>
</aside>
</html>