<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title> Chart </title>
</head>

<body>
<div>
<center>
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

	<h1>환자 차트</h1>
	<a href="add-chart-submit.jsp"> 차트 추가 </a><br>
	<table border=1>

		<tr>
			<th>차트번호
			<th>환자번호
			<th>환자이름
			<th>병명
			<th>담당의사
			<th>담당부서
			<th>삭제
		</tr>

		<%
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

		String sqlStr = "select * from (dept natural join doctor) join (chart join patient on chart.pno=patient.pno) on doctor.dno=patient.dno where patient.pno = ?";

		String pnoStr = request.getParameter("pno");

		PreparedStatement st = conn.prepareStatement(sqlStr);

		st.setString(1, pnoStr);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			String cno = rs.getString("cno");
			String pno = rs.getString("pno");
			String pname = rs.getString("pname");
			String disease = rs.getString("disease");
			String dname = rs.getString("dname");
			String dpname = rs.getString("dpname");
			String dno = rs.getString("dno");
		%>
		<tr>
			<td><a href="update-chart.jsp?pno=<%=pno%>&cno=<%=cno%>"> <%=cno%> </a>
			<td><%=pno%>
			<td><%=pname%>
			<td><%=disease%>
			<td><%=dname%>
			<td><%=dpname%>
			<td><a href="del-charts.jsp?pno=<%=pno%>&cno=<%=cno%>"> 삭제 </a>
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