<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
  	#form {
		margin: 100px;
	}
	table {
		padding: 20px;
		margin-right: auto;
		margin-left: auto;
	}
	label {
		display: block;
		margin-left: 5px;
		font-size: 12px;
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
<script type="text/javascript" src="../js/joinCheck.js"></script>
<script type="text/javascript">
    function goFirstForm() { //취소버튼 클릭시 첫 화면으로 이동
        location.href="Main.jsp";
    } 
    function OpenIdCheck() { //아이디 중복체크 화면 on
		var form = document.join;
		var data = document.getElementById('user_id').value;
	
			/* if (!form.user_id.value) {
					alert("아이디를 입력하세요.");
					form.user_id.focus();
					return false;
			}else {
				if(data.length < 4 || data.length > 12){
					alert("아이디는 4자리 이상 12자리 이하로 입력해주세요.");
					form.user_id.select();
				}
			} */
			window.name = "parentform";
	        window.open("idCheckForm.jsp?user_id="+data, "chkform", "width=500, height=300, resizable = no, scrollbars = no");
	    }
    function inputIdChk() {
        document.join.idDup.value="idUncheck";
    }
</script>
</head>
<body onload="join.user_id.focus()">
	<!-- start header div -->
	<div id="header_menu">
		<%@ include file="/include/header.jspf"%>
	</div>
	&nbsp&nbsp&nbsp&nbsp
	<!-- end header div -->
<form name="join" action="joinProc.jsp" method="post" onsubmit="return checkValue()" id="form">
	<div id="formdiv" align="center">
		<font style="font-size: x-large; font-weight: bold;">회원가입</font>
		<hr width="600px">
		<table>
			<tr>
				<td rowspan="2" style="text-align: right;" bgcolor="#d3d3d3"><label><!-- <sup style="color:#ff0000">*</sup> -->아이디</label></td>
				<td><input type="text" name="user_id" id="user_id" maxlength="12" onkeydown="inputIdChk()">
					<input type="button" id="check_id" value="ID 중복검사" onclick="OpenIdCheck()" id="btn">
					<input type="hidden" name="idDup" value="idUncheck">
				</td>
			</tr>
			<tr>
				<td bgcolor="#eeeeee">아이디는 영문, 숫자 조합으로 하셔야 합니다. [4자리 이상 12자리 이하]</td>
			</tr>
			<tr>
				<td style="text-align: right;" bgcolor="#d3d3d3"><label>비밀번호</label></td>
				<td><input type="password" name="user_pw" id="user_pw" placeholder="8~15자 이내로 입력하세요." onchange="check_pw()"><span id="Input_check_pw"></span></td>
			</tr>
			<tr>
				<td style="text-align: right;" bgcolor="#d3d3d3"><label>비밀번호 확인</label></td>
				<td bgcolor="#eeeeee"><input type="password" name="user_cpw" id="user_cpw" onchange="check_pw()">&nbsp;<span id="check"></span></td>
			</tr>
			<tr>
				<td style="text-align: right;" bgcolor="#d3d3d3"><label>이름</label></td>
				<td><input type="text" name="user_name"></td>
			</tr>
			<tr>
				<td style="text-align: right;" bgcolor="#d3d3d3"><label>전화번호</label></td>
				<td bgcolor="#eeeeee">
					<select name="pfn">
						<option name="">선택안함</option>
						<option name="1">010</option>
						<option name="2">011</option>
						<option name="3">012</option>
						<option name="4">013</option>
						<option name="5">014</option>
						<option name="6">015</option>
						<option name="7">016</option>
						<option name="8">017</option>
						<option name="9">060</option>
						<option name="10">070</option>
					</select>
					-<input type="text" name="user_ppn2" size="4" maxlength="4">-<input type="text" name="user_ppn3" size="4" maxlength="4"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="#eeeeee">
					<input type="submit" value="가입" name="user_submit" id="btn">
					<input type="button" value="취소" name="user_cancel" onclick="goFirstForm()" id="btn">
				</td>
			</tr>
		</table>
		<hr width="600px;">
	</div>
</form>
</body>
</html>
