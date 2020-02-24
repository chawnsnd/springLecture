<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#join_btn").on("click", function(){
		var id = $("#id").val();
		var password = $("#password").val();
		var param = {
				"id": id,
				"password": password
			}
		join(param);
	})
})
function join(param){
	$.ajax({
		url: "users",
		method: "post",
 		data: JSON.stringify(param),
 		contentType: "application/json",
		success: function() {
			alert("가입성공");
		},
		error: function(res){
			console.log(res);
		},
		complete: function(){
			location.href = "/restApiTest";
		}
	});
}
</script>
</head>
<body>

아이디 : <input type="text" id="id"><br>
패스워드 : <input type="text" id="password"><br>
<button id="join_btn">가입</button>
</body>
</html>