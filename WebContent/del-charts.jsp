<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>Delete Charts </title>
</head>

<body>
<div>
<center>
<%
request.setCharacterEncoding("EUC-KR");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
	String sqlStr = "delete from CHART where cno = ?";
	String cnoStr = request.getParameter("cno");
	String pno = request.getParameter("pno");
	PreparedStatement st = conn.prepareStatement(sqlStr);
	st.setString(1, cnoStr);
	st.executeUpdate();
	st.close();
	conn.close();
	response.sendRedirect("charts.jsp?pno=" + pno);
%>
</center>
</div>
</body>
</html>