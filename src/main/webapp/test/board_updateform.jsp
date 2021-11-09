<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import = "java.sql.*" %>
    <%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		String puid = "";
		String psub = "";
		String pcont = "";
		int pcount = 0;
		String pupt = "";
		
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
		 String sql = "select puid, psub, pcont, pcount, pupt from mppost where pnum = '" + pnum + "'";
		 
		 
			pstmt = conn.prepareStatement(sql);
		
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				puid = rs.getString(1);
				psub = rs.getString(2);
				pcont = rs.getString(3);
				pcount = rs.getInt(4);
				pupt = rs.getString(5);
				
				
			}
%>		
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
		
		if(!form.board_subject.value){
			alert("제목을 작성해주세요.");
			fomr.board_subject.focus();
		}
		if(!form.board_content.value){
			alert("내용을 작성해주세요.");
			fomr.board_content.focus();
		}
	}
	function cancelupdate() {
		if(confirm("글 수정을 취소하시겠습니까?") == true){
			location.href="board_view.jsp?pnum="+<%=pnum%>;
		}else{
			return false;
		}
		
	}
</script>
</head>
<body>

	<form action="db_board_write.jsp" method="post" id="boardForm">
		<table width="auto" border="1" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">작성자</td>
				<td>${sessionScope.sessionID}</td>
			</tr>
			<tr>
				<td id="title">제목</td>
				<td>
					<input type="text" name="board_subject" size="100%" maxlength="100" value="<%= psub%>">
				</td>
			</tr>
			<tr>
				<td id="title">내용</td>
				<td>
					<textarea name="board_content" rows="20" cols="72"><%= pcont%></textarea>
				</td>
			</tr>
			<tr>
				<td id="title">첨부파일</td>
				<td>
					<input type="file" name="board_file">
				</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<input type="button" value="목록">
					<input type="submit" value="등록" onclick="writecheck()">
					<input type="reset" value="취소" onclick="cancelupdate()">
				</td>
			</tr>
		</table>
	</form>
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
</html>
