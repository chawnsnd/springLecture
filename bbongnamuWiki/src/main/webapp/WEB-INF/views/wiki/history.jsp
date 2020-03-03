<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}(역사)- 뽕나무위키</title>
<link rel="shortcut icon" href="../resources/favicon.ico">
<link href="../resources/css/layout.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<main>
		<%@ include file="../layout/aside.jsp"%>
		<article>
			<h1 onclick="location.href='view?title=${title}'">${title} (역사)</h1>
			<c:if test="${pageNavigator.currentPage!=1}">
			<a href="history?title=${title}&page=${pageNavigator.currentPage-1}">이전</a>
			</c:if>
			<c:if test="${pageNavigator.currentPage!=pageNavigator.totalPageCount}">
			<a href="history?title=${title}&page=${pageNavigator.currentPage+1}">다음</a>
			</c:if>
			<c:forEach var="history" items="${historys}">
				<ul>
					<li>${history.writedate}(
					<a href="view?title=${title}&historynum=${history.num}">보기</a> | 
					<a href="revert?title=${title}&historynum=${history.num}">이 리비전으로 되돌리기</a>) 
					<c:if test="${history.type == 'REVERT' }">
						(${history.revertnum}판으로 되돌림)
					</c:if>
					<c:if test="${history.type == 'DELETE' }">
						(삭제됨)
					</c:if> 
					<c:if test="${history.type == 'CREATE' }">
						(생성됨)
					</c:if>
					${history.num}판 ${history.userId} 
					<c:if test="${history.explanation != null}">
						(${history.explanation})
					</c:if>
					</li>
				</ul>
			</c:forEach>
			<c:if test="${pageNavigator.currentPage!=1}">
			<a href="history?title=${title}&page=${pageNavigator.currentPage-1}">이전</a>
			</c:if>
			<c:if test="${pageNavigator.currentPage!=pageNavigator.totalPageCount}">
			<a href="history?title=${title}&page=${pageNavigator.currentPage+1}">다음</a>
			</c:if>
		</article>
	</main>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>