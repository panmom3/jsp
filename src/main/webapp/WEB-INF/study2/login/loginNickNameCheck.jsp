<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>loginNickNameCheck.jsp</title>
  <jsp:include page="/include/bs5.jsp" />
  <script>
    'use strict';
    
    function sendCheck() {
    	opener.window.document.myform.nickName.value = '${nickName}';
    	opener.window.document.myform.name.focus();
    	window.close();
    }
    
    function nickNameCheck() {
    	let nickName = childForm.nickName.value;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		childForm.nickName.focus();
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
  <h3>닉네임 체크폼</h3>
  <c:if test="${res == 1}">
    <h5><font color="blue"><b>${nickName}</b></font>닉네임은 사용 가능합니다.</h5>
    <p><input type="button" value="창닫기" onclick="sendCheck()" class="btn btn-secondary btn-sm" /></p>
  </c:if>
  <c:if test="${res != 1}">
    <h5><span style="color:blue; font-weight:bolder">${nickName}</span> 닉네임은 이미 사용중인 아이디입니다.</h5>
    <form name="childForm" method="post" action="${ctp}/study2/login/LoginNickNameCheck">
    	<div class="input-group mt-3">
    	  <input type="text" name="nickName" class="form-control" autofocus required />
    	  <input type="button" value="닉네임재검색" onclick="nickNameCheck()" class="btn btn-secondary btn-sm"/>
    	</div>
    </form>
  </c:if>
</div>
<p><br/></p>
</body>
</html>