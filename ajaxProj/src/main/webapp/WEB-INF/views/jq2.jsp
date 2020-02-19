<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(()=>{
	var arr1 = [ 55, 30, 78 ];
	var arr2 = [ 'aaa', 'bbb', 'ccc', 'ddd' ];
	var arr3 = [
		{
			name:'abc', 
			age:20
		}, 
		{
			name:'def', 
			age:30
		}
	];
	var arr4 = [];
	console.log("< array declaration >")
	console.log("var arr1 = [ 55, 30, 78 ];");
	console.log("var arr2 = [ 'aaa', 'bbb', 'ccc', 'ddd' ];");
	console.log("var arr3 = [ { name: 'abc', age: 20 }, { name: 'def', age: 30 } ];");
	console.log("var arr4 = [];");
	console.log("");
	
	console.log("< access to array >")
	console.log("arr1[0]: "+arr1[0]);
	console.log("arr2.length: "+arr2.length);
	console.log("arr2[1].length: "+arr2[1].length);
	console.log("arr3[1].name: "+arr3[1].name);
	console.log("arr3[1].age: "+arr3[1].age);
	console.log("");

	arr4.push(1);
	arr4.push(2);
	arr4.push(3);
	arr4.push(4);
	arr4.pop();
	console.log("< push, pop >")
	console.log("arr4.push(1);");
	console.log("arr4.push(2);");
	console.log("arr4.push(3);");
	console.log("arr4.push(4);");
	console.log("arr4.pop();");
	console.log("");
	
	console.log("< Javascript [].forEach >");
	arr4.forEach((item, idx)=>{
		console.log("arr4["+idx+"]: "+item);
	});
	console.log("< jQuery $.each 1 >");
	$.each(arr4, (idx, item)=>{
		console.log("arr4["+idx+"]: "+item);		
	});
	console.log("< jQuery $.each 2 >");
	$(arr4).each((idx, item)=>{
		console.log("arr4["+idx+"]: "+item);		
	});
	console.log("")
	
	console.log("< check objects of arr3 >")
	$.each(arr3, (idx, obj)=>{
		console.log(idx+1+"번째 사람의 이름: "+obj.name+", 나이: "+obj.age);
	});
	console.log("");

	console.log("< HTML tag >")
	$('p').each((idx, tag)=>{
		console.log(tag);
	});
	console.log("< HTML $(tag).text() >")
	$('p').each((idx, tag)=>{
		console.log($(tag).text());
	});
});
</script>
<body>
	<h1>[ jQuery 배열 ]</h1>
	<p>문장1</p>
	<p>문장2</p>
	<p>문장3</p>
</body>
</html>