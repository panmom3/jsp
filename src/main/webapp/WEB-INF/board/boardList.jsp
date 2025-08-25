<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/include/bs5.jsp" />
	<title>boardList.jsp</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container mt-5">
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td colspan="2"><h2 class="text-center mb-3">게시판 리스트</h2></td>
		</tr>
		<tr>	
			<td><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></td>
			<td class="text-end"></td>
		</tr>
	</table>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>올린날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${curScrStartNo}</td>
				<td>${vo.title}</td>
				<td>${vo.nickName}</td>
				<td>${vo.wDate}</td>
				<td>${vo.readNum}</td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"></c:set>
		</c:forEach>
	</table>
<!-- 블록페이지 시작 -->
<div class="text-center">
	<c:if test="${pag > 1}"><a href="BoardList.bo?pag=1" class="text-decoration-none link-primary">첫페이지</a></c:if>
	<c:if test="${curBlock > 0}"><a href="BoardList.bo?pag=${(curBlock-1)*blockSize + 1}" class="text-decoration-none link-primary">이전블록</a></c:if>
	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
		<c:if test="${i <= totPage && i == pag}">[<a href="BoardList.bo?pag=${i}" class="text-decoration-none link-primary text-danger"><b>${i}</b></a>]</c:if>
		<c:if test="${i <= totPage && i != pag}">[<a href="BoardList.bo?pag=${i}" class="text-decoration-none link-primary">${i}</a>]</c:if>
	</c:forEach>
	<c:if test="${curBlock < lastBlock}"><a href="BoardList.bo?pag=${(curBlock+1)*blockSize + 1}" class="text-decoration-none link-primary">다음블록</a></c:if>
	<c:if test="${pag < totPage}"><a href="BoardList.bo?pag=${totPage}" class="text-decoration-none link-primary">마지막페이지</a></c:if>
</div>
<!-- 블록페이지 끝 -->
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>