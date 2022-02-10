<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);

cal.set(y,m,1); //년 , 월 , 1일
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
int lastday = cal.getActualMaximum(Calendar.DATE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
	∙ Calendar ∙
</header>
<section>
	<table>
		<caption><%=y %>년 <%=m %>월</caption>
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
		for(int day=1; day<=lastday; day++){
			if(day%7==0){
			out.print("<tr></tr>");
			}
		%>
			<td><%=day %></td>
			
		<%
		}
		%>
		</tr>
	</table>
</section>
</body>
</html>