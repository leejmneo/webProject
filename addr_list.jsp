<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspbook.ch08.*" %>
     <%request.setCharacterEncoding("utf-8"); %>
	<%@ page import = "java.util.ArrayList" %>
	<%@ page import = "java.util.List" %>
    <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ּҷ� ���</title>
<style>
table, td {
	border : 1px solid black;
	width: 500px;
	text-align : center;
}
</style>
</head>
<body>
<%
int rpp = 2;
String sindex = request.getParameter("sindex");
int currentPage = 0;
if (sindex == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(sindex);
%>
<div align="center">
<h2>�ּҷ� (��ü����)</h2>
<hr>
<a href="addr_form.jsp">�ּ��߰�</a><P>
<table>
<tr><td>�̸�</td><td>��ȭ��ȣ</td><td>�̸���</td><td>����</td><td>�׷�</td></tr>
<%
	int startIndex = currentPage * 2 - 2;
	int lastIndex = currentPage * 2 - 1;
	List<AddrBean> list = am.getAddrlist();
	if (currentPage * rpp > list.size()) {
		rpp--;
	}
	for (int i = 0; i < rpp; i++) {
%>
<tr>
<td><%=list.get(startIndex).getUsername() %></td>
<td><%=list.get(startIndex).getTel() %></td>
<td><%=list.get(startIndex).getEmail() %></td>
<td><%=list.get(startIndex).getSex() %></td>
<td><%=list.get(startIndex).getGroup() %></td>
</tr>
<% 
startIndex = lastIndex;
 }%>
</table>
<BR><BR>
<%
int allpage = am.getAddrlist().size() / 2;
if (am.getAddrlist().size() % 2 != 0)
	allpage = (am.getAddrlist().size() + 1) / 2;
for (int i = 1; i <= allpage; i++) {
	if (i != currentPage) {
%>
	<a href="addr_list.jsp?sindex=<%=i %>"><%=i %>|</a>
<%} else { %>
	<%=i %>|
<%} }%>

</div>
</body>
</html>