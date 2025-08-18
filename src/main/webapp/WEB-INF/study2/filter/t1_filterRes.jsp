<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t1_filterRes.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 t1_filterRes.jsp 입니다.</h2>
	<hr/>
	<div>메세지 : ${message}</div>
	<hr/>
	<div><a href="${ctp}/study2/filter/T1_filter" class="btn btn-info">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>