<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>pdsTest.jsp</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습(COS라이브러리)</h2>
  <hr/>
  <div class="row text-center">
    <div class="col"><a href="FileUpload1.st" class="btn btn-success">파일업로드1(싱글)</a></div>
    <div class="col"><a href="FileUpload2.st" class="btn btn-primary">파일업로드2(멀티)</a></div>
    <div class="col"><a href="FileUpload3.st" class="btn btn-info">파일업로드3(멀티)</a></div>
    <div class="col"><a href="FileUpload4.st" class="btn btn-warning">파일업로드4(멀티)</a></div>
  </div>
  <hr/>
  <div class="row">
    <div class="col"><a href="FileList.st" class="btn btn-secondary form-control">파일목록보기</a></div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>