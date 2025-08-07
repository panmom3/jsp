<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t10_member.jsp</title>
  <script>
    'use strict';
    
    if('<%=mid%>' == '') {
    	alert("로그인후 사용해 주세요");
    	location.href = '<%=request.getContextPath()%>/study/0806/t10_login.jsp';
    }
    
    function logoutCheck() {
    	let ans = confirm("로그아웃 하시겠습니까?");
    	if(ans) {
    		alert('<%=mid%>님 로그아웃되셨습니다.');
    		location.href = '<%=request.getContextPath()%>/study/0806/t10_login.jsp';
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 회원 전용방 입니다.</h2>
  <hr/>
  <p>현재 로그인된 사용자 : <%=mid%> 사용자가 로그인 되었습니다.</p>
  <hr/>
  <p><a href="javascript:logoutCheck()" class="btn btn-success">로그아웃</a>
</div>
<p><br/></p>
</body>
</html>