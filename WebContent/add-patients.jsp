<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Add a Patient</title>
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

	String pno = request.getParameter("pno");
	String pname = request.getParameter("pname");
	String pgen = request.getParameter("pgen");
	String resinum = request.getParameter("resinum");
	String paddress = request.getParameter("paddress");
	String dname = request.getParameter("dname");
	String nname = request.getParameter("nname");
	String dates = request.getParameter("dates");
	String roomnum = request.getParameter("roomnum");
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
	System.out.println(pno + "<-----추가환자넘버");
	String dsqlStr = "select * from DOCTOR where dname = ?";
	PreparedStatement dst = conn.prepareStatement(dsqlStr);
	dst.setString(1, dname);
	ResultSet drs = dst.executeQuery();

	String dno = null;
	String nno = null;

	while(drs.next()){
		dno = drs.getString("dno");
	}

	String nsqlStr = "select * from NURSE where nname = ?";
	PreparedStatement nst = conn.prepareStatement(nsqlStr);
	nst.setString(1, nname);
	ResultSet nrs = nst.executeQuery();

	while(nrs.next()){
		nno = nrs.getString("nno");
	}
	
	String sqlStr = "insert into patient values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

	PreparedStatement st = conn.prepareStatement(sqlStr);

	st.setString(1, pno);
	st.setString(2, pname);
	st.setString(3, pgen);
	st.setString(4, resinum);
	st.setString(5, paddress);
	st.setString(6, dno);
	st.setString(7, nno);
	st.setString(8, dates);
	st.setString(9, roomnum);

	st.executeUpdate();
	st.close();

	conn.close();
	
	
	response.sendRedirect("list-patients.jsp");
	%>
	

</div>
</body>
</html>