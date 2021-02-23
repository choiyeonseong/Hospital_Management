<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title> Add Patients </title>
</head>
<body>
<div> <center>
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

<h1> 예약 추가 </h1>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select max(ano) from APPOINTMENT";
String ano = null;

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String Sano = rs.getString("max(ano)");
	System.out.println(Sano + "<---1");
	int Iano = Integer.parseInt(Sano);
	Iano++;
	ano = Integer.toString(Iano);
	
}
System.out.println(ano + "<---2");
%>
 <h3> 예약 정보 입력 </h3>
 
      <form method = "post" action = "add-appointment.jsp">
      환자이름 : <input type = "text" name = "pname"><p>
            예약날짜  : <input type = "text" name = "adate"><p>
              예약시간 : <input type = "text" name = "atime"><p>
        <input type = "hidden" readonly name = "ano" value="<%=ano%>"><p>
           <input type = "submit" value = "추가">
      </form>

<%
rs.close();
st.close();
conn.close();
%>
<center>
</div>
</body>
</html>