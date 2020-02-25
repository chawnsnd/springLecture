<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" type="text/css" href="./resources/css/handlebars.css">
<script src="./resources/js/jquery-3.4.1.min.js"></script>
<script src="./resources/js/handlebars-v4.7.3.js"></script>
<script src="./resources/js/handlebars-custom.js"></script>
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
	$("#info_btn").on("click", function(){
		var accessToken = getCookie("access_token");
		var signedUserNo = getCookie("signed_user_no");
		getUserInfo(accessToken, signedUserNo);
	})
})
function login(param){
	$.ajax({
		url: "users/login",
		method: "post",
 		data: JSON.stringify(param),
 		contentType: "application/json",
		success: function(res) {
			alert("로그인 성공");
		},
		error: function(res){
			console.log(res);
		},
		complete: function(res){
		}
	});
}
function getUserInfo(accessToken, signedUserNo){
	$.ajax({
		url: "users/info/"+signedUserNo,
		method: "get",
		success: function(res) {
			console.log(res)
		},
		error: function(e){
			console.log(e);
		},
		complete: function(res){
		}
	});
}

function getCookie (cookieName){
  var results = document.cookie.match ( '(^|;) ?' + cookieName + '=([^;]*)(;|$)' );
  if (results)
    return (unescape(results[2]));
  else
    return null;
}
</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="boardList">게시판</a>
<a href="templatePractice">탬플릿</a>
<p>
<div id="login-template" class="template">
{{#if}}
아이디 : <input type="text" id="id"><br>
패스워드 : <input type="password" id="password"><br>
{{/if}}
<button id="login_btn">로그인</button>
<a href="joinForm">회원가입</a>
</div>
<br>
<button id="info_btn">회원정보</button>
</body>
</html>
