<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${wiki.title} - 뽕나무위키</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<main>
	<%@ include file="../layout/aside.jsp"%>
	<article>
		<h1 class="pointer underline" onclick="location.href='view?title=${wiki.title}'">
			${wiki.title}
			<c:if test="${wiki.historynum != 0}"> (${wiki.historynum}판)</c:if>
		</h1>
		<div class="btn_group">
			<button class="green" onclick="location.href='edit?title=${wiki.title}'">편집</button>
			<button class="green" onclick="location.href='history?title=${wiki.title}'">역사</button>
		</div>
		<hr>
		<c:if test="${wiki.historytype == 'DELETE' }">
		<p>이미 삭제된 문서입니다.</p>
		</c:if>
		<p>${wiki.content}</p>
	</article>
	</main>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>