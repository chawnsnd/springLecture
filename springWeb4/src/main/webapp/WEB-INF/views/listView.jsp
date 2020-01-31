<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<script>
	function remove(n){
		var form = document.getElementById("hiddenForm");
		var inputPw = document.getElementById("password"+n);
		var password = document.getElementById("password");
		var num = document.getElementById("num");
		password.value = inputPw.value;
		num.value = n;
		form.submit();
	}

</script>
</head>
<body>
	<h1>[ 방명록 ]</h1>

	<c:forEach var="guestbook" items="${guestbooks }">
		<p>번호: ${guestbook.num } | 작성일시: ${guestbook.inputdate }</p>
		<p>이름: ${guestbook.name }</p>
		<pre>${guestbook.contents }</pre>
		<p><button onclick="modify()">수정</button></p>
		<p>
		<input type="password" id="password${guestbook.num}" placeholder="비밀번호">
		<button onclick="remove(${guestbook.num})">삭제</button>
		</p>
		<hr>
	</c:forEach>
	<form action="delete" id="hiddenForm" method="post">
		<input type="hidden" name="num" id="num">
		<input type="hidden" name="password" id="password">
	</form>
	<p>
		<a href="writeForm">글쓰기</a>
	</p>
</body>
</html>