<%@page import="grad.FreeDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="grad.FreeDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="free" class="grad.FreeDTO" scope="page" />
<jsp:setProperty name="free" property="article_title" />
<jsp:setProperty name="free" property="article_detail" />
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
	if(sessionID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('먼저 로그인을 해주세요.');");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	// article_index를 초기화 시키고
	// article_index라는 데이터가 넘어온 것이 존재한다면 캐스팅 하여 변수에 담는다.
	int article_index = 0;
	if(request.getParameter("article_index") != null){
		article_index = Integer.parseInt(request.getParameter("article_index"));
	}
	// 만약 넘어온 데이터가 없으면
	if(article_index == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("location.href='FreeBoard.jsp'");
		script.println("</script>");
	}
	// 해당 article_index에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다.
	FreeDTO freeDTO = new FreeDAO().getFree(article_index);
	if(!sessionID.equals(freeDTO.getUser_id())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='FreeBoard.jsp'");
		script.println("</script>");
	} else {
		//입력 안된 부분 있는지 체크
		if(request.getParameter("article_title") == null || request.getParameter("article_detail") == null || request.getParameter("article_title").equals("") || request.getParameter("article_detail").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요.');");
			script.println("history.back()");
			script.println("</script>");
		}else{
			// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
			FreeDAO freeDAO = new FreeDAO();
			int result = freeDAO.update(article_index, request.getParameter("article_title"), request.getParameter("article_detail"));
			// 데이터베이스 오류인 경우
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 성공적으로 수정되었습니다.')");
				script.println("location.href='FreeBoard.jsp'");
				script.println("</script>");
			}
		}
	}
%>
</body>
</html>