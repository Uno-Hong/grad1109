<%@page import="java.util.Date"%>
<<<<<<< HEAD
<%@page import="grad.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="UpdateProc" class="grad.UserDAO"/>
<jsp:useBean id="userBean" class="grad.UserDTO"/>
<jsp:setProperty property="*" name="userBean"/>

<%
	userBean.setUser_id(request.getParameter("user_id"));
	userBean.setUser_pw(request.getParameter("user_pw"));
	userBean.setUser_name(request.getParameter("user_name"));
	userBean.setUser_phone(request.getParameter("user_phone"));
	userBean.setUser_man(Integer.parseInt(request.getParameter("user_man")));
	String hidden_user_id = request.getParameter("hidden_user_id");
	
	boolean result = UpdateProc.UpdateProc(userBean, hidden_user_id);
	 String msg = null;
	if(result) {  msg = "성공"; }
	String url = "manageUser.jsp";

%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>