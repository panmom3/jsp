<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t06.jsp</title>
	<script>
		'use strict';
		
		function fCheck() {
			// 아이디/비밀번호 체크
		}
		
		myform.submit();
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원 로그인</h2>
	<form name="myform" method="post" action="<%=request.getContextPath() %>/j0806/T06">
		<div class="mb-3">아이디
			<input type="text" name="mid" value="hkd1234" class="form-control" autofocus required />
		</div>
		<div class="mb-3">비밀번호
			<input type="password" name="pwd" value="1234" class="form-control" required />
		</div>
		<div class="mb-3">
			<input type="submit" value="로그인" class="btn btn-success form-control" />
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>