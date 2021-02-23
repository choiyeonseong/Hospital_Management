<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Add Patients </title>
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

<h1> 환자 추가 </h1>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Hospital;", "sa", "mssql_p@ssw0rd!");

String sqlStr = "select max(pno) from PATIENT";
String pno = null;

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

while(rs.next()) {
	String Spno = rs.getString("max(pno)");
	System.out.println(Spno + "<---1");
	int Ipno = Integer.parseInt(Spno);
	Ipno++;
	pno = Integer.toString(Ipno);
	
}
System.out.println(pno + "<---2");
%>
 <h3> 환자 정보 입력 </h3>
 
      <form method = "post" action = "add-patients.jsp">
            이름 : <input type = "text" name = "pname"><p>
            성별 : <input type = "text" name = "pgen"><p>
              주민번호 : <input type = "text" name = "resinum"><p>
              주소 : <input type = "text" name = "paddress"><p>
           담당 의사 : <input type = "text" name = "dname"><p>   
            담당 간호사 : <input type = "text" name = "nname"><p>  
         진료날짜 : <input type = "text" name = "dates"><p>
         병실 : <input type = "text" name = "roomnum"><p>
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