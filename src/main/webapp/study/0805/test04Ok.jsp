<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test04Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 testOk.jsp 입니다.</h2>
	<hr>
	<div>성명 : <%=name %></div>
	<div>나이 : <%=age %></div>
	<hr>
	<div>
		<a href="test04.jsp" class="btn btn-warning">돌아가기</a>
	</div>
</div>
<p><br/></p>
</body>
</html>