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

String dno = request.getParameter("dno");
String dname = request.getParameter("dname");
String dphone = request.getParameter("dphone");
String demail = request.getParameter("demail");
String dpno = request.getParameter("dpno");

System.out.println(dno);
System.out.println(dname);
System.out.println(dphone);
System.out.println(demail);
System.out.println(dpno);

String sql = "UPDATE DOCTOR set dname = ?, dphone = ?, demail = ?, dpno = ? where dno = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, dname);
pstmt.setString(2, dphone);
pstmt.setString(3, demail);
pstmt.setString(4, dpno);
pstmt.setString(5, dno);

pstmt.executeUpdate();
pstmt.close();
conn.close();


response.sendRedirect("list-doctors.jsp?dpno=" + dpno);

%>
</div>
</body>
</html>