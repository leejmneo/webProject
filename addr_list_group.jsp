<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.ch08.*" %>
     <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 주소 목록</title>
<style>
table, td {
	border : 1px solid black;
	width: 500px;
	text-align : center;
}
#go {
		float : right;
		width : 60px;
		height : 60px;
	}
</style>
</head>
<body>
<div align="center">
<a href = "index.jsp" target="_self">
<input id = "go" type = button value = "BACK"></a>
<h2>주소록 (그룹별 보기)</h2>
<hr>
<a href="addr_form.jsp">주소추가</a>
&nbsp;
<a href="addr_list.jsp">전체 보기</a><P><P>
<table>
<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td><td>그룹</td></tr>
<%
	for (AddrBean ab : am.getAddrlist()) {
		if (ab.getGroup().equals(("가족"))) {
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
		if (ab.getGroup().equals(("친구"))) {
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
		if (ab.getGroup().equals(("직장"))) {
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