<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title> Add a Appointment </title>
</head>
<style>
div {
    height: 700px;
    background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%)
}
</style>
<body>
<div>
	<%
		request.setCharacterEncoding("EUC-KR");

	String ano = request.getParameter("ano");
	String pname = request.getParameter("pname");
	String adate = request.getParameter("adate");
	String atime = request.getParameter("atime");
	String dname = request.getParameter("dname");
	String nname = request.getParameter("nname");
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
	
	String dsqlStr = "select * from PATIENT where pname = ?";
	PreparedStatement dst = conn.prepareStatement(dsqlStr);
	dst.setString(1, pname);
	ResultSet drs = dst.executeQuery();

	String pno = null;

	while(drs.next()){
		pno = drs.getString("pno");
	}
	
	String sqlStr = "insert into APPOINTMENT values(?, ?, ?, ?)";

	PreparedStatement st = conn.prepareStatement(sqlStr);

	st.setString(1, ano);
	st.setString(2, adate);
	st.setString(3, atime);
	st.setString(4, pno);

	st.executeUpdate();
	
	dst.close();
	st.close();
	conn.close();
	
	
	response.sendRedirect("list-appointments.jsp");
	%>
	

</div>
</body>
</html>