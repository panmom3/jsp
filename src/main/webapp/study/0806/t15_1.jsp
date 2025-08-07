<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t15_1.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>성적 자료</h2>
	<form name="myform" method="post" action="t15_1Ok.jsp">
		<p>성명 : <input type="text" name="name" value="홍길동" class="form-control" autofocus required /></p>
		<p>학번 : <input type="text" name="hakbun" value="ms1234" class="form-control" required /></p>
		<p>국어 : <input type="number" name="kor" value="100" class="form-control" required /></p>
		<p>영어 : <input type="number" name="eng" value="90" class="form-control" required /></p>
		<p>수학 : <input type="number" name="mat" value="80" class="form-control" required /></p>
		<p>과학 : <input type="number" name="sci" value="70" class="form-control" required /></p>
		<p>사회 : <input type="number" name="soc" value="60" class="form-control" required /></p>
		<p>
			<input type="submit" value="계산처리" class="btn btn-success me-2" />
			<input type="reset" value="다시입력" class="btn btn-warning" />
		</p>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
	</form>
</div>
<p><br/></p>
</body>
</html>