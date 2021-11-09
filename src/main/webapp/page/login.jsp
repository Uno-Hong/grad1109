<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	#form {
		margin: calc(100vh-100px);
	}
	#login { /* 로그인 버튼 스타일 */
			background-color: #1ebb90;
			border: 1px solid #ffffff;
			width : 150px;
			height: 100px;
			text-align: center;
			font-size: 18px;
			font-weight: bold;
			color: #ffffff;
	}
	#login:hover { /* 로그인 버튼에 마우스 올렸을 때 변화 */
		background-color: #1baf86;
		font-size: 19px;
	}
	table {
		width: 180px;
		padding: 20px;
		margin-right: auto;
		margin-left: auto;
	}
	
	label {
		display: block;
		margin-left: 5px;
		font-size: 12px;
	}
	input {
		width: auto;
		margin-left: 5px;
	}
	td {
		text-decoration: none;
		list-style: none;
		font-size: 12px;
	}
	@media screen and (max-width: 500px) {
		#login { font-size: 12px; width: 85px; height: 80px;}
		label { font-size: 11px; }
		input { width: 35vw; height: 3vh; }
		a { font-size :11px; }
		
	}
</style>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function notidpw() {
		if(!form.loginid.value){
			alert("아이디를 입력하세요.");
			form.loginid.focus();
			return false;
		}else if(!form.loginpw.value){
			alert("비밀번호를 입력하세요.");
			form.loginpw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body onload="loginform.loginid.focus()">
		<!-- start header div -->
		<div id="header_menu">
			<%@ include file="/include/header.jspf"%>
		</div>
		&nbsp&nbsp&nbsp&nbsp
		<!-- end header div -->
	 <form name="loginform" action="loginProc.jsp" method="post" id="form" onsubmit="return notidpw()">
	 	
	 	<div align="center">
		<font style="font-size: x-large; font-weight: bold;">로그인</font>
		<hr width="330px">
		 	<table id="login-table">
		 		<tr>
		 			<td>
			 			<label>아이디</label><input type="text" name="loginid" autofocus="autofocus">
			 			<label>비밀번호</label><input type="password" name="loginpw">
		 			</td>
		 			<td align="center" style="padding-left: 10px;">
		 				<button type="submit" id="login">로그인</button>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td colspan="2" style="text-align: center;">
		 				<a href="join.jsp">회원가입</a> | 
		 				<a href="searchIdFrm.jsp">아이디</a>/<a href="searchPwFrm.jsp">비밀번호 찾기</a>
		 			</td>
		 		</tr>
		 	</table>
		 <hr width="330px">
	 	</div>
	 </form>
</body>
</html>