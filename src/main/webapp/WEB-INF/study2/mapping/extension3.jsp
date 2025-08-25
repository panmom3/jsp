<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>extension3.jsp</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>확장자 패턴 연습3</h2>
  <hr/>
  <div>
    <a href="${ctp}/study2/mapping/home3.test3" class="btn btn-success me-3">Home3</a>
    <a href="${ctp}/study2/mapping/guest3.test3" class="btn btn-primary me-3">Guest3</a>
    <a href="${ctp}/study2/mapping/board3.test3" class="btn btn-secondary me-3">Board3</a>
    <a href="${ctp}/study2/mapping/pds3.test3" class="btn btn-warning me-3">PDS3</a>
  </div>
  <hr/>
  <div id="msg">${msg}</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>