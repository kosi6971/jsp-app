<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비동기 통신 테스트 페이지</title>
    <%-- 제이쿼리 라이브러리 CDN --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
        $(()=>{
        	// 비동기 통신이란
        	// 동기화의 반대 개념
        	// 동기화란, 페이지 전체에 데이터를 가져올 때
        	// 모든 페이지를 새로 받아어는 개념
        	// 비동기화란? 페이지가 일부만 업데이트됨
        	// 일부만 업데이트 되기위해 백단 통신이 필요함 -> 비동기 통신
        	
        	// AJAX란, 비동기 통신을 위한 메서드
        	// (Asynchronous Javascript And XML)
        	
        	
        	// JS에서도 기본적으로 구현되어 있음
        	// -> 참고: https://www.w3schools.com/js/js_ajax_intro.asp
        	// jQuery에서 보다 쉬운 방법으로 코딩하도록 새로운 메서드
        	// -> 참고: https://www.w3schools.com/jquery/jquery_ajax_get_.asp
        	// 제이쿼리 post방식 비동기통신 메서드
        	// $.post(URL, data, callback);
        	
            // 버튼 클릭 시
            $("#mybtn").click(e=>{
            	// 기본 서브밋 이동 막기
                e.preventDefault();
                
                // 비동기통신 ajax 메서드 사용
                // 직접 페이지로 이동 방문하지 않고 이 자리에서 처리함
                // $.post(URL, data, callback);
                // $.post(전송할 페이지, 전송할 데이터, 처리 후 함수);
                $.post(
                		// 전송할 페이지
                		"process/ajaxtest.jsp",
                		// 전송할 데이터
                		// {속성:값} -> 값을 입력된 value 읽어옴
                		{name:$("#name").val()},
                		//처리 후 함수(콜백 함수)
                		function(data){ // data - 처리 후 처리페이지로 부터 리턴된 값
                			console.log(data);
                			// 화면에 결과 찍기
                			$("#res").text(data);
                		});
                
            })
        });
    </script>
</head>
<body>
    
    <form action="process/ajaxtest.jsp" id="myform" method="post">
        <input type="text" name="name" id="name">
        <button type="submit" id="mybtn">전송하기</button>
    </form>
	<h1>결과값 : <span id="res"></span> </h1>
</body>
</html>