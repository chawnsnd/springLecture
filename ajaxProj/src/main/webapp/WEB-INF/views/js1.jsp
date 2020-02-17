<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goTest(){
	history.go(-1);
}
function test1(){
	alert(location.href);
	location.href="js2";
}
function test2(){
	window.open("js2", 'win', '');
}
function test3(){
	if(confirm("이동하시겠습니까?")){
		location.href="js2";
	}
}
// function test4(){
// 	setTimeout(()=>{
// 		location.href="js2";
// 	}, 3000);
// }
function test4(){
	// 1)
	var willExcuteFunc = function(a, b){
		location.href = "js2";
		return a+b;
	};
	setTimeout(willExcuteFunc, 3000);
	
	// 2)
	var willExcuteFunc = ()=>{
		location.href = "js2";
	};
	setTimeout(willExcuteFunc, 3000);
	
	// 3)
	setTimeout(function(){
		location.href = "js2";
	}, 3000);
	
	// 4)
	setTimeout(()=>{
		location.href="js2";
	}, 3000);
}
</script>
</head>
<body>
JS1
<p><a href="js2">js2 보기 (직접 링크)</a></p>
<p><a href="javascript:test1()">js2 보기 (location 이용)</a></p>
<p><a href="javascript:test2()">js2 보기(새창 열기)</a></p>
1. 사용자에게 이동 여부를 묻고 예 누르면 이동 아니오 누르면 현재페이지 그대로
<p><a href="javascript:test3()">js2 보기</a></p>
2. 링크누른후 3초 뒤에 이동
<p><a href="javascript:test4()">js2 보기</a></p>
</body>
</html>