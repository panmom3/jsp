<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/include/bs5.jsp" />
	<title>directory.jsp</title>
	<script>
		'use strice';
		function fCheck(flag) {
			let su1 = myform.su1.value;
			let su2 = myform.su2.value;
			
			if(flag == 1) {
				let query = {
						su1 : su1,
						su2 : su2
				}
				$.ajax({
		     		url  : "DirectoryCha",
		     		type : 'get',
		     		data : query,
		     		success:function(res) {
		     			let temp = res.split(":");
		     			cha.innerHTML = temp[0];
		     			msg.innerHTML = temp[1];
		     		},
		     		error : function() { alert("전송오류!"); }
		     	});
			} else if(flag == 2) {
				myform.action = "${ctp}/study2/mapping/DirectoryRes";
				myform.submit();
			}
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container mt-5">
	<h2>디렉토리 매핑 연습</h2>
	<div>전송 메세지 : <span id="msg">${message}</span></div>
	<hr/>
	<form name="myform" method="post" action="${ctp}/study2/mapping/DirectoryOk">
		<div class="mb-3">
			<input type="submit" value="두수의 합" class="btn btn-success me-3"/>
			<input type="button" value="두수의 차" onclick="fCheck(1)" class="btn btn-success me-3"/>
			<input type="button" value="새로고침" onclick="location.href='Directory'" class="btn btn-warning me-3"/>
			<input type="button" value="전송" onclick="fCheck(2)" class="btn btn-info me-3"/>
		</div>
		<div>
				<input type="number" name="su1" value="${su1}" class="form-control mb-2"/>
				<input type="number" name="su2" value="${su2}" class="form-control mb-2"/>
		</div>
	</form>
	<hr/>
	<div>두수의 합 : ${hap}</div>
	<div>두수의 차 : <span id="cha">${cha}</span></div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>