<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
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
	min-width: 50px;
}
.bottom{
	text-align: center;
	margin-top: 30px;
}
#passwordOk{
	color: green;
}
#passwordErr{
	color: red;
}
.err{
	color: red;
}
</style>
<script>
function checkUpdate(){
	if(!checkNull()){
		alert("아이디, 비밀번호, 이름은 필수입력 항목입니다.");
		return false;
	}else if(!checkId()){
		alert("아이디를 확인해주세요.");
		return false;
	}else if(!checkPassword()){
		alert("비밀번호가 일치하지 않습니다.")
		return false;
	}else{
		return true;
	}

}
function checkNull(){
	var password = document.getElementById("password");
	var passwordCheck = document.getElementById("passwordCheck");
	var name = document.getElementById("name");
	if((password.value == null || password.value == '') ||
		(passwordCheck.value == null || passwordCheck.value == '') ||
		(name.value == null || name.value == '')){
		return false;
	}else{
		return true;
	}
}
function checkId(){
	return true;
}
function checkPassword(){
	var password = document.getElementById("password");
	var passwordCheck = document.getElementById("passwordCheck");
	var ok = document.getElementById("passwordOk");
	var err = document.getElementById("passwordErr");
	if(password.value === passwordCheck.value){
		ok.hidden = false;
		err.hidden = true;
		return true;
	}else{
		ok.hidden = true;
		err.hidden = false;
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section>
<h1>개인 정보 수정</h1>
<form action="info" method="post" onsubmit="return checkUpdate()">
<table>
	<tr>
		<th colspan="3">
			필수입력
		</th>
	</tr>
	<tr>
		<th>ID</th>
		<td colspan="2">
			${member.id }
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" placeholder="비밀번호 입력" id="password" name="password"><br>
			<input type="password" placeholder="비밀번호 다시 입력" id="passwordCheck" name="passwordCheck" onkeyup="checkPassword()">
		</td>
		<td>
			<span class="msg" id="passwordOk" hidden="hidden">비밀번호가<br>같습니다.</span>
			<span class="msg" id="passwordErr" hidden="hidden">비밀번호가<br>다릅니다.</span>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td colspan="2">
			<input type="text" placeholder="이름 입력" value="${member.name }" id="name" name="name">
		</td>
	</tr>
	<tr>
		<th colspan="3">
			선택입력
		</th>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="2">
			<input type="text" placeholder="이메일 입력" value="${member.email }" id="email" name="email">
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="2">
			<input type="text" placeholder="전화번호" value="${member.phone }" id="phone" name="phone">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2">
			<input type="text" placeholder="주소 입력" value="${member.address }" id="address" name="address">
		</td>
	</tr>
</table>
<c:if test="${updateFailed }">
	<div class="err">수정에 실패했습니다.</div>
	</c:if>
<div class="bottom">
	<input type="submit" value="수정">
	<input type="reset" value="다시 쓰기">
</div>
</form>
</section>
</body>
</html>