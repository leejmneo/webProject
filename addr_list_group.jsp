<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspbook.ch08.*" %>
     <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�׷� �ּ� ���</title>
<style>
table, td {
	border : 1px solid black;
	width: 500px;
	text-align : center;
}
</style>
</head>
<body>
<div align="center">
<h1><a href = "index.jsp" target="_self">WEB PROGRAMING PROJECT</a></h1>
<h2>�ּҷ� (�׷캰 ����)</h2>
<hr>
<a href="addr_form.jsp">�ּ��߰�</a><P>
<table>
<tr><td>�̸�</td><td>��ȭ��ȣ</td><td>�̸���</td><td>����</td><td>�׷�</td></tr>
<%
	for (AddrBean ab : am.getAddrlist()) {
		if (ab.getGroup().equals(("����"))) {
%>
<tr>
<td><%=ab.getUsername() %></td>
<td><%=ab.getTel() %></td>
<td><%=ab.getEmail() %></td>
<td><%=ab.getSex() %></td>
<td><%=ab.getGroup() %></td>
</tr>
<% } }%>
<%
	for (AddrBean ab : am.getAddrlist()) {
		if (ab.getGroup().equals(("ģ��"))) {
%>
<tr>
<td><%=ab.getUsername() %></td>
<td><%=ab.getTel() %></td>
<td><%=ab.getEmail() %></td>
<td><%=ab.getSex() %></td>
<td><%=ab.getGroup() %></td>
</tr>
<% } }%>
<%
	for (AddrBean ab : am.getAddrlist()) {
		if (ab.getGroup().equals(("����"))) {
%>
<tr>
<td><%=ab.getUsername() %></td>
<td><%=ab.getTel() %></td>
<td><%=ab.getEmail() %></td>
<td><%=ab.getSex() %></td>
<td><%=ab.getGroup() %></td>
</tr>
<% } }%>
</table>
</div>
</body>
</html>