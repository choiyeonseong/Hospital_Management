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
<a href="logout.jsp"> �α׾ƿ� </a> &nbsp &nbsp
<a href="menu.jsp"> Ȩ</a>

<h1> ȯ�� �߰� </h1>
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
 <h3> ȯ�� ���� �Է� </h3>
 
      <form method = "post" action = "add-patients.jsp">
            �̸� : <input type = "text" name = "pname"><p>
            ���� : <input type = "text" name = "pgen"><p>
              �ֹι�ȣ : <input type = "text" name = "resinum"><p>
              �ּ� : <input type = "text" name = "paddress"><p>
           ��� �ǻ� : <input type = "text" name = "dname"><p>   
            ��� ��ȣ�� : <input type = "text" name = "nname"><p>  
         ���ᳯ¥ : <input type = "text" name = "dates"><p>
         ���� : <input type = "text" name = "roomnum"><p>
        <input type = "hidden" readonly name = "pno" value="<%=pno%>"><p>
           <input type = "submit" value = "�߰�">
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