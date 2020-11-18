<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspbook.ch08.*" %>
     <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application" />   
<!-- 아직 미완성 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>그룹 주소 목록</title>
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
<h2>주소록 (그룹별 보기)</h2>
<hr>
<a href="addr_form.jsp">주소추가</a><P>
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
