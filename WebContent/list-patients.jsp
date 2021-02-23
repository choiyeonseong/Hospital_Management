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
	<a href="logout.jsp"> �α׾ƿ� </a> &nbsp &nbsp
	<a href="menu.jsp"> Ȩ</a>
	<h1>ȯ�� ���</h1>
	<a href="add-patients-submit.jsp"> ȯ���߰� </a><br>
	<table border=1>

		<tr>
			<th>ȯ�ڹ�ȣ
			<th>����
			<th>����
			<th>�ֹι�ȣ
			<th>�ּ�
			<th>����ǻ�
			<th>��簣ȣ��
			<th>���ᳯ¥
			<th>���ǹ�ȣ
			<th>����
			<th>����
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
			
			<td><a href=update-patient.jsp?pno=<%=pno%>>����</a>
			<td><a href=del-patients.jsp?pno=<%=pno%>>����</a>
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