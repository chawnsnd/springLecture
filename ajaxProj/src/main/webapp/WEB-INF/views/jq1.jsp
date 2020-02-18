<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(()=>{
	alert($('h1')[0].innerHTML);
	$('*').css('font-weight', 'bold');
	$('p').css('color', 'green');
	$('#blueText').css('color', 'blue');
	$('.redText').css('color', 'red');
	$('div.redText > p').css('color', 'gold');
	$('input[type="password"]').css('background-color', 'mistyrose');
});
</script>
<!-- <style> -->
<!--  p{  -->
<!--  	color: green;  -->
<!--  }  -->
<!--  #blueText{  -->
<!--  	color: blue;  -->
<!--  }  -->
<!--  .redText{  -->
<!--  	color: red;  -->
<!--  }  -->
<!-- </style> -->
</head>
<body>
	<h1>[ jQuery ]</h1>
	<p>p태그 사용한 문자열</p>
	<p id="blueText">id가 있는 문자열</p>
	<p class="redText">class가 있는 문자열</p>
	
	<div class="redText">
		<p>div태그 내에 class, 그 안의 p태그</p>	
	</div>
	
	<form>
	ID <input type="text"><br>
	PW <input type="password"><br>
	<input type="submit" value="Login">
	</form>
</body>
</html>