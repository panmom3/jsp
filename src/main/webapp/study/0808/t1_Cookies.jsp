<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t1_Cookies.jsp</title>
	
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>쿠키 연습 메인 메뉴</h2>
	<hr/>
	<div class="row">
		<div class="col"><a href="t1_CookiesSave.jsp" class="btn btn-success">쿠키저장</a></div>
		<div class="col"><a href="t1_CookiesCheck.jsp" class="btn btn-primary">쿠키확인</a></div>
		<div class="col"><a href="t1_CookiesAllDelete.jsp" class="btn btn-danger">쿠키전체삭제</a></div>	
	</div>
</div>
<p><br/></p>
</body>
</html>