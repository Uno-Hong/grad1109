<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="changePwProc" class="grad.UserDAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj_sid = session.getAttribute("sessionID");
	String login_id = (String)obj_sid; //로그인 세션 ID
	    	
	String change_pw = request.getParameter("check_change_pw");
	
	boolean result = changePwProc.changePw(login_id, change_pw);

	String url = "mypage.jsp";
	String msg = "error";
	
	if(result){
		msg = "성공적으로 비밀번호가 변경되었습니다. 다시 로그인해주세요";
		url = "Main.jsp";
				
		session.invalidate();
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>