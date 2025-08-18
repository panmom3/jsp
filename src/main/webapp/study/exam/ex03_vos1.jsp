<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  성적자료를 폼을 통해서 입력받아 '총점/평균/학점/순위'를 구해서 출력하시오.
  (동적폼을 만들어서 성적자료를 여러개 입력받을수 있도록 처리)
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex03_vos.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2 class="text-center mb-3">성적결과</h2>
  <table class="table text-center mt-3">
 		<tr class="table-danger">
 			<th>이름</th>
 			<th>국어</th>
 			<th>영어</th>
 			<th>수학</th>
  		<th>총점</th>
  		<th>평균</th>
  		<th>학점</th>
  		<th>순위</th>
 		</tr>
 		<c:forEach var="vo" items="${sessionScope.vos}">
	 		<tr>
	  		<td>${vo.name}</td>
	  		<td>${vo.kor}</td>
	  		<td>${vo.eng}</td>
	  		<td>${vo.mat}</td>
	  		<td>${vo.tot}</td>
	  		<td><fmt:formatNumber value="${vo.avg}" pattern="0.00" /></td>
	  		<td>${vo.grade}</td>
	  		<td>${vo.rank}</td>
	  	</tr>
 		</c:forEach>
  </table>
  <p><a href="${pageContext.request.contextPath}/study/exam/form.jsp" class="btn btn-info form-control">추가 입력</a>
</div>
<p><br/></p>
</body>
</html>