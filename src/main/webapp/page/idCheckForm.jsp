<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="idCheckProc" class="grad.UserDAO"/>
<%   
	String id = request.getParameter("user_id");
	boolean result = idCheckProc.idCheck(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style type="text/css">
		#wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        #chk{
            text-align :center;
        }
        #cancelBtn{
            visibility:visible;
        }
        #useBtn{
            visibility:visible;
        }
</style>
<script type="text/javascript" src="/js/idCheck.js"></script>
<script type="text/javascript">
	function sendCheckValue(){
		// 중복체크 결과인 idCheck 값을 전달한다.
		opener.document.join.idDup.value ="idCheck";
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap" align="center">
		<br>
		<b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
		<%=id %><% 
					if(result){ out.println("는 이미 존재하는 ID입니다."); }
					else { out.println("는 사용 가능한 ID입니다."); }
				%>
			<div id="msg">
			</div>
			<br>
			<input id="submit" type="button" value="확인" onclick="sendCheckValue()"><br>
			
		</div>
	</div>

</body>
</html>
	