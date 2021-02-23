<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Nurses </title>
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
<h1> 간호사 목록 </h1>

<table border=1>
<tr> <th> 간호사 번호 <th> 성명  <th> 성별 <th> 전화번호 <th> 이메일 </tr>

<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from NURSE where dpno = ?";
String dpnoStr = request.getParameter("dpno");

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setString(1, dpnoStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String dpno = rs.getString("dpno");
	String nname = rs.getString("nname");
	String nno = rs.getString("nno");
	String ngen = rs.getString("ngen");
	String nphone = rs.getString("nphone");
	String nemail = rs.getString("nemail");
%>
<tr> <td> <%=nno %> <td> <a href=update-nurse.jsp?nno=<%=nno %>> <%=nname%></a> <td> <%=ngen %> <td> <%=nphone %> <td> <%=nemail %> </tr>

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