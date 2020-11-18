<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspbook.ch08.*"%>
<!DOCTYPE html>
 <%request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="addr" class="jspbook.ch08.AddrBean"/>
 <jsp:setProperty name="addr" property="*"/>
 <jsp:useBean id="am" class="jspbook.ch08.AddrManager" scope="application"/>
 <%
 am.add(addr);
 %>
<html>
<head>
<meta charset="EUC-KR">
<title>등록내용</title>
</head>
<body>
<div align="center">
<h2>등록내용</h2>
이름 : <%=addr.getUsername() %><P>
전화번호 : <%=addr.getTel() %> <P>
이메일 : <%=addr.getEmail() %> <P>
성별 : <%=addr.getSex() %> <P>
그룹 : <%=addr.getGroup() %> <P>
<hr>
<a href="addr_list.jsp">전체 목록보기</a>
&nbsp;
<a href="addr_list_group.jsp">그룹별 목록보기</a>
</div>
</body>
</html>