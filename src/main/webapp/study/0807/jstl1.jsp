<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>jstl1.jsp</title>
  <script>
    'use strict';
    
    let cnt = 0;
    let member = new Array();
    
    function fCheck() {
    	let name = $('#name').val();
    	let age = $('#age').val();
    	let gender = myform.gender.value;
    	let job = $('#job').val();
    	let str = name + "/" + age + "/" + gender + "/" + job;
    	member[cnt] = str;
    	
    	let ans = confirm("값을 전송할까요?");
    	if(ans) {
    		location.href = "${pageContext.request.contextPath}/j0807/JSTLtest1_2?member="+member;
    	}
    	
    	cnt++;
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSTL(Java Standard Tag Library)</h2>
  <table class="table table-bordered">
    <tr>
      <th>라이브러리</th>
      <th>주소(URL)</th>
      <th>접두어</th>
      <th>기본문법</th>
    </tr>
    <tr>
      <td>Core</td>
      <td>http://java.sun.com/jsp/jstl/core</td>
      <td>c</td>
      <td>< c : 태그명.... ></td>
    </tr>
    <tr>
      <td>Function</td>
      <td>http://java.sun.com/jsp/jstl/function</td>
      <td>fn</td>
      <td>$ {fn:태그명 }</td>
    </tr>
    <tr>
      <td>Formatting</td>
      <td>http://java.sun.com/jsp/jstl/fmt</td>
      <td>fmt</td>
      <td>< fmt: 태그명.... ></td>
    </tr>
    <tr>
      <td>SQL</td>
      <td>http://java.sun.com/jsp/jstl/sql</td>
      <td>sql</td>
      <td>< sql: 태그명.... ></td>
    </tr>
  </table>
  <hr/>
  <div>
    앞의 정의된 라이브러리를 사용할 경우에는 jsp지시자중 'taglib'를 이용하여 먼저 선언후 사용한다.<br/>
    주소(download) : https://tomcat.apache.org/taglibs/standard/
  </div>
  <hr/>
  <h2>Core 라이브러리 사용예</h2>
  <pre>
    <h4>용도 : 변수제어(선언/값할당/객체/출력/제거), 제어문(조건문, 반복문)</h4>
    변수선언 : < c :set var="변수명" value="값">< /c :set>
    변수출력 : < c :out value="${값/변수/수식}" />
    변수제거 : < c :remove var="변수명" />
  </pre>
  <hr/>
  su1변수를 선언후 초기값으로 100을 할당? <c:set var="su1" value="100"></c:set><br/>
  su1변수값을 출력1? <c:out value="${su1}"></c:out><br/>
  su1변수값을 출력2? ${su1}<br/>
  su1변수 제거? <c:remove var="su1"/><br/>
  su1변수값을 출력3? ${su1}<br/>
  <% String name = "홍길동"; %>
  성명1 : <%=name %><br/>
  <% pageContext.setAttribute("name", "이기자"); %>
  성명2 : ${name}<br/><br/>
  <h4>JSTL 제어문(조건문(if), 반복문(foreach)) - 조건의 비교는 EL을 이용한다.</h4>
  <p>사용법 : < c :if test="${조건식}">조건식에 따른 처리내용< / c:if></p>
  <p>단점 : else문이 없다. 숫자비교를 문자처럼 앞에서부터 비교한다.</p>
  <p>사용예1 : su3=300, su4=400</p>
  <c:set var="su3" value="300" />
  <c:set var="su4" value="40" />
  <div>1. su3 == su4 : <c:if test="${su3 == su4}">1.su3와 su4는 같다.</c:if></div>
  <div>2. su3 != su4 : <c:if test="${su3 != su4}">2.su3와 su4는 같지않다.</c:if></div>
  <div>3. su3 > su4 : <c:if test="${su3+'0' > su4+'0'}">3.su3가 su4보다 크다.</c:if></div>
  <div>4. su3 <= su4 : <c:if test="${su3+'0' <= su4+'0'}">4.su3가 su4보다 작거나 같다.</c:if></div>
  <div>5. su3 < su4 : <c:if test="${su3 < su4}">5.su4가 su3보다 크다.</c:if></div>
  <div>6. su3 >= su4 : <c:if test="${su3 >= su4}">6.su4가 su3보다 작거나 같다.</c:if></div>
  <div>3_1. su3 gt su4 : <c:if test="${su3 gt su4}">3.su3가 su4보다 크다.</c:if></div>
  <div>4._1 su3 le su4 : <c:if test="${su3 le su4}">4.su3가 su4보다 작거나 같다.</c:if></div>
  <div>5_1. su3 lt su4 : <c:if test="${su3 lt su4}">5.su4가 su3보다 크다.</c:if></div>
  <div>6_1. su3 ge su4 : <c:if test="${su3 ge su4}">6.su4가 su3보다 작거나 같다.</c:if></div>
  <h4>다중조건비교 : choose ~ when ~ otherwise</h4>
  <pre>
    사용법 :
    < c : choose>
        < c : when test="조건식1">처리할 내용1< / c : when>
        < c : when test="조건식2">처리할 내용2< / c : when>
        < c : when test="조건식3">처리할 내용3< / c : when>
        ~~ ~~ ~~
        < c : otherwise> 기타 수행할 내용들 < / : otherwise>
    < /c : choose>
  </pre>
  <div>점수 85점인 학생의 학점은? 학점 : 
    <c:set var="jum" value="85"/>
  	<c:choose>
  	  <c:when test="${jum >= 90}">A</c:when>
  	  <c:when test="${jum >= 80}">B</c:when>
  	  <c:when test="${jum >= 70}">C</c:when>
  	  <c:when test="${jum >= 60}">D</c:when>
  	  <c:otherwise>F</c:otherwise>
  	</c:choose>
  </div>
  <br/>
  <h4>반복문(forEach)</h4>
<% for(int i=1; i<=10; i++) { %>
      값1 : <%=i%> /
<% } %>
	<br/>
	<c:forEach var="i" begin="1" end="10">
	  값2 : ${i} /
	</c:forEach>
	<br/>
<%
  String[] cards = {"국민","BC","LG","현대","삼성","농협","BC"};
  for(String card : cards) {
  	out.println(card + " / ");
  }
  pageContext.setAttribute("cards", cards);
%>
  <br/>
  <c:forEach var="card" items="${cards}">
  	${card} /
  </c:forEach>
  <br/>
  <c:set var="cards2" value="국민/BC/LG/현대/삼성/농협/BC" />
  카드 : ${cards2}<br/>
  <c:forTokens var="card" items="${cards2}" delims="/">
  	${card} :
  </c:forTokens>
  <br/>
  <h4>상태변수 사용(varStatus)</h4>
  <pre>
    예약어 : index, count, current, first, last 
  </pre>
  <c:forEach var="card" items="${cards2}" varStatus="st">
  	${st.index} / ${st.count} : ${st.current} : ${st.first} / ${st.last}<br/>
  </c:forEach>
  <br/>
  <c:forEach var="card" items="${cards}" varStatus="st">
  	${st.index} / ${st.count} : ${st.current} : ${st.first} / ${st.last}<br/>
  </c:forEach>
  <br/>
	<h4>images 폴더에 저장된 그림 5장을 출력하시오.</h4>
	<c:forEach var="i" begin="1" end="5">
	  그림${i}:<img src="${pageContext.request.contextPath}/images/${i}.jpg" width="150px"/> &nbsp;
	</c:forEach>
	<br/>
  <c:set var="img" value="1/2/3/4/5" />
  <c:forTokens var="i" items="${img}" delims="/" varStatus="st">
	  그림${i}:<img src="${pageContext.request.contextPath}/images/${i}.jpg" width="150px"/> &nbsp;
	  <c:if test="${st.count % 2 == 0}"><br/></c:if>
  </c:forTokens>
  <br/>
<%
  String[][] members = {
  		{"홍길동","25","서울"},
  		{"김말숙","33","청주"},
  		{"이기자","19","제주"},
  		{"강감찬","55","광주"},
  		{"김연아","19","서울"}
  };
	pageContext.setAttribute("members", members);
%>
  <hr/>
  <c:forEach var="member" items="${members}">
    <c:forEach var="m" items="${member}">
    	${m} /
    </c:forEach>
    <br/>
  </c:forEach>
  <hr/>
  <div class="border p-3">
    <form name="myform" method="post" action="${pageContext.request.contextPath}/j0807/JSTLtest">
      <div>성명
        <input type="text" name="name" id="name" value="이기자" class="form-control"/>
      </div>
      <div>나이
        <input type="number" name="age" id="age" value="22" class="form-control"/>
      </div>
			<div class="mb-3">성별 &nbsp;&nbsp;
	  	  <input type="radio" name="gender" value="남자" class="me-1" />남자 &nbsp;
	  	  <input type="radio" name="gender" value="여자" class="me-1" checked />여자
	  	</div>
	  	<div class="mb-3">직업
	  	  <select name="job" id="job" class="form-control">
	  	    <option value="">선택</option>
	  	    <option selected>회사원</option>
	  	    <option>공무원</option>
	  	    <option>군인</option>
	  	    <option>의사</option>
	  	    <option>자영업</option>
	  	    <option>가사</option>
	  	  </select>
	  	</div>
	  	<div>
	  	  <input type="submit" value="전송" class="btn btn-success"/>
	  	  <input type="button" value="전송2" onclick="fCheck()" class="btn btn-primary"/>
	  	</div>
    </form>
  </div>
  <div id="demo">
  	성명 : ${vo.name}<br/>
  	나이 : ${vo.age}<br/>
  	성별 : ${vo.gender}<br/>
  	직업 : ${vo.job}<br/>
  </div>
  <hr/>
  <table class="table table-hover">
    <tr class="table-secondary">
      <th>번호</th>
      <th>성명</th>
      <th>나이</th>
      <th>성별</th>
      <th>직업</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${st.count}</td>
        <td>${vo.name}</td>
        <td>${vo.age}</td>
        <td>${vo.gender}</td>
        <td>${vo.job}</td>
      </tr>
    </c:forEach>
  </table>
  <hr/>
  ===>>> URL이동 : 자바스크립트? location.hrer='';  ==>> redirect url = '경로'
  <%-- <c:redirect url='https://www.naver.com'/> --%>
  <c:redirect url='https://www.naver.com'>
    <c:param name="name" value="홍길동" />
  </c:redirect>
</div>
<p><br/></p>
</body>
</html>