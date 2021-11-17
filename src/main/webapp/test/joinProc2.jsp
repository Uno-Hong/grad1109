<%@page import="java.io.PrintWriter"%>
<%@page import="grad.UserDAO"%>
<%@page import="grad.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="grad.UserDTO"/>
<jsp:setProperty name="user" property="user_id"/>
<jsp:setProperty name="user" property="user_pw"/>
<jsp:setProperty name="user" property="user_name"/>
<jsp:setProperty name="user" property="user_phone"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
<style>
      body {
         text-align : center;
      }
</style>
</head>
<body>
<%
	String p1 = request.getParameter("pfn");
	String p2 = request.getParameter("user_ppn2");
	String p3 = request.getParameter("user_ppn3");
	String phone = p1 + p2 + p3;
	user.setUser_phone(phone);
	
	if(user.getUser_id() == null || user.getUser_pw() == null || user.getUser_name() == null ||
	user.getUser_phone() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 되지 않은 사항이 있습니다.');");
		script.println("history.back()");
		script.println("</script>");
	}else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		// 데이터베이스 오류인 경우
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공적으로 가입되었습니다.')");
			script.println("location.href='Main.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>