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
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

<h1> 의사 정보 수정 </h1>

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
의사번호 : <input type="text" name="dno" readonly value="<%=dno%>"><br>
병원부서 : <input type="text" name="dpno" value="<%=dpno%>"><br>
의사이름 : <input type="text" name="dname" value="<%=dname%>"><br>
전화번호 : <input type="text" name="dphone" value="<%=dphone%>"><br>
메일주소 : <input type="text" name="demail"  value="<%=demail%>"><br>

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