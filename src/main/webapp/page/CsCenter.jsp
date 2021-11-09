<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="grad.CsDTO" %>
<%@ page import="grad.CsDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디가 좋아? | 고객센터</title>

<style>
	table {
		width: 60%;
	}
	#toptable {
		text-align: center;
	}
	tr, td{
		padding: 3px;
	}
	#form {
		margin: 100px;
	}
	td {
		text-align: center;
	}
	thead th {
		text-align: center;
	}
</style>
<script type="text/javascript">
	function gowriteForm() { //글쓰기버튼 클릭시 글쓰기 폼으로 이동
		location.href="CsWriteFrm.jsp";
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
	
	<div name="fbform" align="center" id="form">
	<font style="font-size: x-large; font-weight: bold;">고객센터</font>
	<hr width="720px">
	<%
		//현재 세션 상태 체크
		String sessionID = null;
		if(session.getAttribute("sessionID") != null){
			sessionID = (String)session.getAttribute("sessionID");
		}
		int pageNumber = 1; //기본은 1페이지를 할당
		// 만약 파라미터로 넘어온 오브젝트 타입 pageNumber가 존재하면
		// int 타입으로 캐스팅 하고 그 값을 pageNumber로 변수에 저장
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		%>
	<div>
		<div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody>
					<%
						CsDAO csDAO = new CsDAO();
						ArrayList<CsDTO> list = csDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getCs_number() %></td>
						<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
						<td><a href="FreeView.jsp?article_index=<%= list.get(i).getCs_number() %>"><%= list.get(i).getCs_title() %></a></td>
						<td><%= list.get(i).getCs_id() %></td>
						<td><%= list.get(i).getCs_date().substring(0, 11) + list.get(i).getCs_date().substring(11, 13) + "시"	+ list.get(i).getCs_date().substring(14, 16) + "분" %></td>
						<td><%= list.get(i).getCs_state() %></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="CsCenter.jsp?pageNumber=<%=pageNumber - 1 %>">이전</a>
			<%
				}if(csDAO.nextPage(pageNumber + 1)){
			%>
				<a href="CsCenter.jsp?pageNumber=<%=pageNumber + 1 %>">다음</a>
			<%
				}
			%>
			
			<!-- 글쓰기 버튼 생성 -->
			<a href="CsWriteFrm.jsp">글쓰기</a>
		</div>
	</div>
	
</body>
</html>
<%-- <%@ include file="./include/footer.jspf"%> --%>