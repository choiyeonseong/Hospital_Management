<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Update Chart Info </title>
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

<h1> ��Ʈ ���� ���� </h1>

<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from CHART natural join PATIENT where pno = ? and cno = ?";

String pnoStr = request.getParameter("pno");
String cnoStr = request.getParameter("cno");

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setString(1, pnoStr);
st.setString(2, cnoStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String cno = rs.getString("cno");
	String pno = rs.getString("pno");
	String pname = rs.getString("pname");
	String disease = rs.getString("disease");
%>

<FORM action="update-patient-pro.jsp?pno=<%=pno%>&cno=<%=cno%>" method="POST">
ȯ�ڹ�ȣ : <input type="text" name="pno" readonly value="<%=pno%>"><br>
ȯ���̸� : <input type="text" name="pname" readonly value="<%=pname%>"><br>
ȯ�ں��� : <input type="text" name="disease" value="<%=disease%>"><br>
<input type="hidden" name="cno" value="<%=cno%>"><br>

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