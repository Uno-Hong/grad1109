<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
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
<title>비밀번호 변경</title>
<script type="text/javascript">
	function goFirstForm() { //취소버튼 클릭시 첫 화면으로 이동
		location.href="Main.jsp";
	} 
</script>
<script type="text/javascript" src="../js/changePassword.js"></script>
<script type="text/javascript"></script>
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
</head>
<body>
		<!-- start header div -->
		<div id="header_menu">
			<%@ include file="/include/header.jspf"%>
		</div>
		&nbsp&nbsp&nbsp&nbsp
		<!-- end header div -->
	<form name="mypageform" action="changePwProc.jsp" method="post" id="form" onsubmit="return checkValue()">
		<div align="center">
			<font style="font-size: x-large; font-weight: bold;">비밀번호 변경</font>
			<hr width="500px">
			<table>
				<tr>
					<td colspan="2">
						비밀번호는 영문과 특수문자, 숫자 2가지 이상 조합하여 10~16자리로 입력해주세요.<br>
						개인정보와 관련된 숫자 등 다른 사람이 알아낼 수 있는 비밀번호는 사용하지 않는 것이 안전합니다.
					</td>
				</tr>
				<tr>
					<td><label>아이디</label></td>
					<td><label><% out.print(login_id); %></label>
				</tr>
				<tr>
					<td><label>현재 비밀번호</label></td>
					<td><input type="password" name="check_current_pw" id="check_current_pw" placeholder="8~15자 이내로 입력하세요." ></td>
				</tr>
				<tr>
					<td><label>새 비밀번호</label></td>
					<td><input type="password" name="check_change_pw" id="check_change_pw" onchange="check_pw()">&nbsp;<span id="Input_check_pw"></span></td>
				</tr>
				<tr>
					<td><label>새 비밀번호 확인</label></td>
					<td><input type="password" name="check_retry_pw" id="check_retry_pw" onchange="check_pw()">&nbsp;<span id="check"></span></td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#eeeeee">
						<input type="submit" value="확인" name="check_submit" id="btn">
						<input type="button" value="취소" name="check_cancel" onclick="goFirstForm()" id="btn">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>