<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>

<!-- Dependency Styles -->
<link rel="stylesheet"
	href="dependencies/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/stylesheet.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/swiper.min.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/font-awesome.min.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/animate.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/magnific-popup.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/jquery-ui.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/slick.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/colornip.min.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/css-loader.css'/>"
	type="text/css">

<!-- Site Stylesheet -->
<link rel="stylesheet" href="<c:url value='/vendor/css/woocommerce.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/app.css'/>"
	type="text/css">

<!-- 배경색 -->
<style>
body {
	color: white;
	background-image: url('../resource/img/tempBG.jpg');
	background-attachment : fixed;
}
.section-title.style-four{
	margin-top: 55px
}
</style>



</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>

		<!--===========================-->
		<!--=        	BODY          =-->
		<!--===========================-->
		<section id="gallery" class="section-padding">
			<!-- DETAILS 문구 -->
			<footer id="footer-4">
				<div class="container">
					<div class="d-flex justify-content-center row">
						<div class="col-xl-10">
							<div class="section-title style-four" id="ad">
								<a href="Subcontent.jsp"><h2>L &nbsp;I&nbsp; S&nbsp; T</h2></a>
							</div>
						</div>
						<!-- /.col-xl- -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container -->
			</footer>
			<br> <br>
			<!-- /#footer -->
			<div class="tim-container d-flex justify-content-center">

				<div class="col-xl-10">
					<ul
						class="tim-isotope-filter album-filter-button album-filter-button-two">
						<li class="current"><a href="" data-filter="*">All</a></li>
						<li><a href="" data-filter=".drum">Drum</a></li>
						<li><a href="" data-filter=".guiter">Guiter</a></li>
						<li><a href="" data-filter=".bass">Bass</a></li>
						<li><a href="" data-filter=".piano">Piano</a></li>
					</ul>

					<div class="tim-isotope tim-isotope-2 wow fadeInUp"
						data-wow-delay="0.8s">
						<ul class="tim-filter-items tim-album-items grid">
							<li class="grid-sizer"></li>

							<!-- 첫번째 목록 -->
							<li class="tim-album-item grid-item bass piano guiter">
								<div class="tim-isotope-grid__img effect-active">
									<img src="<c:url value='/resource/img/A.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/A.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>
								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<a href="<c:url value='/sub1/subcontent.ins'/>"><h4 class="album-title">방구석
												기타리스트</h4></a> <a href="<c:url value='/sub1/subcontent.ins'/>"><h5 class="artist-name">Guitarist
												In the corner of a room</h5></a>
									</div>
								</div>
							</li>

							<!-- 두번째 목록 -->
							<li class="tim-album-item grid-item bass drum">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/B.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/B.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">2</h4>
										<h5 class="artist-name">Music on Night</h5>
									</div>
								</div>
							</li>

							<!-- 세번째 목록 -->
							<li class="tim-album-item grid-item piano">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/H.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/H.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">3</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 네번째 목록 -->
							<li class="tim-album-item grid-item drum bass">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/E.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/E.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">4</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 다섯번째 목록 -->
							<li class="tim-album-item grid-item drum bass">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/O.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/O.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">5</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 여섯번째 목록 -->
							<li class="tim-album-item grid-item drum">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/L.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/L.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">6</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 일곱번째 목록 -->
							<li class="tim-album-item grid-item guiter">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/F.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/F.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">7</h4>
										<h5 class="artist-name">Music on Night</h5>
									</div>
								</div>
							</li>

							<!-- 여덟번째 목록 -->
							<li class="tim-album-item grid-item guiter piano">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/J.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/J.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">8</h4>
										<h5 class="artist-name">Music on Night</h5>
									</div>
								</div>
							</li>

							<!-- 아홉번째 목록 -->
							<li class="tim-album-item grid-item bass piano">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/Q.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/Q.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">9</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 열번째 목록 -->
							<li class="tim-album-item grid-item guiter  drum">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/H.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/H.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">10</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 열한번째 목록 -->
							<li class="tim-album-item grid-item bass drum">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/I.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/I.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">11</h4>
										<h5 class="artist-name">Music on Night</h5>

									</div>
								</div>
							</li>

							<!-- 열두번째 목록 -->
							<li class="tim-album-item grid-item guiter bass">
								<div class="tim-isotope-grid__img">
									<img src="<c:url value='/resource/img/U.jpg'/>" alt="album thumb" />
								</div> <a class="popup-modal" href="<c:url value='/resource/img/U.jpg'/>"> <i
									class="fa fa-picture-o"></i>
							</a>

								<div class="gallery_details_wrap">
									<div class="gallery-info">
										<h4 class="album-title">12</h4>
										<h5 class="artist-name">Music on Night</h5>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
			<!-- /.tim-container -->
		</section>
		<br>
		<!-- /#gallery -->

	</div>

	<!-- /#site -->
	<!-- Dependency Scripts -->
	<script src="<c:url value='/vendor/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/swiper.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/swiperRunner.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/wow.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery.countdown.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery.spinner.js'/>"></script>
	<script src="<c:url value='/vendor/js/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/masonry.pkgd.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/imagesloaded.pkgd.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/slick.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/headroom.js'/>"></script>
	<script src="<c:url value='/vendor/js/mp3-player-button.js'/>"></script>
	<script src="<c:url value='/vendor/js/smoke.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery.fittext.js'/>"></script>
	<script src="<c:url value='/vendor/js/tilt.jquery.js'/>"></script>
	<script src="<c:url value='/vendor/js/parallax.min.js'/>"></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js'></script>
	<!-- Player -->
	<script src="<c:url value='/vendor/js/jquery.jplayer.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jplayer.playlist.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/myplaylist.js'/>"></script>

	<!--Google map api -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsBrMPsyNtpwKXPPpG54XwJXnyobfMAIc"></script>

	<!-- Site Scripts -->
	<script src="<c:url value='/vendor/js/app.js'/>"></script>