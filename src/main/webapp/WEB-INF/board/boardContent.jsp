<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/include/bs5.jsp" />
	<title>boardContent.jsp</title>
	<script>
    'use strict';
    
    // 좋아요 처리(중복 허용)
    function goodCheck() {
    	$.ajax({
    		url : 'BoardGoodCheck.bo',
    		type : 'post',
    		data : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res != '0') location.reload();
    		},
    		error : function() { alert("전송오류");}
    	});
    }
    
 		// 좋아요 따봉처리(중복 허용)
    function goodCheckPlus() {
    	$.ajax({
    		url : 'BoardGoodCheckPlusMinus.bo',
    		type : 'post',
    		data : {
    			idx : ${vo.idx},
    			gooCnt : 1
    		},
    		success:function(res) {
    			if(res != '0') location.reload();
    		},
    		error : function() { alert("전송오류");}
    	});
    }
		// 싫어요 처리(중복 허용)
    function goodCheckMinus() {
    	$.ajax({
    		url : 'BoardGoodCheckPlusMinus.bo',
    		type : 'post',
    		data : {
    			idx : ${vo.idx},
    			gooCnt : -1
    		},
    		success:function(res) {
    			if(res != '0') location.reload();
    		},
    		error : function() { alert("전송오류");}
    	});
    }
    <!--
    $(document).ready(function() {
        let likeCount = 0;

        $(".like-btn").click(function() {
          likeCount++;
          $(".count").text(likeCount);
        });
      });
    -->
  </script>
	<style>
		th{background-color:#eee !important;text-align: center;}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<div class="container mt-5">
	<h2 class="text-center">글 내 용 보 기</h2>
	<table class="table table-bordered">
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickName}</td>
			<th>글쓴날짜</th>
			<td>${vo.wDate}</td>
		</tr>
		<tr>
			<th>글조회수</th>
			<td>${vo.readNum}</td>
			<th>접속IP</th>
			<td>${vo.hostIp}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${vo.title}
				(<a href="javascript:goodCheck()" class="text-decoration-none" title="좋아요">❤️</a> : ${vo.good})
				/
				<a href="javascript:goodCheckPlus()" class="text-decoration-none" title="좋아요">👍</a>
				<a href="javascript:goodCheckMinus()" class="text-decoration-none" title="싫어요">👎</a>
			</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3" style="height:220px">${fn.replace(vo.content, newLine, "<br/>")}</td>
		</tr>
		<tr>
			<td colspan="4" class="text-center">
				<input type="button" value="돌아가기" onclick="location.href='BoardList.bo';" />
			</td>
		</tr>
	</table>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>