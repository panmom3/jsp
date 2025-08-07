<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String job = request.getParameter("job");
	String mountain = request.getParameter("mountain");
	String content = request.getParameter("content");
	String fileName = request.getParameter("fileName");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>t08Ok.jsp</title>
	<style>
	.row_group{display:table;width:100%;}
	.tit{display: table-cell;width: 150px;padding: 10px 10px;background-color: #fdf9c3;vertical-align: middle;border-bottom: 1px solid #ccc;text-align:center}
	.txt{display: table-cell;padding: 10px 10px;background-color: #fefded;vertical-align: middle;border-bottom: 1px solid #ccc;}
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2 class="text-center">회원가입결과</h2>
	<hr/>
	<div class="row_group"><span class="tit">성명</span><span class="txt"><%=name %></span></div>
	<div class="row_group"><span class="tit">나이</span><span class="txt"> <%=age %></span></div>
	<div class="row_group"><span class="tit">성별</span><span class="txt"> <%=gender %></span></div>
	<div class="row_group"><span class="tit">취미</span><span class="txt"> <%=hobby %></span></div>
	<div class="row_group"><span class="tit">직업</span><span class="txt"> <%=job %></span></div>
	<div class="row_group"><span class="tit">가본산</span><span class="txt"> <%=mountain %></span></div>
	<div class="row_group"><span class="tit">자기소개</span><span class="txt"> <%=content %></span></div>
	<div class="row_group"><span class="tit">첨부파일</span><span class="txt"> <%=fileName %></span></div>
	
	<div class="text-center"><input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath() %>/study/0806/t08.jsp'" class="btn btn-danger mt-3 text-center"/></div>
</div>
<p><br/></p>
</body>
</html>