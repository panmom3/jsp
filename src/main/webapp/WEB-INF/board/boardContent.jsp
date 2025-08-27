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
  
    // 좋아요 처리(중복 불허)
    function goodCheck() {
    	$.ajax({
    		url  : 'BoardGoodCheck.bo',
    		type : 'post',
    		data : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res != '0') location.reload();
    			else alert("이미 좋아요를 클릭하셨습니다.");
    		},
    		error : function() { alert("전송오류!!"); }
    	});
    }
  
    // 좋아요(따봉) 처리(중복 허용)
    function goodCheckPlus() {
    	$.ajax({
    		url  : 'BoardGoodCheckPlusMinus.bo',
    		type : 'post',
    		data : {
    			idx : ${vo.idx},
    			gooCnt : 1
    		},
    		success:function(res) {
    			if(res != '0') location.reload();
    		},
    		error : function() { alert("전송오류!!"); }
    	});
    }
  
    // 싫어요 처리(중복 허용)
    function goodCheckMinus() {
    	$.ajax({
    		url  : 'BoardGoodCheckPlusMinus.bo',
    		type : 'post',
    		data : {
    			idx : ${vo.idx},
    			gooCnt : -1
    		},
    		success:function(res) {
    			if(res != '0') location.reload();
    		},
    		error : function() { alert("전송오류!!"); }
    	});
    }
    
    // 게시글 삭제처리
    function deleteCheck() {
    	let ans = confirm("현재 게시글을 삭제하시겠습니까?");
    	if(ans) location.href = "BoardDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
    }
    
    // 댓글 저장하기
    function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert('댓글을 입력하세요');
    		return false;
    	}
    	let query = {
    			boardIdx : ${vo.idx},
    			mid      : '${sMid}',
    			nickName : '${sNickName}',
    			hostIp   : '${pageContext.request.remoteAddr}',
    			content  : content
    	}
    	
    	$.ajax({
    		url  : 'BoardReplyInput.bo',
    		type : 'post',
    		data : query,
    		success:function(res) {
    			if(res != '0') {
    				alert('댓글이 입력되었습니다.');
    				location.reload();
    			}
    			else alert("댓글 입력 실패~~");
    		},
    		error : function() { alert("전송오류!!"); }
    	});
    }
    
    // 댓글 삭제처리
    function replyDelete(idx) {
    	let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : "BoardReplyDelete.bo",
    		type : "post",
    		data : {idx : idx},
    		success:function(res) {
    			if(res != '0') {
    				alert('댓글이 삭제되었습니다.');
    				location.reload();
    			}
    			else alert("댓글 삭제 실패~~");
    		},
    		error : function() { alert("전송오류!!"); }
    	});
    }
  </script>
  <style>
    th {
      background-color: #eee !important;
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">글 내 용 보 기</h2>
  <table class="table table-bordered m-0 p-0">
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
      <td colspan="3" style="height:230px">${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
  </table>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="text-start">
        <c:if test="${boardFlag == 'search'}"><input type="button" value="돌아가기" onclick="location.href='BoardSearchList.bo?search=${search}&searchString=${searchString}';" class="btn btn-success" /></c:if>
        <c:if test="${boardFlag != 'search'}"><input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-success" /></c:if>
      </td>
      <td class="text-end">
        <c:if test="${sMid == vo.mid || sAdmin == 'adminOK'}">
          <c:if test="${sMid == vo.mid}">
	        	<input type="button" value="수정" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning" />
	        </c:if>
	        <input type="button" value="삭제" onclick="deleteCheck()" class="btn btn-danger" />
        </c:if>
      </td>
    </tr>
  </table>
  <hr/>
  <!-- 이전글/다음글 -->
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="m-0 p-0">
        <c:if test="${!empty nextVo.title}">
	        👆 <a href="BoardContent.bo?idx=${nextVo.idx}&pag=${pag}&pageSize=${pageSize}" class="text-decoration-none">다음글 : ${nextVo.title}</a>
        </c:if>
      </td>
    </tr>
    <tr>
      <td class="m-0 p-0">
        <c:if test="${!empty preVo.title}">
        	👇 <a href="BoardContent.bo?idx=${preVo.idx}&pag=${pag}&pageSize=${pageSize}" class="text-decoration-none">이전글 : ${preVo.title}</a>
        </c:if>
      </td>
    </tr>
  </table>
  <br/>
  
  <!-- 댓글 처리(리스트/입력) 시작 -->
  <!-- 댓글 리스트 -->
  <table class="table table-hover text-center">
    <tr>
      <th>작성자</th>
      <th>댓글내용</th>
      <th>댓글일자</th>
      <th>댓글IP</th>
    </tr>
    <c:forEach var="replyVo" items="${replyVos}" varStatus="st">
      <tr>
        <td class="text-start">
          ${replyVo.nickName}
          <c:if test="${sMid == replyVo.mid}"><a href="javascript:replyDelete(${replyVo.idx})" title="삭제" class="text-decoration-none">x</a></c:if>
        </td>
        <td class="text-start">${fn:replace(replyVo.content, newLine, "<br/>")}</td>
        <td>${replyVo.wDate}</td>
        <td>${replyVo.hostIp}</td>
      </tr>
    </c:forEach>
  </table>
  <!-- 댓글 입력폼 -->
  <form name="replyForm">
    <table class="table table-center">
      <tr>
        <td style="width:85%" class="text-start">
          글내용 :
          <textarea rows="4" name="content" id="content" class="form-control"></textarea>
        </td>
        <td style="width:15%">
          <br/>
          <p>작성자 : ${sNickName}</p>
          <p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"/></p>
        </td>
      </tr>
    </table>
  </form>
  <!-- 댓글 처리(리스트/입력) 끝 -->
  
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>