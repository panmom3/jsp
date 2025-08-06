<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test09.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>값 전송</h2>
	<p><a href="<%=request.getContextPath()%>/j0805/Test09?su=100" class="btn btn-success">1~100까지의 합</a></p>
</div>
<p><br/></p>
</body>
</html>