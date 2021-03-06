<%@page import="grad.PlaceDAO"%>
<%@page import="grad.PlaceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="PlaceDAO" class="grad.PlaceDAO"/>
<jsp:useBean id="userName" class="grad.UserDAO"/>
<jsp:useBean id="userBean" class="grad.UserDTO"/>
<jsp:setProperty property="*" name="userBean"/>
        <%
	    	String requestURI = request.getRequestURI();
	    	Object obj_sid = session.getAttribute("sessionID");
	    	String login_id = (String)obj_sid;
	    	String login_name = userName.searchName(login_id);
	    	ArrayList<PlaceDTO> lists = PlaceDAO.AllPlaceSelect();
	    	pageContext.setAttribute("lists", lists);
    	%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>

    <!-- Custom fonts for this template -->
    <link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./manageDB.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin <sup>관리자</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <!-- 
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>회원 관리</span></a>
            </li>
			 -->
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리
            </div>

           <!-- Nav Item --->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <!-- <i class="fas fa-fw fa-cog"></i> -->
                    <i class="fas fa-fw fa-table"></i>
                    <span>회원</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 관리:</h6>
                        <a class="collapse-item" href="manageUser.jsp">수정</a>
                        <a class="collapse-item" href="../join.jsp">등록</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item --->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePlace"
                    aria-expanded="true" aria-controls="collapsePlace">
                    <!-- <i class="fas fa-fw fa-wrench"></i>-->
                    <i class="fas fa-fw fa-table"></i>
                    <span>맛집/명소</span>
                </a>
                <div id="collapsePlace" class="collapse" aria-labelledby="headingPlace"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리:</h6>
                        <a class="collapse-item" href="managePlace.jsp">수정</a>
                        <a class="collapse-item" href="managePlaceInsert.jsp">등록</a>
          
                    </div>
                </div>
            </li>
            
            <!-- Nav Item --->
            <!-- 
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRest"
                    aria-expanded="true" aria-controls="collapseRest">
                   
                    <i class="fas fa-fw fa-table"></i>
                    <span>맛집</span>
                </a>
                <div id="collapseRest" class="collapse" aria-labelledby="headingRest"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">맛집 관리:</h6>
                        <a class="collapse-item" href="manageRest.jsp">수정</a>
                        <a class="collapse-item" href="manageRestInsert.jsp">등록</a>
          
                    </div>
                </div>
            </li>
			 -->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            
            <!-- Nav Item --->
            <li class="nav-item">
                <a class="nav-link" href="manageDisplay.jsp">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>화면 구성</span></a>
            </li>
            
             <!-- Nav Item --->
            <li class="nav-item">
                <a class="nav-link" href="manageCenter.jsp">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>고객센터</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <!-- 
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
					 -->
					 
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><% out.print(login_name); %></span>
                                <img class="img-profile rounded-circle"
                                    src="../../img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <!-- 
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                 -->
                                <!-- 
                                <div class="dropdown-divider"></div>
                                 -->
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->



                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!-- 
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>
					 -->
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">명소/맛집 수정</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style ="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>위도/경도</th>
                                            <th>명소/맛집</th>
                                            <th>시</th>
                                            <th>구</th>
                                            <th>동</th>
                                            <th>번지</th>
                                            <th>영업시간</th>
                                            <th>홈페이지</th>
                                            <th>태그</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>위도/경도</th>
                                            <th>명소/맛집</th>
                                            <th>시</th>
                                            <th>구</th>
                                            <th>동</th>
                                            <th>번지</th>
                                            <th>영업시간</th>
                                            <th>홈페이지</th>
                                            <th>태그</th>
                                            <th>삭제</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var = "list" items = "${lists}">
                                  			<tr>
                                  				<td>${list.place_id}</td>
                                  				<td>${list.place_name}</td>
                                  				<td>${list.place_addr}</td>
                                  				<td>${list.place_pn}</td>
                                  				<td>${list.place_latlng}</td>
                                  				<td>${list.place_type}</td>
                                  				<td>${list.place_si}</td>
                                  				<td>${list.place_gu}</td>
                                  				<td>${list.place_dong}</td>
                                  				<td>${list.place_bungi}</td>
                                  				<td>${list.place_openhour}</td>
                                  				<td>${list.place_homepage}</td>
                                  				<td>${list.place_tag}</td>
                                  				<td>
                                  				<button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#DBModal" 
                                  				data-id="${list.place_id}" data-name="${list.place_name}" data-addr="${list.place_addr}" data-pn="${list.place_pn}" data-latlng="${list.place_latlng}"  data-type="${list.place_type}" data-si="${list.place_si}" data-gu="${list.place_gu}" data-dong="${list.place_dong}" data-bungi="${list.place_bungi}" data-openhour="${list.place_openhour}" data-homepage="${list.place_homepage}" data-tag="${list.place_tag}"
                                  				onclick="ToModal('${list.place_id}', '${list.place_name}', '${list.place_addr}', '${list.place_pn}', '${list.place_latlng}', '${list.place_type}', '${list.place_si}', '${list.place_gu}', '${list.place_dong}', '${list.place_bungi}', '${list.place_openhour}', '${list.place_homepage}', '${list.place_tag}' );">
                                  				<i class="fas fa-edit fa-sm text-white-50"></i> </button>
                                  				</td>
                                  			</tr>
                                  		</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">현재 세션을 종료하시려면 로그아웃 버튼을 눌러주세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="../logout.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </div>



  <!-- DB Modal-->
    <div class="modal fade" id="DBModal" tabindex="-1" role="dialog" aria-labelledby="MyDBModal"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style ="width:auto; display:table;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="MyDBModal">갱신</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <form method="post">
                <div class="modal-body">
                <div class="table-responsive">
                                <table class="table table-borderless" id="dataTableModal" width="100%" cellspacing="0" style ="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>위도/경도</th>
                                            <th>맛집/명소</th>
                                       </tr>
                                     </thead>
                                     <tbody>
                                    		 <tr>
                                  				<td><input type="text" id="place_id" name ="place_id" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_name" name ="place_name" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_addr" name ="place_addr" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_pn" name ="place_pn" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_latlng" name ="place_latlng" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_type" name ="place_type" style = "text-align:center; border:none;"></input></td>
                                  			</tr>
                                  	 </tbody>
                                     <thead>
                                            <tr>
                                            <th>시</th>
                                            <th>구</th>
                                            <th>동</th>
                                            <th>번지</th>
                                            <th>영업시간</th>
                                            <th>홈페이지</th>
                                            <th>태그</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                  				<td><input type="text" id="place_si" name ="place_si" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_gu" name ="place_gu" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_dong" name ="place_dong" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_bungi" name ="place_bungi" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_openhour" name ="place_openhour" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_homepage" name ="place_homepage" style = "text-align:center; border:none;"></input></td>
                                  				<td><input type="text" id="place_tag" name ="place_tag" style = "text-align:center; border:none;"></input></td>
                                  	</tr>
                                    </tbody>
                                </table>
                            </div>
                </div>
                <div class="modal-footer">
                	<button class="btn btn-primary" type="submit" formaction="managePlaceUpdateProc.jsp">수정</button>
                    <button class="btn btn-secondary" type="submit" formaction="managePlaceDeleteProc.jsp">삭제</button>
                </div>
                </form>
            </div>
        </div>
    </div>

