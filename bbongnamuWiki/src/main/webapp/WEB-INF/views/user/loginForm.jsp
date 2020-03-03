<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	function login() {
		$.ajax({
			url : "login",
			type : "post",
			data : {
				"id" : $("#form_id").val(),
				"password" : $("#form_password").val()
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (data.result) {
					location.href = "/bbongnamu";
				} else {
					$("#login_msg").text("가입되지 않은 아이디이거나, 잘못된 비밀번호입니다.");
				}
			},
			error : function(e) {
				alert("서버와 통신이 실패했습니다.");
				console.log(e);
			}
		})
	}
</script>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<main>
		<%@ include file="../layout/aside.jsp"%>
		<article>
			<h1>로그인</h1>
			<form id="login_form" onsubmit="login()" method="post">
				<div>아이디</div>
				<input type="text" id="form_id" name="id">
				<div>비밀번호</div>
				<input type="password" id="form_password" name="password">
				<div id="login_msg"></div>
				<div>
					<input type="submit" id="form_submit" value="로그인">
					<a href="<c:url value="/user/join" />">회원가입</a>
				</div>
			</form>
		</article>
	</main>
</body>
</html>