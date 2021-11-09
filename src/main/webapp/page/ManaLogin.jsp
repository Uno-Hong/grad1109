<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>


<style>
      body {
         text-align : center;
      }
</style>

<%
	String pw = request.getParameter("pw");
	String url = "Main.jsp";
	String msg = "로그인 정보가 잘못되었습니다.";
	//out.print(pw);

	if(pw.equals("1234")){
		msg = "성공적으로 로그인되었습니다.";
		url = "./manageDB/manageDB.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>