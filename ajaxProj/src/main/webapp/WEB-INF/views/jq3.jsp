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
	$('#btn1').on('click', test1);
	$('#btn2').on('click', test2);
	$('#btn3').on('click', test3);
	$('#select1').on('change', test4);
	$('input[type="checkbox"]').on('change', test5);
	$('#img1').on('mouseover', test6);
	$('#text1').on('keyup', test7);
});

function test1(){
	alert("test1 함수 실행");
}
function test2(){
// 	$('#btn1').off();
// 	$('#btn1').off('click');
	$('#btn1').off('click', test1);
}
function test3(){
	$('#btn1').on('click', test1);
}
function test4(){
	alert("test4 함수 실행");
}
function test5(){
	alert("test5 함수 실행");
}
function test6(){
	alert("test6 함수 실행");
}
function test7(){
	alert("test7 함수 실행");
}
</script>
<body>
	<h1>[ jQuery 이벤트 ]</h1>
	<p><input type="button" value="버튼1" id="btn1"></p>
	<p><input type="button" value="이벤트 연결 해제" id="btn2"></p>
	<p><input type="button" value="다시 이벤트 연결" id="btn3"></p>
	<p>
		<select id="select1">
			<option>option1</option>
			<option>option2</option>
			<option>option3</option>
		</select>
	</p>
	<p>
		<label><input type="checkbox">체크박스1</label>
		<label><input type="checkbox">체크박스2</label>
		<label><input type="checkbox">체크박스3</label>
	</p>
	<p><img src="https://s.pstatic.net/shopping.phinf/20200218_22/c66d8628-5411-495a-9ac7-6fc0662dd804.jpg" id="img1"></p>
	<p><input type="text" id="text1"></p>
</body>
</html>