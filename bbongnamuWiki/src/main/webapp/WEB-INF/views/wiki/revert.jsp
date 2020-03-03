<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${wiki.title}(${wiki.historynum}판으로 되돌리기) - 뽕나무위키</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
<style>
#textarea_content {
	width: 100%;
	height: 500px;
	resize: none;
}

#explanation_input {
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<main>
		<%@ include file="../layout/aside.jsp"%>
		<article>
			<h1 class="pointer underline" onclick="location.href='view?title=${wiki.title}'">${wiki.title} (${wiki.historynum}판으로 되돌리기)</h1>
			<form id="revert_form" action="revert" method="post"
				onsubmit="return check()">
				<p>
					<textarea name="content" id="textarea_content" disabled="disabled">${wiki.content}</textarea>
				</p>
				<p>
					설명<br> <input type="text" name="explanation"
						id="explanation_input">
				</p>
				<input type="text" name="title" value="${wiki.title}"
					hidden="hidden"> <input type="text" name="historynum"
					value="${wiki.historynum}" hidden="hidden"> <input class="blue fill right"
					type="submit" value="되돌리기">
			</form>
		</article>
	</main>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>