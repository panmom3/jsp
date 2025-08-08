<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String[] cards = {"국민","BC","LG","현대","삼성","농협","BC"};
	pageContext.setAttribute("cards", cards);
	
	String[][] members = {
			{"홍길동","25","서울"},
			{"김말숙","33","청주"},
			{"이기자","19","제주"},
			{"강감찬","55","광주"},
			{"김연아","19","서울"}
	};
	pageContext.setAttribute("members", members);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ex02_jstl.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
    과제 : JSTL을 사용하여 아래와 같이 풀이하시오.
    1.구구단 5단을 출력하세요
    2.구구단 3단~5단까지 출력하시오(2중 for문)
    3.members배열의 주소가 '서울'단어에는 빨간색으로 표시해서 출력하시오.(배열에 저장된 자료를 한행에 3개의 항목씩 출력)
    4.members배열의 나이가 25세 미만은 굵고 파랑색 표시
    5.cards배열의 내용중, 첫번째 카드의 배경색은 노랑, 마지막카드의 배경색은 하늘색 으로 출력하시오.
    6.cards배열의 내용중, '국민카드'는 파랑색, '삼성카드'는 빨강색, 첫번째 카드의 배경색은 노랑, 마지막카드의 배경색은 하늘색 으로 출력하시오.
  </pre>
</div>
<p><br/></p>
</body>
</html>