<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Doctors </title>
</head>
<style>
div {
    height: 700px;
    background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%)
}
center {
  margin: auto;
  width: 60%;
}
</style>
<body>
<div>
<center>
<a href="logout.jsp"> �α׾ƿ� </a> &nbsp &nbsp
<a href="menu.jsp"> Ȩ</a>
<h1> �ǻ� ��� </h1>

<table border=1>
<tr> <th> �ǻ� ��ȣ <th> ����  <th> ���� <th> ��ȭ��ȣ <th> �̸��� </tr>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from DOCTOR where dpno = ?";
String dpnoStr = request.getParameter("dpno");

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setString(1, dpnoStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String dpno = rs.getString("dpno");
	String dno = rs.getString("dno");
	String dname = rs.getString("dname");
	String dgen = rs.getString("dgen");
	String dphone = rs.getString("dphone");
	String demail = rs.getString("demail");
%>
<tr> <td> <%=dno %> <td> <a href=update-doctor.jsp?dno=<%=dno %>> <%=dname%></a> <td> <%=dgen %> <td> <%=dphone %> <td> <%=demail %> </tr>

<%
}
%>

</table>

<%
rs.close();
st.close();
conn.close();
%>
</center>
</div>
</body>
</html>