<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Appointments </title>
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

<h1> ���� ��� </h1>

<a href="add-appointment-submit.jsp"> ���� �߰� </a><br>
<table border=1>
<tr> <th> ���� ��ȣ  <th> ȯ�ڸ� <th> ���೯¥ <th> ����ð� <th> ����ǻ�  <th> ��簣ȣ�� <th> ���� </tr>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");


String sqlStr = "select * from ((APPOINTMENT a JOIN PATIENT p on a.PNO = p.PNO) natural join DOCTOR) join NURSE n on p.nno = n.nno order by ano";

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String ano = rs.getString("ano");
	String pname = rs.getString("pname");
	String adate = rs.getString("adate");
	String atime= rs.getString("atime");
	String dname = rs.getString("dname");
	String nname = rs.getString("nname");
%>
<tr> <td> <a href=update-appointment.jsp?ano=<%=ano %>> <%=ano%></a> 
	 <td> <%=pname %> 
	 <td> <%=adate %> 
	 <td> <%=atime %> 
	 <td> <%=dname %>
	 <td> <%=nname %>
	 <td> <a href="del-appointments.jsp?ano=<%=ano%>"> ���� </a>
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