<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title> 병원 관리 로그인 </title>
</head>

<body>
<div>
<center>
  <h1> 병원 업무 시스템 로그인 </h1>
  
  <form action="j_security_check" method="post" >
  
사번 : <input type="text" name="j_username" />
비밀번호 : <input type="password" name="j_password" />
  
  <input type="submit" value="로그인"/>
  
  </form>
  </center>
</div>
</body>
</html>