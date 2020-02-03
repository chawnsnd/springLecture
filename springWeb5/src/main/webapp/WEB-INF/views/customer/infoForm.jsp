<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
<link rel="stylesheet" type="text/css" href="./resources/css/table.css">
<link rel="stylesheet" type="text/css" href="./resources/css/frame.css">
<style>
section{
	width: 30%;
	margin: auto;
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
<%@ include file="header.jsp" %>
<section>
<h1>개인 정보 수정</h1>
<form action="userInfo" method="post">
<table>
	<tr>
		<th>ID</th>
		<td>
			aaa
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" placeholder="비밀번호 입력"><br>
			<input type="password" value="비밀번호 다시 입력">
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<input type="text" placeholder="이름 입력" value="홍길동">
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" placeholder="이메일 입력" value="aaa@aaa.com">
		</td>
	</tr>
	<tr>
		<th>고객구분</th>
		<td>
			<label><input type="radio" name="type">개인</label>
			<label><input type="radio" name="type" checked="checked">기업</label>
		</td>
	</tr>
	<tr>
		<th>식별번호</th>
		<td>
			<input type="text" placeholder="개인:주민번호 / 법인:사업자번호" value="801230-1234572">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2">
			<input type="text" placeholder="주소 입력" value="서울시">
		</td>
	</tr>
</table>
<div class="bottom">
	<input type="submit" value="수정">
	<input type="reset" value="다시 쓰기">
</div>
</form>
</section>
</body>
</html>