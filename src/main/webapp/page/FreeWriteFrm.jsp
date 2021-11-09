<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	#title {
		
		font-size: 12px;
		text-align: center;
		font-weight: bold;
	}
	#boardForm {
		margin-top: 20px;
		margin-bottom: 40px;
	}
	input {
		font-size: 12px; 
	}
</style>
<script type="text/javascript">
	function writecheck() {
		var form = document.boardform;
		
		if(!form.article_title.value){
			alert("제목을 작성해주세요.");
			fomr.article_title.focus();
		}
		if(!form.article_detail.value){
			alert("내용을 작성해주세요.");
			fomr.article_detail.focus();
		}
	}
	function cancelwrite() {
		if(confirm("글쓰기를 취소하시겠습니까?") == true){
			location.href="FreeBoard.jsp";
		}else{
			return false;
		}
	}
	function goList() {
		location.href="FreeBoard.jsp";
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
<%
	//현재 세션 상태 체크
	String sessionID = null;
	if(session.getAttribute("sessionID") != null){
		sessionID = (String)session.getAttribute("sessionID");
	}
%>
	<form action="FreeWriteProc.jsp" method="post" id="boardForm">
	<div align="center">
		<font style="font-size: x-large; font-weight: bold;">글쓰기</font>
		<hr width="730px">
		<table width="auto" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">작성자</td>
				<td>
					<input type="text" name="user_id" value="${sessionScope.sessionID}" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td>
					<input type="text" name="article_title" size="100%" maxlength="100" value="">
				</td>
			</tr>
			<tr>
				<td id="title">내용</td>
				<td>
					<textarea name="article_detail" rows="20" cols="72"></textarea>
				</td>
			</tr>
			<!-- <tr>
				<td id="title">첨부파일</td>
				<td>
					<input type="file" name="article_file">
				</td>
			</tr> -->
			<tr align="center" valign="middle">
				<td colspan="5">
					<input type="button" value="목록" onclick="goList()">
					<input type="submit" value="등록" onclick="writecheck()">
					<input type="reset" value="취소" onclick="cancelwrite()">
				</td>
			</tr>
		</table>
		<hr width="730px">
		</div>
	</form>
</body>
</html>