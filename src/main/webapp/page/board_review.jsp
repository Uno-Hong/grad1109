<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디가 좋아? | 후기게시판</title>
<% 
	
%>
<!-- db 연결 -->
<%
	int total = 0; //전체 게시글 수

	int article_index = 0; // 게시글 ID
	int rest_id = 0; 
	int article_hit = 0;
	String user_id = "";
	String article_date = "";
	
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String year = (String)simpleDate.format(date);
	String yea = "";
	
	final int rowsize = 10; //한 페이지에 보일 게시물 수 (추후 보일 게시물 수 만들수 있음)
	final int block = 5; //아래에 보일 페이지 최대 갯수 1~5 / 6~10 / 11~15

	int pg = 1; //기본 페이지 값
	
	if(request.getParameter("pg") != null) { //받아온 pg값이 있을 때, 다른 페이지 일때,
		pg = Integer.parseInt(request.getParameter("pg")); //pg값 저장
	}
	
	int start = (pg*rowsize) - (rowsize-1); //해당 페이지에서 시작번호
	int end = (pg*rowsize);
	
	int allpage = 0;
		
	int startpage = ((pg-1)/block*block) + 1; //시작 블럭 숫자(1~5페이지일경우 1, 6~10일 경우 6)
	int endpage = ((pg-1)/block*block) + block; //끝 블럭 숫자(1~5일경우 5, 6~10일경우 10)
		
	/********************************/
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt;
	ResultSet rs = null;
	/********************************/
		
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/wdyl?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		String sqls = "";
				
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		conn.setAutoCommit(false);
		stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		//out.println("DB 연결 성공");
		
		//String sql = "select uid, upw from mpuser where uid = '" + entid + "'";
		String sqlCount = "select count(*) from tb_user_review";
		rs = stmt.executeQuery(sqlCount);
				
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
			
		int sort = 1;
		String sqlSort = "select article_index from tb_user_review order by step asc";
		rs = stmt.executeQuery(sqlSort);
			
		while(rs.next()){
			int stepnum = rs.getInt(1);
			sqls = "update tb_user_review set step = " + sort + " where article_index = " + stepnum;
			stmt1.executeUpdate(sqls);
			sort++;
		}
		
		allpage = (int)Math.ceil(total/(double)rowsize);
		
		if(endpage > allpage) {
			endpage = allpage;
		}
		
		String sql = "select article_index, user_id, article_hit, left(article_date,10) from tb_user_review where step >=" + start + " and step <= " + end + " order by step asc";
		pstmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
%>			   

<style type="text/css">
	div#map_area {
		width: 50%;
		height: auto;
		float: left;
	}
	div#review_board {
		width: 50%;
		height: auto;
		float: left;
	}
</style>



<script type="text/javascript">

</script>
</head>
<body>
	<!-- start header div -->
	<div id="header_menu">
		<%@ include file="/include/header.jspf"%>
	</div>
	&nbsp&nbsp&nbsp&nbsp
	<!-- end header div -->
	<form>
		<div id="map_area">
		<!-- map 코드 파일 include -->
		<%@ include file="/include/map.jspf"%>
		</div>
		
		<div id="review_board">
			<div name="fbform" align="center" id="form">
				<font style="font-size: x-large; font-weight: bold;">후기게시판</font>
				<hr width="720px">
				<div id="board" align="center" >
					<font size="4" style="font-weight: bold;">총 게시물 : <%=total%>개</font><br>
						<% if(session.getAttribute("sessionID") != null){
							out.print("<input type='button' value='글쓰기' onclick='gowriteForm()''>");
						} %>
					<table border="2" style="margin-top: 20px;">
						<tr id="toptable" style="font-weight: bold;">
							<td width="73"></td>
							<td width="379">제목</td>
							<td width="100">글쓴이</td>
							<td width="100">작성일</td>
							<td width="58">조회수</td>
						</tr>
					<% if(total==0) { %>
						<tr align="center" bgcolor="#FFFFFF" height="30">
							<td colspan="6">등록된 글이 없습니다.</td>
						</tr>
					<%	
					} else {
						while (rs.next()){
							article_index = rs.getInt(1);
							user_id = rs.getString(2);
							article_hit = rs.getInt(3);
							article_date = rs.getString(4);	
					%>		
					<tr>
						<td style="text-align: center; font-weight: bold;"><%= article_index %></td>
						<td style="text-align: left;">
						<a href="board_view.jsp?article_index=<%=article_index%>&pg=<%=pg %>"><%= user_id%>
					<%
						yea = article_date.substring(0,10);
						if(year.equals(yea)){ %>
						<img src="img/new.jpg">
					<% } %>
						</td>
						<td style="text-align: center;"><%= user_id %></td>
						<td style="text-align: center;"><%= article_date %></td>
						<td style="text-align: center;"><%= article_hit %></td>
					</tr>
					<% } } %> 	
					</table>
				</div>
				<div id="pageForm" align="center">
					<% if (pg>block) { %>
						[<a href="board_free.jsp?pg=1">◀◀</a>]
						[<a href="board_free.jsp?pg=<%= startpage-1%>">◀</a>]
					<% } %>
					<% for(int i = startpage; i <= endpage; i++){
						if(i==pg){ %>
						<u><b>[<%=i %>]</b></u>
					<% }else { %>
						[<a href="board_free.jsp?pg=<%=i%>"><%=i%></a>]
					<% } } %>
					<% if(endpage<allpage){ %>
						[<a href="board_free.jsp?pg=<%=endpage+1%>">▶</a>]
						[<a href="board_free.jsp?pg=<%=allpage%>">▶▶</a>]
					<% } %>
				</div>
				<br>
			</div>
			<% conn.commit();
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(pstmt != null) {
					try{ pstmt.close(); }catch(SQLException sqle){ }
				}
					if(conn != null) {
					try{ conn.close(); }catch(SQLException sqll){ }
				}
			}
			%>
		</div>
		
	</form>
</body>
</html>