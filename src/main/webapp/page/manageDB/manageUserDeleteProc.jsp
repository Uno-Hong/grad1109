<%@page import="java.util.Date"%>
<%@page import="grad.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="DeleteProc" class="grad.UserDAO"/>
<jsp:useBean id="userBean" class="grad.UserDTO"/>
<jsp:setProperty property="*" name="userBean"/>

<%
	String hidden_user_id = request.getParameter("hidden_user_id");
	DeleteProc.userDelete(hidden_user_id);

	String url = "manageUser.jsp";
%>
<script type="text/javascript">
	location.href="<%=url%>";
</script>