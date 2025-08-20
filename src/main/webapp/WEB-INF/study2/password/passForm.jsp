<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>passForm.jsp</title>
	<script>
	'use strict';
	
	function pwdCheck(flag) {
		let pwd = myform.pwd.value;
		if(pwd.trim() == "") {
			alert("비밀번호를 입력하세요");
			myform.pwd.focus();
		}
		else {
			myform.flag.value = flag;
			myform.action = "${ctp}/study2/password/PassCheck";
			myform.submit();
		}
	}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>비밀번호 암호화 연습</h2>
	<form name="myform" method="post" action="">
		<div class="input-group">
			<div class="input-group-text">비밀번호 : </div>
			<input type="password" name="pwd" id="pwd" value="1234" class="form-control" />
			<input type="button" value="숫자1" onclick="pwdCheck(1)" class="btn btn-success me-2" />
			<input type="button" value="숫자2" onclick="pwdCheck(2)" class="btn btn-primary me-2" />
		</div>
		<input type="hidden" name="flag" />
	
	</form>
</div>
<p><br/></p>
</body>
</html>