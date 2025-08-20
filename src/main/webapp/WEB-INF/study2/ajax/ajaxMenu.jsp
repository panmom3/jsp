<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>ajaxMenu.jsp</title>
  <script>
    'use strict';
    
    // 동기식 처리
    function idCheck1() {
    	let mid = myform.mid.value.trim();
    	location.href = "${ctp}/study2/ajax/IdCheck1?mid="+mid;
    }
    
    // 비동기식 처리(브라우저에서 제공해주는 XMLHttpRequest객체를 사용하는 방식)
    function idCheck2() {
    	let mid = myform.mid.value.trim();
    	
    	let xhr = new XMLHttpRequest();
    	xhr.open("GET", "${ctp}/study2/ajax/IdCheck2?mid="+mid);
    	xhr.send();
    	
    	xhr.onreadystatechange = function() {
    		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
    			document.getElementById("demo").innerHTML = xhr.responseText;
    		}
    		else {
    			document.getElementById("demo").innerHTML = "전송오류";
    		}
    	}
    }
    
    // 비동기식(fetch())
    function idCheck3() {
        let mid = myform.mid.value.trim();
        
	      fetch("${ctp}/study2/ajax/IdCheck2?mid=" + mid)
          .then(res => res.text()) // 객체res->응답을 텍스트로 변환
          .then(data => {          // res를 data 담아서 처리
              document.getElementById("demo").innerHTML = data;
              console.log("res :", data);
          })
          .catch(error => {
              document.getElementById("demo").innerHTML = "전송오류";
              console.error(error);
          });
    }
 		// 비동기식(jQuery에서 제공해주는 aJax방식)
 		function idCheck4() {
        let mid = myform.mid.value.trim();
        //alert("처리전~~");
        
        $.ajax({
        	url : "${ctp}/study2/ajax/IdCheck2",   //필수
        	type: "get",   //필수
        	data: {"mid" : mid},   //값이 있으면
        	//dataType : "json",
        	contextType : "application/json",
        	charset : "utf-8",
        	timeout : 10000,
        	beforeSend: function() {
        		console.log("처리전 : ", mid);
        	},
        	success:function(res) {   //필수
        		$("#demo").html(res);
        	},
        	error : function() {alert("전송오류~~")},
        	complete : function() {
        		console.log("처리후 :", mid);
        	}
        });
        //alert("처리후~~");
 		}
 		// 비동기식(ajax처리)
 		function idCheck5() {
 			let mid = myform.mid.value.trim();
 			if(mid == "") {
 				alert("아이디를 입력하세요");
 				return false;
 			}
 			let query = {
 					mid : mid
 			}
 			
 			$.ajax({
 				url : '${ctp}/study2/ajax/IdCheck5',
 				type : 'post',
 				data : query,
 				success : function(res) {  //응답값 res
 					//alert("정상처리...");   //응답이 없을경우
 					let str = '닉네임 : <font color="red">' + res + '</font>';
 					$("#demo").html(str);
 				},
 				error : function() {alert("전송오류~~")}
 			});
 		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>aJax 연습</h2>
  <form name="myform">
    <div class="input-group">
      <div class="input-group-text">아이디</div>
      <input type="text" name="mid" id="mid" value="admin" class="form-control"/>
    </div>
    <hr/>
    <div class="text-center">
      <input type="button" value="동기식" onclick="idCheck1()" class="btn btn-success me-2"/>
      <input type="button" value="비동기식(XML)" onclick="idCheck2()" class="btn btn-primary me-2"/>
      <input type="button" value="비동기식(fetch)" onclick="idCheck3()" class="btn btn-primary me-2"/>
      <input type="button" value="비동기식(ajax1)" onclick="idCheck4()" class="btn btn-info me-2"/>
      <input type="button" value="비동기식(ajax2)" onclick="idCheck5()" class="btn btn-warning me-2"/>
    </div>
  </form>
  <hr/>
  <div id="demo"></div>
  <hr/>
  <h2>HTTP통신</h2>
  <pre>
    ☞ 동기식(Synchronous) : 먼저 시작된 하나의 프로세스(작업)의 처리가 끝날때까지 다른 작업들은 시작하지않고
      기다렸다가, 앞의 작업이 모두 끝나면, 새로운 작업을 시작하는 방식이다.
    ☞ 비동기식(Asynchronous) : 먼저 시작된 프로세스의 수행 완료여부와 관계없이 새로운 작업을 시작하는 방식
    
    * 프론트 프로그램에서의 비동기식
	    - 바닐라 자바스크립트의 비동기식 : 브라우저의 XMLHttpRequest
	    - ECMA6 자바스크립트의 비동기식 : 콜백함수, Promise, Promise를 활용한 async/await, fatch()방식
	  
	  <h4>AJAX</h4>
	  ☞ AJAX(Asynchronous Javascript And XML)
	    자바스크립트 라이브러리중의 하나이며, 브라우저객체인 XMLHttpRequest를 이용해서 전체패이지를 고치지 않아도
	    부분적인 페이지의 일부만을 처리할수 있도록 사용할수 있게 해 주는 기술이다.
	    즉, 자바스크립트를 이용하여 서버에 데이터를 요청할때 비동기식으로 통신하게 하는 방식이다.
	    과거에는 XML방식을 많이 사용하였으나, 프로그램 로직과 헤더의 변수를 사용하는 복잡한 방식이였기에,
	    지금은 JSON방식을 많이 사용할수 있는 AJax방식을 많이 사용하고 있다.(jQuery에서 제공해주는 aJax라이브러리를 많이 사용한다.)
	    
	  <h5>AJAX에서의 전송방식(메소드) 종류</h5>
	  - GET : 데이터를 읽어주거나 주로 검색시에 사용
	  - POST : 새로운 리소스를 생성할때 사용
	  - PUT : 새로 변경된 리소드를 생성/갱신(update)할때 사용
	  - DELETE : 지정된 리소스를 삭제할때 사용
  </pre>
</div>
<p><br/></p>
</body>
</html>