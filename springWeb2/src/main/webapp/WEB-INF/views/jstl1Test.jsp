<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtsl1</title>
</head>
<body>
	<!--  pageScope, requestScope, sessionScope, applicationScope -->
	requestScope.str => ${requestScope.str}
	<br> str -> ${str}
	<br> num -> ${num}
	<br> num+1 -> ${num+1}
	<br> num > 50 -> ${num > 50}
	<br> slist -> ${slist}
	<br> data -> ${data}
	<br> data == null -> ${data == null}
	<br>
	<hr>
	<h2>* set, remove 태그</h2>
	<c:set var="n" value="55" />
	<p>n = ${n }</p>
	<c:remove var="n" />
	<p>n = ${n }</p>

	<h2>* if 태그</h2>
	<c:if test="${num == 100 }">
		<p>num은 100입니다.</p>
	</c:if>

	<c:if test="${num != 100 }">
		<p>num은 100이 아닙니다.</p>
	</c:if>

	<c:if test="${data == null }">
		<p>data가 없습니다.</p>
	</c:if>

	<c:if test="${data != null }">
		<p>data가 있습니다.</p>
	</c:if>

	<c:if test="${str == '문자열' }">
		<p>str은 '문자열'입니다.</p>
	</c:if>

	<c:if test="${str != '문자열' }">
		<p>str은 '문자열'이 아닙니다.</p>
	</c:if>

	<h2>* choose 태그</h2>
	<c:choose>
		<c:when test="${num == 100 }">
			<p>num의 값은 100이다.</p>
		</c:when>
		<c:when test="${num == 200 }">
			<p>num의 값은 200이다.</p>
		</c:when>
		<c:otherwise>
			<p>num의 값은 그 밖의 수이다.</p>
		</c:otherwise>
	</c:choose>

	<!-- jstl 구문을 주석처리하고 싶을 경우엔
	<!@ ~~~ @> 사용 -->

	<h2>* forEach 반복문</h2>
	<p>
	<c:forEach var="cnt" begin="1" end="5">
	반복 ${cnt }
	</c:forEach>
	</p>
	<p>
	<c:forEach var="s" items="${slist}">
	${s}
	</c:forEach>
	</p>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>내용</th>
		</tr>
		<c:forEach var="i" begin="0" end="${slist.size() -1}">
		<tr>
			<td>${i }</td>
			<td>${slist[i]}</td>
		</tr>
		</c:forEach>
	</table>
	
	<h2>* out 태그</h2>
	${tag}
	<c:out value="${tag }"/>
	
	<h2>* url 태그</h2>
	<!-- 상대경로 -->
	<p><img src="resources/image/mario.png" width="400px"></p>
	<!-- 절대경로(맞을수도 있고 틀릴수도 있음/지금은 틀림/비추) -->
	<p><img src="/resources/image/mario.png" width="400px"></p>
	<!-- 절대경로(맞을수도 있고 틀릴수도 있음/지금은 맞음/비추) -->
	<p><img src="/web2/resources/image/mario.png" width="400px"></p>
	<!-- 절대경로로 현재상황에 맞게 만들어줌(추천) -->
	<p><img src="<c:url value="/resources/image/mario.png"/>" width="400px"></p>
	
</body>
</html>