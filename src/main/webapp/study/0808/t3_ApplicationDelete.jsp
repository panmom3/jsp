<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t3_ApplicationDelete.jsp</title>
	<script>
	'use strict';
	
	function applicationDelete() {
		let applicationSw = document.getElementById("applicationSw").value;
		
		if(applicationSw == "") {
			alert("삭제할 어플리케이션명을 선택하세요");
			return false;
		}
		location.href = "t3_ApplicationDeleteOk.jsp?applicationSw=" + applicationSw;
	}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>어플리케이션 삭제</h2>
	<select name="applicationSw" id="applicationSw" onchange="applicationDelete()">
		<option value="">선택</option>
		<option value="aMid">아이디</option>
		<option value="aNickName">닉네임</option>
		<option value="aName">성명</option>
	</select>
</div>
<p><br/></p>
</body>
</html>