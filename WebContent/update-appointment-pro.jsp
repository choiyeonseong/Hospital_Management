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

String ano = request.getParameter("ano");
String pname = request.getParameter("pname");
String adate = request.getParameter("adate");
String atime = request.getParameter("atime");
String dname = request.getParameter("dname");
String nname = request.getParameter("nname");

System.out.println(ano);
System.out.println(pname);
System.out.println(adate);
System.out.println(atime);
System.out.println(dname);
System.out.println(nname);

String psqlStr = "select * from PATIENT where pname = ?";
PreparedStatement pst = conn.prepareStatement(psqlStr);
pst.setString(1, pname);
ResultSet prs = pst.executeQuery();

String pno = null;

while(prs.next()){
	pno = prs.getString("pno");
}

String sql = "UPDATE APPOINTMENT set pno = ?, adate = ?, atime = ? where ano = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, pno);
pstmt.setString(2, adate);
pstmt.setString(3, atime);
pstmt.setString(4, ano);

pstmt.executeUpdate();

pst.close();
pstmt.close();
conn.close();


response.sendRedirect("list-appointments.jsp");

%>
</div>
</body>
</html>