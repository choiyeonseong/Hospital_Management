<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Add Charts </title>
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

<h1> 차트 추가 </h1>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");
String pno = request.getParameter("pno");
String sqlStr = "select max(cno) from CHART";
String cno = null;

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String Scno = rs.getString("max(cno)");
	int Icno = Integer.parseInt(Scno);
	Icno++;
	cno = Integer.toString(Icno);
	
}
%>
<h3> 차트 정보 입력 </h3>
 
<form method = "post" action = "add-chart.jsp">
 	환자이름 : <input type = "text" name = "pname"><p>
 	병      명  : <input type = "text" name = "disease"><p>
 	<input type = "hidden" readonly name = "cno" value="<%=cno%>"><p>
 	<input type = "hidden" readonly name = "pno" value="<%=pno%>"><p>
 	<input type = "submit" value = "추가">
</form>

<%
rs.close();
st.close();
conn.close();
%>
</center> 
</div>
</body>
</html>