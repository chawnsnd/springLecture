<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<script>
	function toggleDropdown() {
		var dropdown = document.getElementById("dropdown");
		if (dropdown.classList.contains('dropdown-active')) {
			dropdown.classList.remove('dropdown-active');
		} else {
			dropdown.classList.add('dropdown-active');
		}
	}
</script>
<style>
.header_top {
	width: 65%;
	margin: auto;
	padding: 20px;
	text-align: left;
	display: flex;
}

.undecoration {
	text-decoration: none;
}

.black_to_grey {
	color: black;
}

.black_to_grey:hover {
	color: grey;
}

.grey_to_black {
	color: grey;
}

.grey_to_black:hover {
	color: black;
}

.header_title {
	flex: 1;
	font-size: 30px;
	font-weight: 800;
	cursor: pointer;
	vertical-align: middle;
}

.header_right {
	flex: 1;
	text-align: right;
}

.header_right .header_profile_image {
	vertical-align: middle;
	height: 44px;
	width: 44px;
	cursor: pointer;
}

.header_right>a{
	display: inline-block;
	font-weight: bold;
	margin: auto;
	vertical-align: bottom;
	margin-right: 10px;
}

.header_search_bar {
	display: flex;
	border: 2px solid grey;
	text-align: center;
	vertical-align: middle;
	flex: 1.5;
}

.header_search_bar>input {
	/*     outline: none; */
	padding-left: 15px;
	flex: 6;
	border: none;
	font-size: 18px;
	font-weight: 700;
	vertical-align: middle;
}

.header_search_bar>input:focus {
	border: 2px solid salmon;
}

.header_search_bar>.fa-search {
	flex: 1;
	font-size: 30px;
	cursor: pointer;
	margin: auto;
}

.header_search_bar>.fa-search:hover {
	color: #FF5D4D;
}

.header_bottom {
	padding: 10px;
	background-color: #FF5D4D;
	text-align: left;
	border-bottom: 3px solid #eaeaea;
	border-top: 50px solid gray;
	border-right: 50px solid transparent;
}

.header_menu {
	width: 65%;
	margin: auto;
}

.header_menu>a{
	color: white;
	font-weight: bold;
	margin-right: 20px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-active .dropdown-content {
	display: block;
}

.dropdown-content {
	text-align: left; 
	margin-top : 10px;
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 200px;
	padding: 12px 16px;
	z-index: 1;
	border: 1px solid rgba(27, 31, 35, .15);
	border-radius: 4px;
	box-shadow: 0 1px 15px rgba(27, 31, 35, .15);
	margin-top: 10px;
}
.dropdown-content>* {
	font-weight: bold;
}

</style>
<script src="https://kit.fontawesome.com/74fba7f134.js"
 	crossorigin="anonymous"></script>
<script>
function search(){
	var searchText = document.getElementById("search_text").value;
	location.href="board/list?searchText="+searchText;
}
</script>
</head>
<header>
	<div class="header_top">
		<div class="header_title" onclick="location.href='<c:url value="/"/>'">SpringWeb5</div>
		<div class="header_search_bar">
			<input type="text" id="search_text"> <i class="fas fa-search" onclick="search()"></i>
		</div>
		<div class="header_right">
			<c:if test="${sessionScope.loginId == null }">
				<a class="undecoration black_to_grey"
					href="<c:url value="/member/join"/>">회원 가입</a>
				<a class="undecoration black_to_grey"
					href="<c:url value="/member/login"/>">로그인</a>
			</c:if>
			<c:if test="${sessionScope.loginId != null }">
				<div class="dropdown" id="dropdown">
					<img src="<c:url value="/resources/img/default_profile.png"/>"
						class="header_profile_image" onclick="toggleDropdown()" />
					<div class="dropdown-content">
						<span class="right_content">${loginId } 님</span>
						<hr>
						<a class="undecoration grey_to_black right_content" 
							href="<c:url value="/member/info"/>">개인정보 수정</a>
						<hr>
						<a class="undecoration grey_to_black right_content"
							href="<c:url value="/member/logout"/>">로그아웃</a>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<div class="header_bottom">
		<div class="header_menu">
			<a class="undecoration" href="<c:url value="/board/list"/>">연습 게시판</a>
			<a class="undecoration" href="https://github.com/chawnsnd" target="_blank">깃허브</a>
		</div>
	</div>
</header>
</html>