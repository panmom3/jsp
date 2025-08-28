<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>uuid.jsp</title>
  <script>
    'use strict';
    
    let str = '';
    function uuidCheck() {
    	$.ajax({
    		url  : 'UuidProcess.st',
    		type : 'get',
    		success:function(res) {
    			str += res + "<br/>";
    			demo.innerHTML = str;
    		},
    		error : function() { alert("전송오류!"); }
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>UUID 사용예</h2>
  <pre>
    UUID(Universally Unique IDentifier)는 네트워크상에서 고유성이 보장되는 id를 만들기 위한 규약.
    '거의 중복되는 확률이 0에 가까움. 중복이 매우 낮은 확률을 가지는 ID를 만드는 방법을 표준화한것이 UUID이다.
    32자의 16진수로 표시(128Bit)로 표현됨 : 8-4-4-4-12)
    예) 1234abdf-AD23-ff12-8823-43260fdabca3
  </pre>
  <form name="myform">
    <input type="button" value="UUID생성" onclick="uuidCheck()" class="btn btn-success"/>
    <input type="button" value="새로하기" onclick="location.reload()" class="btn btn-warning"/>
  </form>
  <hr/>
  출력결과<br/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>