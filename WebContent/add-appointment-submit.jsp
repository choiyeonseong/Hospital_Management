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
<a href="logout.jsp"> �α׾ƿ� </a> &nbsp &nbsp
<a href="menu.jsp"> Ȩ</a>

<h1> ���� �߰� </h1>
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
 <h3> ���� ���� �Է� </h3>
 
      <form method = "post" action = "add-appointment.jsp">
      ȯ���̸� : <input type = "text" name = "pname"><p>
            ���೯¥  : <input type = "text" name = "adate"><p>
              ����ð� : <input type = "text" name = "atime"><p>
        <input type = "hidden" readonly name = "ano" value="<%=ano%>"><p>
           <input type = "submit" value = "�߰�">
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