<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.ch08.*"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>주소록 등록</title>
<style>
table, td {
	border : 1px solid black;
}
td {
	padding : 10px 15px 5px 5px;
	width : 70px;
	height : 30px;
}
</style>
</head>
<body>
<div align="center">
<h2>주소록 등록</h2>
<hr>
<form name=form1 method="post" action=addr_add.jsp>
<table>
<tr>
<td>이름</td>
<td><input type=text size=20 name=username></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type=text size = 20 name=tel></td>
</tr>
<tr>
<td>이메일</td>
<td><input type=text size = 20 name=email></td>
</tr>
<tr>
<td>성별</td>
<td>
<select name=sex>
<option selected>남</option>
<option>여</option>
</select>
</td>
</tr>
<tr>
<td>그룹</td>
<td>
<select name=group>
<option selected>가족</option>
<option>친구</option>
<option>직장</option>
</select>
</td>
</tr>
<tr><td colspan=2 align="center">
<input type=submit value="확인">
<input type=reset value="취소">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>