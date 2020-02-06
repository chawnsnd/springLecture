<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>SpringWeb5 - SE Bank Step 4</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/table.css"/>">
</head>
<link rel="stylesheet" type="text/css"
</head>
<style>
.section {
	width: 60%;
}

.menu {
	text-align: center;
	margin-top: 50px;
	font-size: 20px;
}

.menu>a {
	color: grey;
	text-decoration: none;
}

.menu>a:hover {
	color: black;
}

.right_top {
	display: inline-block;
	float: right;
	width: 250px;
	border: 1px solid grey;
	padding: 10px 20px;
}

.right_top>.title {
	font-weight: bold;
}

.right_top>.right_top_element {
	margin: 10px 0px;
}
</style>
<body>
	<%@ include file="layout/header.jsp"%>
	<section>
		<div class="right_top">
			<c:if test="${sessionScope.loginId == null }">
			<div class="right_top_element title" style="font-size: 13px;">로그인</div>
			<form action="member/login" method="post">
				<div class="right_top_element">
					아이디 <input type="text" id="id" name="id">
				</div>
				<div class="right_top_element">
					비밀번호 <input type="password" id="passsword" name="password">
				</div>
				<div class="right_top_element">
					<input type="submit" value="로그인"> <input type="button" value="회원가입" onclick="location.href='member/join'">
				</div>
			</form>
			<hr>
			<div class="right_top_element">
				<img src="resources/img/naverLogin.PNG" width="80px" style="cursor: pointer;" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Bh9GX6eaqwK4vmyWdvGV&state=STATE_STRING&redirect_uri=http://localhost:8888/web5/member/naverLogin'">
			</div>
			</c:if>
			<c:if test="${sessionScope.loginId != null }">
			${sessionScope.loginId } 님
			<a href="<c:url value="/member/logout"/>">로그아웃</a>
			</c:if>
		</div>
	</section>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>
