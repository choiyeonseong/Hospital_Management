<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Update Appointments' Info </title>
</head>
<style>
div {
    height: 700px;
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

<h1> 예약 정보 수정 </h1>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from ((APPOINTMENT a JOIN PATIENT p on a.PNO = p.PNO) natural join DOCTOR) join NURSE n on p.nno = n.nno where ano = ?";
String anoStr = request.getParameter("ano");

PreparedStatement appst = conn.prepareStatement(sqlStr);
appst.setString(1, anoStr);
ResultSet rs = appst.executeQuery();

while(rs.next()){
	String ano = rs.getString("ano");
	String pname = rs.getString("pname");
	String adate = rs.getString("adate");
	String atime = rs.getString("atime");
	String dname = rs.getString("dname");
	String nname = rs.getString("nname");
	
%>

<FORM action="update-appointment-pro.jsp" method="post">
예약번호 : <input type="text" name="ano" readonly value="<%=ano%>"><br>
환자이름 : <input type="text" name="pname" readonly value="<%=pname%>"><br>
예약날짜 : <input type="text" name="adate" value="<%=adate%>"><br>
예약시간 : <input type="text" name="atime" value="<%=atime%>"><br>
담당의사 : <input type="text" name="dname" readonly value="<%=dname%>"><br>
담당간호사 : <input type="text" name="nname" readonly value="<%=nname%>"><br>

<% 
} 
%>

<br>
<input type="submit" value=수정완료>
</FORM>
<%
rs.close();
appst.close();
conn.close();
%>
</center>
</div>
</body>
</html>