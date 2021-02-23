<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Update Patient Info </title>
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

<h1> 환자 정보 수정 </h1>

<% 
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select * from ((PATIENT join DOCTOR on PATIENT.dno = DOCTOR.dno) "
		+ "join NURSE on PATIENT.nno = NURSE.nno) where pno = ?";

String pnoStr = request.getParameter("pno");

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setString(1, pnoStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String pno = rs.getString("pno");
	String pname = rs.getString("pname");
	String paddress = rs.getString("paddress");
	String dname = rs.getString("dname");
	String nname = rs.getString("nname");
	String roomnum = rs.getString("roomnum");
%>

<FORM action="update-patient-pro.jsp?pno=<%=pno%>" method="POST">
환자번호 : <input type="text" name="pno" readonly value="<%=pno%>"><br>
환자이름 : <input type="text" name="pname" value="<%=pname%>"><br>
환자주소 : <input type="text" name="paddress" value="<%=paddress%>"><br>
담당의사 : <input type="text" name="dname"  value="<%=dname%>"><br>
담당간호사 : <input type="text" name="nname"  value="<%=nname%>"><br>
입원실 : <input type="text" name="roomnum"  value="<%=roomnum%>"><br>

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