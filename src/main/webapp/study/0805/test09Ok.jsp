<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<p>결과: <%=request.getParameter("tot") %></p>
	<p><input type="button" value="돌아가기" onclick="location.href='test09.jsp'" class="btn btn-warning" /></p>
</div>
<p><br/></p>
</body>
</html>