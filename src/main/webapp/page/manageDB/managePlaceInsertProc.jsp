<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Date"%>
<%@page import="grad.PlaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="InsertProc" class="grad.PlaceDAO"/>
<jsp:useBean id="placedto" class="grad.PlaceDTO"/>
<jsp:useBean id="placefiledto" class="grad.PlaceFileDTO"/>

<%
	

	
	String saveFolder = application.getRealPath("/img");
   // String saveFolder = saveFolders.substring(0,55) + saveFolders.substring(58,81);

    String msg = saveFolder;
    


	// 총 100M 까지 저장 가능하게 함

	int maxSize = 1024 * 1024 * 100;
	String encType = "UTF-8";

	
	        MultipartRequest multi = null;
	        multi = new MultipartRequest(request, saveFolder, maxSize,
	                encType, new DefaultFileRenamePolicy());
	
	        String fileName = multi.getFilesystemName("place_etc");
	        String original = multi.getOriginalFileName("place_etc");
	        
	        //String type = multi.getContentType("place_etc");
	        File f = multi.getFile("place_etc");
	        
	      //  out.println("저장된 파일 이름 : " + fileName + "<br/>");
	       // out.println("실제 파일 이름 : " + original + "<br/>");
	      //  out.println("파일 타입 : " + type + "<br/>");
	        
	       
	        
	        placedto.setPlace_name(multi.getParameter("place_name"));
	    	placedto.setPlace_addr(multi.getParameter("place_addr"));
	    	placedto.setPlace_pn(multi.getParameter("place_pn"));
	    	placedto.setPlace_lng(Float.parseFloat(multi.getParameter("place_lng")));
	    	placedto.setPlace_lat(Float.parseFloat(multi.getParameter("place_lat")));
	    	placedto.setPlace_type(Integer.parseInt(multi.getParameter("hidden_place_type")));
	    	
	    	if(f != null)
	    	{
		    	placefiledto.setPlace_img_origin(original);
		    	placefiledto.setPlace_img_name(saveFolder + "\\" + fileName);
		    	placefiledto.setPlace_img_size(f.length());
	    	}
	       // (saveFolder + "\\" + fileName);
	        
	        
	        if (f != null) 
	        {
	            out.println("크기 : " + f.length()+"바이트");
	            out.println("<br/>");
        	}
	        
	        
	       int place_id =  InsertProc.PlaceInsert(placedto);
	       boolean result = InsertProc.PlaceFileInsert(placefiledto, place_id);
	        
	if(result) { msg = saveFolder + "\\" + fileName; } 
	
	String url = "managePlaceInsert.jsp";

	
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>