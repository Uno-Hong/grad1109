<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%   
		int pnum = Integer.parseInt(request.getParameter("pnum"));
      
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
         
         String sql = "delete from mppost where pnum = '" + pnum + "'";
         
			pstmt = conn.prepareStatement(sql);
		
			pstmt.executeUpdate();
        
         //out.println("테이블에" + id + "회원정보 추가");
         conn.commit();
         
        	out.println("<script>");
        	out.println("alert('글이 삭제되었습니다.')");
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