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
�α׾ƿ� �Ǿ����ϴ�. <br>
<a href=menu.jsp> �ٽ� �α��� </a>
</center>
</div>
</body>
</html>