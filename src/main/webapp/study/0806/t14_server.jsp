<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t14_server.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>서버의 환경변수값 확인하기</h2>
	<div>호스트컴퓨터 IP : <%=request.getRemoteAddr() %> / ${pageContext.request.remoteAddr}</div>
	<div>전송방식 : <%=request.getMethod() %></div>
	<div>접속프로토콜 : <%=request.getProtocol() %></div>
	<div>접속(서버)포트 : <%=request.getServerPort() %></div>
	<div>접속(서버)이름(도메인) : <%=request.getServerName() %></div>
	<div>접속 Context명 : <%=request.getContextPath() %></div>
	<div>접속 URL : <%=request.getRequestURL() %></div>
	<div>접속 URI : <%=request.getRequestURI() %></div>   <!--앞에 주소 빠짐-->
</div>
<p><br/></p>
</body>
</html>