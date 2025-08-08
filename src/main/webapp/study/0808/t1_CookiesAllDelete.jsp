<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	for(int i=0; i<cookies.length; i++) {
		//if(cookies[i].getName().equals("cPwd")) {     //비밀번호만 지울경우
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		//}
	}
%>
<script>
	alert("쿠키가 삭제되었습니다.");
	location.href = "t1_Cookies.jsp";
</script>