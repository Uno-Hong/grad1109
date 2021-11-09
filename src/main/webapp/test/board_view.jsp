<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		String puid = "";
		String psub = "";
		String pcont = "";
		int pcount = 0;
		String pupt = "";
		String pfile = "";
	
		/********************************/
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt;
		ResultSet rs = null;
		/********************************/
		
		try{
		 String jdbcUrl = "jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
		 String dbId = "root";
		 String dbPass = "1234";
		 
		 Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		 conn.setAutoCommit(false);
		 stmt = conn.createStatement();
		 //out.println("DB 연결 성공");
		 
		 //String sql = "select uid, upw from mpuser where uid = '" + entid + "'";		
		 String sql = "select puid, psub, pcont, pcount, left(pupt,16), pfile from mppost where pnum = '" + pnum + "'";
		 
		 
			pstmt = conn.prepareStatement(sql);
		
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				puid = rs.getString(1);
				psub = rs.getString(2);
				pcont = rs.getString(3);
				pcount = rs.getInt(4);
				pupt = rs.getString(5);
				pfile = rs.getString(6);
				
				pcount++;
				
			}
%>			   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이펫</title>
<style type="text/css">
	table {
		width: 60%;
		text-align: center;
	}
	tr, td {
		padding: 3px;
	}
	#form {
		margin-top: 50px;
	}
	#btn {
		font-size: 12px;
	}
</style>
<script type="text/javascript">
	function goList() {
		location.href="board_free.jsp?pnum=<%=pnum%>&pg=<%=pg%>";
	}
	function delete_board() {
		if(confirm("글을 삭제하시겠습니까?") == true){
			location.href="db_delete_board.jsp?pnum=<%=pnum%>&pg=<%=pg%>";
		}else{
			return false;
		}
	}
	function update_board() {
		if(confirm("글을 수정하시겠습니까?") == true){
			location.href="board_updateform.jsp?pnum=<%=pnum%>&pg=<%=pg%>";
		}else{
			return false;
		}
	}
	
</script>
</head>
<body>
<div id="form" align="center">
<input type="button" value="목록" onclick="goList()" id="btn">
	<div align="center">
	<table border="2" style="margin-top: 20px; margin-bottom: 20px;">
		<tr>
			<td colspan="1">제목</td>
			<td colspan="5" style="text-align: left;"><%= psub%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%= pupt%></td>
			<td>작성자</td>
			<td><%= puid%></td>
			<td>조회수</td>
			<td><%= pcount%></td>
		</tr>
		<tr>
			<td colspan="6" height="500px" style="padding-left: 20px; text-align: left;"><%= pcont %><br>
			<%if(pfile != null) {%>
				<img src="<%= pfile %>">
				<%} %>
			</td>
		</tr>
	</table>
	</div>
	<%if(session.getAttribute("sessionID").equals(puid)) {%>
		<input type="button" onclick="delete_board()" value="글 삭제" id="btn">
		<input type="button" onclick="update_board()" value="글 수정" id="btn">
	<%} %>
</div>
	<%			 
			sql = "update mppost set pcount = " + pcount + " where pnum = " + pnum;
	
			pstmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
	
			
	%>
	<%
			conn.commit();
	
		 
			}catch(Exception e){
			 e.printStackTrace();
			}
		finally{
			 if(pstmt != null) {
			    try{ pstmt.close(); }catch(SQLException sqle){ }
			 }
			 if(conn != null) {
			    try{ conn.close(); }catch(SQLException sqll){ }
			 }
			}
%>
</body>
