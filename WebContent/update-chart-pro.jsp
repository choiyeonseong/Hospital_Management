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

String cno = request.getParameter("cno");
String pno = request.getParameter("pno");
String pname = request.getParameter("pname");
String disease = request.getParameter("disease");

String sql = "UPDATE CHART set pno = ?, disease = ? where cno = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, pno);
pstmt.setString(2, disease);
pstmt.setString(3, cno);

pstmt.executeUpdate();
pstmt.close();
conn.close();


response.sendRedirect("list-cahrt.jsp?=pno" + pno);

%>
</div>
</body>
</html>