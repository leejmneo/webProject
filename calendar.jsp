<%-- 
컴퓨터학과 20190997 이지민
 웹브라우저 : 크롬
 --%>
<%@ page import="java.util.Calendar" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!
public String parseDay(int cnt, String day) {
  	if (cnt % 7 == 0) 
  		return ("<font color=\"red\">" + day + "</font>");
  	else if (cnt % 7 == 6)
  		return ("<font color=\"blue\">" + day + "</font>");
  	return ("<font>" + day + "</font>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>problem02</title>

  
<style type="text/css">

font {
	font-size : medium;
}

#header {
	width : 100%;
	height : 40px;
}

#calendar {
	width : 100%;
	border : 1px solid;
    border-collapse : collapse;
	text-align : center;
	margin-top : 10px;
}
#cal_header {
	height : 20px;
	border : 1px solid;
    border-collapse : collapse;
}
#cal_td { 
	height : 40px;
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

	//기본값
	Calendar cal = Calendar.getInstance();
	int year = nowYear;
	int month = nowMonth;
	
	//파라미터가 실려오면
	String sYear = request.getParameter("YEAR");
	String sMonth = request.getParameter("MONTH");
	if(sYear!=null)
		year = Integer.parseInt(sYear);
	if(sMonth!=null)
		month = Integer.parseInt(sMonth);

	cal.set(year, month - 1, 1);

	int num = 1;
	int count = 0;
	int day = cal.get(Calendar.DAY_OF_WEEK) - 1;
	int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	String[] s = { "일", "월", "화", "수", "목", "금", "토" };

	out.println("<table id=\"header\">");
	
	out.println("<tr>" + "<th style=\"text-align:left\">");
	out.print("<a href = \"calendar.jsp?YEAR=" + (year-1));
	out.println("&MONTH=" + month + "\">" + "◀ </a>");	
	out.println(year + "년");
	out.print("<a href = \"calendar.jsp?YEAR=" + (year+1));
	out.println("&MONTH=" + month + "\">" + "▶ </a>" + "</th>");	

	out.print("<th style=\"text-align:center\">");
	out.print("<a href = \"calendar.jsp?YEAR=" + year);
	if (month == 1) 
		out.println("&MONTH=" + month + "\">" + "◀ </a>");	
	else 
		out.println("&MONTH=" + (month-1) + "\">" + "◀ </a>");	
	
	out.println(month + "월");
	out.print("<a href = \"calendar.jsp?YEAR=" + year);
	if (month == 12) 
		out.println("&MONTH=" + month + "\">" + "▶ </a>");	
	else 
		out.println("&MONTH=" + (month+1) + "\">" + "▶ </a>" + "</th>");	
	
	out.print("<th style=\"text-align:right\">");
	out.print("<a href=\"calendar.jsp?YEAR=" + nowYear + "&MONTH=" + nowMonth + "\">");
	out.print(nowYear + "-" + nowMonth + "-" + nowDate);
	out.print("</a>");
	out.println("</th>" + "</tr>");
	out.println("</table>");
	
	out.println("<table id=\"calendar\">");
	
	int row = 6;
	if (day + end > 35)
		row = 7;
	
	for (int i = 0; i < row; i++) { 
		out.print("<tr>");
		for (int j = 0; j < 7; j++) {
			if (i == 0) 
				out.print("<td id=\"cal_header\">" + parseDay(count, s[j]) + "</td>");
			else {
				out.print("<td id=\"cal_td\">");
				if (i == 1) {
					if (j < day)
						out.print(parseDay(count, "&nbsp;"));
					else 
						out.print(parseDay(count, Integer.toString(num++)));
				}
				else if (num > end)
					out.print(parseDay(count, "&nbsp;"));
				else 
					out.print(parseDay(count, Integer.toString(num++)));
			}
			out.print("</td>");
			count++;
		}
		out.println("</tr>");
	}
	out.println("</table>");
%>


</body>
</html>

<%-- 1. 상단 여백 줄이기 ㅇㅇ 테이블 이용
     2. 요일 글씨 행 높이 줄이기 ㅇㅇ cal_header
     3. 6행 달력일 때 조건 걸기 - 시작 요일이 금? 토일이면 row 변수값만 바꾸기 ㅇㅇ day+end >35 면 row = 7
     4. row 가 추가될때 쫍아지지 않았으면 좋겠어. ㅇㅇ cal_header, cal_td 가 height 담당.
      --%>
      
<%-- 1. 토요일 색 파랑 추가 할까말까 !
 
      --%>
      
<%-- 1. 외적 기능
		1) 년도 이동, 월 이동 (기본조건) - 영상으로만 표현되는거는 그냥 글로만 피피티에 남기는게 맞겠지?
		2) 캘린더 테이블 1행은 좁게 표현 (기본조건)
		3) 일요일과 토요일은 색 추가 (기본조건)
		4) 상단 년, 월, 오늘 표시하는 부분 테이블로 한줄에 나란히 표현 (기본조건) - 사진으로 표현될 수 있는거는 캡쳐하고 
		
		5) 월이 1월이면 그 전으로 눌러도 변화 없게(12월도 마찬가지) (옵션조건)
		+
		5) 20년 8월 달력같이 6주가 되어도 달련 모양이 찌그러지지 않게 함 - td로 높이 조절 (추가기능)
		6) 오른쪽 상단 오늘 날짜 누르면 달력이 오늘의 달력으로 변함 (추가기능)
		7) 웹페이지의 크기에 맞춰 동적으로 크기 조절 - width 를 %로 표현 (추가기능)
		
	 2. 코드 기능
	 	1) 달력 출력 부분은 이중 for문을 이용해서 간단하게 코드 짬
--%>