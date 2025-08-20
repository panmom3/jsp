<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>loginMain.jsp</title>
	<script>
		'use strict';
		
		function logout(){
			let ans = confirm("로그아웃하시겠습니까?");
			if(ans) location.href="${ctp}/study2/login/Logout";
		}
		
		function loginList() {
			
		}
		
		function loginSearch() {
			$.ajax({
				url : '${ctp}/study2/login/LoginSearch1',
				type : 'get',
				data : {mid: "admin"},
				success :function(res) {
					document.getElementId("demo").innerHTML = res;
				},
				error : function() {alert("전송오류~~")}
			});
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원 전용방</h2>
	<hr/>
	<div class="row text-center">
		<div class="col"><a href="LoginList" class="btn btn-success btn-sm">회원리스트(비)</a></div>
		<div class="col"><a href="javascript:loginList()" class="btn btn-success btn-sm">회원리스트(동)</a></div>
		<div class="col"><a href="javascript:loginSearch1()" class="btn btn-success btn-sm">회원검색(admin)</a></div>
		<div class="col"><a href="" class="btn btn-success btn-sm">회원검색(form)</a></div>
		<div class="col"><a href="LoginList" class="btn btn-success btn-sm">회원정보갱신</a></div>
		<div class="col"><a href="${ctp}/study2/test/TestMenu" class="btn btn-warning btn-sm">돌아가기</a></div>
	</div>
	<hr/>
	<div>이곳은 회원 전용서비스 구역입니다.</div>
	<div>회원 아이디 : ${sMid}</div>
	<div>회원 닉네임 : ${sNickName}</div>
	<hr/>
	<div id="demo"></div>
	<hr/>
	<div>
		<button type="button" onclick="logout()" class="btn btn-success text-center">로그아웃</button>
	</div>
</div>
<p><br/></p>
</body>
</html>