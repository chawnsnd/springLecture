<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 요청정보의 Parameter 연습 ]</title>
<style>
body {
	background-color: #eaeaea;
}

#main {
	display: inline-block;
	background-color: white;
	margin: auto;
}

form {
	display: inline-block;
}

#title {
	font-weight: bold;
	background-color: salmon;
	font-size: 40px;
	marign-bottom: 20px;
	padding-bottom: 10px;
	color: white;
	border-bottom: 3px solid pink;
}

.name {
	display: inline-block;
	verticle-align: top;
	width: 100px;
	margin-right: 10px;
	font-weight: bold;
	width: 100px
}

.value {
	display: inline-block;
}

input[type='submit'] {
	float: right;
}
</style>
</head>
<body>
	
	<div id="main">
		<div id="title">네이트 회원가입</div>
		<form action="param2" method="post">
			<div class="item">
				<span class="name">아이디</span> <span class="value"><input
					type="text" name="id"> @ nate.com
					<button onclick="alert('준비중인 기능입니다.');">중복확인</button></span>
			</div>
			<div class="item">
				<span class="name">비밀번호</span> <span class="value"><input
					type="password" name="password"></span>
			</div>
			<div class="item">
				<span class="name">비밀번호 확인</span> <span class="value"><input
					type="password" name="checkPassword"></span>
			</div>
			<div class="item">
				<span class="name">이름</span> <span class="value"><input
					type="text" name="name"></span>
			</div>
			<div class="item">
				<span class="name">이메일</span> <span class="value"><input
					type="text" name="email1"> @ <input type="text" name="email2"></span>
			</div>
			<div class="item">
				<span class="name">휴대폰</span> <span class="value"> <select
					name="contury">
						<option value="korea">Korea (82)</option>
						<option value="japan">Japan (00)</option>
				</select> <input type="text" name="phone">
				</span>
			</div>
			<div class="item">
				<span class="name">성별</span> <span class="value"> <input
					type="radio" name="gender" value="male">남자 <input
					type="radio" name="gender" value="female">여자
				</span>
			</div>
			<div class="item">
				<span class="name">생년월일</span> <span class="value"> <select
					name="year">
						<option value="" disabled selected>년도</option>
						<option value="1992">1992</option>
						<option value="1993">1993</option>
				</select><span>년</span> <select name="month">
						<option value="" disabled selected>월</option>
						<option value="1">1</option>
						<option value="2">2</option>
				</select><span>월</span> <select name="date">
						<option value="" disabled selected>일</option>
						<option value="date">9</option>
						<option value="date">10</option>
				</select><span>일</span>
				</span>
			</div>
			<div class="item">
				<span class="name">해외IP차단</span> <span class="value"> <input
					type="radio" name="blockOverseasIP" value="on">ON <input
					type="radio" name="blockOverseasIP" value="off">OFF
				</span>
			</div>
			<input type="submit" value="가입">
		</form>
	</div>
</body>
</html>