<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지마다 여기부터 헤더 스타일, 헤더 붙여넣기 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 페이지마다 여기까지 헤더 스타일, 헤더 붙여넣기 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="grad.FreeDTO" %>
<%@ page import="grad.FreeDAO" %>
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
<!-- end header div -->
<%
	//현재 세션 상태 체크
	String sessionID = null;
	if(session.getAttribute("sessionID") != null){
		sessionID = (String)session.getAttribute("sessionID");
	}
	if(sessionID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('먼저 로그인을 해주세요.');");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	// article_index를 초기화 시키고
	// article_index라는 데이터가 넘어온 것이 존재한다면 캐스팅 하여 변수에 담는다.
	int article_index = 0;
	if(request.getParameter("article_index") != null){
		article_index = Integer.parseInt(request.getParameter("article_index"));
	}
	
	// 만약 넘어온 데이터가 없으면
	if(article_index == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("location.href='FreeBoard.jsp'");
		script.println("</script>");
	}
	// 해당 article_index에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다.
	FreeDTO freeDTO = new FreeDAO().getFree(article_index);
	if(!sessionID.equals(freeDTO.getUser_id())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='FreeBoard.jsp'");
		script.println("</script>");
	}
%>
	<form action="FreeUpdateProc.jsp?article_index=<%= article_index %>" method="post" id="boardForm">
	<div align="center">
		<font style="font-size: x-large; font-weight: bold;">게시판 글 수정 양식</font>
		<hr width="730px">
		<table width="auto" border="3" bordercolor="lightgray" align="center">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="title">
						<input type="text" name="article_title" placeholder="글 제목" maxlength="70" value="<%=freeDTO.getArticle_title()%>">
					</td>
				</tr>
				<tr>
					<td id="title">
						<textarea name="article_detail" placeholder="글 내용" maxlength="3000" style="height: 350px;"><%=freeDTO.getArticle_detail()%></textarea>
					</td>
				</tr>
			</tbody>
		</table>
			<!-- 글쓰기 버튼 생성 -->
			<input type="submit" value="수정" onclick="writecheck()">
			<input type="reset" value="취소" onclick="cancelwrite()">
		<hr width="730px">
		</div>
	</form>
</body>
</html>