<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Appointments </title>
</head>
<style>
div {
    height: 3000px;
    background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%)
}
center {
  margin: auto;
  width: 60%;
}
</style>
<body>
<div>
<center>
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

<h1> 예약 목록 </h1>

<a href="add-appointment-submit.jsp"> 예약 추가 </a><br>
<table border=1>
<tr> <th> 예약 번호  <th> 환자명 <th> 예약날짜 <th> 예약시간 <th> 담당의사  <th> 담당간호사 <th> 삭제 </tr>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");


String sqlStr = "select * from ((APPOINTMENT a JOIN PATIENT p on a.PNO = p.PNO) natural join DOCTOR) join NURSE n on p.nno = n.nno order by ano";

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String ano = rs.getString("ano");
	String pname = rs.getString("pname");
	String adate = rs.getString("adate");
	String atime= rs.getString("atime");
	String dname = rs.getString("dname");
	String nname = rs.getString("nname");
%>
<tr> <td> <a href=update-appointment.jsp?ano=<%=ano %>> <%=ano%></a> 
	 <td> <%=pname %> 
	 <td> <%=adate %> 
	 <td> <%=atime %> 
	 <td> <%=dname %>
	 <td> <%=nname %>
	 <td> <a href="del-appointments.jsp?ano=<%=ano%>"> 삭제 </a>
</tr>

<%
}

%>

</table>

<%

rs.close();
st.close();
conn.close();
%>
</center>
</div>
</body>
</html>