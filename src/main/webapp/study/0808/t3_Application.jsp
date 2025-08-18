<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t3_Application.jsp</title>
	
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Application 연습 메인 메뉴</h2>
	<hr/>
	<form name="myform" method="post" action="t3_ApplicationSave.jsp">
		<table class="table table-bordered text-center">
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			<tr>
				<th>아이디</th> 
				<td><input type="text" name="mid" value="${aMid}" autofocus required class="form-control" /></td>   <!-- s 세션 -->
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" value="${aNickName}" required class="form-control" /></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" value="${aName}" required class="form-control" /></td>
			</tr>
		</table>
		<div class="row text-center">
			<div class="col"><button type="submit" class="btn btn-success">어플리케이션저장</button></div>
			<div class="col"><a href="t3_ApplicationCheck.jsp" class="btn btn-primary">어플리케이션확인</a></div>
			<div class="col"><a href="t3_ApplicationDelete.jsp" class="btn btn-danger">어플리케이션삭제</a></div>	
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>