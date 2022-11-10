<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<%! // 느낌표 - 선언부
	// 함수를 만들 때는 여기에 만들어야한다
	// 느낌표가 없는 스크립트릿에 만들 시 에러
	public String myFn(){
	return "<h1>kosi</h1>";
	}
%>
</head>

<body>
<% // 스크립트릿 구역
	// 문자형 변수에 url로 전달되는 값을 받는다
	// request.getParameter(파라미터 변수)
	String user = request.getParameter("name");
	// if문으로 전달값이 없는 경우 거르기
	if(user == null){
		user = "나는 풀스택 개발자입니다.";
	}
%>

<h1>index</h1>

<!-- 스크립트 출력 -->
<h1><%=user %></h1>
<h2>
	<a href="index.jsp?name='Perfect Coding'">완전한 코딩</a>
	<br>
	<a href="index.jsp?name='Poor Coding'">거지같은 코딩</a>
	<br>
	<a href="index.jsp">처음으로</a>
</h2>
<div><%=myFn() %></div>

</body>
</html>