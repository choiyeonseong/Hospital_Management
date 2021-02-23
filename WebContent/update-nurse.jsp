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
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

<h1> 간호사 정보 수정 </h1>

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
간호사번호 : <input type="text" name="nno" readonly value="<%=nno%>"><br>
병원부서 : <input type="text" name="dpno" value="<%=dpno%>"><br>
간호사이름 : <input type="text" name="nname" value="<%=nname%>"><br>
전화번호 : <input type="text" name="nphone" value="<%=nphone%>"><br>
메일주소 : <input type="text" name="nemail"  value="<%=nemail%>"><br>

<%
}
%>

<br>
<input type="submit" value=수정완료 >
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