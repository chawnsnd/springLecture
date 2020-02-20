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
	var imgs = ['https://s.pstatic.net/shopping.phinf/20200218_22/c66d8628-5411-495a-9ac7-6fc0662dd804.jpg',
		'https://s.pstatic.net/static/www/mobile/edit/2020/0219/cropImg_166x108_24037379203091761.jpeg',
		'https://s.pstatic.net/static/www/mobile/edit/2020/0217/mobile_10491591820.jpg'];
	var curIdx = 0;	
	initImgSlider(imgs);
	$('#prev').on('click', prevImg);
	$('#next').on('click', nextImg);
	

	$('#btn1').on('click', test1);
	$('#btn2').on('click', test2);
	$('#btn3').on('click', test3);
	$('#select1').on('change', test4);
	$('input[type="checkbox"]').on('change', test5);
	$('#img1').on('mouseenter', test6);
	$('#img1').on('mouseleave', test7);

	var imgIdx = 0;
// 	$('#img1').on('click', function(){
// 		imgIdx++;
// 		if(imgIdx >= imgs.length) imgIdx = 0;
// 		$(this).attr('src', imgs[imgIdx]);
// 	});

	$('#text1').on('keyup', test8);
	$('#text2').on('click', function(){
		alert("메롱");
	});
	$('#text3').on('click', function(){
		$('#text2').trigger('click');
	});
	$('#text4').on('click', function(){
		setTimeout(function(){
			$('#text2').trigger('click');
		}, 3000);
	});
	$('.btn').on('click', function(){
		var n = $(this).attr('data-num');
		alert(n);
	})
	$('#btn4').on('click', function(){
		var imgs = ['https://s.pstatic.net/shopping.phinf/20200218_22/c66d8628-5411-495a-9ac7-6fc0662dd804.jpg',
			'https://s.pstatic.net/static/www/mobile/edit/2020/0219/cropImg_166x108_24037379203091761.jpeg',
			'https://s.pstatic.net/static/www/mobile/edit/2020/0217/mobile_10491591820.jpg'];
		var tag = '';
		$.each(imgs, function(index, name){
			tag += '<p><img src="'+name+'"></p>';
		});
		$("#output").html(tag);
	});
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
// 	var width = $(this).width();
// 	var height = $(this).height();
	$(this).css('width', $(this).width()*2);
// 	$(this).css('height', height*2);
}
function test7(){
// 	var width = $(this).width();
// 	var height = $(this).height();
	$(this).css('width', $(this).width()/2);
// 	$(this).css('height', height/2);
}
function test8(){
	alert("test8 함수 실행");
}

function initImgSlider(imgs){
	
	$.each(imgs, function(index, img){
		$('#slider-imgs').append('<img src="'+img+'">');
	});
	for(var i=0; i<imgs.length; i++){
		if(curIdx == i){
			$("#slider-nav").append('<span>●</span>');
		}else{
			$("#slider-nav").append('<span>○</span>');
		}
	};
}
</script>
<style>
.click{
	cursor: pointer;
	border: 1px solid black;
	padding: 5px;
	border-radius: 5px;
	box-shadow: 1px 1px gray;
}
.click:hover{
	background-color: black;
	color: white;
}

#slider-container{
	display: inline-block;
	position: relative;
}

.slider-btn{
	position: absolute;
	top: 50%;
	cursor: pointer;
}
.slider-btn#prev{
	left: 0;
}
.slider-btn#next{
	right: 0;
}
#slider-imgs{
	border: 1px solid red;
}
#slider-img{
	width: 500px;
	height: 300px;
}
#slider-nav{
	position: absolute;
	bottom: 0%;
	cursor: pointer;
	left: 50%;
}
</style>
<body>
	<h1>[ jQuery 이벤트 ]</h1>
	<p><input type="button" value="버튼1" id="btn1" class="btn" data-num="1"></p> <!-- data는 사용자 정의 속성 -->
	<p><input type="button" value="이벤트 연결 해제" id="btn2" class="btn" data-num="2"></p>
	<p><input type="button" value="다시 이벤트 연결" id="btn3" class="btn" data-num="3"></p>
	<p><input type="button" value="내용채우기" id="btn4" class="btn" data-num="4"></p>
	<div id="output"></div>
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
	<!-- $("#img").attr("src") -->
	<p>
		<div id="slider-container">
			<span id="prev" class="slider-btn">prev</span>
			<div id="slider-imgs"></div>
			<span id="next" class="slider-btn">next</span>
			<div id="slider-nav"></div>
		</div>
	</p>
	<!-- $("#text1").val() -->
	<p><input type="text" id="text1"></p>
	<p><span id="text2" class="click">Click</span></p>
	<p><span id="text3" class="click">Click</span></p>
	<p><span id="text4" class="click">Click</span></p>
</body>
</html>