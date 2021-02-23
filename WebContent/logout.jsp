<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title> Logout </title>
</head>

<body>
<div>
<center>
<%
	session.invalidate();
%>
로그아웃 되었습니다. <br>
<a href=menu.jsp> 다시 로그인 </a>
</center>
</div>
</body>
</html>