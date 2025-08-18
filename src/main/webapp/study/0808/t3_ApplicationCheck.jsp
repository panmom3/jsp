<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t3_ApplicationCheck.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>어플리케이션값 출력</h2>
	<p>아이디 : ${aMid}</p>
	<p>별명 : ${aNickName}</p>
	<p>성명 : ${aName}</p>
	<hr/>
	<p><a href="t3_Application.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>