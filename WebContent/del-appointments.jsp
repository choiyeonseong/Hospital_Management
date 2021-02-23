<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>Delete Appointments </title>
</head>

<body>
<div>
<center>
<%
request.setCharacterEncoding("EUC-KR");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
	String sqlStr = "delete from APPOINTMENT where ano = ?";
	String anoStr = request.getParameter("ano");
	PreparedStatement st = conn.prepareStatement(sqlStr);
	st.setString(1, anoStr);
	st.executeUpdate();
	st.close();
	conn.close();
	response.sendRedirect("list-appointments.jsp");
%>
</center>
</div>
</body>
</html>