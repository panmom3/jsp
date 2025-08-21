<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/include/bs5.jsp" />
	<title>extension.jsp</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container mt-5">
	<h2>확장자 패턴 연습</h2>
	<hr/>
	<div>
		<a href="${ctp}/study2/mapping/home.do" class="btn btn-success me-3">Home</a>
		<a href="${ctp}/study2/mapping/guest.do" class="btn btn-primary me-3">Guest</a>
		<a href="${ctp}/study2/mapping/board.do" class="btn btn-secondary me-3">Board</a>
		<a href="${ctp}/study2/mapping/pds.do" class="btn btn-warning me-3">PDS</a>
	</div>
	<hr/>
	<div id="msg">${msg}</div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>