<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>fileList.jsp</title>
  <script>
    'use strict';
    
    // 서버 파일시스템의 실제 파일 삭제하기
    function fileDelete(fileName) {
    	let ans = confirm("현재 선택파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : 'FileDelete.st',
    		type : 'post',
    		data : {fileName : fileName},
    		success:function(res) {
    			if(res != '0') {
    				alert("파일 삭제완료");
    				location.reload();
    			}
    			else alert("파일 삭제 실패~~");
    		},
    		error : function() { alert("전송오류"); }
    	});
    }
    
    // 전체선택
    function allCheck() {
      for(let i=0; i<myform.fileFlag.length; i++) {
        myform.fileFlag[i].checked = true;
      }
    }

    // 전체취소
    function allReset() {
      for(let i=0; i<myform.fileFlag.length; i++) {
        myform.fileFlag[i].checked = false;
      }
    }

    // 선택반전
    function reverseCheck() {
      for(let i=0; i<myform.fileFlag.length; i++) {
        myform.fileFlag[i].checked = !myform.fileFlag[i].checked;
      }
    }
    
    // 선택항목 삭제처리
    function selectFileDelete() {
    	let selectFileArray = '';
    	
      for(let i=0; i<myform.fileFlag.length; i++) {
    	  let file = myform.fileFlag[i];
        if(file.checked) selectFileArray += file.value + "/";
      }
    	selectFileArray = selectFileArray.substring(0,selectFileArray.lastIndexOf("/"));
    	
    	if(selectFileArray == '') {
    		alert("삭제할 파일 항목을 1개 이상 선택하세요");
    		return false;
    	}
    	
    	let ans = confirm("선택된 파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
      $.ajax({
    	  url  : "FileSelectDelete.st",
    	  type : "post",
    	  data : {selectFileArray : selectFileArray},
    	  success: (res) => {
    		  if(res != "0") { 
    			  alert("선택한 항목들을 삭제하셨습니다.");
    			  location.reload();
    		  }
    		  else alert("삭제 실패~");
    	  },
    	  error : () => alert("전송 실패~~")
      });
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>서버 파일 리스트(총 : <font color='red'><b>${fn:length(files)}</b></font> 건)</h2>
  <p>(경로 : /images/pdsTest)</p>
  <hr/>
  <div class="row">
	  <div class="col input-group">
	    <input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm me-1"/>
	    <input type="button" value="전체취소" onclick="allReset()" class="btn btn-primary btn-sm me-1"/>
	    <input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-info btn-sm me-1"/>
	    <input type="button" value="선택항목삭제" onclick="selectFileDelete()" class="btn btn-danger btn-sm" />
	  </div>
	  <div class="col text-end">
	    <a href="PdsTest.st" class="btn btn-warning">돌아가기</a>
	  </div>
  </div>
  <hr/>
  <form name="myform">
	  <c:forEach var="file" items="${files}" varStatus="st">
	    <c:set var="fNameArr" value="${fn:split(file,'.')}" />
	    <c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
	    <div class="mb-3">
	      <input type="checkbox" name="fileFlag" value="${file}"/>
	      ${st.count} : 
		    <c:if test="${extName == 'zip'}">압축파일</c:if>
		    <c:if test="${extName == 'hwp'}">한글파일</c:if>
		    <c:if test="${extName == 'doc'}">Word문서파일</c:if>
		    <c:if test="${extName == 'ppt' || extName == 'pptx'}">파워포인트문서파일</c:if>
		    <c:if test="${extName == 'pdf'}">PDF문서파일</c:if>
		    <c:if test="${extName == 'txt'}">텍스트문서파일</c:if>
		  	<c:if test="${extName == 'jpg' || extName == 'gif' || extName == 'png'}">
		  	  <img src="${ctp}/images/pdsTest/${file}" width="150px">
		  	</c:if>
		  	: <a href="${ctp}/images/pdsTest/${file}" download="${file}" class="text-decoration-none" title="다운로드">${file}</a>
		  	: <a href="JavaFileDownload.st?file=${file}" class="btn btn-info btn-sm">다운로드</a>
		  	: <a href="javascript:fileDelete('${file}')" class="btn btn-danger btn-sm">삭제</a>
	  	</div>
	  </c:forEach>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>