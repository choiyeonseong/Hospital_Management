<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Add a Chart </title>
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
	String cno = request.getParameter("cno");
	String pname = request.getParameter("pname");
	String disease = request.getParameter("disease");
	String pno = request.getParameter("pno");

	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
	
	String psqlStr = "select * from PATIENT where pname = ?";
	PreparedStatement pst = conn.prepareStatement(psqlStr);
	pst.setString(1, pname);
	ResultSet prs = pst.executeQuery();

	while(prs.next()){
		pno = prs.getString("pno");
	}
	
	String sqlStr = "insert into CHART values(?, ?, ?)";

	PreparedStatement st = conn.prepareStatement(sqlStr);

	st.setString(1, cno);
	st.setString(2, pno);
	st.setString(3, disease);

	st.executeUpdate();
	st.close();

	conn.close();
	
	
	response.sendRedirect("charts.jsp?pno=" + pno);
	%>
	

</div>
</body>
</html>