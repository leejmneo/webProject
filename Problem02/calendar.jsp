<%-- 
컴퓨터학과 20190997 이지민
 웹브라우저 : 이클립스
 
 --%>
<%@ page import="java.util.Calendar" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!
public String parseDay(int cnt, String day) {
  	String s = "";
  	
  	if (cnt % 7 == 0) {
  		s += "<font color=\"red\">";
	  	s += day;
	  	s += "</font>";
  	}
  	else {
  		s += "<font>";
	  	s += day;
	  	s += "</font>";
  	}
  	
  	return s;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>

  
<style type="text/css">

font {
	font-size : larger;
}

#weight {
	font-weight : 900;
}

#year {
	font-weight : bold;
	text-align : left;
	margin-bottom : 25px;	

}

#month {
	font-weight : bold;
	text-align : center;
	margin-bottom : 25px;	

}

#today {
	font-weight : bold;
	text-align : right; 
	margin-bottom : 25px;	
}

#calendar {
	width : 93%;
	height : 220px;
	border : 1px solid;
    border-collapse : collapse;
	text-align : center;
	margin-top : 10px;
}
	#cal_td { 
	border : 1px solid;
    border-collapse : collapse;
}

</style>
</head>
<body>
<%
	Calendar today = Calendar.getInstance();
	int nowYear = today.get(Calendar.YEAR);
	int nowMonth = today.get(Calendar.MONTH) + 1; 
	int nowDate = today.get(Calendar.DATE);

	String sYear = request.getParameter("YEAR");
	int year = nowYear;
	String sMonth = request.getParameter("MONTH");
	int month = nowMonth;
	
	if(sYear!=null)
		year = Integer.parseInt(sYear);

	if(sMonth!=null)
		month = Integer.parseInt(sMonth);
	
	Calendar cal = Calendar.getInstance();
	cal.set(year, month - 1, 1);
	//cal.set(2021, 0, 1);
	
	int num = 1;
	int count = 0;
	int day = cal.get(Calendar.DAY_OF_WEEK) - 1;
	int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	String[] s = { "일", "월", "화", "수", "목", "금", "토" };
	
	out.print("<div align=\"center\">");
	out.print("<table id=\"calendar\">");
	
	out.println("<div id=\"year\">");
	out.print("<a href = \"calendar.jsp?YEAR=" + (year-1));
	out.println("&MONTH=" + month + "\">" + "◀ </a>");	
	out.println(year + "년");
	out.print("<a href = \"calendar.jsp?YEAR=" + (year+1));
	out.println("&MONTH=" + month + "\">" + "▶ </a>");	
	out.println("</div>");
	
	if (month == 1) {
	out.println("<div id=\"month\">");
	out.print("<a href = \"calendar.jsp?YEAR=" + year);
	out.println("&MONTH=" + month + "\">" + "◀ </a>");	
	}
	else {
		out.println("<div id=\"month\">");
		out.print("<a href = \"calendar.jsp?YEAR=" + year);
		out.println("&MONTH=" + (month-1) + "\">" + "◀ </a>");	
	}
	if (month == 12) {
		out.println(month + "월");
		out.print("<a href = \"calendar.jsp?YEAR=" + year);
		out.println("&MONTH=" + month + "\">" + "▶ </a>");	
		out.println("</div>");
	}
	else {
		out.println(month + "월");
		out.print("<a href = \"calendar.jsp?YEAR=" + year);
		out.println("&MONTH=" + (month+1) + "\">" + "▶ </a>");	
		out.println("</div>");
	}
	
	out.println("<div id=\"today\">" + nowYear + "-" + nowMonth + "-" + nowDate);
	out.println("</div>");
	out.println("<br>");
	
	int row = 6;
	if (day + end > 35)
		row = 7;
	
	for (int i = 0; i < row; i++) { 
		if (i == 0)
			out.print("<tr id=\"week\">");
		else 
			out.print("<tr>");
		
		for (int j = 0; j < 7; j++) {
			out.print("<td id=\"cal_td\">");
			
			if (i == 0) 
				out.print("<div id=\"weight\">" + parseDay(count, s[j]) + "</div>"); 
			else if (i == 1) {
				if (j < day)
					out.print(parseDay(count, "&nbsp;"));
				else 
					out.print(parseDay(count, Integer.toString(num++)));
			}
			else if (num > end)
				out.print(parseDay(count, "&nbsp;"));
			else 
				out.print(parseDay(count, Integer.toString(num++)));
		
			out.print("</td>");
			count++;
		}
	
		
	}
	out.print("</table>");
	out.print("</div>");
%>
</body>
</html>

<%-- 1. 상단 여백 줄이기
     2. 요일 글씨 행 높이 줄이기
     3. 6행 달력일 때 조건 걸기 - 시작 요일이 금? 토일이면 row 변수값만 바꾸기
     4. row 가 추가될때 쫍아지지 않았으면 좋겠어.
      --%>