<%@page import="java.io.PrintWriter"%>
<%@ page import="grad.CsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="cs" class="grad.CsDTO" />
<jsp:setProperty property="*" name="cs"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디가 좋아?</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("cs_id");
	String title = request.getParameter("cs_title");
	String article = request.getParameter("cs_article");
	
	//현재 세션 상태 체크
	String sessionID = null;
	if(session.getAttribute("sessionID") != null){
		sessionID = (String)session.getAttribute("sessionID");
	}
	//입력 안된 부분 있는지 체크
	if(cs.getCs_title() == null || cs.getCs_article() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 입력해주세요.');");
		script.println("history.back()");
		script.println("</script>");
	}else{
		// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
		CsDAO csDAO = new CsDAO();
		
		int result = csDAO.write(cs);
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
			script.println("location.href='CsCenter.jsp'");
			script.println("</script>");
			
			System.out.println(id);
			System.out.println(title);
			System.out.println(article);
			
		}
	}
%>
</body>
</html>