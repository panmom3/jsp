<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>t15_res.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>성적 결과</h2>
  <table class="table table-bordered text-center">
    <tr>
      <th>성명</th>
      <td>${vo.name}</td>
    </tr>
    <tr>
      <th>학번</th>
      <td>${vo.hakbun}</td>
    </tr>
    <tr>
      <th>국어</th>
      <td>${vo.kor}</td>
    </tr>
    <tr>
      <th>영어</th>
      <td>${vo.eng}</td>
    </tr>
    <tr>
      <th>수학</th>
      <td>${vo.mat}</td>
    </tr>
    <tr>
      <th>과학</th>
      <td>${vo.sci}</td>
    </tr>
    <tr>
      <th>사회</th>
      <td>${vo.soc}</td>
    </tr>
    <tr>
      <th>총점</th>
      <td>${vo.tot}</td>
    </tr>
    <tr>
      <th>평균</th>
      <td>${vo.avg}</td>
    </tr>
    <tr>
      <th>학점</th>
      <td>${vo.grade}</td>
    </tr>
    <tr>
      <th>HostIp</th>
      <td>${vo.hostIp}</td>
    </tr>
  </table>
  <div class="text-center"><a href="t15_main.jsp" class="btn btn-warning">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>