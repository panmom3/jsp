<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t2_SessionDelete.jsp</title>
	<script>
	'use strict';
	
	function sessionDelete() {
		let sessionSw = document.getElementById("sessionSw").value;
		
		if(sessionSw == "") {
			alert("삭제할 세션명을 선택하세요");
			return false;
		}
		location.href = "t2_SessionDeleteOk.jsp?sessionSw=" + sessionSw;
	}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 삭제</h2>
	<select name="sessionSw" id="sessionSw" onchange="sessionDelete()">
		<option value="">선택</option>
		<option value="sMid">아이디</option>
		<option value="sNickName">닉네임</option>
		<option value="sName">성명</option>
	</select>
</div>
<p><br/></p>
</body>
</html>