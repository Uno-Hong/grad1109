<%@page import="grad.PlaceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="grad.PlaceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
       <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>어디가 좋아?</title>
<!-- 네이버 api -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3fmcy9j37w"></script>
<!-- 구글 api -->
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBXlIrTBg49z6-ughr5Lj-KE6ctFDXvNzM" ></script> -->

<!--  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 -->
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
 
<style type="text/css">

	.carousel-item {
  height: 40vh;
  min-height: 300px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

@font-face {

      src : url("../css/DoHyeon-Regular.ttf"); 
      font-family: "Dohyeon" ;

}


.portfolio-item {
	overflow: hidden;
}
.img-fluid {
	width: 100%;
	height: 100%;
	object-fit: cover;
}


</style>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/grad/css/styles.css" rel="stylesheet" />

</head>
<body >

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: rgba(255, 255, 255, 0.8);">
            <div class="container" >
                <a class="navbar-brand" href="Main.jsp" style = "font-family :'Dohyeon'; text-shadow: 2px 2px 0 black;">어디가 좋아?</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <!-- <li class="nav-item"><a class="nav-link" href="FreeBoard.jsp" style = "font-family :'Dohyeon'; color: black;">커뮤니티</a></li> -->
                        <li class="nav-item"><a class="nav-link" href="FreeBoard.jsp" style = "font-family :'Dohyeon'; color: black;">자유게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="ReviewBoard.jsp" style = "font-family :'Dohyeon'; color: black;">장소검색</a></li>
                        <li class="nav-item"><a class="nav-link" href="planner.jsp" style = "font-family :'Dohyeon'; color: black;">플래너</a></li>
                        <li class="nav-item"><a class="nav-link" href="CsCenter.jsp" style = "font-family :'Dohyeon'; color: black;">고객센터</a></li>
                        <%
					// 로그인이 되어있는 상태
					if (session.getAttribute("sessionID") == null) {
					%>
   						<li class="nav-item"><a class="nav-link" data-bs-toggle="modal" data-target="#Login" href="#Login" style = "font-family :'Dohyeon'; color: black;">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="join.jsp" style = "font-family :'Dohyeon'; color: black;">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" data-bs-toggle="modal" data-target="#ManaLogin" href="#ManaLogin" style = "font-family :'Dohyeon'; color: black;">매니저</a></li>
						
                        	<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="logout.jsp" style = "font-family :'Dohyeon'; color: black;">로그아웃</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="mypage.jsp" style = "font-family :'Dohyeon'; color: black;">마이페이지</a></li> -->
					<%
					}
					%>
                    </ul>
                </div>
            </div>
        </nav>

	<!-- Login Modal -->
	<div class="modal fade" id="Login" tabindex="-1" role="dialog"
		aria-labelledby="LoginLabel" aria-hidden="true" style = "text-align : center;">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0" align="center">Login</h2>
					<button type="button" class="btn-close btn-close-white"
						data-dismiss="modal"></button>
				</div>
				<div class="modal-body p-5 pt-0">
					<form name="UserLogin" action="loginProc.jsp" method="post"
						id="form">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-4" name="loginid"
								placeholder="아이디를 입력해주세요.">
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-4"
								name="loginpw" placeholder="비밀번호를 입력해주세요.">
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
							type="submit">Login</button>
						<hr class="my-4">
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4"
							type="button" onclick="location.href = 'join.jsp'">회원가입
						</button>
						<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4"
							type="button" onclick="location.href = 'checkPw.jsp'">
							비밀번호 찾기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Login Modal -->

	<!-- Manager Login Modal -->
	<div class="modal fade" id="ManaLogin" tabindex="-1" role="dialog"
		aria-labelledby="ManaLoginLabel" aria-hidden="true" style = "text-align : center;">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0">관리자 페이지 접속</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form name="ManaLogin" action="ManaLogin.jsp" method="post"
						id="form">
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-4" name="pw"
								placeholder="Password" autofocus>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
							type="submit">Sign up</button>
						<small class="text-muted">By clicking Sign up, you agree
							to the terms of use.</small>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Manager Login Modal -->

<header>
  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active" style="background-image: url('../img/Main_slide_image_1.jpg')">
        <div class="carousel-caption">
          <h5 style = "font-family : 'Dohyeon';">맛집</h5>
          <p >맛집</p>
        </div>
      </div>
      <div class="carousel-item" style="background-image: url('../img/Main_slide_image_2.jpg')">
        <div class="carousel-caption">
          <h5 style = "font-family : 'Dohyeon';">명소</h5>
          <p>명소</p>
        </div>
      </div>
      <div class="carousel-item" style="background-image: url('../img/Main_slide_image_3.jpg')">
        <div class="carousel-caption">
          <h5 style = "font-family : 'Dohyeon';">지도</h5>
          <p>지도</p>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</header>
 
      
              <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase" style = "font-family : 'Dohyeon';">추천</h2>
                    <h3 class="section-subheading text-muted" style = "font-family : 'Dohyeon';">요즘 hot한 지역을 추천합니다!</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="PlaceDetail.jsp?place_name=양재천">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="../placeimg/양재천.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading" style = "font-family : 'Dohyeon';"><a href="PlaceDetail.jsp?place_name=양재천" style="color: black; text-decoration: none;">양재천</a></div>
                                <div class="portfolio-caption-subheading text-muted" style = "font-family : 'Dohyeon';">#걷기좋은 #단풍명소 #핑크뮬리명소</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="PlaceDetail.jsp?place_name=서울숲 은행나무길">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="../placeimg/서울숲 은행나무길.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading" style = "font-family : 'Dohyeon';"><a href="PlaceDetail.jsp?place_name=서울숲 은행나무길" style="color: black; text-decoration: none;">서울숲 은행나무길</a></div>
                                <div class="portfolio-caption-subheading text-muted" style = "font-family : 'Dohyeon';"">#데이트코스 #산책로 #힐링</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="PlaceDetail.jsp?place_name=익선동 한옥거리">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="../placeimg/익선동 한옥거리.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading" style = "font-family : 'Dohyeon';"><a href="PlaceDetail.jsp?place_name=익선동 한옥거리" style="color: black; text-decoration: none;">익선동 한옥거리</a></div>
                                <div class="portfolio-caption-subheading text-muted" style = "font-family : 'Dohyeon';">#요즘핫한 #데이트코스</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="PlaceDetail.jsp?place_name=카멜리아힐">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="../placeimg/카멜리아힐.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading" style = "font-family : 'Dohyeon';"><a href="PlaceDetail.jsp?place_name=카멜리아힐" style="color: black; text-decoration: none;">카멜리아힐</a></div>
                                <div class="portfolio-caption-subheading text-muted" style = "font-family : 'Dohyeon';">#제주대표 #핑크뮬리명소</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="PlaceDetail.jsp?place_name=포천 아트밸리">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="../placeimg/포천 아트밸리.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading" style = "font-family : 'Dohyeon';"><a href="PlaceDetail.jsp?place_name=포천 아트밸리" style="color: black; text-decoration: none;">포천 아트밸리</a></div>
                                <div class="portfolio-caption-subheading text-muted" style = "font-family : 'Dohyeon';">#단풍명소 #문화예술공간</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" href="PlaceDetail.jsp?place_name=함목몽돌해변">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"></div>
                                </div>
                                <img class="img-fluid" src="../placeimg/함목몽돌해변.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading" style = "font-family : 'Dohyeon';"><a href="PlaceDetail.jsp?place_name=함목몽돌해변" style="color: black; text-decoration: none;">함목몽돌해변</a></div>
                                <div class="portfolio-caption-subheading text-muted" style = "font-family : 'Dohyeon';">#물놀이 #바다구경 #파도멍</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
  



   <div id="footer_menu">
      
   </div>
  
          <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
     <!--  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
      -->
  
</body>

</html>