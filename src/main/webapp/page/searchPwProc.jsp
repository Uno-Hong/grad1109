<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="searchPwProc" class="grad.UserDAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
    <%
    	String user_id = request.getParameter("sp_id");
		String user_name = request.getParameter("sp_name");
    	String user_phone = request.getParameter("sp_phonenum");
    	
    	String result = searchPwProc.searchPw(user_id, user_name, user_phone);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#searchid {
		font-weight: bold;
		font-size: medium;
	}
	#form {
		margin: 50px;
	}
</style>
<script type="text/javascript">
	function goLogin() { //버튼 클릭시 로그인 화면으로 이동
		location.href="login.jsp";
	} 
	function goSearchid() { //버튼 클릭시 아이디 찾기 폼으로 이동
		location.href="searchIdFrm.jsp";
	} 
</script>
</head>
<body>
	<!-- start header div -->
	<div id="header_menu">
		<%@ include file="/include/header.jspf"%>
	</div>
	&nbsp&nbsp&nbsp&nbsp
	<!-- end header div -->
	<div align="center" style="font-size: 12px;" id="form">
	<font style="font-weight: bold; font-size: medium;"><%= user_id %></font>님의 비밀번호는
		<div id="searchid">
			<% out.println("<br>" + result); %>
		</div>
	<br>입니다.<br><br><br>
	<input type="button" value="아이디 찾기" onclick="goSearchid()">
	<input type="button" value="로그인" onclick="goLogin()">
</div>
</body>
</html>
<%@ include file="/include/footer.jspf"%>