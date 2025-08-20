<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>loginJoin.jsp</title>
	<script>
    'use strict';
    
    function fCheck() {
    	// 정규식을 이용한 유효성검사처리.....
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;	// 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
      let regNickName = /^[가-힣0-9_]+$/;		// 닉네임은 한글, 숫자, 밑줄만 가능
      let regName = /^[가-힣a-zA-Z]+$/;			// 이름은 한글/영문 가능
    	
    	
    	// 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입처리한다.
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value.trim();
    	let nickName = myform.nickName.value;
    	let name = myform.name.value;
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(pwd.length < 4 || pwd.length > 20) {
        alert("비밀번호는 4~20 자리로 작성해주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
			
    	myform.submit();
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/study2/exam/LoginJoinOk">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2" class="bg-secondary-subtle"><font size="5">회원가입</font></td>
      </tr>
      <tr>
        <th class="align-middle">아이디</th>
        <td><input type="text" name="mid" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th class="align-middle">비밀번호</th>
        <td><input type="password" name="pwd" required class="form-control"/></td>
      </tr>
      <tr>
        <th class="align-middle">닉네임</th>
        <td><input type="text" name="nickName" required class="form-control"/></td>
      </tr>
      <tr>
        <th class="align-middle">이름</th>
        <td><input type="text" name="name" required class="form-control"/></td>
      </tr>
      <tr>
        <th class="align-middle">나이</th>
        <td><input type="text" name="age" required class="form-control"/></td>
      </tr>
      <tr>
        <th class="align-middle">성별</th>
        <td>
        	<input type="radio" name="gender" value="여자"/>여자
        	<input type="radio" name="gender" value="남자" checked />남자
        </td>
      </tr>
      <tr>
        <th class="align-middle">주소</th>
        <td><input type="text" name="address" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
        	<input type="submit" value="회원가입" class="btn btn-secondary"/>
        	<!-- <button type="button" class="btn btn-success" onclick="fCheck()">회원가입</button> -->
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
</body>
</html>