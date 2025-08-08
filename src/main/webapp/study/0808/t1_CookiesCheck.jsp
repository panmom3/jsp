<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	out.println("저장된 쿠키는?<br/>");
	for(int i=0; i<cookies.length; i++) {
		out.println("쿠키이름 : " + cookies[i].getName() + " , ");
		out.println("쿠키값 : " + cookies[i].getValue() + "<br/>");
	}
%>
<p><a href="t1_Cookies.jsp" class="btn">돌아가기</a></p>
