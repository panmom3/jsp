<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>form.jsp</title>
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-center mb-3">성적입력폼</h2>
	  <form name="myform" method="post" action="<%=request.getContextPath() %>/jexam/Ex03_1">
	  	<div class="input-group mb-3">
	  		<lable for="name" class="input-group-text">이름</lable>
	  		<input type="text" name="name" id="name" value="홍길동" class="form-control" />
	  	</div>
	  	<div class="input-group mb-3">
	  		<lable for="kor" class="input-group-text">국어</lable>
	  		<input type="number" name="kor" id="kor" min="0" max="100" value="80" class="form-control" />
	  	</div>
	  	<div class="input-group mb-3">
	  		<label for="eng" class="input-group-text">영어</label>
	  	  <input type="number" name="eng" id="eng" min="0" max="100" value="90" class="form-control" />
	  	</div>
	  	<div class="input-group mb-3">
	  		<label for="mat" class="input-group-text">수학</label>
	  	  <input type="number" name="mat" id="mat" min="0" max="100" value="70" class="form-control" />
	  	</div>
	  	<input type="submit" class="btn btn-primary form-control mb-2" value="추가" />
	  </form>
	  <p><a href="ex03_vos1.jsp" class="btn btn-info form-control">전체 결과보기</a>
	</div>
</body>
</html>