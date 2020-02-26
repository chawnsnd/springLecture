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
		getUserInfo(accessToken);
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
function getUserInfo(accessToken){
	$.ajax({
		url: "users/info",
		method: "get",
		contentType: "application/json",
		success: function(user,xhr, aaa) {
			console.log(user)
			console.log(xhr)
			console.log(aaa)
			console.log("썽공")
		},
		error: function(e){
			console.log(e);
			console.log("씰패")
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
아이디 : <input type="text" id="id"><br>
패스워드 : <input type="password" id="password"><br>
<button id="login_btn">로그인</button>
<a href="joinForm">회원가입</a>
<br>
<button id="info_btn">회원정보</button>
</body>
</html>
