<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t2_Session.jsp</title>
	
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 연습 메인 메뉴</h2>
	<hr/>
	<form name="myform" method="post" action="t2_SessionSave.jsp">
		<table class="table table-bordered text-center">
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			<tr>
				<th>아이디</th> 
				<td><input type="text" name="mid" value="${sMid}" autofocus required class="form-control" /></td>   <!-- s 세션 -->
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" value="${sNickName}" required class="form-control" /></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" value="${sName}" required class="form-control" /></td>
			</tr>
		</table>
		<div class="row text-center">
			<div class="col"><button type="submit" class="btn btn-success">세션저장</button></div>
			<div class="col"><a href="t2_SessionCheck.jsp" class="btn btn-primary">세션확인</a></div>
			<div class="col"><a href="t2_SessionAllDelete.jsp" class="btn btn-danger">세션전체삭제</a></div>	
			<div class="col"><a href="t2_SessionDelete.jsp" class="btn btn-warning">세션부분삭제</a></div>	
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>