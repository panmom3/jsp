<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/include/bs5.jsp" />
	<title>friendMain.jsp</title>
	<script>
		'use strice';
		
		function friendList() {
			$.ajax({
				url : '${ctp}/study2/ajax/friend/FriendList',
				type : 'get',
				success:function(res) {
					// 테이블로 편집처리
					
					let str = res;
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
<div class="container mt-5">
	<h2 class="text-center mb-3">AJAX를 이용한 CRUD 구현하기</h2>
	<hr/>
	<div class="row text-center">
		<div class="col"><a href="javascript:friendList()" class="btn btn-success btn-sm">전체리스트</a></div>
		<div class="col"><a href="javascript:friendInput()" class="btn btn-info btn-sm">회원가입</a></div>
		<div class="col"><a href="javascript:friendSearch()" class="btn btn-primary btn-sm">개별조회(수정/삭제)</a></div>
		<div class="col"><a href="javascript:location.reload()" class="btn btn-warning btn-sm">새로고침</a></div>
	</div>
	<hr/>
	<div id="demo"></div>
</div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>