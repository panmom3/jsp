<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = "hkd1234";
	Cookie cookieMid = new Cookie("cMid", mid);
	cookieMid.setMaxAge(60*60*24); // 쿠키의 만료시간(초) : 1일
	response.addCookie(cookieMid);
	
	String pwd = "1234";
	Cookie cookiePwd = new Cookie("cPwd", pwd);
	cookiePwd.setMaxAge(60*60*24); // 쿠키의 만료시간(초) : 1일
	response.addCookie(cookiePwd);
%>
<script>
	alert("쿠키가 저장되었습니다.");
	location.href = "t1_Cookies.jsp";
</script>