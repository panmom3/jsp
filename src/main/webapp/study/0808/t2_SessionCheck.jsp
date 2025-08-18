<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String sessionName = "";

  Enumeration enumCK = session.getAttributeNames();
  
  while(enumCK.hasMoreElements()) {
  	sessionName = enumCK.nextElement().toString();
  	
  	System.out.println(sessionName + " / " + session.getAttribute(sessionName));
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>t2_SessionCheck.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>세션값 출력</h2>
  <p>세션 고유번호 : <%=session.getId() %></p>
  <p>아이디 : ${sMid}</p>
  <p>별명 : ${sNickName}</p>
  <p>성명 : ${sName}</p>
  <hr/>
<%
  long createTime = session.getCreationTime();	// 세션이 생성된 시간
  long lastTime = session.getLastAccessedTime();// 세션에 마지막으로 액세스한 시간
  long usedTime = lastTime - createTime;	// 현재 웹사이트에 머문시간
%>
	<p>1.현재 웹사이트에 머문 시간은? <%=usedTime/(1000 * 60) %>분</p>
	<p>1.현재 세션의 유효시간? <%=session.getMaxInactiveInterval()/60 %>분</p>
  <hr/>
  
<%
  //createTime = session.getCreationTime();
  Date createDate = new Date(createTime);
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  String createDate_ = sdf.format(createDate);
  //lastTime = session.getLastAccessedTime();
  Date lastDate = new Date(lastTime);
  String lastDate_ = sdf.format(lastDate);
  
  usedTime = lastTime - createTime; // 머문시간
%>
  <p>2.현재 웹사이트에 접속한 시간? <%=createDate_ %></p>
  <p>2.현재 웹사이트에 최종접속한 시간? <%=lastDate_ %></p>
	<p>2.현재 웹사이트에 머문 시간은? <%=usedTime/(1000 * 60) %>분</p>
	<p>2.현재 세션의 유효시간? <%=session.getMaxInactiveInterval()/60 %>분</p>
  
  <hr/>
  <p><a href="t2_Session.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>