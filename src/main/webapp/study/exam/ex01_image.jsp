<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
  콤보상자와 리스트박스에 그림을 추가시켜준후, 그림을 선택하면 하단에 선택된 그림을 표시하시오.
  단, 리스트박스의 그림은 여러장을 선택하여 출력시켜줄수 있도록 처리한다.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t08.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    // 콤보상자 클릭시 그림 1장 출력
    function imgChange() {
            let img = $('#img').val();
        console.log(img);
            // $('#imgDemo').attr('src','../../images/'+img+'.jpg');
            $('#imgDemo').attr('src','<%=request.getContextPath()%>/images/'+img+'.jpg');
        }
    
    // 리스트박스 클릭시 그림 여러장 출력
    function imgChange2() {
            let img = $('#img2').val();
        console.log(img);
        let str = '';
        for(let i of img) {
            str += '<img src="../../images/'+i+'.jpg" width="150px" /><br/>';
        }
            $('#demo').html(str);
        }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>아래 콤보상자에서 그림파일을 선택하면 선택된 그림을 화면에 출력시켜주시오.</h2>
  <hr/>
  <form action="t08Ok.jsp">
      <div>그림선택
        <select name="img" id="img" class="form-control" onchange="imgChange()">
          <option value="1">111</option>
          <option value="2">112</option>
          <option value="3">113</option>
          <option value="4">114</option>
          <option value="5">115</option>
        </select>
      </div>
      <hr/>
      <div>그림선택
        <select name="img2" id="img2" size="5" multiple class="form-control" onclick="imgChange2()">
          <option value="1">111</option>
          <option value="2">112</option>
          <option value="3">113</option>
          <option value="4">114</option>
          <option value="5">115</option>
        </select>
      </div>
  </form>
  <hr/>
  <div><img src="" id="imgDemo" width="200px"/></div>
  <div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>