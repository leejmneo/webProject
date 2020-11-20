<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.ch08.*" %>
     <%request.setCharacterEncoding("utf-8"); %>
	<%@ page import = "java.util.ArrayList" %>
	<%@ page import = "java.util.List" %>
    <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주소록 목록</title>
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
<h2>주소록 (전체보기)</h2>
<hr>
<a href="addr_form.jsp">주소추가</a><P>
<table>
<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td><td>그룹</td></tr>
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
