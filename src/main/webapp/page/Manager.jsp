<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "grad.ManagerDAO" %>
<%@ page import = "grad.ManagerDTO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script type="text/javascript">
	function idDelete(user_id) {
		location.href = "delete_User.jsp?user_id=" + user_id;
	}
</script>
</head>
<body>
	<table align = "center" class = "ta">
		<tr class = "ta">
	   		<td align = "center"> 아이디 </td>
	   		<td align = "center"> 이름 </td>
	   		<td align = "center"> 전화번호 </td>
	   		<td align = "center"> 가입일자 </td>
		</tr>
	<%
		ManagerDAO mDAO = new ManagerDAO();
		ArrayList<ManagerDTO> mDTO = mDAO.getUser(); 
		
		for(int i = 0 ; i < mDTO.size() ; i++) {
	%>
 			
			<tr class = "ta">
				<td align = "center">
					<%= mDTO.get(i).getUser_id() %> 
	         	</td>
	         	<td align = "center"> 
	         		<%= mDTO.get(i).getUser_name() %>
	         	</td>
	         	<td align = "center"> 
	         		<%= mDTO.get(i).getUser_phone() %>
	         	</td>
	         	<td align = "center"> 
	         		<%= mDTO.get(i).getUser_reg() %>
	         	</td>
	         	<td>
					<input type = "button" onClick = "idDelete('<%= mDTO.get(i).getUser_id() %>')" value = "삭제">	         	
	         	</td>
			</tr>
		<%} %>
		</table>
</body>
</html>