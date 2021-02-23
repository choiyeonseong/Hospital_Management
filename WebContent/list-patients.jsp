<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Patients</title>
</head>
<style>
div {
    height: 3000px;
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
	<h1>환자 목록</h1>
	<a href="add-patients-submit.jsp"> 환자추가 </a><br>
	<table border=1>

		<tr>
			<th>환자번호
			<th>성명
			<th>성별
			<th>주민번호
			<th>주소
			<th>담당의사
			<th>담당간호사
			<th>진료날짜
			<th>병실번호
			<th>수정
			<th>삭제
		</tr>

		<%
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

		String userStr = request.getRemoteUser();

		String sqlStr = "select * from (PATIENT join DOCTOR on PATIENT.dno = DOCTOR.dno) join NURSE on PATIENT.nno = NURSE.nno order by pno";

		PreparedStatement st = conn.prepareStatement(sqlStr);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			String pno = rs.getString("pno");
			String pname = rs.getString("pname");
			String pgen = rs.getString("pgen");
			String resinum = rs.getString("resinum");
			String paddress = rs.getString("paddress");
			String dname = rs.getString("dname");
			String nname = rs.getString("nname");
			String dates = rs.getString("dates");
			String roomnum = rs.getString("roomnum");
			
		%>
		<tr>
			<td><%=pno%>
			<td><a href=charts.jsp?pno=<%=pno%>><%=pname%></a>
			<td><%=pgen%>
			<td><%=resinum%>
			<td><%=paddress%>
			<td><%=dname%>
			<td><%=nname%>
			<td><%=dates%>
			
			<%
			if (roomnum == null){
			%>
			<th><%=""%>
			<%}
			else{
			%> <th><%=roomnum%> 
			<% } %>
			
			<td><a href=update-patient.jsp?pno=<%=pno%>>수정</a>
			<td><a href=del-patients.jsp?pno=<%=pno%>>삭제</a>
		</tr>
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