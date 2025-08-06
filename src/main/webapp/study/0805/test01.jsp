<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test01.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP 기본 문법</h2>
	<!-- 이곳은 HTML 주석입니다. -->
	<%-- 이곳은 JSP 주석입니다. --%>
	<%-- 
		< %@ 디렉티브(directive): 지시자(page, include, taglib) % >
		<% 스크립틀릿(scriptlet) : (jsp문서안에 서블릿코드(java코드)를 사용할때 쓴다.) %>
		<%= 표현식(expression) : 변수(수식)값을 출력할때 사용 %>
		<%! 선언문(declaration) %>
	--%>
	<%!
		public int hap(int su) {
			int hap = 0;
			for(int i=1; i<=su; i++) {
				hap += i;
			}
			return hap;
		}
	%>
	<% 
		int tot = 0;
		for(int i=1; i<=100; i++) {
			tot += i;
		}
		// out.println("1~100까지의 합은 : " + tot);
	%>
	1~100까지의 합은 <%=tot %> 입니다.<br />
	
	<%
		int res = hap(20);
		out.println("<font color='red'><b>1~20까지의 합은 : " + res + "</b></font>");
		res = hap(100);
		out.println("<p style='font-size:20pt;font-weight:bold;color:blue'>1~100까지의 합은 : " + res + "</p>");
		out.println("<p><input type='button' value='전송' onclick='alert(\"안녕\")' class='btn btn-success' /></p>");
		System.out.println("결과는 " + res);
	
	%>
</div>
<p><br/></p>
</body>
</html>