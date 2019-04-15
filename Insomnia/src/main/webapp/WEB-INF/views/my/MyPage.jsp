<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>


<!-- Site Stylesheet -->
<link rel="stylesheet" href="<c:url value='/vendor/css/MyPageCSS.css'/>" />

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
										src="../resource/img/cat_110_165.jpg">
									<!-- </figure> -->
								</article>
								<article class="regu_user_info_center">
									<p>
										<strong class="userName">고냥이</strong> 님 안녕하세요.<br>
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
											</p> <span class="regu_next_arrow"></span>
										</a>
									</div>
									<div class="regu_user_info_rb">
										<a href="">
											<p class="icon_evt_cup_txt">
												INSOMNIA<br>
												<strong>전체 이벤트</strong>
											</p> <span class="regu_next_arrow"></span>
										</a>
									</div>
								</article>
							</section>
							<!-- 일반회원정보 end -->
							<!-- 카드혜택보기 -->
							<section class="card_advantage_wrap">
								<div class="card_advantage_int">
									<div class="card_advantage_icon">
										<figure class="card_advantage_icon1"></figure>
									</div>
									<div class="card_advantage_cont">
										<div class="card_adv_txt1">
											<strong>아직 등록된 INSOMNIA 카드가 없으신가요?</strong><br> INSOMNIA
											카드를 등록하시고 생일 무료음료 쿠폰과 다양한 인섬니아의<br> 리워드를 경험하세요. 인섬니아만의
											특별한 혜택을 경험하실 수 있습니다.
										</div>
										<p class="card_adv_btn card_adv_btn1">
											<a href="">인섬니아 카드 보기</a>
										</p>
										<p class="card_adv_btn card_adv_btn2">
											<a href="">인섬니아 e-Gift Card 구매</a>
										</p>
									</div>
								</div>
								<div class="card_advantage_inb">
									<div class="card_advantage_icon">
										<figure class="card_advantage_icon2"></figure>
									</div>
									<div class="card_advantage_cont2">

										<div class="card_adv_txt2">
											<strong>INSOMNIA만의 특별한 혜택이 궁금하신가요?</strong><br>혜택에 편리함까지
											더한 마이 인섬니아 리워드로<br> 한층 더 인섬니아를 특별하게 즐기세요.
										</div>

									</div>
								</div>
							</section>
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
										<div class="bx-wrapper"
											style="max-width: 286px; margin: 0px auto;">
											<div class="bx-viewport"
												style="width: 100%; overflow: hidden; position: relative; height: 209px;">
												<ul class="yes_store_wrap"
													style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(-306px, 0px, 0px);">
													<li
														style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;"
														class="bx-clone"><a href="">
															<div class="ms_sstore_slider_img">
																<img alt="" src="" onerror="">
															</div>
															<div class="ms_sstore_slider_txt">
																<strong>신규음반1</strong><br> 신규음반이름1<br> <span
																	class="date">2019-03-22</span>
															</div>
													</a></li>
													<li
														style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;"
														class="bx-clone"><a href="">
															<div class="ms_sstore_slider_img">
																<img alt="" src="" onerror="this.src='/'">
															</div>
															<div class="ms_sstore_slider_txt">
																<strong>신규음반2</strong><br> 신규음반이름2<br> <span
																	class="date">2019-03-29</span>
															</div>
													</a></li>
													<li
														style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;">
														<a href="">
															<div class="ms_sstore_slider_img">
																<img alt="" src="" onerror="">
															</div>
															<div class="ms_sstore_slider_txt">
																<strong>신규음반3</strong><br> 신규음반3(슬라이더 예비)<br>
																<span class="date">2019-03-21</span>
															</div>
													</a>
													</li>
													<li
														style="float: left; list-style: none; position: relative; width: 133px; margin-right: 20px;">
														<a href="">
															<div class="ms_sstore_slider_img">
																<img alt="" src="" onerror="">
															</div>
															<div class="ms_sstore_slider_txt">
																<strong>신규음반4</strong><br> 신규음반4(슬라이더 예비)<br>
																<span class="date">2019-03-22</span>
															</div>
													</a>
													</li>

												</ul>
											</div>
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev" href="">Prev</a><a class="bx-next"
														href="">Next</a>
												</div>
											</div>
										</div>

									</div>
								</article>
								<article class="ms_sstore_charging_r">
									<div class="ms_regi_card">
										<a href="" required="login">
											<figure class="icon_ms_regi_card"></figure>
											<p>
												<strong>카드등록</strong><br>카드를 등록하시고 다양한 리워드를 만나보세요.
											</p> <strong>카드등록</strong>
										</a>
									</div>
									<div class="ms_charge_card">
										<a href="" required="login">
											<figure class="icon_ms_charge_card"></figure>
											<p>
												<strong>카드충전</strong><br>매장과 온라인에서 간편하게 충전하세요.
											</p> <strong>카드충전</strong>
										</a>
									</div>
									<div class="regu_mem_icon_wrap">
										<a class="regu_mem_icon1" href="" required="login"> <!-- <span class="regu_icon"><i class="inboxNoCnt">N</i></span> -->
											<span class="regu_txt">인박스</span>
										</a> <a class="regu_mem_icon2" href="" required="login"> <!--  <span class="regu_icon"></span> -->
											<span class="regu_txt">캘린더</span>
										</a> <a class="regu_mem_icon3" href="" required="login"> <!-- <span class="regu_icon"><i>0</i></span> -->
											<span class="regu_txt">e-쿠폰</span>
										</a>
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

								</ul></li>
							<li><a class="menu">My 뮤직</a>
								<!-- <ul style="display: none;">
									<li><a href="" required="login">· 작은제목1</a></li>
									<li><a href="" required="login">· 작은제목2</a></li>
									<li><a href="" required="login">· 작은제목3</a></li>
									<li><a href="" required="login">· 작은제목4</a></li>
								</ul> -->
							</li>
							<li><a class="menu">My 캘린더</a>
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
								</ul></li>
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

			var submenus = $('.menu').next();

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

