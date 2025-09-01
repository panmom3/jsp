<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="http://192.168.50.61:9090/springGroup">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="GuestList.gu">Guest</a>
      </li>
      <c:if test="${!empty sMid}">
	      <li class="nav-item">
	        <a class="nav-link" href="BoardList.bo">Board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="PdsList.pds">PDS</a>
	      </li>
	      <li class="nav-item">
	        <div class="dropdown">
					  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">Study</button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="${ctp}/login/FriendInfo">회원정보</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/ajax/friend/FriendMain">AJAX연습</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/mapping/Directory">디렉토리매핑연습</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension.do">확장자매핑연습1</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension2.test">확장자매핑연습2</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension3.test3">확장자매핑연습3</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension4.test4">확장자매핑연습4</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension5.test5">확장자매핑연습5</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/uuid/Uuid.st">UUID연습</a></li>
					    <li><a class="dropdown-item" href="${ctp}/study2/pdsTest/PdsTest.st">file업로드연습</a></li>
					    <li><a class="dropdown-item" href="Sha.st">SHA암호화</a></li>
					    <li><a class="dropdown-item" href="ModalTest.st">Modal 연습</a></li>
					  </ul>
					</div>
	      </li>
      </c:if>
      <li class="nav-item">
        <c:if test="${!empty sMid}"><a class="nav-link" href="${ctp}/study2/login/Logout">Logout</a></c:if>
        <c:if test="${empty sMid}"><a class="nav-link" href="${ctp}/study2/login/Login">Login</a></c:if>
      </li>
    </ul>
  </div>
</nav>