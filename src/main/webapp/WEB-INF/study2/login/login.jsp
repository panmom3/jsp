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
  <form name="myform" method="post" action="${ctp}/study2/login/LoginOk">
    <table class="table table-bordered text-center">
      <tr>
        <td colspan="2" class="bg-secondary-subtle"><font size="5">로 그 인</font></td>
      </tr>
      <tr>
        <th class="align-middle">아이디</th>
        <td><input type="text" name="mid" value="${mid}" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th class="align-middle">비밀번호</th>
        <td><input type="password" name="pwd" value="1234" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <div class="mb-2">
	          <input type="submit" value="로그인" class="btn btn-success me-2"/>
	          <input type="reset" value="다시입력" class="btn btn-warning me-2"/>
	          <input type="button" value="회원가입" onclick="location.href='${ctp}/study2/login/LoginJoin';" class="btn btn-secondary"/>
          </div>
	    		<div style="font-size:0.8em">
	    			<input type="checkbox" name="idSave" checked /> 아이디 저장 /
	    			<!-- <a href="#" class="text-decoration-none text-white link-primary badge bg-danger">아이디찾기</a> / -->
	    			<a href="#" class="text-decoration-none text-dark link-primary">아이디찾기</a> /
	    			<a href="#" class="text-decoration-none text-dark link-primary">비밀번호찾기</a>
	    		</div>
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
</body>
</html>