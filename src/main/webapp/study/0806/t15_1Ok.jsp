<%@ page import="study.j0806.T15VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// T15VO vo = new T15VO();
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="study.j0806.T15VO" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t15_1Ok.jsp</title>
	<!-- setter : jsp:setProperty, getter : jsp:getProperty 
	<!--
	<jsp:setProperty property="name" name="vo"/>
	<jsp:setProperty property="hakbun" name="vo"/>
	<jsp:setProperty property="kor" name="vo"/>
	<jsp:setProperty property="eng" name="vo"/>
	<jsp:setProperty property="mat" name="vo"/>
	<jsp:setProperty property="sci" name="vo"/>
	<jsp:setProperty property="soc" name="vo"/>
	<jsp:setProperty property="hostIp" name="vo"/>
	-->
	<jsp:setProperty property="*" name="vo"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>vo에 담겨있는 값들</h2>
	<p>성명 : <jsp:getProperty property="name" name="vo"/></p>
	<p>학번 : <jsp:getProperty property="hakbun" name="vo"/></p>
	<p>국어 : <jsp:getProperty property="kor" name="vo"/></p>
	<p>영어 : <jsp:getProperty property="eng" name="vo"/></p>
	<p>수학 : <jsp:getProperty property="mat" name="vo"/></p>
	<p>과학 : <jsp:getProperty property="sci" name="vo"/></p>
	<p>사회 : <jsp:getProperty property="soc" name="vo"/></p>
	<p>사용자IP : <jsp:getProperty property="hostIp" name="vo"/></p>
	<hr>
	<div><a href="t15_main.jsp" class="btn btn-primary">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>