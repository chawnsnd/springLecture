<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/frame.css"/>">
<script>
window.onload = function(){
	var id = document.getElementById("id");
	id.focus();
}
function formCheck(){
	var id = document.getElementById("id");
	if(id.value.length < 3 || id.value.length > 12){
		alert('ID는 3~12자로 입력하세요.');
		return false;
	}
	return true;
}
function inputId(unique){
	if(!unique || unique==null){
		alert('ID 중복확인을 완료해주세요.');
		return false;
	}
	opener.document.getElementById('id').value='${id}';
	this.close();
}
</script>
</head>
<body>
	<section>
		<h1>ID 중복 확인</h1>
		<form action="checkId" method="post" onsubmit="return formCheck()">
			<input type="text" name="id" id="id" placeholder="ID 입력"> <input
				type="submit" value="검색">
		</form>
		<c:if test="${id!=null }">
			<c:if test="${unique }">
				<p>${id }: 사용할 수 있는 ID입니다.</p>
			</c:if>
			<c:if test="${!unique }">
				<p>${id }: 이미 사용중인 ID입니다.</p>
			</c:if>
		</c:if>
		<input type="button" value="ID사용하기" onclick="inputId(${unique})">
	</section>
</body>
</html>