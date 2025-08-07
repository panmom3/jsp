<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t13Yung.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>여기는 영업과 입니다.</h2>
  회원 아이디 : <%=mid %>
  <p><a href="t13.jsp" class="btn btn-success">돌아가기</a>
</div>
<p><br/></p>
</body>
</html>