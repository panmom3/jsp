<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int aCount = application.getAttribute("aCount")==null ? 0 : (int) application.getAttribute("aCount");
	int sCount = session.getAttribute("sCount")==null ? 0 : (int) session.getAttribute("sCount");
	
	aCount++;
	sCount++;
	
	application.setAttribute("aCount", aCount);
	session.setAttribute("sCount", sCount);
%>
<!-- 
| 구분        | **session**                     | **application**                     |
| --------- | ------------------------------- | ----------------------------------- |
| 저장 범위     | **한 명의 사용자(클라이언트)**             | **웹 애플리케이션 전체(모든 사용자)**             |
| 지속 시간     | 브라우저를 닫거나 세션 타임아웃이 되면 소멸        | 서버가 내려가거나 재시작할 때까지 유지               |
| 주요 사용 예   | 로그인 정보, 장바구니, 사용자별 임시 데이터       | 방문자수 카운트, 공용 설정 값                   |
| JSP EL 접근 | `${sCount}` (sessionScope에서 찾음) | `${aCount}` (applicationScope에서 찾음) |
| 내부 객체     | `HttpSession` 객체                | `ServletContext` 객체                 |
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>t4_storageTest.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>방문카운트를 session과 application 비교하기</h2>
	<hr/>
	<p>어플리케이션 카운트 : ${aCount}</p>
	<hr/>
	<p>세션 카운트 : ${sCount}</p>
	<hr/>
	<p><a href="t4_storageTest.jsp" class="btn btn-success">방문수 증가</a></p>
</div>
<p><br/></p>
</body>
</html>

