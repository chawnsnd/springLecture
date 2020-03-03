<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${wiki.title}(편집)- 뽕나무위키</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
<link href="../resources/css/layout.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	function check() {
		if ($("#agree_check").is(":checked")) {
			return true;
		} else {
			alert("문서를 저장하려면 동의에 체크해야 합니다.");
			return false;
		}
	}
</script>
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
			<h1 onclick="location.href='view?title=${wiki.title}'">${wiki.title} 
			<c:if test="wiki.historynum == 0">
			(새로 작성)
			</c:if>
			<c:if test="wiki.historynum != 0">
			(${wiki.historynum}판 편집)
			</c:if>
			</h1>
			<a href="delete?title=${wiki.title}">삭제</a>
			<form id="edit_form" action="edit" method="post"
				onsubmit="return check()">
				<p>
					<textarea name="content" id="textarea_content">${wiki.content}</textarea>
				</p>
				<p>
					설명<br> <input type="text" name="explanation"
						id="explanation_input">
				</p>
				<input type="text" name="title" value="${wiki.title}"
					hidden="hidden">
				<p>
					<label> <input type="checkbox" id="agree_check"> 문서
						편집을 저장하면 당신은 기여한 내용을 기여한 문서에 대한 하이퍼링크나 URL을 이용하여 저작자 표시를 하는 것으로
						충분하다는 데 동의하는 것입니다. 이 동의는 철회할 수 없습니다.
					</label>
				</p>
				<input type="submit" value="저장">
			</form>
		</article>
	</main>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>