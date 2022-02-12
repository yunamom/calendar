<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String yy = request.getParameter("y"); 
String mm = request.getParameter("m"); 

Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);//0~11
int thisY = y; //현재년도 변수


y = (yy != null && !yy.equals(""))?Integer.parseInt(yy):y;
m = (mm != null && !mm.equals(""))?Integer.parseInt(mm)-1:m;
//받아온 month 값을 -1 해준뒤 적용해준다. (month 의 인덱스는 0부터11까지)
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>∙ <%=y %>년 <%=m+1 %>월 ∙</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<form name="frm" method="post" action="index.jsp">
<!-- 데이터를 자기자신에게 넘길수있게한다.-->
</form>
<header>
<h2>∙ Yuna Calendar ∙</h2>
</header>
<section>	
	<table>
		<caption>
<div class="Box">
		<button type="button" onclick="location='index.jsp?y=<%=before_y%>&m=<%=before_m%>'">
		<%=before_m%>월</button>
<div class="selectBox">
	<select name="year" class="select" onchange="if(this.value) location.href=(this.value)">
		<%int test=0;
		for(int y1=(thisY-10); y1<=(thisY+10); y1++){
			String checkY=(y1==y)?"selected":"";
		%>
		<option value="index.jsp?y=<%=y1 %>&m=<%=m+1 %>" <%=checkY %>><%=y1 %>년</option>
		<% test++;
		}
		%>
	</select>
	<span class="icoArrow"><img src="img.png"></span>
	<select name="month" class="select" onchange="if(this.value) location.href=(this.value)">
		<%
		for(int m1=0; m1<12; m1++){
			String checkM=(m1==m)?"selected":"";
		%>
		<option value="index.jsp?y=<%=y %>&m=<%=m1+1 %>" <%=checkM %>><%=m1+1 %>월 </option>
		<%
		}
		%>
	</select>	
</div>
		<button type="button" onclick="location='index.jsp?y=<%=after_y%>&m=<%=after_m%>'">
		<%=after_m%>월</button>
</div>
		</caption>
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
			out.print("<td>∙</td>");
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
		while(count>0 && count<7){
			out.print("<td></td>");
			count++;
		}
		%>
		</tr>
	</table>
</section>
<footer>
by.yunamom
</footer>
</body>
</html>