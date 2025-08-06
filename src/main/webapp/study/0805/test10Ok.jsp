<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int tot = Integer.parseInt(request.getParameter("tot"));
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test10Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>결과보기</h2>
	<p>결과 : <%=su1%>에서 <%=su2%>까지의 합은 <%=tot%></p>
	<p><input type="button" value="돌아가기" onclick="location.href='test10.jsp'" class="btn btn-warning"/></p>
</div>
<p><br/></p>
</body>
</html>