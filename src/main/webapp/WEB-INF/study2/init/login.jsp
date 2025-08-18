<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
	<title>login.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/study2/init/LoginOK">
		<table class="table table-bordered text-center">
			<tr>
				<th colspan="2"><font size="5">로 그 인</font><br/>
					(${sOfficeName}/${sOfficeEmail}) - ${aTest}
				</th>
			</tr>
			<tr>
				<th>부서명</th>
				<td><input type="text" name="className" value="${className}" autofocus required class="form-control"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" value="${mid}" required class="form-control"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" value="" required class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn btn-success me-2" />
					<input type="reset" value="다시입력" class="btn btn-success me-2" />
					<input type="button" value="돌아가기" onclick="${ctp}/study2/TestMenu" class="btn btn-primary me-2" />
				</td>
			</tr>
		</table>
	</form>			
</div>
<p><br/></p>
</body>
</html>