<script>

    var place_id="";
    var place_name="";
    var place_addr="";
    var place_pn="";
    var place_latlng="";
    var place_type="";
    var place_si="";
    var place_gu="";
    var place_dong="";
    var place_bungi="";
    var place_openhour="";
    var place_homepage="";
    var place_tag="";
    
    $(document).ready(function() {     
        $('#DBModal').on('show.bs.modal', function(event) {          
        	place_id = $(event.relatedTarget).data('id');
        	place_name = $(event.relatedTarget).data('name');
        	place_addr = $(event.relatedTarget).data('addr');
        	place_pn = $(event.relatedTarget).data('pn');
        	place_latlng = $(event.relatedTarget).data('latlng');
        	place_type = $(event.relatedTarget).data('type');
        	place_si = $(event.relatedTarget).data('si');
        	place_gu = $(event.relatedTarget).data('gu');
        	place_dong = $(event.relatedTarget).data('dong');
        	place_bungi = $(event.relatedTarget).data('bungi');
        	place_openhour = $(event.relatedTarget).data('openhour');
        	place_homepage = $(event.relatedTarget).data('homepage');
        	place_tag = $(event.relatedTarget).data('tag');
        });
    });
    
    function ToModal(id, name, addr, pn, latlng, type, si, gu, dong, bungi, openhour, homepage, tag){

    	$('#place_id').val(id)
    	$('#place_name').val(name)
    	$('#place_addr').val(addr)
    	$('#place_pn').val(pn)
    	$('#place_latlng').val(latlng)
    	$('#place_type').val(type)
    	$('#place_si').val(si)
    	$('#place_gu').val(gu)
    	$('#place_dong').val(dong)
    	$('#place_bungi').val(bungi)
    	$('#place_openhour').val(openhour)
    	$('#place_homepage').val(homepage)
    	$('#place_tag').val(tag)

    	}
    
    function insertBlack()
    {
        var blackCount = $('#blackCount').val();
        location.replace('${path}/page/manageDB/manageUserProc');
    }
    
</script>




    <!-- Bootstrap core JavaScript-->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../../vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../../vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../js/demo/datatables-demo.js"></script>

</body>


</html>