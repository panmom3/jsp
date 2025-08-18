<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t1_filter.jsp</title>
	<script type="text/javascript">
		'use strict';
		
		function fCheck(flag) {
			if(flag == 'OK') myform.action = "${ctp}/study2/filter/T1OK";
			else  myform.action = "${ctp}/study2/filter/T1NO";
			myform.submit();
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Filter한글처리 연습</h2>
	<form name="myform" name="post">
		<div><input type="text" name="content" value="간단한 자기 소개란입니다." class="form-control" autofocus /></div>
		<div><textarea rows="5" name="introduce" class="form-control">자기소개서 입니다.</textarea></div>
		<div class="text-center mt-3">
			<input type="button" value="전송OK" onclick="fCheck('OK')" class="btn btn-success me-3" />
			<input type="button" value="전송NO" onclick="fCheck('NO')" class="btn btn-success me-3" />
			<input type="reset" value="다시입력" class="btn btn-warning" />
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>