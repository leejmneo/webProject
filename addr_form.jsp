<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR" import="jspbook.ch08.*"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>�ּҷ� ���</title>
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
<h2>�ּҷ� ���</h2>
<hr>
<form name=form1 method="post" action=addr_add.jsp>
<table>
<tr>
<td>�̸�</td>
<td><input type=text size=20 name=username></td>
</tr>
<tr>
<td>��ȭ��ȣ</td>
<td><input type=text size = 20 name=tel></td>
</tr>
<tr>
<td>�̸���</td>
<td><input type=text size = 20 name=email></td>
</tr>
<tr>
<td>����</td>
<td>
<select name=sex>
<option selected>��</option>
<option>��</option>
</select>
</td>
</tr>
<tr>
<td>�׷�</td>
<td>
<select name=group>
<option selected>����</option>
<option>ģ��</option>
<option>����</option>
</select>
</td>
</tr>
<tr><td colspan=2 align="center">
<input type=submit value="Ȯ��">
<input type=reset value="���">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>