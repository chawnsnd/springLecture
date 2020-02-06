<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/frame.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/table.css"/>">
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
</head>
<script>
	function checkJoin(){
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
		var id = document.getElementById("id");
		var password = document.getElementById("password");
		var passwordCheck = document.getElementById("passwordCheck");
		var name = document.getElementById("name");
		if((id.value == null || id.value == '') ||
			(password.value == null || password.value == '') ||
			(passwordCheck.value == null || passwordCheck.value == '') ||
			(name.value == null || name.value == '')){
			return false;
		}else{
			return true;
		}
	}
	function checkId(){
		window.open("checkId", "ID 중복확인", "width=400, height=300, left=300, top=300");
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
<body>
<%@ include file="../layout/header2.jsp" %>
<section>
<h1>회원 가입</h1>
<form action="join" method="post" onsubmit="return checkJoin()">
	<table>
		<tr>
			<th colspan="3">필수입력</th>
		</tr>
		<tr>
			<th>ID</th>
			<td>
				<input type="text" id="id" name="id" placeholder="ID 중복확인 이용" readonly="readonly">
			</td>
			<td>
				<input type="button" id="idCheck" name="idCheck" value="ID 중복확인" onclick="checkId()">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="password" name="password" placeholder="비밀번호 입력"><br>
				<input type="password" id="passwordCheck" placeholder="비밀번호 다시 입력" onkeyup="checkPassword()">
			</td>
			<td>
				<span class="msg" id="passwordOk" hidden="hidden">비밀번호가<br>같습니다.</span>
				<span class="msg" id="passwordErr" hidden="hidden">비밀번호가<br>다릅니다.</span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="2">
				<input type="text" id="name" name="name" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<th colspan="3">선택입력</th>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="2">
				<input type="text" id="email" name="email" placeholder="이메일 입력">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td colspan="2">
				<input type="text" id="phone" name="phone" placeholder="전화번호 입력">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="2">
				<input type="text" id="address" name="address" placeholder="주소 입력">
			</td>
		</tr>
	</table>
	<c:if test="${joinFailed }">
	<div class="err">회원가입에 실패했습니다.</div>
	</c:if>
	<div class="bottom">
		<input type="submit" value="가입">
		<input type="reset" value="다시 쓰기">
		<fieldset style="margin-top: 20px; border: 1px solid #dee3eb;">
		<legend style="color: grey; text-align: left;">Sign in with</legend> 
		<img style="vertical-align: middle; cursor: pointer;" width="50%" src="<c:url value="/resources/img/naver_login.PNG"/>" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Bh9GX6eaqwK4vmyWdvGV&state=STATE_STRING&redirect_uri=http://localhost:8888/web5/member/naverLogin'"/>
		</fieldset>
	</div>
</form>
</section>
</body>
</html>