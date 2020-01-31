<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style>
th {
	width: 150px;
	text-align: left;
}

td {
	width: 300px;
	text-align: left;
}

td.center {
	text-align: center;
}
input, textarea{
	width: 100%;
}
textarea{
	resize: none;
 }
</style>
</head>
<body>
	<h1>[ 방명록 글쓰기 ]</h1>
	<form action="write" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents" id="contents" rows="25" ></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="center"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</body>
</html>