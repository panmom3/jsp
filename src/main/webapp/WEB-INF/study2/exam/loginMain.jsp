<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>loginMain.jsp</title>
	<script>
		'use strict';
		
		function logout(){
			let ans = confirm("로그아웃하시겠습니까?");
			if(ans) location.href="${ctp}/study2/exam/Logout";
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원 전용방</h2>
	<hr/>
	<div>이곳은 회원 전용서비스 구역입니다.</div>
	<div>회원 아이디 : ${sMid}</div>
	<div>회원 닉네임 : ${sNickName}</div>
	<hr/>
	<div>
		<button type="button" onclick="logout()" class="btn btn-success text-center">로그아웃</button>
	</div>
</div>
<p><br/></p>
</body>
</html>