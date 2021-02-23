<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/background.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title> Menu </title>
</head>

<body>
<div> <center>
<a href="logout.jsp"> 로그아웃 </a>

<h1> 업무 메뉴 </h1>

<table border=1>
<tr> <th> <a href="list-doc_depts.jsp"> 의사 명단 </a> <th> <a href="list-nur_depts.jsp"> 간호사 명단 </a> </tr>
<tr> <th> <a href="list-patients.jsp"> 환자 관리 </a> <th> <a href="list-appointments.jsp"> 예약 관리 </a> </tr>
<tr> <th colspan=2> <a href="mypage.jsp"> 마이페이지 </a> </tr>
</table>
</center>
</div>
</body>
</html>