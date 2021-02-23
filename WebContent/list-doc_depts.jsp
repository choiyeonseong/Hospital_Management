<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Departments </title>
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

<h1> 부서별 </h1>

<table border=1>
<tr> <th> 순번 <th> 부서명 </tr>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String userStr = request.getRemoteUser();

String sqlStr = "select * from DEPT";
PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

while (rs.next()) {
   String dpno = rs.getString("dpno");
   String dpname = rs.getString("dpname");
%>
<tr> <td> <%=dpno %> <td> <a href=list-doctors.jsp?dpno=<%=dpno %>> <%=dpname %> </a> </tr>
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