<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	//id가 "btn1"인 버튼을 클릭하면 call1()함수 실행됨
	$("#btn1").on('click', call1);
	$("#btn2").on('click', call2);
	$("#form").on('submit', function(){
		var name = $("#name").val();
		var age = $("#age").val();
		var phone = $("#phone").val();
		if(name==""||age==""||phone==""||name==null||age==null||phone==null){
			alert("전부 입력해주세요");
		}else{
			insert(name, age, phone);
		}
	})

	$("#form2").on('submit', function(){
		var name = $("#name").val();
		var age = $("#age").val();
		var phone = $("#phone").val();
		if(name==""||age==""||phone==""||name==null||age==null||phone==null){
			alert("전부 입력해주세요");
		}else{
			insert2(name, age, phone);
		}
	})
	$("#btn3").on('click', call3);
	$("#btn4").on('click', call4);
});
function call1(){
	$.ajax({
		url:"ajaxtest1",
		type:"GET",
		dataType: "text",
		success: output1,
		error: error1
	});
}
function call2(){
	$.ajax({
		url:"ajaxtest2",
		type:"POST",
		data: {str1:'aaaa', str2: 'bbbb'},
		dataType: "text",
		success: function(res){
			alert("서버에서 가져온 문자열 : "+res);
		},
		error: function(e){
			alert("에러 메시지 : "+JSON.stringify(e));
		}
	});
}

function insert(n, a, p){
	$.ajax({
		url: "insert1",
		type: "post",
		data: {name:n, age:a, phone: p},
		success: function(){
			alert("저장되었습니다.");
			$("#name").val();
			$("#age").val();
			$("#phone").val();
			$("#name").select();
			$("#name").focus();
		},
		error: function(){
			alert("저장 실패!");
		}
	});
}

function insert2(n, a, p){
	$.ajax({
		url: "insert2",
		type: "post",
		data: {name:n, age:a, phone: p},
		success: function(){
			alert("저장되었습니다.");
			$("#name2").val();
			$("#age2").val();
			$("#phone2").val();
			$("#name2").focus();
		},
		error: function(){
			alert("저장 실패!");
		}
	});
}

function call3(){
	$.ajax({
		url: "jsontest1",
		type: "get",
		dataType: 'text',
		success: function(ob){
			$("#output1").html(ob);
		},
		error: function(){
			alert("에러");
		}
	});
}

function call4(){
	$.ajax({
		url: "jsontest2",
		type: "get",
		dataType: 'json',
		success: function(ob){
			console.log(ob);
		},
		error: function(){
			alert("에러");
		}
	});
}

function output1(){
	alert("성공");
}
function error1(){
	alert("실패");
}
</script>
</head>
<body>
<h1>ajax</h1>
<p><input type="button" id="btn1" value="서버로 요청 보내기"></p>
<p><input type="button" id="btn2" value="서버로 문자열 보내기/받기"></p>
<form id="form">
<p>이름 : <input type="text" id="name"></p>
<p>나이 : <input type="number" id="age"></p>
<p>핸드폰 번호 : <input type="text" id="phone"></p>
<input type="submit" value="입력">
</form>

<form id="form2">
<p>이름2 : <input type="text" id="name2"></p>
<p>나이2 : <input type="number" id="age2"></p>
<p>핸드폰 번호2 : <input type="text" id="phone2"></p>
<input type="submit" value="저장">

<p><input type="button" id="btn3" value="객체를 문자열로 받기"></p>
<div id="output1"></div>
<p><input type="button" id="btn4" value="객체를 JSON로 받기"></p>
<div id="output2"></div>
</form>
</body>
</html>