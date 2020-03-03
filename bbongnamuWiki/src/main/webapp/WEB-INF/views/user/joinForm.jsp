<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	var idCheck = false;
	var passwordCheck = false;
	$(document)
			.ready(
					function() {
						$("#form_id").on("keyup", function() {
							checkId($(this).val());
						});
						$("#form_password")
								.on(
										"keyup",
										function() {
											var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
											if (reg.test($(this).val())) { //정규식으로 바꿀 예정
												$("#password_check").text(
														"사용할 수 있는 비밀번호입니다.");
												passwordCheck = true;
											} else {
												$("#password_check")
														.text(
																"영문, 숫자, 특수문자의 조합으로 8자 이상 설정해주세요.");
												passwordCheck = false;
											}
										});
						$("#join_form").on("submit", function() {
							if (idCheck && passwordCheck) {
								join();
							} else {
								alert("가입에 실패했습니다.");
							}
						});
					});

	function checkId(id) {
		$.ajax({
			url : "idcheck",
			type : "get",
			data : {
				"id" : id
			},
			dataType : "json",
			success : function(data) {
				if (data.result) {
					$("#id_check").text("사용할 수 있는 아이디입니다.");
					idCheck = true;
				} else {
					$("#id_check").text("이미 등록된 아이디입니다.");
					idCheck = false;
				}
			},
			error : function(e) {
				alert("서버와 통신이 실패했습니다.");
				idCheck = false;
			}
		})
	}

	function join() {
		$.ajax({
			url : "join",
			type : "post",
			data : {
				"id" : $("#form_id").val(),
				"password" : $("#form_password").val()
			},
			dataType : "json",
			success : function(data) {
				if (data.result) {
					alert("가입이 성공했습니다.");
					location.href = "/bbongnamu";
				} else {
					alert("가입이 실패했습니다.");
					console.log(data.msg);
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
			<h1>회원가입</h1>
			<form id="join_form" method="post">
				<div>아이디</div>
				<input type="text" id="form_id" name="id">
				<span id="id_check"></span>
				<div>비밀번호</div>
				<input type="password" id="form_password" name="password">
				<span id="password_check"></span>
				<div><input type="submit" id="form_submit" value="가입"></div>
			</form>
		</article>
	</main>
</body>
</html>