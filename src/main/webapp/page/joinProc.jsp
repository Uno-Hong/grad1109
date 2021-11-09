<%@page import="grad.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="joinProc" class="grad.UserDAO"/>
<jsp:useBean id="userBean" class="grad.UserDTO"/>
<jsp:setProperty property="*" name="userBean"/>
<style>
      body {
         text-align : center;
      }
</style>
<%
	String p1 = request.getParameter("pfn");
	String p2 = request.getParameter("user_ppn2");
	String p3 = request.getParameter("user_ppn3");
	String phone = p1 + p2 + p3;
%>
<%
	userBean.setUser_phone(phone);
	boolean result = joinProc.join(userBean);

	String url = "join.jsp";
	String msg = "회원가입 정보가 잘못되었습니다.";
	
	if(result){
		msg = "성공적으로 회원 가입이 되었습니다.";
		url = "Main.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>