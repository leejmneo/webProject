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
<title>��ϳ���</title>
</head>
<body>
<div align="center">
<h2>��ϳ���</h2>
�̸� : <%=addr.getUsername() %><P>
��ȭ��ȣ : <%=addr.getTel() %> <P>
�̸��� : <%=addr.getEmail() %> <P>
���� : <%=addr.getSex() %> <P>
�׷� : <%=addr.getGroup() %> <P>
<hr>
<a href="addr_list.jsp">��ü ��Ϻ���</a>
&nbsp;
<a href="addr_list_group.jsp">�׷캰 ��Ϻ���</a>
</div>
</body>
</html>