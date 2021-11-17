<%@page import="grad.PlaceDAO"%>
<%@page import="grad.PlaceDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 페이지마다 여기부터 헤더 스타일, 헤더 붙여넣기 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<!-- 페이지마다 여기까지 헤더 스타일, 헤더 붙여넣기 -->
<%
	String place_name = request.getParameter("place_name");
	PlaceDAO placeDAO = new PlaceDAO();
	ArrayList<PlaceDTO> plist = placeDAO.PlaceInfo(place_name);
	
	String latlng = plist.get(0).getPlace_latlng();
	
	String[] s_latlng = latlng.split(", ");
	String place_lat = s_latlng[0];
	String place_lng = s_latlng[1];
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="twitter:image" content="http://map3.daum.net/staticmap/og?type=place&amp;srs=wcongnamul&amp;size=400x200&amp;m=429468%2C1130912">
<link rel="stylesheet" type="text/css"
	href="//t1.daumcdn.net/kakaomapweb/place/jscss/pc.af992913.css">
<link
	href="//t1.daumcdn.net/localimg/localimages/07/common/kakaomap_favicon.ico"
	rel="shortcut icon">
<title></title>
</head>
<body style="background: #E1E1E1;">
	<!-- start header div -->
	<div id="header_menu">
		<%@ include file="/include/header.jspf"%>
	</div>
	<!-- end header div -->
	<div class="container" style="background: white; padding-top: 15px; padding-bottom: 15px;">
		<div class="">
			<div class="place_photo" style="">
				<img alt="장소 사진" src="/grad/img/bg_nodata.png" width="100%"
					height="auto">
			</div>
			<div class="top_info border-primary"
				style="margin: -50px auto 0; box-shadow: 0px 1px 1px 1px lightgray; border: 0px solid; z-index: 10; padding: 20px; position: relative; background: white; margin-left: 30px; margin-right: 30px;">
				<h2 align="center" style = "font-family : 'Dohyeon';"><%=plist.get(0).getPlace_name()%></h2>
				<div class="map" style="" align="center">
					<a href="ReviewBoard.jsp?place_name='<%=plist.get(0).getPlace_name() %>'?place_lat='<%= place_lat%>'?place_lng='<%= place_lng%>'" class="">
					<span class="ico_comm ico_map">지도</span>지도</a>
				</div>
			</div>
			<div class="details_placeinfo">
				<h3 class="tit_subject" style = "font-family : 'Dohyeon';">상세정보</h3>
				<div class="placeinfo_default">
					<h4 class="tit_detail">
						<span class="ico_comm ico_address">위치</span>
					</h4>
					<div class="location_detail">
						<span class="txt_address"><%=plist.get(0).getPlace_addr()%><span class="bg_bar"></span></span>
					</div>
				</div>
				<%if(plist.get(0).getPlace_openhour() != null) {%>
				<div class="placeinfo_default">
					<h4 class="tit_detail">
						<span class="ico_comm ico_operation">운영시간 안내</span>
					</h4>
					<div class="location_detail openhour_wrap">
						<div class="location_present">
							<strong class="tit_operation fst"></strong>
							<ul class="list_operation">
								<li><span class="txt_operation"><%=plist.get(0).getPlace_openhour()%>

								</span></li>
							</ul>
						</div>
					</div>
				</div>
				<% } %>
				<%if(plist.get(0).getPlace_homepage() != null) {%>
				<div class="placeinfo_default placeinfo_homepage">
					<h4 class="tit_detail">
						<span class="ico_comm ico_homepage">홈 페이지</span>
					</h4>
					<div class="location_detail">
						<div class="location_present">
							<a class="link_homepage" href="http://<%=plist.get(0).getPlace_homepage()%>"><%=plist.get(0).getPlace_homepage()%></a>
						</div>
					</div>
				</div>
				<% } %>
				<%if(plist.get(0).getPlace_pn() != null) {%>
				<div class="placeinfo_default placeinfo_contact">
					<h4 class="tit_detail">
						<span class="ico_comm ico_contact">연락처</span>
					</h4>
					<div class="location_detail">
						<div class="location_present">
							<span class="num_contact"> <span class="txt_contact"><%=plist.get(0).getPlace_pn()%></span>
								<span class="color_g">대표번호</span>
							</span>
						</div>
					</div>
				</div>
				<% } %>
			</div>
		</div>
		<!-- 후기 작성 -->
		<div class="" style="box-shadow: 0px 1px 1px 1px lightgray; position: relative; padding: 10px; padding-left: 50px; padding-right: 50px; margin-left: 30px; margin-right: 30px; ">
		    <h3 class="tit_subject" style = "font-family : 'Dohyeon';">후기 작성</h3>
		    <div class="">
		       <button class="btn btn-primary" style="font-size: 11px;">후기 작성하기</button>
		    </div>
		    <strong class="total_evaluation">전체 <span class="color_b">갯수</span></strong>
		    <div class="evaluation_review">
		        <strong class="screen_out">후기 리스트</strong>
	            <div class="paging_mapdetail">
                       <span class="screen_out">현재페이지</span>
                       <em class="link_page">1</em>
                       <a href="#none" class="link_page" data-page="2" data-logtarget="" data-logevent="point,page,page_number2">
                           2
                       </a>
	            </div>
		    </div>
		</div>
	</div>
</body>
</html>