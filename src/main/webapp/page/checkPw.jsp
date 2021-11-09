<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="checkPwProc" class="grad.UserDAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%
		String requestURI = request.getRequestURI();
		String referer = request.getHeader("Referer");
		
		String[] rArray = referer.split("/");
		
		String lastArray = rArray[rArray.length-1];
		//out.println(lastArray);
		
    	Object obj_sid = session.getAttribute("sessionID");
    	String login_id = (String)obj_sid; //로그인 세션 ID
    	
    	Object obj_spw = session.getAttribute("sessionPW");
    	String login_pw = (String)obj_spw; //로그인 세션 PW
    	
    	String user_pw = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
	table {
		border: 1px solid;
		padding: 20px;
		margin-right: auto;
		margin-left: auto;
	}
	td {
		text-decoration: none;
		list-style: none;
		padding: 10px;
		font-size: 13px;
	}
	#change_info {
		font-size: 12px;
	}
	#change_pw {
		font-size: 12px;
	}
	#btn {
		font-size: 12px;
	}
</style>
<script type="text/javascript">
	
	function go_where() {
	<%
		switch(rArray[rArray.length-1]){
			case "mypage.jsp":
				out.print("location.href=" + lastArray);
				break;
		}
	%>
	}
	function goFirstForm() { //취소버튼 클릭시 첫 화면으로 이동
		location.href="Main.jsp";
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
	<form name="checkPWFrm" action="checkPwProc.jsp" method="post" id="form">
		<div align="center">
			<font style="font-size: x-large; font-weight: bold;">회원정보확인</font>
			<hr width="500px">
			<%-- <%out.print(login_pw); %> --%>
			<font style="color: blue;"><% out.print(login_id); %></font><font>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</font>
			<br><br>
			<table>
				<tr>
					<td><label>아이디</label></td>
					<td><label><% out.print(login_id); %></label>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" name="check_pw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#eeeeee">
						<input type="submit" value="확인" name="check_submit" id="btn">
						<input type="button" value="취소" name="check_cancel" onclick="goFirstForm()" id="btn">
					</td>
				</tr>
			</table>
		</div>
		<input type="hidden" name="uri" value=<%=lastArray%>>
	</form>
	
</body>
</html>