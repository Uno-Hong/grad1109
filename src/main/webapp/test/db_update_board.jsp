<%@page import="org.apache.tomcat.util.http.fileupload.MultipartStream"%>
<%@page import="jdk.jfr.Timespan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
   <%   
      String puid = (String)session.getAttribute("sessionID");
      String psub = request.getParameter("board_subject");
      String pcont = request.getParameter("board_content");
      String pfile = request.getParameter("board_file");
      
	 int pnum = 1;
      
   %>
   <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      
      try{
    	  String jdbcUrl = "jdbc:mysql://localhost:3306/mypet?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
         String dbId = "root";
         String dbPass = "1234";
         
         Class.forName("com.mysql.jdbc.Driver");
         
         conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
         conn.setAutoCommit( false );
         //out.println("DB 연결 성공");
         
         String sql = "insert into mppost (puid, psub, pcont, pfile, pupt) values (?, ?, ?, ?, now())";
         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, puid);
			pstmt.setString(2, psub);
			pstmt.setString(3, pcont);
			pstmt.setString(4, pfile);
			
			pstmt.executeUpdate();
        
         //out.println("테이블에" + id + "회원정보 추가");
         conn.commit();
         
        	out.println("<script>");
			out.println("location.href='board_free.jsp'");
			out.println("</script>");
         
         
         
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
</body>
</html>