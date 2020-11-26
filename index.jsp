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
</style>
</head>
<body>
<ul>	<%--상단 메뉴?--%>
   <li><a href="#p1">주소록</a></li>
   <li><a href="#p2">달력</a></li>
   <li><a href="#p3">시간표</a></li>
</ul>
<div align="center">
	<h1><a href = "index.jsp" target="_self">WEB PROGRAMING PROJECT</a></h1>
	<hr>
	<table class="index">
		<tr class="index" id="p1">
			<td>
			<jsp:include page = "addr_form.jsp"/>
			</td>
		</tr>
		<tr class="index" id="p2">
			<td>
			<jsp:include page="calendar.jsp"/>
			</td>
		</tr>
		<tr class="index"id="p3">
			<td>
			<jsp:include page="Problem03.jsp"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>