<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기</title>
</head>
<body>
<form action="join" method="post">
이름: <input type="text" name="name"><br>
나이: <input type="number" name="age"><br>
주소: <input type="text" name="address"><br>
<input type="submit" value="가입">
</form>
<button onclick="location.href='<c:url value='/' />'">메인화면</button>
</body>
</html>