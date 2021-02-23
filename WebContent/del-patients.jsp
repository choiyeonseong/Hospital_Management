<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>Delete Patients </title>
</head>

<body>
<div>
<center>
<%
request.setCharacterEncoding("EUC-KR");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
	
	String Str = "delete from CHART where pno = ?";

	String cnoStr = request.getParameter("pno");
	
	PreparedStatement pst = conn.prepareStatement(Str);

	pst.setString(1, cnoStr);
	
	pst.executeUpdate();
	

	String sqlStr = "delete from patient where pno = ?";

	String pnoStr = request.getParameter("pno");
	
	PreparedStatement st = conn.prepareStatement(sqlStr);

	st.setString(1, pnoStr);
	
	st.executeUpdate();
	
	pst.close();
	st.close();
	conn.close();
	response.sendRedirect("list-patients.jsp");
%>
</center>
</div>
</body>
</html>