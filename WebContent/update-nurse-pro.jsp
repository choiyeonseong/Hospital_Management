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
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String nno= request.getParameter("nno");
String nname = request.getParameter("nname");
String nphone = request.getParameter("nphone");
String nemail = request.getParameter("nemail");
String dpno = request.getParameter("dpno");

System.out.println(nno);
System.out.println(nname);
System.out.println(nphone);
System.out.println(nemail);
System.out.println(dpno);

String sql = "UPDATE NURSE set nname = ?, nphone = ?, nemail = ?, dpno = ? where nno = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, nname);
pstmt.setString(2, nphone);
pstmt.setString(3, nemail);
pstmt.setString(4, dpno);
pstmt.setString(5, nno);

pstmt.executeUpdate();
pstmt.close();
conn.close();


response.sendRedirect("list-nurses.jsp?dpno=" + dpno);

%>
</div>
</body>
</html>