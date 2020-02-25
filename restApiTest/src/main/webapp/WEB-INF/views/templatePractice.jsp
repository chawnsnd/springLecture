<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탬플릿 연습</title>
<link rel="stylesheet" type="text/css" href="./resources/css/handlebars.css">
<script src="./resources/js/jquery-3.4.1.min.js"></script>
<script src="./resources/js/handlebars-v4.7.3.js"></script>
<script src="./resources/js/handlebars-custom.js"></script>
<script>
$(document).ready(function(){
	getBoard(1);
})
function getBoard(boardno){
	$.ajax({
		url: "boards/"+boardno,
		method: "get",
		success: function(board) {
			console.log(board);
		},
		error: function(res){
			console.log(res);
		},
		complete: function(board){
			bind("#template1", board);
		},
		dataType: "json"
	});
}
</script>
</head>
<body>
<div id="template1" class="template">
<table>
	<tr>
		<th>제목</th>
		<td>{{title}}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>{{content}}</td>
	</tr>
</table>
</div>
</body>
</html>