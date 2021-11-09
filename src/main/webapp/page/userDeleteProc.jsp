<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="userDeleteProc" class="grad.UserDAO"/>
<jsp:useBean id="userBean" class="grad.UserDTO"/>
<jsp:setProperty property="*" name="userBean"/>
<%
	Object obj_sid = session.getAttribute("sessionID");
	String login_id = (String)obj_sid;
	boolean result = userDeleteProc.userDelete(login_id);
	
	String url = "mypage.jsp";
	String msg = "회원탈퇴가 실패하였습니다.";
	
	if(result){
		msg = "회원이 탈퇴되었습니다.";
		url = "Main.jsp";
	}
	
	session.invalidate();
%>
<script>
	 alert('회원 탈퇴 되었습니다.');
</script>
	<meta http-equiv = "refresh" content = "1; url= Main.jsp" target="main">
