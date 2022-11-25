<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnector" %>
<%@ page import="common.SHA256" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>
<%
		//POST 방식의 한글처리 : 이것 안쓰면 한글깨짐!!!
		request.setCharacterEncoding("UTF-8");
	
		// DB연결 객체 생성
		JDBConnector jdbc = new JDBConnector();
		// 암호화 객체 생성
		SHA256 sha = new SHA256();

		//1.아이디(입력항목)
		String mid = request.getParameter("mid");
		// 2.비번(입력항목)
		String mpw = request.getParameter("mpw");
		// 3.비번(db)
		String dbmpw = "";
		// 4.이름(db)
		String name = "";
		// 5.성별(db)
		String auth = "";

	try {
		
		// 7. 쿼리문작성 할당
		String query = "SELECT `mid`, `mpw`, `name`, `auth` FROM `member` WHERE `mid`=?";
		// 해당 유일키 idx값을 넣어서 선택하면 하나의 레코드만 선택된다!
		// 데이터가 들어갈 자리만 물음표(?)로 처리하면 끝!

		// 11. 쿼리문 연결 사용준비하기
		// conn연결된 DB객체
		jdbc.pstmt = jdbc.conn.prepareStatement(query);
		// prepareStatement(쿼리문변수)
		// - 쿼리문을 DB에 보낼 상태완료!
		// - 중간에 쿼리문에 넣을 값을 추가할 수 있음!

		// 12. 쿼리에 추가할 데이터 셋팅하기!
		jdbc.pstmt.setString(1, mid);
		// 아이디로 쿼리조건값을 설정
		
		// 13. 쿼리를 DB에 전송하여 실행후 결과집합(결과셋)을 가져옴!
		// ResultSet객체는 DB에서 쿼리결과를 저장하는 객체임!
		jdbc.rs = jdbc.pstmt.executeQuery();
		// executeQuery() 쿼리실행 메서드

		// 14. 저장된 결과집합의 레코드 수 만큼 돌면서 코드만들기!
		if (jdbc.rs.next()) {
			// 비밀번호
			dbmpw = jdbc.rs.getString("mpw");
			// 이름
			name = jdbc.rs.getString("name");
			// 권한
			auth = jdbc.rs.getString("auth");
		
			// 비밀번호 비교를 위해 입력한 비밀번호를 암호화
			String shampw = sha.encSha256(mpw);
			
			out.println(
					"<h1>" +
					"♣ mid : " + mid + "<br>" +
					"♣ dbmpw : " + dbmpw + "<br>" +
					"♣ sha256 : " + shampw + "<br>" +
					"♣ mpw : " + mpw + "<br>" +
					"♣ name : " + name + "<br>" +
					"♣ auth : " + auth + "<br>" +
					"</h1>"
				);
			
			if(dbmpw.equals(shampw)){ // 로그인 성공
				out.print("<h1>비밀번호가 일치합니다</h1>");
				
				/*
					[로그인 성공 시, 필수 셋팅할 것은]
					-> 세션 변수 셋팅하기
					세션이란, Session
					-> 로그인한 사용자 정보를 저장하여 사용하는 시간동안
					로그인 상태를 유지해주는 서버 메모리 관리 규칙
					-> 로그인한 사용자 정보는 세션변수에 저장하여 로그인한
					같은 도메인 안에서 어느 곳에서든지 사용할 수 있도록 제공해준다
					-> 시스템을 사용하지 않은 상태로 제한 시간을 주는데 20분이
					기본적인 세션 한계 시간이다.
					
					[세션의 시작은 언제부터인가]
					-> 자바웹에서는 매우 간단히 세션 변수를 셋팅하면 바로 세션이 시작된다
					-> 세션 변수 셋팅법 :
						session.setAttribute(세션변수명, 값)
					-> 세션 변수 호출법 :
						session.getAttribute(세션변수명)
					
					[세션은 어떨게 강제 종료 하는가]
					-> 세션 강제 종료 메서드를 호출한다
					session.invalidate()
					-> 세션이 유효하지 않게 해라
				*/
				
				// 세션 변수에 사용자 이름을 생성한다(세션 시작)
				session.setAttribute("name", name);
				// 페이지 강제 이동하기(첫 페이지)
				response.sendRedirect("../index.jsp");
				
				// 세션, 리퀘스트, 리스폰스 내장객체는
				// 바로 생성 없이 사용할 수 있는 static객체로 설정되었다
				
			}
			else{ // 로그인 실패
				out.print("<h1>비밀번호가 일치하지 않습니다</h1>");
			}
		}
		else{
			out.print("<h1>아이디가 존재하지 않습니다</h1>");
		}

		// 14. 연결해제하기
		jdbc.close();

	} //// try /////
	catch (Exception e) {
		// DB연결 실패시 여기로 들어옴!
		out.println("에러메시지:");
		out.println(e.toString());
		// toString() 문자데이터로 변환하는 메서드
	} ///// catch //////
	%>
</body>
</html>