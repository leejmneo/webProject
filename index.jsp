<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작 페이지</title>
<style>
	ul{	
		list-style-type: none;
		background-color: #f1f1f1;
		width: 20%;
		position: fixed;
		height: 20%;
		overflow: auto;
	}
	li {
		font-weight: bold;
		display: block;
		color: #000;
		padding: 8px 15px 8px 15px;
	}
	li:hover {
		background-color: #333;
		color: #fff;
	}
	table.index{
		border-collapse: collapse;
		width:80%;
	}
	tr.index{
		border-style: groove;
	}
	#go {
		float : right;
		width : 60px;
		height : 60px;
	}
</style>
</head>
<body>
<ul>	<%--상단 메뉴?--%>
	<li>주소록</li>
	<li>달력</li>
	<li>시간표</li>
</ul>
<div align="center">
	<h1><a href = "index.jsp" target="_self">WEB PROGRAMING PROJECT</a></h1>
	<hr>
	<table class="index">
		<tr class="index">
			<td>
			<a href = "addr_form.jsp" target="_blank">
			<input id = "go" type = button value = "GO"></a>
			<jsp:include page="addr_form.jsp"/>
			</td>
		</tr>
		<tr class="index">
			<td>
			<a href = "calendar.jsp" target="_blank">
			<input id = "go" type = button value = "GO"></a>
			<jsp:include page="calendar.jsp"/>
			</td>
		</tr>
		<tr class="index">
			<td>
			<a href = "Problem03.jsp" target="_blank">
			<input id = "go" type = button value = "GO"></a>
			<jsp:include page="Problem03.jsp"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>