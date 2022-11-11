<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결 체크</title>
</head>
<body>
<%
	try{
		
	// DB와 연결하려면 해당 DB의 jar파일이 DB폴더의 lib폴더 안에 위치해 있어야 한다
	// MySQL 설치폴더
	// C:\Program Files\Apache Software Foundation\Tomcat 9.0\lib
	// mysql-connector.jar 파일 확인
	
	// DB 연결 문자열값 만들기
	String DB_URL = "jdbc:mysql://localhost:3306/mydb";
	// 형식 -> jdbc:DB시스템종류://DB IP/DB이름
	//MySQL -> jdbc:mysql://localhost:3306/mydb

	// DB 아이디 계정 : root는 슈퍼어드민 기본 계정
	String DB_USER = "root";
	
	// DB 비밀번호 : root는 최초에 비밀번호가 없다
	String DB_PWD = "";
	
	// 연결 객체 선언
	Connection conn = null;
	
	// 쿼리문 저장 객체 선언
	PreparedStatement pstmt = null;

	// 결과 저장 객체 선언
	ResultSet rs = null;
	
	// 쿼리문 작성 할당
	
	
	// DB 종류 클래스 등록하기 -> 해당 연결 드라이브 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	// DB 연결
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
	
	// 성공 메시지 띄우기
	out.println("성공");
	}
	catch(Exception e){
		// 추적된 에러 메시지 찍기
		// DB 연결 실패 메시지 띄우기 
		e.printStackTrace();
	}
%>
</body>
</html>