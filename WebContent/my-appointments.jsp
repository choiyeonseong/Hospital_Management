<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title> My Appointments </title>
</head>

<body>
<div>
<center>
<a href="logout.jsp"> �α׾ƿ� </a> &nbsp &nbsp
<a href="menu.jsp"> Ȩ</a>

   <h1> ���� ���� </h1>
   <table border=1>

      <tr>
         <th>�����ȣ
         <th>ȯ���̸�
         <th>���೯¥
         <th>����ð�
         <th>����ǻ�
         <th>��簣ȣ��
         <th>����
      </tr>

<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "";
String noStr = request.getRemoteUser();
String check = noStr.substring(0,1);
System.out.println(check);
if (check.equals("1")) {
   sqlStr = "select * from (((APPOINTMENT a JOIN PATIENT p on a.PNO = p.PNO) natural join DOCTOR) join NURSE n on p.nno = n.nno) where dno=?";
} else if (check.equals("2")) {
   sqlStr = "select * from (((APPOINTMENT a JOIN PATIENT p on a.PNO = p.PNO) natural join DOCTOR) join NURSE n on p.nno = n.nno) where p.nno=?";
}

      PreparedStatement st = conn.prepareStatement(sqlStr);
        st.setString(1, noStr);
      ResultSet rs = st.executeQuery();

      while (rs.next()) {
         String ano = rs.getString("ano");
         String pname = rs.getString("pname");
         String adate = rs.getString("adate");
         String atime = rs.getString("atime");
         String dname = rs.getString("dname");
         String nname = rs.getString("nname");
      %>
      <tr>
         <td> <a href="update-appointment.jsp?ano=<%=ano%>"> <%=ano%></a>
         <td> <%=pname%>
         <td> <%=adate%>
         <td> <%=atime%>
         <td> <%=dname%>
         <td> <%=nname%>
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