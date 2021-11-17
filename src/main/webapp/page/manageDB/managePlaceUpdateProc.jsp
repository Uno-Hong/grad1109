<%@page import="java.util.Date"%>
<%@page import="grad.PlaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="UpdateProc" class="grad.PlaceDAO"/>
<jsp:useBean id="PlaceBean" class="grad.PlaceDTO"/>
<jsp:setProperty property="*" name="PlaceBean"/>

<%
	PlaceBean.setPlace_id(Integer.parseInt(request.getParameter("place_id")));
	PlaceBean.setPlace_name(request.getParameter("place_name"));
	PlaceBean.setPlace_addr(request.getParameter("place_addr"));
	PlaceBean.setPlace_pn(request.getParameter("place_pn"));
	PlaceBean.setPlace_latlng(request.getParameter("place_latlng"));
	PlaceBean.setPlace_type(request.getParameter("place_type"));
	PlaceBean.setPlace_si(request.getParameter("place_si"));
	PlaceBean.setPlace_gu(request.getParameter("place_gu"));
	PlaceBean.setPlace_dong(request.getParameter("place_dong"));
	PlaceBean.setPlace_bungi(request.getParameter("place_bungi"));
	PlaceBean.setPlace_openhour(request.getParameter("place_openhour"));
	PlaceBean.setPlace_homepage(request.getParameter("place_homepage"));
	PlaceBean.setPlace_tag(request.getParameter("place_tag"));
	
	
	
	boolean result = UpdateProc.UpdateProc(PlaceBean, request.getParameter("place_id"));
	 String msg = null;
	if(result) {  msg = "성공"; }
	String url = "managePlace.jsp";

%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>