<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t01Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>전송된 값</h2>
	<hr/>
	<div class="">성명: <%=name %></div>
	<div class="">나이: <%=age %></div>
	<div><input type="button" value="돌아가기" onclick="location.href='t01.jsp'" /></div>
</div>
<p><br/></p>
</body>
</html>