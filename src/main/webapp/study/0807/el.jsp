<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>el.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language)</h2>
  <p>저장소(서버 저장소 : ServerContext컨테이너에 저장(기록)되어 있는 자료에 대한 처리를 담당)
  <hr/>
  <pre>
    사용법 : $ {변수/값/객체/수식}
    용도 : 사용자(클라이언트)가 '변수/값/객체/수식'등을 서버로부터 전송받은후에 해당 자료를 '(변수)저장', 계산, 선언등의 처리용도로 사용.
    서버저장소 : Application / Session / PageContext / Request
  </pre>
  <hr/>
<%
  String name = "홍길동";
  String addr = "Seoul";
  int su1 = 100, su2 = 200;
  String su3 = "100", su4 = "400";
  
  out.println("<h4>스크립틀릿을 이용한 출력</h4>");
  out.println("name :" + name);
  out.println("<br/>addr : " + addr);
  out.println("<br/>su1 : " + su1);
  out.println("<br/>su1 + su2 : " + (su1 + su2));
  out.println("<br/>su3 + su3 : " + (su3 + su4));
  //out.println("<br/>su3 * su3 : " + (su3 * su4)); // 문자 곱하기 연산 불가
%>
  <hr/>
  <h4>표현식을 이용한 출력</h4>
  name = <%=name %><br/>
  addr = <%=addr %><br/>
  su1 = <%=su1 %><br/>
  su1 + su2 = <%=(su1 + su2) %><br/>
  su3 * su4 = < %=(su3 * su4) %><br/> <!-- 자바에서는 문자 곱하기 연산 불가 -->
  <hr/>
  <h4>EL 표기법을 이용한 출력</h4>
<%
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("addr", addr);
  pageContext.setAttribute("su1", su1);
  pageContext.setAttribute("su2", su2);
  pageContext.setAttribute("res1", (su1 + su2));
  pageContext.setAttribute("res2", (su3 + su4));
  //pageContext.setAttribute("res3", (su3 * su4)); // 문자 곱하기 연산 불가
%>
  name = ${name}<br/>
  addr = ${addr}<br/>
  su1 = ${su1}<br/>
  res1 = ${res1}<br/>
  res2 = ${res2}<br/>
  su1 + su2 = ${(su1 + su2)}<br/>
  su1 * su2 = ${(su1 * su2)}<br/>
  $ {su1} + $ {su2} = ${su1} + ${su2}<br/>
  <hr/>
  <h4>파라메터를 통해서 넘어온 값의 처리(QueryString형식)</h4>
  <p>폼태그 또는 get방식을 통해서 넘어온 값에 대한 처리를 할수 있다.(주소?변수1=값1&변수2=값2......)</p>
  <div>주소창의 마지막 파일명또는 경로명뒤에 '?mbc=20&kbs=50'을 입력후 확인하시오.</div>
  mbc = ${param.mbc}<br/>
  kbs = ${param.kbs}<br/>
  mbc + kbs = ${param.mbc + param.kbs}<br/>
  mbc - kbs = ${param.mbc - param.kbs}<br/>
  <hr/>
  <h4>폼태그의 post방식을 통한 전송</h4>
  <div>
    <form name="myform" method="post" action="${pageContext.request.contextPath}/j0807/ELtest">
      <div>성명
        <input type="text" name="name2" value="이기자" class="form-control"/>
      </div>
	  	<div class="mb-3">직업
	  	  <select name="job" class="form-control">
	  	    <option value="">선택</option>
	  	    <option>회사원</option>
	  	    <option>공무원</option>
	  	    <option>군인</option>
	  	    <option>의사</option>
	  	    <option>자영업</option>
	  	    <option>가사</option>
	  	  </select>
	  	</div>
	  	<div>
	  	  <input type="submit" value="전송" class="btn btn-success"/>
	  	</div>
    </form>
  </div>
  <hr/>
  <p>성명 : ${name2}</p>
  <p>직업 : ${job}</p>
</div>
<p><br/></p>
</body>
</html>