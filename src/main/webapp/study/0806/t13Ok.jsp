<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
  String buseo = request.getParameter("buseo");
%>

<% if((mid.equals("admin") || mid.equals("hkd1234") || mid.equals("kms1234")) && pwd.equals("1234")) { %>
		<jsp:forward page="t13Res.jsp">
			<jsp:param name="mid" value="<%=mid%>"/>
			<jsp:param name="buseo" value="<%=buseo%>"/>
		</jsp:forward>
<% } else { %>
		<script>
		  alert("로그인 실패~~");
		  location.href = 't13.jsp';
		</script>
<% } %>


