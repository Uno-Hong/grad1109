<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="loginProc" class="grad.UserDAO"/>
<style>
      body {
         text-align : center;
      }
</style>

<%
   String id = request.getParameter("loginid");
   String pw = request.getParameter("loginpw");
   String url = "login.jsp";
   String msg = "로그인 정보가 잘못되었습니다.";
   
   
   boolean result = loginProc.login(id, pw);
   if(result){
      session.setAttribute("sessionID", id);
      session.setAttribute("sessionPW", pw);
      msg = "성공적으로 로그인되었습니다.";
      url = "Main.jsp";
   }
%>
<script type="text/javascript">
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>