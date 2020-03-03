<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	if(getCookie("recent_wiki") == null){
		init();
	}else{
		console.log(getCookie("recent_wiki"));
		var wikis = getCookie("recent_wiki").split(",");
		var html = "";
		$.each(wikis, function(idx, wiki){
			html += "<li><a href='<c:url value='/wiki/view' />?title="+wiki+"'>"+wiki+"</a></li>";
		})			
		$("#recent_wiki").html(html);
	}
})
function init(){
	$.ajax({
		url : "<c:url value='/wiki/recent-wikis' />",
		type : "get",
		dataType : "json",
		success : function(wikis) {
			var html = "";
			var cookie = "";
			$.each(wikis, function(idx, wiki){
				html += "<li><a href='<c:url value='/wiki/view' />?title="+wiki.title+"'>"+wiki.title+"</a></li>";
				cookie += wiki.title+",";
			})
			setCookie("recent_wiki", cookie, 1);
			$("#recent_wiki").html(html);
		},
		error : function(e) {
			alert("서버와 통신이 실패했습니다.");
			idCheck = false;
		}
	})
}
function setCookie(name, value, minute) {
	var date = new Date();
	date.setTime(date.getTime() + minute*60*1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
}
function getCookie(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
}
</script>
<style>	
aside ul{
	padding: 0 20px;
	list-style:none;
}
</style>
	<ul>
		<li><a href="<c:url value="/" />">대문</a></li>
	</ul>
	<hr>
	<form action="<c:url value="/wiki/search" />" method="get" style="display: flex;">
		<input type="text" id="aside_search_wiki" name="keyword" placeholder="위키 검색" style="flex: 3;">
		<input type="submit" id="aside_search_wiki_submit" value="검색" style="flex: 1;">
	</form>
	<hr>
	<div>특수기능</div>
	<ul>
		<li><a href="#" onclick="location.href='<c:url value="/wiki/random" />';">랜덤문서</a></li>
		<li><a href="#" onclick="alert('준비중인 기능입니다.');">편집된지 오래된 문서</a></li>
		<li><a href="#" onclick="alert('준비중인 기능입니다.');">내용이 짧은 문서</a></li>
		<li><a href="#" onclick="alert('준비중인 기능입니다.');">내용이 긴 문서</a></li>
	</ul>
	<hr>
	<div>최근 편집문서</div>
	<ul id="recent_wiki">
	</ul>
</aside>