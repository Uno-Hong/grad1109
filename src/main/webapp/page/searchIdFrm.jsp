<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	#form {
		margin: 100px;
	}
	td {
		height: 50px;
		padding: 15px;
		font-size: 13px;
	}
	#btn {
		font-size: 12px;
	}
</style>
<script type="text/javascript" src="/js/searchInfo.js"></script>
<script type="text/javascript">
	function goLogin() { //취소버튼 클릭시 로그인 화면으로 이동
		location.href="login.jsp";
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
	<form action="searchIdProc.jsp" method="post" id="form" onsubmit="return searchId_check()">
		<div align="center">
			<font style="text-align: center; font-size: x-large; font-weight: bold;">아이디 찾기</font>
			<hr width="320px;">
			<table>
				<tr>
					<td style="text-align: right;">이름</td>
					<td><input type="text" name="si_name"></td>
				</tr>
				<tr>
					<td style="text-align: right;">휴대폰 번호</td>
					<td><input type="text" name="si_phonenum" placeholder="'-'를 제외하고 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="찾기" name="si_ok" id="btn">
					<input type="button" value="취소" name="si_cancel" onclick="goLogin()" id="btn">
					</td>
				</tr>
			</table>
			<hr width="320px;">
		</div>
	</form>
</body>
</html>
<%@ include file="/include/footer.jspf"%>