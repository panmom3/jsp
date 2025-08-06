<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test10.jsp</title>
	<script>
		'use strict';
		
		function fCheck() {
			let su1 = $('#su1').val();
			let su2 = $('#su2').val();
			
			if(su1.trim() == "" || su2.trim() == "") {
				alert("su1과 su2에는 숫자를 입력하세요");
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>form을 통한 값의 전달</h2>
	<p>su1과 su2를 입력받아서 두 범위안의 함을 구하시오</p>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/j0805/Test10">
		<div class="input-group mb-2">
			<div class="input-group-text">수1</div>
			<input type="number" name="su1" id="su1" value="1" class="form-control" />
		</div>
		<div class="input-group mb-2">
			<div class="input-group-text">수2</div>
			<input type="number" name="su2" id="su2" value="10" class="form-control" />
		</div>
		<p><input type="button" value="계산하기" onclick="fCheck()" class="btn btn-success form-control" /></p>
	</form>
</div>
<p><br/></p>
</body>
</html>