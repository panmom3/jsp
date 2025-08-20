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
    
    let idCheckSw = 0;
    let nickNameCheckSw = 0;
    
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
    	
    	// 아이디/닉네임 중복버튼 눌렀는지 체크?
      if(idCheckSw == 0) {
    	  alert("아이디 중복체크버튼을 눌러주세요");
    	  document.getElementById("midBtn").focus();
      }
      else if(nickNameCheckSw == 0) {
    	  alert("닉네임 중복체크버튼을 눌러주세요");
    	  document.getElementById("nickNameBtn").focus();
      }
      else myform.submit();
    }
    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	let url = "${ctp}/study2/login/LoginIdCheck?mid="+mid;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else {
    		myform.mid.readOnly = true;
    		window.open(url,"nWin","width=440px,height=220px");
    	}
    }
    
    // 닉네임 중복체크
    function nickNameCheck() {
    	let nickName = myform.nickName.value;
    	let url = "${ctp}/study2/login/LoginNickNameCheck?nickName="+nickName;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		myform.nickName.focus();
    	}
    	else {
    		myform.nickName.readOnly = true;
    		window.open(url,"nWin","width=440px,height=220px");
    	}
    }
    
    // 아이디/닉네임 중복체크버튼에서 제어가 옮겨갈때 실행....
    $(function() {
    	$("#midBtn").on("blur", () => idCheckSw = 1);
    	$("#nickNameBtn").on("blur", () => nickNameCheckSw = 1);
    });
  </script>
  <style>
    .boxWidth {
      width: 18%;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/study2/login/LoginJoinOk" class="was-validated">
    <h2 class="text-center">회 원 가 입</h2>
    <br/>
    <div class="input-group mb-3">
      <label for="mid" class="input-group-text boxWidth">아이디</label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
      <input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary btn-sm" onclick="idCheck()"/>
    </div>
    <div class="input-group mb-3">
      <label for="pwd" class="input-group-text boxWidth">비밀번호</label>
      <input type="password" name="pwd" id="pwd" value="1234" placeholder="비밀번호를 입력하세요." class="form-control" required />
    </div>
    <div class="input-group mb-3">
      <label for="nickName" class="input-group-text boxWidth">닉네임</label>
      <input type="text" name="nickName" id="nickName" placeholder="별명을 입력하세요." class="form-control" required />
      <input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickNameCheck()"/>
    </div>
    <div class="input-group mb-3">
      <label for="name" class="input-group-text boxWidth">성 명</label>
      <input type="text" name="name" id="name" placeholder="성명을 입력하세요." class="form-control" required />
    </div>
    <div class="input-group mb-3">
      <label for="age" class="input-group-text boxWidth">나 이</label>
      <input type="text" name="age" id="age" value="20" min="1" max="99" class="form-control" required />
    </div>
    <div class="input-group mb-3 border ">
      <span class="input-group-text boxWidth">성 별</span> &nbsp; &nbsp;
      <div class="form-check-inline mt-2">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="남자"> 남자 &nbsp;
        </label>
      </div>
      <div class="form-check-inline mt-2">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="여자" checked> 여자
        </label>
      </div>
    </div>
    <div class="input-group mb-3">
      <label for="address" class="input-group-text boxWidth">주 소</label>
      <input type="text" name="address" id="address" placeholder="주소를 입력하세요." class="form-control" />
    </div>
    <div class="text-center">
	    <button type="button" class="btn btn-success" onclick="fCheck()">회원가입</button> &nbsp;
	    <button type="button" class="btn btn-warning" onclick="location.reload()">다시작성</button> &nbsp;
	    <button type="button" class="btn btn-info" onclick="location.href='${ctp}/study2/exam/Login';">돌아가기</button>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>