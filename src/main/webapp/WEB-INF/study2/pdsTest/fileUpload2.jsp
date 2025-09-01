<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>fileUpload2.jsp</title>
  <script>
    'use strict';
    
    function fCheck() {
    	let fName1 = document.getElementById("file1").value;
    	let fName2 = document.getElementById("file2").value;
    	let fName3 = document.getElementById("file3").value;
    	let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
    	let ext2 = fName2.substring(fName2.lastIndexOf(".")+1).toLowerCase();
    	let ext3 = fName3.substring(fName3.lastIndexOf(".")+1).toLowerCase();
    	let maxSize = 1024 * 1024 * 10;	// 최대 10MByte
    	
    	if(fName1.trim() == "" || fName2.trim() == "" || fName3.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	let fileSize1 = document.getElementById("file1").files[0].size;
    	let fileSize2 = document.getElementById("file2").files[0].size;
    	let fileSize3 = document.getElementById("file3").files[0].size;
    	if(fileSize1 > maxSize || fileSize2 > maxSize || fileSize3 > maxSize) {
    		alert("업로드할 파일의 최대용량은 10MByte 이하로 등록하세요");
    	}
    	else if(ext1 != 'jpg' && ext1 != 'gif' && ext1 != 'png' && ext1 != 'zip' && ext1 != 'hwp' && ext1 != 'doc' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'pdf' && ext1 != 'txt') {
    		alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/doc/ppt/pptx/pdf/txt'파일 입니다.");
    	}
    	else if(ext2 != 'jpg' && ext2 != 'gif' && ext2 != 'png' && ext2 != 'zip' && ext2 != 'hwp' && ext2 != 'doc' && ext2 != 'ppt' && ext2 != 'pptx' && ext2 != 'pdf' && ext2 != 'txt') {
    		alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/doc/ppt/pptx/pdf/txt'파일 입니다.");
    	}
    	else if(ext3 != 'jpg' && ext3 != 'gif' && ext3 != 'png' && ext3 != 'zip' && ext3 != 'hwp' && ext3 != 'doc' && ext3 != 'ppt' && ext3 != 'pptx' && ext3 != 'pdf' && ext3 != 'txt') {
    		alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/doc/ppt/pptx/pdf/txt'파일 입니다.");
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습2(멀티파일)</h2>
  <hr/>
  <form name="myform" method="post" action="FileUploadOk2.st" enctype="multipart/form-data">
    <div>
      <input type="file" name="fName1" id="file1" class="form-control mb-2"/>
      <input type="file" name="fName2" id="file2" class="form-control mb-2"/>
      <input type="file" name="fName3" id="file3" class="form-control mb-2"/>
      <!-- <input type="submit" value="파일전송" class="btn btn-success form-control"/> -->
      <input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control"/>
    </div>
  </form>
  <hr/>
  <div class="row">
    <div class="col"><a href="FileList.st" class="btn btn-primary form-control">파일목록보기</a></div>
    <div class="col"><a href="PdsTest.st" class="btn btn-warning form-control">돌아가기</a></div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>