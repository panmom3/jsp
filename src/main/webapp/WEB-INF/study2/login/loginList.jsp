<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>loginList.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2 class="mb-4">전체 회원 리스트</h2>
  <table class="table table-hover">
    <tr class="table-secondary">
      <th>번호</th>
      <th>아이디</th>
      <th>닉네임</th>
      <th>성명</th>
      <th>나이</th>
      <th>성별</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${st.count}</td>
        <td>${vo.mid}</td>
        <td>${vo.nickName}</td>
        <td>${vo.name}</td>
        <td>${vo.age}</td>
        <td>${vo.gender}</td>
      </tr>
    </c:forEach>
  </table>
  <div><a href="LoginMain" class="btn btn-secondary">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>