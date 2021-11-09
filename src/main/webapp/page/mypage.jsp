<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
	<% request.setCharacterEncoding("UTF-8"); %>
    <%
    	String requestURI = request.getRequestURI();
    	Object obj_sid = session.getAttribute("sessionID");
    	String login_id = (String)obj_sid;
    	
    	String user_id = "";
    	String user_pw = "";
    	String user_name = "";
    	String user_phone_first = "";
    	String user_phone_middle = "";
    	String user_phone_last = "";
    	
    	/********************************/
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt;
		ResultSet rs = null;
		/********************************/
		
	    try{
	    	String dbId = "root";
			String dbPass = "Hh33906^";
			String PortNo = "3306";
			String DBName = "gjob";
			String TIMEZONE = "serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
			
			String jdbcUrl = "jdbc:mysql://localhost:" + PortNo + "/" + DBName + "?" + TIMEZONE ;;
	       
	       conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	       conn.setAutoCommit(false);
			stmt = conn.createStatement();
	       //out.println("DB 연결 성공");
	       
	       String sql = "select *, left(user_phone, 3), mid(user_phone, 4, 4), right(user_phone, 4) from tb_user where user_id = '" + login_id + "'";
	       
	       pstmt = conn.prepareStatement(sql);
		   rs = stmt.executeQuery(sql);
		   
		   while(rs.next()){
				user_id = rs.getString("user_id");
				user_pw = rs.getString("user_pw");
				user_name = rs.getString("user_name");
				user_phone_first = rs.getString("left(user_phone, 3)");
				user_phone_middle = rs.getString("mid(user_phone, 4, 4)");
				user_phone_last = rs.getString("right(user_phone, 4)");
				
				//out.println("<br>" + user_id);
			}
	 %>
    <%
    	conn.commit();
    
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
	table {
		border: 1px solid;
		padding: 20px;
		margin-right: auto;
		margin-left: auto;
	}
	td {
		text-decoration: none;
		list-style: none;
		padding: 10px;
		font-size: 13px;
	}
	#change_info {
		font-size: 12px;
	}
	#change_pw {
		font-size: 12px;
	}
</style>
<script type="text/javascript">
	/* function go_change_info() {
		//location.href="change_info.jsp";
		location.href="check_pw.jsp";
	} */
	function go_change_pw() {
		//location.href="change_info.jsp";		
		location.href="checkPw.jsp";
	}
	function check_delete_user() {		
		location.href="delete_user_form.jsp";
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
	<form name="mypageform" method="post" id="form">
		<div align="center">
			<font style="font-size: x-large; font-weight: bold;">마이페이지</font>
			<hr width="500px">
			<table>
				<tr>
					<td colspan="1">
						<!-- 사진 들어갈 예정 -->
					</td>
					<td><label>아이디</label></td>
					<td colspan="3">
						<label><% out.print(user_id); %></label>
					</td>
				</tr>
				<tr>
					<td><input type="button" value="비밀번호변경" id="change_pw" onclick="go_change_pw()"></td>
					<td><label>전화번호</label></td>
					<td colspan="3">
						<label><%out.print(user_phone_first); %></label>&nbsp-&nbsp<label><%out.print(user_phone_middle); %></label>&nbsp-&nbsp<label><%out.print(user_phone_last); %></label>
					</td>
				</tr>
				<tr>
					<td colspan="1"><input type="button" value="회원탈퇴" id="delete_user" onclick="check_delete_user()"></td>
					<td colspan="2">
					
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>