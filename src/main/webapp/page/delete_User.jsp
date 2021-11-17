<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "grad.ManagerDAO" %>
<%@ page import = "grad.ManagerDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저삭제</title>
</head>
<body>
	<%
		String sessionID = null;
		if(session.getAttribute("sessionID") != null){
			sessionID = (String)session.getAttribute("sessionID");
		}
		
		String user_id = "";
		user_id = request.getParameter(user_id);
			
		// 글 삭제 로직을 수행한다
		ManagerDAO mDAO = new ManagerDAO();
		int result = mDAO.userDelete(user_id);
		
		if(result > 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제하기 성공')");
			script.println("location.href='Manager.jsp'");
			script.println("</script>");
		}
	%>	
</body>
</html>