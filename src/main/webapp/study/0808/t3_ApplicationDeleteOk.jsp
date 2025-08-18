<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDeleteOk.jsp -->
<%
	String applicationSw = request.getParameter("applicationSw");

	application.removeAttribute(applicationSw);  

	pageContext.setAttribute("applicationSw", applicationSw);

%>
<script>
	alert("${applicationSw} 어플리케이션이 삭제 되었습니다.");
	location.href = 't3_Application.jsp';
</script>