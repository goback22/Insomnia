<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

	/*===================로그인 후 회원화면=========================*/

.user_top dd, .user_top dt {
	
	display: inline;
	color: white;
	font-size: 15px;
}

.afterLogin p, .afterLogin a {
	color: white;
	font-size: 15px;
}


.user_picture {
	
	width: 70px;
	height: 50px;
	border-radius: 100%;
	margin-right: 20px;
	margin-left: 10px;
	margin-bottom: 5px;
	
}

.benefit span, .benefit dt, .benefit dd, .benefit a {
	font-size: 13px;
	margin-left: 5px;
}


#logout {
	font-size; 13px;
	float: right;
}


.afterLogin img {
	width: 30px;
}

table {
	width: 279px;
	text-align: center;
}

.user_middle table tr {
	width: 279px;
	text-align: center;
}

.user_middle table td  {
	width: 25%;
}

.user_middle td a {
	width: 100%;
	text-align: center;
	height: 100px;
}


.user_middle label {
	color: white;
	font-size: 15px;
}


.user_bottom li, .user_bottom ul {
	width: 100%
}

.user_bottom img{
	width: 20%
}

.user_bottom span{
	width: 80%
	text-align: center;
}

.profile_name {
	color: orange;
	font-size: 17px;
}





.user_top {	
	
	
}

.user_middle {
	
	
}

.user_bottom {
	
}
	


</style>


<!-- 네비게이션 바 -->
<div class="nav">

	<!--=========================-->
	<!--=        Navbar         =-->
	<!--=========================-->
	<header class="header header-magic-line">
		<div class="header-inner">
			<div class="tim-container clearfix">
				<div class="header-magic-line-inner clearfix">
					<div id="site-logo" class="float-left">
						<a href="<c:url value='/home.ins'/>" class="logo-main"> <img
							src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
						</a> <a href="<c:url value='/home.ins'/>" class="logo-stickky"> <img
							src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
						</a>
					</div>

					<!-- 로그인 아이콘 -->
					<ul class="user-login">
						<li><a href="<c:url value='/#'/>" class="off-opener"> <i
								class="fa fa-bars" aria-hidden="true"></i>
						</a></li>
					</ul>

					<div class="nav">
						<ul class="group" id="header-menu-magic-line">

							<li class="menu-item-has-children current_page_item"><a
								href="<c:url value='/#'/>">HOME</a></li>

							<li class="menu-item-has-children"><a
								href="<c:url value='/main/mainproject.ins'/>">Funding</a>
							</li>

							<li class="menu-item-has-children"><a
								href="<c:url value='/sub1/subprojects.ins'/>">Sub Projects</a></li>

							<%
								if ("admin".equals(session.getAttribute("id")) || "ADMIN".equals(session.getAttribute("id"))) {
							%>
							<li class="menu-item-has-children"><a
								href="<c:url value='/admin/index.ins'/>">Admin Page</a></li>
							<li class="menu-item-has-children"><a
								href="<c:url value ='/Pay/PayPage.ins'/>">PayPage(Test)</a></li>
							<%
								} else {
							%>

							<li class="menu-item-has-children"><a
								href="<c:url value='/menu/mypage.ins'/>">My Page</a></li>
							<%
								}
							%>
						</ul>
					</div>
					<!-- /.nav -->
				</div>
			</div>
			<!-- /.tim-container -->
		</div>
		<!-- /.header-inner -->
	</header>
	<!-- /#header -->


	<!-- 여기부터 -->

	<!-- 여기부터 -->
			
				<!-- 로그인 시 보여줄 화면 시작 -->
				<div class="offset-menu-two">
					<div class="afterLogin" style="margin-top: -370px">
					<!-- 닫기 버튼 -->
						<a href="<c:url value='/#'/>" class="offset-closer">
							<img style="margin-left: 270px; margin-top: -60px" src="<c:url value='/resource/img/offset-cross2.png'/>" alt="">
						</a>
					<!-- 네이버 로그인 display:none -->
					<div id="naver_id_login" style="display: none;"></div>
						
					<!-- 사용자 계정정보 -->
				
	            	<div class="user_top">		<!-- 상단메뉴:div -->
              			<!-- 프로필 이미지 -->
                		<img class="user_picture" src="<c:url value='/upload/${record.profile_img}'/>"/>
              			<!-- 사용자 이름 -->
              			<a href="<c:url value='/menu/mypage.ins'/>" class=""><span class="profile_name">${record.name}</span>님 환영합니다!</a>
              			<!-- 쿠폰, 포인트 -->
			             <dl class="c">
			               <dt>쿠폰</dt>
			               <dd><a href="javascript:void(0)"><span id="">0</span>장</a></dd>
			               <dt>포인트</dt>
			               <dd><a href="javascript:void(0)"><span id="">0</span>P</a></dd>
			             </dl>
            		</div>
		            <table class="user_middle">	<!-- 중간메뉴:ul -->	<!-- ul이 1 칸 차지, li display : inline -->
		              <tr>
			              <td><a id="middle1" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_apple-music-2_2301791.png'/>"/></a></td>
			              <td><a id="middle2" href="javascript:void(0)" class=""><img src="<c:url value='/img/iconfinder_microphone_1055023.png'/>"/></a></td>
			              <td><a id="middle3" href="javascript:void(0)" class=""><img src="<c:url value='/img/followers.png'/>"/></a></td>
			              <td><a id="middle4" href="javascript:void(0)" class=""><img src="<c:url value='/img/iconfinder_heart_289619.png'/>"/></a></td>
			           </tr>
			           <tr>
		           		  <td><label for="middle1">리워드</label></td>
		           		  <td><label for="middle2">마이페이지</label></td>
		           		  <td><label for="middle3">초대하기</label></td>
		           		  <td><label for="middle4">블라블라</label></td>
			           		
			           </tr>
		            </table>
		            
		            <!-- display:none 끝 -->
		            <%-- <ul class="user_bottom">		<!-- 하단메뉴 --> <!-- ul이 1칸 차지, li display: inline -->
		              <li>
		                <a id="" class="" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_mail_1055030.png'/>"/>
		                  		<span class="">메시지</span>
		                </a>
		              </li>
		              <li><a class="" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_humans_1216581.png'/>"/><span>친구 초대하기</span></a></li>
		              <li><a class="" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_wrench_416405.png'/>"/><span>설정</span></a></li>
		              <li><a class="" href="<c:url value='/logout.ins'/>"><img src="<c:url value='/img/exit.png'/>"/><span>로그아웃</span></a></li>
		            </ul> --%>
		            <a id="logout" href="<c:url value='/logout.ins'/>">로그아웃</a>
            
          		</div> <!-- afterLogin div 끝 -->
						
			<!-- 여기까지 -->
						
						
		</div>
				
				<!-- 로그인 시 보여줄 화면 끝 -->
			<!-- 로그인/회원정보 페이지 끝 -->
			



			<!-- 여기까지 -->

	<!-- 여기까지 -->




	<!--=============================-->
	<!--=        Mobile Nav         =-->
	<!--=============================-->
	
	<!-- hover 효과 -->
		<script> 
			$(function(){
				
				$('.afterLogin label, #logout').hover(function(){
					
					$(this).css('color', 'rgb(222, 255, 239)');
					
				}, function(){
					$(this).css('color', 'white');
				});
				
				
			})
			
		</script>


</div>
<!-- 네비게이션 바 끝 -->
<!-- 밑 두줄 필요(없으면 꺠지는 부분이 있음) -->
<header id="mobile-nav-wrap"> </header>


