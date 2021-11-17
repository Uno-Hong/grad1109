<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지마다 여기부터 헤더 스타일, 헤더 붙여넣기 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 페이지마다 여기까지 헤더 스타일, 헤더 붙여넣기 -->
<%@page import="java.io.PrintWriter"%>
<%@page import="grad.FreeDTO"%>
<%@page import="grad.FreeDAO"%>
<!DOCTYPE html>
<%
	
%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>	
<!-- start header div -->
<div id="header_menu">
	<%@ include file="/include/header.jspf"%>
</div>
<!-- end header div -->
<%
	// 현재 세션 상태 체크
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
	// 변수에 담고 조회수 1을 증가시킨다.
	int article_index = 0;
	if(request.getParameter("article_index") != null){
		article_index = Integer.parseInt(request.getParameter("article_index"));
		FreeDAO freeDAO = new FreeDAO();
		freeDAO.updateHit(article_index);
	}
	
	// 만약 넘어온 데이터가 없으면
	if(article_index == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("location.href='FreeBoard.jsp'");
		script.println("</script>");
	}
	//유효한 글이면 구체적인 정보를 freeDTO라는 인스턴스에 담는다.
	
	FreeDTO freeDTO = new FreeDAO().getFree(article_index);
%>
	<div align="center">
		<font style="font-size: x-large; font-weight: bold;">게시판 글 보기</font>
		<hr width="730px">
		<table>
			<thead>
				<tr>
					<th>게시판 글 보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%= freeDTO.getArticle_title() %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%= freeDTO.getUser_id() %></td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2"><%= freeDTO.getArticle_date().substring(0, 11) + freeDTO.getArticle_date().substring(11, 13) + "시" + freeDTO.getArticle_date().substring(14, 16) + "분" %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="height: 200px; text-align: left;"><%= freeDTO.getArticle_detail() %></td>
				</tr>
			</tbody>
		</table>
		<a href="FreeBoard.jsp">목록</a>
		
		<!-- 해당 글의 작성자가 본인이면 수정과 삭제가 가능하도록 코드 추가 -->
		<%
			if(sessionID != null && sessionID.equals(freeDTO.getUser_id())){
		%>
			<a href="FreeUpdateFrm.jsp?article_index=<%= article_index %>">수정</a>
			<a href="FreeDelete.jsp?article_index=<%= article_index %>">삭제</a>
		<%
			} 
		%>
		<hr width="730px">
	</div>
</body>
</html>