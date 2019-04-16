<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>


<!-- Site Stylesheet -->
<link rel="stylesheet" href="<c:url value='/vendor/css/MyPageCSS.css'/>" />

<!-- 제이쿼리 UI용 라이브러리 임베드 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body {
	background: url('../resource/img/background.jpg');
} 
</style>

</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site" >
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>
		<br><br><br><br>
		
		<!--===========================-->
		<!--=        	About         =-->
		<!--===========================-->
		<!-- 여기부터 -->
		<div id="wrap_wrap">
			<div id="wrap" class="col col-md-8">
				<div class="ms_cont_wrap">
					<div class="ms_cont">
						<div class="regular_user_index" style="">
							<!-- 일반회원정보 -->
							<section class="regu_user_info">
								<article class="regu_user_info_left">
									<!-- <figure> -->
									<!-- <p class="regu_user_pic_mask"></p> -->
									<img class="profileImgUrl"
										src="<c:url value='${record.profile_img}'/>">
									<!-- </figure> -->
								</article>
								<article class="regu_user_info_center">
									<p>
										<strong class="userName">${record.name}</strong> 님 안녕하세요.<br>
										<span>(지금 INSOMNIA 카드를 등록해보세요!)</span>
									</p>
									<!-- <a href="./myinfo_modify.do">개인정보 수정</a> -->
									<div
										style="width: 100%; text-align: center; padding-left: 110px;">
										<a href="<c:url value='/menu/mypage/edit.ins'/>" style="color: black;">개인정보 수정</a> <a class="gray" href="" style="color: black;">비밀번호 변경</a>
									</div>
								</article>
								<article class="regu_user_info_right">
									<div class="regu_user_info_rt">
										<a href="">
											<p class="icon_new_store_txt">
												신규 음반<br>
												<strong>발매 이벤트</strong>
											</p> 
											<!-- <span class="regu_next_arrow"></span> -->
										</a>
									</div>
									<div class="regu_user_info_rb">
										<a href="">
											<p class="icon_evt_cup_txt">
												INSOMNIA<br>
												<strong>전체 이벤트</strong>
											</p> 
											<!-- <span class="regu_next_arrow"></span> -->
										</a>
									</div>
								</article>
							</section>
							<!-- 일반회원정보 end -->
							</br></br>
							<!-- 카드혜택보기 -->
							
							<section class="regu_user_info2">
								<article class="regu_user_info_left">
									<!-- <figure> -->
									<!-- <p class="regu_user_pic_mask"></p> -->
									<img class="profileImgUrl"
										src="<c:url value='${record.profile_img}'/>">
									<!-- </figure> -->
								</article>
								<article class="regu_user_info_center">
									<p>
										<strong>아직 INSOMNIA 리워드를 구매한 적이 없으신가요?</strong><br>
										<span>지금 INSOMNIA의 다양한 음반들을 구매해보세요.</span>
									</p>
									<!-- <a href="./myinfo_modify.do">개인정보 수정</a> -->
									
								</article>
								<article class="regu_user_info_right">
									<div class="regu_user_info_rt2">
										<button></button>
									</div>
									<div class="regu_user_info_rb2">
										<button></button>
									</div>
								</article>
							</section>
							
							<!-- 카드222222 끝 -->
								<section class="regu_user_info3">
								<article class="regu_user_info_left">
									<!-- <figure> -->
									<!-- <p class="regu_user_pic_mask"></p> -->
									<img class="profileImgUrl"
										src="<c:url value='${record.profile_img}'/>">
									<!-- </figure> -->
								</article>
								<article class="regu_user_info_center">
									<p>
										<strong>INSOMNIA 리워드 회원의 특별한 혜택이 궁금하신가요?</strong><br>
										<span>혜택에 편리함까지 더한 My INSOMNIA 회원이 되어보세요!</span>
									</p>
									<!-- <a href="./myinfo_modify.do">개인정보 수정</a> -->
									
								</article>
								<article class="regu_user_info_right">
									<div class="regu_user_info_rt3">
										
									</div>
									<div class="regu_user_info_rb3">
										
									</div>
								</article>
							</section>
							<!-- 카드22222 -->
							
							<!-- 카드혜택보기 end -->
							<!-- 매장 & 카드 -->
							<section class="ms_sstore_charging">
								<article class="ms_sstore_charging_l">
									<header>
										<strong>새로운 인섬니아 음반을 소개합니다.</strong><br>전국의 새로운 인섬니아의
										얼굴들을 만나보세요~!
									</header>
									<div class="ms_sstore_slider">
										<!-- 신규음반이 없을 경우  -->
										<div class="no_store_wrap" style="display: none;">
											<figure>
												<img src="" alt="">
											</figure>
											<p class="cont">신규 음반이 없습니다.</p>
										</div>
										<!-- 신규매장이 없을 경우  end -->
										<div class="bx-wrapper" style="max-width: 286px; margin: 0px auto; position: relative; /* overflow: hidden; */">
											<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 209px;">
												<ul class="yes_store_wrap" style="width: 515%; transition-duration: 0s; transform: translate3d(-306px, 0px, 0px);">
													<!-- 첫번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/laptop.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반1</strong><br> 신규음반이름1<br>
																	<span class="date">2019-03-22</span>
																</div>
													</li>
													<!-- 두번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
														
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/smartphone.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반2</strong><br> 신규음반이름2<br>
																	<span class="date">2019-03-23</span>
																</div>
														
													</li>
													
													<!-- 세번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/laptop.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반1</strong><br> 신규음반이름1<br>
																	<span class="date">2019-03-22</span>
																</div>
													</li>
													<!-- 네번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
														
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/smartphone.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반2</strong><br> 신규음반이름2<br>
																	<span class="date">2019-03-23</span>
																</div>
														
													</li>
													
													<!-- 다섯번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/laptop.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반1</strong><br> 신규음반이름1<br>
																	<span class="date">2019-03-22</span>
																</div>
													</li>
													<!-- 여섯번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
														
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/smartphone.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반2</strong><br> 신규음반이름2<br>
																	<span class="date">2019-03-23</span>
																</div>
														
													</li>
													
													<!-- 일곱번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/laptop.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반1</strong><br> 신규음반이름1<br>
																	<span class="date">2019-03-22</span>
																</div>
													</li>
													<!-- 여덟번째 슬라이드 -->
													<li style="float: left; list-style: none; width: 133px; margin-right: 20px;" class="bx-clone">
														
																<div class="ms_sstore_slider_img">
																	<img alt="" src="<c:url value='/img/smartphone.png'/>" onerror="">
																</div>
																<div class="ms_sstore_slider_txt">
																	<strong>신규음반2</strong><br> 신규음반이름2<br>
																	<span class="date">2019-03-23</span>
																</div>
														
													</li>
													
												</ul>
											</div>
											<!-- 뷰포트 끝 -->
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev">Prev</a>
													<a class="bx-next">Next</a>
												</div>
											</div>
											<!-- 디렉션 끝 -->
										</div>
										<!-- 래퍼 끝 -->
									</div>
									<!-- 슬라이더 끝 -->
								</article>
								<article class="ms_sstore_charging_r">
									<div class="ms_regi_card">
											<figure class="icon_ms_regi_card"></figure>
											<p>
												<strong>카드등록</strong><br>카드를 등록하시고 다양한 리워드를 만나보세요.
											</p> 
									</div>
									<div class="ms_charge_card">
										
											<figure class="icon_ms_charge_card"></figure>
											<p>
												<strong>카드충전</strong><br>매장과 온라인에서 간편하게 충전하세요.
											</p> 
									
									</div>
									<div class="regu_mem_icon_wrap">
										<div>
											<a class="regu_mem_icon1" href="" required="login"> <!-- <span class="regu_icon"><i class="inboxNoCnt">N</i></span> -->
												인박스
											</a>
										</div>
										<div>
											<a class="regu_mem_icon2" href="" required="login"> <!--  <span class="regu_icon"></span> -->
												캘린더
											</a>
										</div>
										<div>
											<a class="regu_mem_icon3" href="" required="login"> <!-- <span class="regu_icon"><i>0</i></span> -->
												e-쿠폰
											</a>
										</div>
									</div>
								</article>
							</section>
							<!-- 매장 & 카드 end -->
						</div>
					</div>
					<!-- ms_cont -->
					<!-- ==============================네브바===================================== -->
					<nav class="ms_nav" id="msRnb">
						<ul>
							<li><a class="menu">My 리워드</a>
								<ul style="display: none;">

									<li><a href="<c:url value='/menu/mypage/edit.ins'/>"
										required="login">· 리워드 내역</a></li>
									<li><a href="" required="login">· 이벤트 및 혜택</a></li>

								</ul>
							</li>
							<li><a class="">My 뮤직</a>
								<!-- <ul style="display: none;">
									<li><a href="" required="login">· 작은제목1</a></li>
									<li><a href="" required="login">· 작은제목2</a></li>
									<li><a href="" required="login">· 작은제목3</a></li>
									<li><a href="" required="login">· 작은제목4</a></li>
								</ul> -->
							</li>
							<li><a class="">My 캘린더</a>
								<!-- <ul style="display: none;">
									<li><a href="" required="login">· 작은제목1</a></li>
									<li><a href="" required="login">· 작은제목2</a></li>
									<li><a href="" required="login">· 작은제목3</a></li>
								</ul> -->
							</li>
							<li class="msRnb_btn"><a class="menu">개인정보관리</a>
								<ul style="display: none;">
									<li><a href="">· 개인정보 확인 및 수정</a></li>
									<li><a href="">· 회원탈퇴</a></li>
								</ul>
							</li>
							
							<li class=""><a href="" required="login">큰제목5</a></li>
							<li class=""><a href="" required="login">큰제목6</a></li>

						</ul>
					</nav>

					<!-- ==============================네브바===================================== -->
				</div>
			</div>
		</div>


		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		

	<script>
		$(function() {

			var submenus = $('.menu').next(); //1개가 아님. 모든 서브메뉴들. 한번에 닫기 위해

			$('.ms_nav .menu').click(function() {
				var submenu = $(this).next();

				if (submenu.is(':visible')) {
					submenus.slideDown();  
					submenu.slideUp();
				} else {
					submenus.slideUp();
					submenu.slideDown();
				}
			});

		});
	</script>
	
	<!-- 슬라이드 스크립트 -->
	<script>
	
	/* //증가*감소 값
	var slideIndex = 1;
	
	//최초 실행시
	showSlides(slideIndex);
	
	//Prev, Next 버튼 클릭시 이동
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}
	
	//슬라이드 이동시키는 함수
	function showSlides(n) {
		
		var i;
		var slides = $('.bx-clone');  //슬라이드 객체의 집합
		
		if(n > slides.length) slideIndex = 1;  // 계속 Next해서, 슬라이드의 전체 갯수보다 커지면, 처음 슬라이드로 돌아간다.
		if(n < 1) slideIndex = slides.length;  // 계속 Prev해서, 1보다 작아지면, 즉 0이 되면, 슬라이드의 전체 갯수, 즉 마지막 슬라이드로 간다.
		
		for(i=0; i<slides.length; i++) {		//일단 루프를 돌며 전체를 안 보이게 한 뒤,
			slides[i].style.display = 'none';
		}
		
		slides[slideIndex-1].style.display = 'block';		// -1은 배열이므로.
		
	} */
	
	//클릭이벤트
	$(function(){
		
		var length = $('.bx-clone').length;
		var currPos = 0;
		
		
		$('.bx-prev').click(function(){

			$('.yes_store_wrap').css('transform', 'translate3d(-100px, 0px, 0px)');
		});
		
		$('.bx-next').click(function(){
				
			$('.yes_store_wrap').css('transform', 'translate3d(100px, 0px, 0px)');
		});
		
		
		
	})///////제이쿼리 진입점
	
	
	</script>

