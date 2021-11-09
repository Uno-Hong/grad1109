<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="checkPwProc" class="grad.UserDAO"/>
    <%
    	String uri = request.getParameter("uri");
    	String lastArray = request.getParameter("lastArray");
    
    	Object obj_sid = session.getAttribute("sessionID");
    	String login_id = (String)obj_sid; //로그인 세션 ID
    	
    	Object obj_spw = session.getAttribute("sessionPW");
    	String login_pw = (String)obj_spw; //로그인 세션 PW
    	
    	String check_pw = request.getParameter("check_pw");
    	
    	String url = "mypage.jsp";
    	String result = checkPwProc.checkPw(login_id);
    	
    	if(result == login_pw){
    		url = lastArray;
    	}
    
	    if(login_pw.equals(check_pw)){
	    	if(uri.equals("mypage.jsp")){
	    		out.println("<script>");
	    		out.println("location.href='changePw.jsp;'");
	    		out.println("</script>");
			}else{
				
			}
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 정보가 틀렸습니다.');");
			out.println("location.href='checkPw.jsp'");
			out.println("</script>");
		}
    %>