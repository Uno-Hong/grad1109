<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String requestURI = request.getRequestURI();
	Object obj_sid = session.getAttribute("sessionID");
	String login_id = (String)obj_sid;	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
	#btn {
		font-size: 12px;
	}
</style>
<script type="text/javascript">
	function goMypageForm() { //취소버튼 클릭시 마이페이지 화면으로 이동
		location.href="mypage.jsp";
	} 
</script>
<script type="text/javascript">
	function checkValue() {
		var form = document.delete_user_form;
		
		if(!form.insert_delete.value){
			alert("내용을 입력하지 않았습니다.");
			form.insert_delete.focus();
			return false;
		}else if(form.insert_delete.value != '삭제한다'){
			alert("입력하신 값이 '삭제한다'와 일치하지 않습니다.");
			form.insert_delete.focus();
			return false;
		}
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
	<form name="delete_user_form" action="userDeleteProc.jsp" onsubmit="return checkValue()" method="post" id="form">
		<div align="center">
			<font style="font-size: x-large; font-weight: bold;">회원 탈퇴</font>
			<hr width="500px">
			<table>
				<tr>
					<td>
						- 회원 탈퇴 시, 바로 <font style="color: blue"><%= login_id %></font>님의 정보가 삭제되어 복구할 수 없게 됩니다.<br>
						- 신중하게 고민 후에 결정하시길 바랍니다.<br>
						- 회원 탈퇴를 원하시면 아래의 입력 칸에 "삭제한다"를 입력해주세요.
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="insert_delete" id="insert_delete" placeholder="'삭제한다'를 입력해주세요." style="width: 100%">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value="확인" name="delete_user_submit" id="btn">
						<input type="button" value="취소" name="delete_user_cancel" onclick="goMypageForm()" id="btn">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>