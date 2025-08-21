<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>loginIdCheck.jsp</title>
  <jsp:include page="/include/bs5.jsp" />
  <script>
    'use strict';
    
    function sendCheck() {
    	opener.window.document.myform.mid.value = '${mid}';
    	opener.window.document.myform.pwd.focus();
    	window.close();
    }
    
    function idCheck() {
    	let mid = childForm.mid.value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		childForm.mid.focus();
    	}
    	else {
    		childForm.submit();
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h3>아이디 체크폼</h3>
  <c:if test="${res == 1}">
    <h5><font color="blue"><b>${mid}</b></font>아이디는 사용 가능합니다.</h5>
    <p><input type="button" value="창닫기" onclick="sendCheck()" class="btn btn-secondary btn-sm" /></p>
  </c:if>
  <c:if test="${res != 1}">
    <h5><span style="color:blue; font-weight:bolder">${mid}</span> 아이디는 이미 사용중인 아이디입니다.</h5>
    <form name="childForm" method="post" action="${ctp}/study2/login/LoginIdCheck">
    	<div class="input-group mt-3">
    	  <input type="text" name="mid" class="form-control" autofocus required />
    	  <input type="button" value="아이디재검색" onclick="idCheck()" class="btn btn-secondary btn-sm"/>
    	</div>
    </form>
  </c:if>
</div>
<p><br/></p>
</body>
</html>