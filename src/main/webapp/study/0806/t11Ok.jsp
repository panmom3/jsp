<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t08Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>전송된 값</h2>
  <table class="table bordered">
    <tr>
      <th>성명</th>
      <td>${name}</td>
    </tr>
    <tr>
      <th>나이</th>
      <td>${age}</td>
    </tr>
    <tr>
      <th>성별</th>
      <td>${gender}</td>
    </tr>
    <tr>
      <th>취미</th>
      <td>${hobby}</td>
    </tr>
    <tr>
      <th>직업</th>
      <td>${job}</td>
    </tr>
    <tr>
      <th>다녀온산</th>
      <td>${mountain}</td>
    </tr>
    <tr>
      <th>자기소개</th>
      <td>${content}</td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>${fileName}</td>
    </tr>
    <tr>
      <td colspan="2">
      	<a href="javascript:location.href='${pageContext.request.contextPath}/study/0806/t11_mvc2.jsp';" class="btn btn-warning">돌아가기</a>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>