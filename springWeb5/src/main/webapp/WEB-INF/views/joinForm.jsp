<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="./resources/css/table.css">
<link rel="stylesheet" type="text/css" href="./resources/css/frame.css">
<style>
section{
	width: 30%;
	margin: auto;
	margin-top: 100px;
}
table{
	width: 100%;
}
table td, th{
	padding: 10px 20px;
}
.bottom{
	text-align: center;
	margin-top: 30px;
}
</style>
</head>
<body>
<%@ include file="header2.jsp" %>
<section>
<h1>회원 가입</h1>
<form action="join" method="post">
	<table>
		<tr>
			<th>ID</th>
			<td>
				<input type="text" placeholder="ID중복확인 이용">
			</td>
			<td>
				<input type="button" value="ID 중복확인" onclick="location.href='checkId'">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="2">
				<input type="password" placeholder="비밀번호 입력"><br>
				<input type="password" placeholder="비밀번호 다시 입력">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="2">
				<input type="text" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="2">
				<input type="text" placeholder="이메일 입력">
			</td>
		</tr>
		<tr>
			<th>고객구분</th>
			<td colspan="2">
				<label><input type="radio" name="type">개인</label>
				<label><input type="radio" name="type">기업</label>
			</td>
		</tr>
		<tr>
			<th>식별번호</th>
			<td colspan="2">
				<input type="text" placeholder="개인:주민번호 / 법인:사업자번호">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="2">
				<input type="text" placeholder="주소 입력">
			</td>
		</tr>
	</table>
	<div class="bottom">
		<input type="submit" value="가입">
		<input type="reset" value="다시 쓰기">
	</div>
</form>
</section>
</body>
</html>