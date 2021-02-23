<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Update Nurse Info </title>
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

<h1> ��ȣ�� ���� ���� </h1>

<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from NURSE where nno = ?";

String nnoStr = request.getParameter("nno");

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setString(1, nnoStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String nno = rs.getString("nno");
	String dpno = rs.getString("dpno");
	String nname = rs.getString("nname");
	String nphone = rs.getString("nphone");
	String nemail = rs.getString("nemail");
%>
<FORM action="update-nurse-pro.jsp?dno=<%=nno%>" method="post">
��ȣ���ȣ : <input type="text" name="nno" readonly value="<%=nno%>"><br>
�����μ� : <input type="text" name="dpno" value="<%=dpno%>"><br>
��ȣ���̸� : <input type="text" name="nname" value="<%=nname%>"><br>
��ȭ��ȣ : <input type="text" name="nphone" value="<%=nphone%>"><br>
�����ּ� : <input type="text" name="nemail"  value="<%=nemail%>"><br>

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