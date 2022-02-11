<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String yy = request.getParameter("year"); 
String mm = request.getParameter("month"); 

Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);//0~11

if(yy != null && mm != null && !yy.equals("") && !mm.equals("")){
	y = Integer.parseInt(yy);
	m = Integer.parseInt(mm)-1;
}
cal.set(y,m,1); //년 , 월 , 1일
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);//일:1 ~ 토:7
int lastday = cal.getActualMaximum(Calendar.DATE);
//출력 년월의 마지막 날짜

//before 버튼을 위한 세팅 
int before_y = y;
int before_m = m;
if(before_m == 0){
	before_y--;
	before_m = 12;
}
//after 버튼을 위한 세팅 12월이 지나고 13이 아닌 1월이 나오게한다.
int after_y = y;
int after_m = m+2;
if(after_m > 12){
	after_y++;
	after_m = 1;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<form name="frm" method="post" action="cal1.jsp">
<!-- 데이터를 자기자신에게 넘길수있게한다.-->
</form>
<header>
∙ Calendar ∙
</header>
<section>
	<button type="button" onclick="location='cal1.jsp?year=<%=before_y%>&month=<%=before_m%>'">
		<%=before_m%></button>
	<table>
		<caption><%=y %>년 <%=m+1 %>월</caption>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
		<%
		int count = 0; //변수생성		
		
		for(int i=1; i<dayOfweek; i++){
			out.print("<td></td>");
			count++;
		}
		for(int day=1; day<=lastday; day++){
			count++;
			String color=(count%7==1)?"#b56161":(count%7==0)?"#677793":"";
		%>	<td style="color:<%=color%>"><%=day %></td>
		<%
			if(count%7==0){
				out.print("</tr><tr>");
				count=0;
			}
		}
		
		for(int i=0; i<7-count; i++){
			out.print("<td></td>");
		}
		%>
		</tr>
	</table>
	<button type="button" onclick="location='cal1.jsp?year=<%=after_y%>&month=<%=after_m%>'">
	<%=after_m%>월</button>
</section>
</body>
<script src="script.js"></script>
</html>