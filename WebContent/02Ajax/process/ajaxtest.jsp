<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	//상단 페이지 디렉티브도 화면구성에 태그이므로 한줄이 빈칸으로 표시됨
	// 이것을 없애는 것은  trimDirectiveWhitespaces="true"

	// [비동기 통신 테스트 처리 페이지]
	// 결과 리턴 시, 화면에 찍어주는 값이 리턴되므로
	// 처리 페이지에서는 html형식을 모두 지워준다

	// post 방식의 한글 처리 : 이것을 안하면 깨짐
	request.setCharacterEncoding("UTF-8");

	// post 방식으로 넘어온 값 받기
	String name = request.getParameter("name");

	// 넘어온 값 화면 출력
	// out.print("get : " + name);

	// 결과값을 화면에 출력한다
	// 넘어온 값만 정확히 비교하기 위해 equals() 사용
	if (name.equals("고양이")) {
		out.print("야옹");
	} else if (name.equals("강아지")) {
		out.print("멍");
	} else {
		out.print("kosi");
	}
%>