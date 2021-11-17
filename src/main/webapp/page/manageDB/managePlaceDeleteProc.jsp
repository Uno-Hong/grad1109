<%@page import="java.util.Date"%>
<%@page import="grad.PlaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="DeleteProc" class="grad.PlaceDAO"/>
<jsp:useBean id="PlaceBean" class="grad.PlaceDTO"/>
<jsp:setProperty property="*" name="PlaceBean"/>

<%
	String place_id = request.getParameter("place_id");
	DeleteProc.PlaceDelete(place_id);

	String url = "managePlace.jsp";
%>
<script type="text/javascript">
	location.href="<%=url%>";
</script>