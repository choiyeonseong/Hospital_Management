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
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

<h1> 차트 정보 수정 </h1>

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
환자번호 : <input type="text" name="pno" readonly value="<%=pno%>"><br>
환자이름 : <input type="text" name="pname" readonly value="<%=pname%>"><br>
환자병명 : <input type="text" name="disease" value="<%=disease%>"><br>
<input type="hidden" name="cno" value="<%=cno%>"><br>

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