<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.ch08.*" %>
     <%request.setCharacterEncoding("utf-8"); %>
	<%@ page import = "java.util.ArrayList" %>
	<%@ page import = "java.util.List" %>
    <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>
<style>
table, td {
	border : 1px solid black;
	width: 700px;
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
<%
int rpp = 0;
String r = request.getParameter("roll");
if (r == null || r.equals("null")) 
	rpp = 2;
else 
	rpp = Integer.parseInt(r);
String sindex = request.getParameter("sindex");
int currentPage = 0;
if (sindex == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(sindex);
%>
<div align="center">
<a href = "index.jsp" target="_self">
<input id = "go" type = button value = "BACK"></a>
<h2>주소록 (전체보기)</h2>
<form>
<select name = roll>
<option selected>2</option>
<option>3</option>
<option>4</option>
</select>
<a href = "addr_list.jsp">
<input type = submit value = "개 정렬"></a>
</form>
<hr>
<a href="addr_form.jsp">주소추가</a><P>
<table>
<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td><td>그룹</td></tr>
<%
	int startIndex = currentPage * rpp - rpp;
	int lastIndex = currentPage * rpp - 1;
	List<AddrBean> list = am.getAddrlist();
	if (currentPage * rpp > list.size()) {
		lastIndex = list.size() - 1;
	}
	for (int i = startIndex; i <= lastIndex; i++) {
%>
<tr>
<td><%=list.get(i).getUsername() %></td>
<td><%=list.get(i).getTel() %></td>
<td><%=list.get(i).getEmail() %></td>
<td><%=list.get(i).getSex() %></td>
<td><%=list.get(i).getGroup() %></td>
</tr>
<% 
 }%>
</table>
<BR><BR>
<%
int allpage = am.getAddrlist().size() / rpp;
if (am.getAddrlist().size() % rpp != 0)
	allpage++;
for (int i = 1; i <= allpage; i++) {
	if (i != currentPage) {
%>
	<a href="addr_list.jsp?sindex=<%=i%>&roll=<%=r%>"><%=i %>|</a>
<%} else { %>
	<%=i %>|
<%} }%>
</div>
</body>
</html>
