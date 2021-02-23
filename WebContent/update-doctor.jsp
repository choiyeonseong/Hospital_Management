<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Update Doctor Info </title>
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

<h1> �ǻ� ���� ���� </h1>

<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from DOCTOR where dno = ?";

String dnoStr = request.getParameter("dno");

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setString(1, dnoStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String dno = rs.getString("dno");
	String dpno = rs.getString("dpno");
	String dname = rs.getString("dname");
	String dphone = rs.getString("dphone");
	String demail = rs.getString("demail");
%>
<FORM action="update-doctor-pro.jsp?dno=<%=dno%>" method="post">
�ǻ��ȣ : <input type="text" name="dno" readonly value="<%=dno%>"><br>
�����μ� : <input type="text" name="dpno" value="<%=dpno%>"><br>
�ǻ��̸� : <input type="text" name="dname" value="<%=dname%>"><br>
��ȭ��ȣ : <input type="text" name="dphone" value="<%=dphone%>"><br>
�����ּ� : <input type="text" name="demail"  value="<%=demail%>"><br>

<%
}
%>

<br>
<input type="submit" value=�����Ϸ� >
</FORM>
<%
rs.close();
st.close();
conn.close();
%>
</center>
</div>
</body>
</html>