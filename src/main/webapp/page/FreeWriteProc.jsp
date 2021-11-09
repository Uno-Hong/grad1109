<%@page import="java.io.PrintWriter"%>
<%@ page import="grad.FreeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="free" class="grad.FreeDTO" />
<jsp:setProperty property="*" name="free"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디가 좋아?</title>
</head>
<body>
<%
	//현재 세션 상태 체크
	String sessionID = null;
	if(session.getAttribute("sessionID") != null){
		sessionID = (String)session.getAttribute("sessionID");
	}
	//로그인 한 사람만 글을 쓸 수 있음
	if(sessionID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('먼저 로그인을 해주세요.');");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	else {
		//입력 안된 부분 있는지 체크
		if(free.getArticle_title() == null || free.getArticle_detail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요.');");
			script.println("history.back()");
			script.println("</script>");
		}else{
			// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
			FreeDAO freeDAO = new FreeDAO();
			free.setUser_id(sessionID);
			int result = freeDAO.write(free);
			// 데이터베이스 오류인 경우
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 성공적으로 작성되었습니다.')");
				script.println("location.href='FreeBoard.jsp'");
				script.println("</script>");
			}
		}
	}
%>
</body>
</html>