<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t11_mvc.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>값 전송 연습</h2>
	<form name="myform" method="post" action="<%=request.getContextPath() %>/j0806/T12">
		<div class="mb-3">성명
  	  <input type="text" name="name" value="홍길동" class="form-control mb-3" autofocus required />
  	</div>
  	<div class="mb-3">나이
  	  <input type="number" name="age" value="20" class="form-control mb-3" />
  	</div>
  	<div class="mb-3">성별 &nbsp;&nbsp;
  	  <input type="radio" name="gender" value="남자" class="me-1" />남자 &nbsp;
  	  <input type="radio" name="gender" value="여자" class="me-1" checked />여자
  	</div>
  	<div class="mb-3"> 취미 &nbsp;&nbsp;  
  	  <input type="checkbox" name="hobby" value="등산" class="me-1" />등산 &nbsp;
  	  <input type="checkbox" name="hobby" value="낚시" class="me-1" />낚시 &nbsp;
  	  <input type="checkbox" name="hobby" value="바둑" class="me-1" />바둑 &nbsp;
  	  <input type="checkbox" name="hobby" value="수영" class="me-1" />수영 &nbsp;
  	  <input type="checkbox" name="hobby" value="배드민턴" class="me-1" />배드민턴 &nbsp;
  	  <input type="checkbox" name="hobby" value="바이크" class="me-1" />바이크
  	  <input type="checkbox" name="hobby" value="바이크" class="me-1" checked/>기타
  	</div>
  	<div class="mb-3">직업
  	  <select name="job" class="form-control">
  	    <option value="">선택</option>
  	    <option>회사원</option>
  	    <option>공무원</option>
  	    <option>군인</option>
  	    <option>의사</option>
  	    <option>자영업</option>
  	    <option>가사</option>
  	  </select>
  	</div>
  	<div class="mb-3">가본산
  	  <select name="mountain" size="5" multiple class="form-control">
  	    <option>백두산</option>
  	    <option>한라산</option>
  	    <option>태백산</option>
  	    <option>소백산</option>
  	    <option>금강산</option>
  	    <option>우암산</option>
  	    <option>속리산</option>
  	    <option>대둔산</option>
  	  </select>
  	</div>
  	<div class="mb-3">자기소개
  	  <textarea rows="6" name="content" class="form-control"></textarea>
  	</div>
  	<div class="mb-3">첨부파일
  	  <input type="file" name="fileName" class="form-control"/>
  	</div>
  	<div class="row">
  	  <div class="col"><input type="submit" value="전송(submit)" class="btn btn-success"/></div>
  	  <div class="col text-end"><input type="reset" value="다시입력" class="btn btn-warning"/></div>
  	</div>
	</form>
</div>
<p><br/></p>
</body>
</html>