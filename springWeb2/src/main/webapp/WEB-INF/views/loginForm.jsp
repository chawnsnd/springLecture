<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function submitForm() {
		var okId = checkId();
		var okPassword = checkPassword();
		if (okId && okPassword) {
			var form = document.getElementById("form");
			form.submit();
		}
	}
	function checkId() {
		var id = document.getElementById("id");
		var idMsg = document.getElementById("idMsg");
		if (id.value == "") {
			idMsg.style.display = "inline-block";
			return false;
		} else {
			idMsg.style.display = "none";
			return true;
		}
	}
	function checkPassword() {
		var password = document.getElementById("password");
		var pwMsg = document.getElementById("pwMsg");
		if (password.value == "") {
			pwMsg.style.display = "inline-block";
			return false;
		} else {
			pwMsg.style.display = "none";
			return true;
		}
	}
</script>
</head>
<body>
	<h1>[ 로그인 ]</h1>
	<form action="login" method="post" id="form">
		<span>아이디<input type="text" name="id" id="id" /></span>
		<span style="display: none; color: green;" id="idMsg">아이디를 입력해주세요.</span><br>
		<span>비밀번호<input type="password" name="password" id="password" /></span>
		<span style="display: none; color: green;" id="pwMsg">비밀번호를 입력해주세요.</span><br>
	</form>
	<button onclick="submitForm()">로그인</button>
	<c:if test="${loginFail }">
		<p style="color: red;">아이디나 비밀번호가 일치하지 않습니다.</p>
	</c:if>
</body>
</html>