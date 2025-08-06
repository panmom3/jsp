<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test02.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>URL 호출</h2>
	<div>
		<a href="atom.jsp" class="btn btn-success">아톰호출1</a>
		<a href="atom" class="btn btn-primary">아톰호출2</a>
		<a href="atom4" class="btn btn-info">아톰호출4</a>
		<a href="/springGroup/atom5" class="btn btn-secondary">아톰호출5</a>
		<a href="<%=request.getContextPath()%>/atom6" class="btn btn-danger">아톰호출6</a>
		<a href="<%=request.getContextPath()%>/atom7" class="btn btn-danger">아톰호출7</a>
	</div>
</div>
<p><br/></p>
</body>
</html>