<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t02.jsp</title>
	<script>
		'use strict';
		
		function fCheck() {
			// 성명/나이 체크
			
			
			myform.submit();
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원가입</h2>
	<form name="myform" method="post" action="t02Ok.jsp">
		<div class="mb-3">성명
			<input type="text" name="name" value="홍길동" class="form-control" autofocus required />
		</div>
		<div class="mb-3">나이
			<input type="number" name="age" value="20" class="form-control" required />
		</div>
		<div class="mb-3">
			<input type="button" value="전송(button)" onclick="fCheck()" class="btn btn-success form-control" />
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>