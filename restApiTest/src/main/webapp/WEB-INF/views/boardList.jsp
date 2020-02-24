<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	getBoards();
	
	$("#submit").on("click", function(){
		var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
		var param = {
				"title": title,
				"content": content,
				"writer": writer 	
		}
		postBoard(param);
	});

	function trEvent(){
		$("#boards tr").on("click", function(){
			var boardno = $(this).attr("id");
			getBoard(boardno);
		});
	}

	function btnEvent(){
		$('#patch_btn').on("click", function(){
			var html = "";
			html+="<tr>";
			html+="<th>글번호</th>";
			html+="<td><input type='text' value='"+$("#board_boardno").text()+"'><td>";
			html+="</tr>";
			html+="<tr>";
			html+="<th>제목</th>";
			html+="<td><input id='patch_title' type='text' value='"+$("#board_title").text()+"'><td>";
			html+="</tr>";
			html+="<tr>";
			html+="<th>작성자</th>";
			html+="<td><input id='patch_writer' type='text' value='"+$("#board_writer").text()+"'><td>";
			html+="</tr>";
			html+="<tr>";
			html+="<th>내용</th>";
			html+="<td><input id='patch_content' type='text' value='"+$("#board_content").text()+"'><td>";
			html+="</tr>";
			html+="<tr><td>";
			html+="<button id='patch_submit_btn' data-boardno="+$("#board_boardno").text()+">수정</button>";
			html+="</td></tr>";
			$("#board").html(html);
			patchBtnEvent();
		});
		$('#delete_btn').on("click", function(){
			var boardno = $(this).attr("data-boardno");
			deleteBoard(boardno);
		});
	}

	function patchBtnEvent(){
		$("#patch_submit_btn").on("click", function(){
			var boardno = $(this).attr("data-boardno");
			var title = $("#patch_title").val();
			var writer = $("#patch_writer").val();
			var content = $("#patch_content").val();
			var param = {
					"title": title,
					"content": content,
					"writer": writer 	
			}
			patchBoard(boardno, param);
		})
	}

	function getBoards(){
		$.ajax({
			url: "boards",
			method: "get",
			success: function( data ) {
				var html = "";
				html+="<tr>";
				html+="<th>글번호</th>";
				html+="<th>제목</th>";
				html+="<th>작성자</th>";
				html+="</tr>";
				$.each(data, function(idx, board){
					html+="<tr id="+board.boardno+">";
					html+="<td>"+board.boardno+"</td>";
					html+="<td>"+board.content+"</td>";
					html+="<td>"+board.writer+"</td>";
					html+="</tr>";
				});
				$("#boards").html(html);
				trEvent();
			},
			dataType: "json"
		});
	}

	function postBoard(param){
		$.ajax({
			url: "boards",
			method: "post",
	 		data: JSON.stringify(param),
	 		contentType: "application/json",
			success: function() {
				alert("등록성공");
			},
			error: function(res){
				console.log(res);
			},
			complete: function(){
				getBoards();
			}
		});
	}

	function patchBoard(boardno, param){
		$.ajax({
			url: "boards/"+boardno,
			method: "patch",
			data: JSON.stringify(param),
	 		contentType: "application/json",
			success: function() {
				alert("수정성공");
			},
			error: function(res){
				console.log(res);
			},
			complete: function(){
				getBoard(boardno);
				getBoards();
			}
		});
	}

	function getBoard(boardno){
		$.ajax({
			url: "boards/"+boardno,
			method: "get",
			success: function( board ) {
				var html = "";
				html+="<tr>";
				html+="<th>글번호</th>";
				html+="<td id='board_boardno'>"+board.boardno+"<td>";
				html+="</tr>";
				html+="<tr>";
				html+="<th>제목</th>";
				html+="<td id='board_title'>"+board.title+"<td>";
				html+="</tr>";
				html+="<tr>";
				html+="<th>작성자</th>";
				html+="<td id='board_writer'>"+board.writer+"<td>";
				html+="</tr>";
				html+="<tr>";
				html+="<th>내용</th>";
				html+="<td id='board_content'>"+board.content+"<td>";
				html+="</tr>";
				html+="<tr><td>";
				html+="<button id='patch_btn' data-boardno="+board.boardno+">수정</button>";
				html+="<button id='delete_btn' data-boardno="+board.boardno+">삭제</button>";
				html+="</td></tr>";
				$("#board").html(html);
				btnEvent();
			},
			dataType: "json"
		});
	}

	function deleteBoard(boardno){
		$.ajax({
			url: "boards/"+boardno,
			method: "delete",
			success: function() {
				alert("삭제성공")
			},
			error: function(res){
				console.log(res);
			},
			complete: function(board){
				$("#board").html("");
				getBoards();
			}
		});
	}
})
</script>
<style>
#boards tr{
	cursor: pointer;
}
</style>
</head>
<body>
<table id="board">

</table>
<br>
<b>글작성</b>
<br>
제목<input type="text" id="title"> | 내용<input type="text" id="content"> | 작성자<input type="text" id="writer"><button id="submit">작성</button>
<br>
<table id="boards">

</table>
</body>
</html>