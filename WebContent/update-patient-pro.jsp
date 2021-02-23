<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
request.setCharacterEncoding("euc-kr");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String pno = request.getParameter("pno");
String pname = request.getParameter("pname");
String paddress = request.getParameter("paddress");
String dname = request.getParameter("dname");
String nname = request.getParameter("nname");
String roomnum = request.getParameter("roomnum");

System.out.println(pno);
System.out.println(pname);
System.out.println(paddress);

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

String sql = "UPDATE PATIENT set pname = ?, paddress = ?, dno = ?, nno = ?, roomnum = ? where pno = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, pname);
pstmt.setString(2, paddress);
pstmt.setString(3, dno);
pstmt.setString(4, nno);
pstmt.setString(5, roomnum);
pstmt.setString(6, pno);

pstmt.executeUpdate();
pstmt.close();
conn.close();


response.sendRedirect("list-patients.jsp");

%>
</div>
</body>
</html>