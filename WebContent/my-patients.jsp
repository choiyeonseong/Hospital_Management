<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div>
<center>
<a href="logout.jsp"> 로그아웃 </a> &nbsp &nbsp
<a href="menu.jsp"> 홈</a>

   <h1>진료 환자</h1>
   <table border=1>

      <tr>
         <th>환자번호
         <th>환자이름
         <th>성별
         <th>진료날짜
         <th>병실
      </tr>

      <%
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

      String sqlStr = null;
      String noStr = request.getRemoteUser();
      String check = noStr.substring(0,1);
      System.out.println(check);
      if (check.equals("1")) {
         sqlStr = "select * from DOCTOR join patient on DOCTOR.dno=PATIENT.dno where DOCTOR.dno= ?";
      } else if (check.equals("2")) {
         sqlStr = "select * from NURSE join patient on NURSE.nno=PATIENT.nno where NURSE.nno=?";
      }

      PreparedStatement st = conn.prepareStatement(sqlStr);


         st.setString(1, noStr);


      ResultSet rs = st.executeQuery();

      while (rs.next()) {
         String pno = rs.getString("pno");
         String pname = rs.getString("pname");
         String pgen = rs.getString("pgen");
         String dates = rs.getString("dates");
         String roomnum = rs.getString("roomnum");
      %>
      <tr>
         <td> <a href=charts.jsp?pno=<%=pno%>> <%=pno%> </a>
               <td><%=pname%>
            <td><%=pgen%>
            <td><%=dates%>
            <td><%=roomnum%>
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