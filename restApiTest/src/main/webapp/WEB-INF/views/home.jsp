<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<script src="./resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#login_btn").on("click", function(){
		var id = $("#id").val();
		var password = $("#password").val();
		var param = {
				"id": id,
				"password": password
			}
		login(param);
	})
})
function login(param){
	$.ajax({
		url: "users/login",
		method: "post",
 		data: JSON.stringify(param),
 		contentType: "application/json",
		success: function(res) {
			console.log(res);
			alert("로그인성공");
		},
		error: function(res){
			console.log(res);
		},
		complete: function(res){
			console.log(res.getAllResponseHeaders());
		}
	});
}
</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="boardList">게시판</a>
<p>
아이디 : <input type="text" id="id"><br>
패스워드 : <input type="text" id="password"><br>
<button id="login_btn">로그인</button>
<a href="joinForm">회원가입</a>
</body>
</html>
