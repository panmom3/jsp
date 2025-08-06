<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test05.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>오늘 날짜는?</h2>
	<%
		// new Date();
		// new java.util.Date();
	%>
	<p>오늘은 <%=new Date() %> 입니다.</p>
	<%
		LocalDate date = LocalDate.now();
		LocalDateTime dateTime = LocalDateTime.now();
	%>
	<p>1.오늘은 <%=date %> 입니다.</p>
	<p>2.오늘은 <%=dateTime %> 입니다.</p>
	<p>3.오늘은 <%=dateTime.toString().substring(11, 19) %> 입니다.</p>
	<p><input type="button" value="새로고침" onclick="location.reload()" /></p>
	
	
</div>
<p><br/></p>
</body>
</html>