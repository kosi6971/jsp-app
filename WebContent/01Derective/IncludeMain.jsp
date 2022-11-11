<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeTime.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어</title>
</head>
<body>
<h1>
<%
	// 오늘 날짜 찍기
	// 내장 객체 중 out : 출력 객체
	out.println("오늘 날짜 출력 : " + today);
	out.println("<br>");
	out.println("오늘 날짜 출력 : " + tomorrow);
%>
</h1>

</body>
</html>