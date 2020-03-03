<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
<script>
function checkHeaderSearch(){
	if($("#search_wiki").val()==""){
		return false;
	}
	return true;
}
</script>
<style>
header {
	overflow: hidden;
}
#left{
	float: left;
	font-size: 15px;
	font-weight: bold;
}
#right {
	float: right;
}
</style>
	<div id="left" onclick="location.href='<c:url value="/" />'"
		style="cursor: pointer;">
		<img src="../resources/favicon.ico" id="logo"> <span
			style="color: darkred;">뽕</span><span>나무위키</span>
	</div>
	<div id="right">
		<form action="<c:url value="/wiki/search" />" method="get" onsubmit="return checkHeaderSearch()" style="display: flex;">
			<input type="text" id="header_search_wiki" name="keyword"
				placeholder="위키 검색" style="flex: 3"> <input type="submit"
				id="header_search_wiki_submit" value="검색" style="flex: 1">
		</form>
		<c:if test="${sessionScope.usernum == null}">
			<a href="<c:url value="/user/login" />">로그인</a>
		</c:if>
		<c:if test="${sessionScope.usernum != null}">
			<span onclick="location.href='<c:url value="/user/info" />'">${sessionScope.id}</span>
			<button onclick="location.href='<c:url value="/user/logout" />'">로그아웃</button>
		</c:if>
	</div>
</header>