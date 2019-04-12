<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Meta Data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- JQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- 구매하기 css -->
<link href="<c:url value='/vendor/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/custom.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/jquery.scrolling-tabs.css'/>"
	rel="stylesheet">

<!-- 텍스트에디터 css -->
<link rel="canonical" href="https://quilljs.com/standalone/full/">
<link type="application/atom+xml" rel="alternate"
	href="https://quilljs.com/feed.xml"
	title="Quill - Your powerful rich text editor" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/monokai-sublime.min.css" />
<link rel="stylesheet"
	href="<c:url value='/vendor/css/quill.snow.css'/>" />

<script>
	$(function() {
		//구매하기 hide, show
		$('.option-btn').click(function() {
			if ($('#optionList').css('display') === 'none') {
				$('#optionList').show(1000);
			} else {
				$('#optionList').hide(1000);
			}
		});
	});
</script>

<!-- aos 구동 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<!-- Dependency Styles -->
<link rel="stylesheet"
	href="dependencies/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="<c:url value='/vendor/css/stylesheet.css'/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value='/vendor/css/swiper.min.css'/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value='/vendor/css/font-awesome.min.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/animate.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/vendor/css/magnific-popup.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/jquery-ui.css'/>"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/slick.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/vendor/css/colornip.min.css'/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value='/vendor/css/css-loader.css'/>" type="text/css">

<!-- Site Stylesheet -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/woocommerce.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/app.css'/>"
	type="text/css">
<style>
element.style {
	background-color: white;
	color: white;
}

body>#standalone-container {
	margin: 50px auto;
	max-width: 720px;
}

#editor-container {
	height: 350px;
}

body {
	/* 	background-color: black; */
	color: white;
	background: url('../resource/img/background.jpg');
}

.text1 {
	color: white;
	font-size: 24px;
	margin-left: 58px;
	margin-top: 50px;
	text-shadow: 1px 1px 10px black;
	font-weight: bold;
}

.section {
	text-align: center;
	color: white;
	font-size: 40px;
	text-shadow: 1px 1px 10px black;
	z-index: 50;
	letter-spacing: 10px;
	line-height: 180%;
	font-weight: 500;
	padding-left: 95px;
	padding-right: 150px;
	padding-top: 170px;
	padding-bottom: 50px;
	border: none;
	font-family: 'Cormorant Garamond', serif;
}

.section1 {
	margin-top: 20px;
	margin-left: 60px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_A.jpg');
}

.section2 {
	margin-top: 280px;
	margin-left: 740px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_D.jpg');
}

.section3 {
	margin-top: 280px;
	margin-left: 60px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_C.jpg');
}

.section4 {
	margin-top: 280px;
	margin-left: 740px;
	margin-bottom: 200px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_B.jpg');
}

.review-comments {
	margin-top: -10px;
}


.title {
	color: white;
}

.comments-title {
	font-size: 24px;
	font-weight: 600;
	margin-top: -20px;
}

.col-md-10 {
	margin: auto;
}

#kyj{
	margin-left: 0px;
}
</style>
</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp" />

		<!--===========================-->
		<!--=        	About         =-->
		<!--===========================-->
		<section class="single-product">
			<div class="container">
				<br> <br>
				<!-- DETAILS 문구 -->
				<footer id="footer-4">
					<div class="container">
						<div class="d-flex justify-content-center row">
							<div class="col-xl-10">
								<div class="section-title style-four" id="ad">
									<h2>D E T A I L S</h2>
								</div>
							</div>
							<!-- /.col-xl- -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container -->
				</footer>
				<!-- /#footer -->

				<div class="product-tab-wrapper">
					<ul class="nav product-tabs" role="tablist" id="abd">
						<li class="nav-item"><a class="nav-link active"
							href="#profile" role="tab" data-toggle="tab">Description</a></li>
						<li class="nav-item"><a class="nav-link" href="#buzz"
							role="tab" data-toggle="tab">Recruit</a></li>
						<li class="nav-item"><a class="nav-link" href="#references"
							role="tab" data-toggle="tab">Reviews</a></li>
					</ul>
					<br>

					<div class="tab-content">

						<!-- 첫번째 카테고리 : 상품 설명 -->
						<div role="tabpanel" class="tab-pane fade in active" id="profile">
							<div class="single-product-wrapper">
								<div class="row">
									<div class="col-md-12 col-sm-6">
										<div class="quickview-slider">
											<!-- 											<div> -->
											<!-- 												<span class="text1">What comes to your mind when you -->
											<!-- 													think about 'Guitarist'?</span> -->
											<!-- 											</div> -->
											<!-- section1 -->
											<div class="section section1" data-aos="fade-up">
												<div style="width: 400px">
													<!-- 													<span style="color: red; font-weight: bold; width: 100px;">Like -->
													<!-- 														this? </span> -->
												</div>
											</div>

											<!-- section2 -->
											<div class="section section2" data-aos="fade-down">
												<div>
													<!-- 													<span>Support and <br /> Purchase -->
													<!-- 													</span> -->
												</div>
											</div>

											<!-- section3 -->
											<div class="section section3" data-aos="slide-up">
												<div>
													<!-- 													<span>Listen and <br /> Participate -->
													<!-- 													</span> -->
												</div>
											</div>

											<!-- section4 -->
											<div class="section section4" data-aos="flip-up">
												<div>
													<!-- 													<span>Support and <br /> Purchase -->
													<!-- 													</span> -->
												</div>
											</div>
										</div>
									</div>
								</div>

								<footer id="footer-4">
									<div class="container">
										<div class="d-flex justify-content-center row">
											<div class="col-xl-10">
												<div class="section-title style-four">
													<h2>I&nbsp;N&nbsp;F&nbsp;O&nbsp;R&nbsp;M&nbsp;A&nbsp;T&nbsp;I&nbsp;O&nbsp;N</h2>
												</div>
												<div class="footer-three-bottom">
													<div class="footer-three-left">
														<a href="#"> </a>
													</div>
												</div>
											</div>
											<!-- /.col-xl- -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.container -->
								</footer>
								<!-- /#footer -->

								<div id="map" style="width: 500px; height: 400px;"></div>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c32fad4a1c57880bfba793d4634c4d7"></script>
								<script>
									var container = document
											.getElementById('map');
									var options = {
										center : new daum.maps.LatLng(
												33.450701, 126.570667),
										level : 3
									};

									var map = new daum.maps.Map(container,
											options);
								</script>

								<div>
									<div class="option-container">
										<div class="option-btn"
											style="font-size: 1.2em; width: 10px; height: 50px; padding-top: 3px; margin-left: 20px;">B
											u y</div>
										<div id="optionList" class="option-area"
											style="display: none;">
											<div class="option-area-content">
												<div class="option-area-content-step1">
													<div class="common-flex-between">
														<span class="option-title mt10 xs-mt25">Buy Tickets</span>
													</div>
													<div class="option-box option-box-blue">
														<div class="option-box-left" style="padding-top: 10px">
															<div class="option-box-amount">오후 16시</div>
															<div class="mt5" style="padding-top: 5px">
																<span><strong>13석 남음</strong></span> <span
																	style="opacity: 0.5;">&nbsp;&nbsp;|&nbsp;&nbsp;
																	12석 판매</span>
															</div>
														</div>
														<div class="option-box-center" style="padding-top: 10px">
															<div class="option-box-title">[ 방구석 기타리스트 ]</div>
															<div class="option-box-desc mt5" style="margin-top: 10px">남
																몰래 갈고 닦은 실력, 무대에서 직접만나보세요</div>
														</div>
														<div class="box_inventory option_box_grey">
															<input type="hidden" name="limited_qty_yn" value="">
															<input type="hidden" name="limited_min_qty" value="1">
															<input type="hidden" name="limited_max_qty" value="999">
															<div style="padding-top: 1px;">
																<span class="txt_count_inventory option_title">수량&nbsp;&nbsp;&nbsp;
																</span> <input name="qty" type="text" value="1"
																	style="background-color: black; width: 38px; height: 20px; text-align: center"
																	class="input_add" onkeyup="checkQty(this);"
																	onfocus="this.select();" style="line-height: 18px">
																<a href="javascript:void(0)" style="font-size: 1.5em">&nbsp;+&nbsp;</a>
																<a href="javascript:void(0)" style="font-size: 1.5em">-</a>
															</div>
															<div style="padding-top: 2px">
																<span>금액&nbsp;&nbsp;&nbsp;</span> <span>11,000원</span>

															</div>
														</div>
													</div>
												</div>


												<div class="option-box" style="margin-top: -25px;">
													<div class="option-box-left">
														<div class="option-box-amount">오후 20시</div>
														<div class="mt5" style="padding-top: 5px">
															<strong class="font-pink">Sold out</strong> <span
																style="opacity: 0.5;">&nbsp;&nbsp;|&nbsp;&nbsp;
																판매 완료</span>
														</div>
													</div>
													<div class="option-box-center">
														<div class="option-box-title">[ 방구석 기타리스트 ]</div>
														<div class="option-box-desc mt5" style="margin-top: 10px">남
															몰래 갈고 닦은 실력, 무대에서 직접 만나보세요</div>
													</div>
													<div class="hidden-xs option-delivery-date">
														<strong class="font-pink"
															style="font-size: 1.6em; margin-top: 200px">Sold
															out</strong>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="optionBtnBox">
									<div class="optionStepBtn">다음단계</div>
								</div>
							</div>
						</div>


						<!-- 두번째 카테고리 : 기타리스트 모집(게시판 형식, view에선 한줄 댓글 기능 추가하기) -->
						<div role="tabpanel" class="tab-pane fade" id="buzz">
							<div class="row">
								<div class="col-md-10">
									<div>
										<h5 class="comments-title">
											Recruit Notice Board <a
												href="#kyj" class="btn btn-success" style="margin-left: 850px;">등록</a>
										</h5>
									</div>
									<table class="table table-hover table-bordered text-center" >
										<tr style="height: 35px;">
											<th style="width: 5%; text-align: center;">번호</th>
											<th style="width: 75%; text-align: center;">제목</th>
											<th style="width: 10%; text-align: center;">작성자</th>
											<th style="width: 10%; text-align: center;">등록일</th>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;">1</td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="<c:url value='/sub1/view.ins'/>" class="title">방구석
													기타리스트 프로젝트 지원</a></td>
											<td style="text-align: center; padding-top: 10px;">김길동</td>
											<td style="text-align: center; padding-top: 10px;">2019-03-28</td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;">2</td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="<c:url value='/sub1/view.ins'/>" class="title">방구석
													기타리스트에 지원합니다.</a></td>
											<td style="text-align: center; padding-top: 10px;">홍길동</td>
											<td style="text-align: center; padding-top: 10px;">2019-03-28</td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;">3</td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="<c:url value='/sub1/view.ins'/>" class="title">프로젝트
													지원서</a></td>
											<td style="text-align: center; padding-top: 10px;">박길동</td>
											<td style="text-align: center; padding-top: 10px;">2019-03-28</td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
										<tr style="height: 50px;">
											<td style="text-align: center; padding-top: 10px;"></td>
											<td
												style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
												href="View.jsp" class="title"></a></td>
											<td style="text-align: center; padding-top: 10px;"></td>
											<td style="text-align: center; padding-top: 10px;"></td>
										</tr>
									</table>
								</div>
							</div>

							<br>
							<br>

							<form class="review-form" action="#" method="post"
								style="padding-left: 115px;">
								<hr />
								<h5 class="comments-title" id="kyj" style="margin-bottom: 0px;">Write</h5>
								<div>
									<input type="text" name="text" placeholder="Title" style="width: 350px">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="name"
										class="form-fname form-element large" placeholder="Name"
										style="width: 250px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="email"
										name="email" class="form-email form-element large"
										placeholder="Email" style="width: 250px"> 
									<br> <br>
									<div id="standalone-container" style="width: 935px;">
										<div id="toolbar-container">
											<span class="ql-formats"> <select class="ql-size"></select>
											</span> <span class="ql-formats">
												<button class="ql-bold"></button>
												<button class="ql-italic"></button>
											</span> <span class="ql-formats"> <select class="ql-color"></select>
												<select class="ql-background"></select>
											</span> <span class="ql-formats">
												<button class="ql-header" value="1"></button>
												<button class="ql-header" value="2"></button>
											</span> <span class="ql-formats">
												<button class="ql-list" value="ordered"></button>
												<button class="ql-list" value="bullet"></button>
												<button class="ql-indent" value="-1"></button>
												<button class="ql-indent" value="+1"></button>
											</span> <span class="ql-formats">
												<button class="ql-direction" value="rtl"></button> <select
												class="ql-align"></select>
											</span> <span class="ql-formats">
												<button class="ql-link"></button>
												<button class="ql-image"></button>
												<button class="ql-video"></button>
												<button class="ql-formula"></button>
											</span>
										</div>
										<div id="editor-container"></div>
									</div>
									<input type="submit" value="Submit" class="gp-btn" style="margin-left: 0px;">
								</div>
							</form>

						</div>

						<!-- 세번째 카테고리 : 리뷰 게시판 -->
						<div role="tabpanel" class="tab-pane fade" id="references">
							<div class="tab-content left">
								<div class="row">
									<div class="col-md-10">
										<!-- Reviews -->
										<div class="review-comments">
											<h5 class="comments-title">
												Reviews <a href="#about" class="btn btn-success"
													style="margin-left: 40px;">등록</a>
											</h5>
											<br>
											<div class="review-comments">
												<ul class="review-list">
													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img
																	src="<c:url value='/resource/img/commenttemp.jpg'/>"
																	alt="Avatar">
															</div>
															<div class="comment-content">
																<h5 class="name">Michael Cunningham</h5>
																<div class="comment-meta">
																	<div class="star-rating">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">18 August 2018</span>
																</div>
																<p>
																	Description says it's water proof. This isn't really
																	the case, but then again I guess it's obvious from the
																	title of the product.<br> Overall very happy that
																	I purchased this jacked, plus I got a discount!
																</p>
															</div>
														</article>
													</li>
													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img
																	src="<c:url value='/resource/img/commenttemp.jpg'/>"
																	alt="Avatar">
															</div>
															<div class="comment-content">
																<h5 class="name">Jane Mullner</h5>
																<div class="comment-meta">
																	<div class="star-rating">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">24 August 2018</span>
																</div>

																<p>Exactly what I expected, a great durable jacket
																	for a good price. Very happy with my purchase although
																	delivery was delayed by a few days, no big deal though.</p>
															</div>
														</article>
													</li>
													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img
																	src="<c:url value='/resource/img/commenttemp.jpg'/>"
																	alt="Avatar">
															</div>
															<div class="comment-content">
																<h5 class="name">Michael Cunningham</h5>
																<div class="comment-meta">
																	<div class="star-rating">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">18 August 2018</span>
																</div>

																<p>
																	Description says it's water proof. This isn't really
																	the case, but then again I guess it's obvious from the
																	title of the product.<br> Overall very happy that
																	I purchased this jacked, plus I got a discount!
																</p>
															</div>
														</article>
													</li>


													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img
																	src="<c:url value='/resource/img/commenttemp.jpg'/>"
																	alt="Avatar">
															</div>
															<div class="comment-content">
																<h5 class="name">Jamie Sanders</h5>
																<div class="comment-meta">
																	<span class="post-date">24 August 2018</span>
																	<div class="star-rating">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																</div>
																<p>Not overly thirlled with this jacket, but I guess
																	it's good value for the money spent.</p>
															</div>
														</article>
													</li>
													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img
																	src="<c:url value='/resource/img/commenttemp.jpg'/>"
																	alt="Avatar">
															</div>
															<div class="comment-content">
																<h5 class="name">Michael Cunningham</h5>
																<div class="comment-meta">
																	<div class="star-rating">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">18 August 2018</span>
																</div>
																<p id="about">
																	Description says it's water proof. This isn't really
																	the case, but then again I guess it's obvious from the
																	title of the product.<br> Overall very happy that
																	I purchased this jacked, plus I got a discount!
																</p>
																<br>
															</div>
														</article>
													</li>
												</ul>
											</div>
										</div>
										<!-- Leave Review -->
									</div>

									<br>

									<form class="review-form" action="#" method="post"
										style="padding-left: 140px;">
										<hr />
										<h5 class="comments-title">Write</h5>
										<div>
											<ul class="rating">
												<li class="rating-title">Leave A Rating</li>&nbsp;&nbsp;
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
											</ul>
											<input type="text" name="name"
												class="form-fname form-element large" placeholder="Name"
												style="width: 250px">&nbsp;&nbsp; <input
												type="email" name="email"
												class="form-email form-element large" placeholder="Email"
												style="width: 250px"> <br> <br>
											<textarea name="message" class="form-message"
												placeholder="Review" tabindex="5"></textarea>
											<input type="submit" value="Submit" class="gp-btn">
										</div>
									</form>
								</div>
							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>
			</div>
			<!-- /.product-tab-wrapper -->
	</div>
	<!-- /.container -->
	</section>
	<!-- /.single-product -->


	<!-- Quick View -->
	<div class="modal quickview-wrapper">
		<div class="quickview">
			<div class="quickview-content">
				<div class="row">
					<div class="col-md-6 col-sm-6">

						<div class="quickview-slider">
							<div class="slider-for1">
								<div class="slick-slide">
									<img src="media/product/3.jpg" alt="Thumb">
								</div>
								<div class="slick-slide">
									<img src="media/product/4.jpg" alt="thumb">
								</div>
								<div class="slick-slide">
									<img src="media/product/5.jpg" alt="thumb">
								</div>
							</div>

							<div class="slider-nav1">
								<div class="slick-slide">
									<div class="slide-img">
										<img src="media/product/10.jpg" alt="Thumb">
									</div>
								</div>
								<div class="slick-slide">
									<img src="media/product/11.jpg" alt="thumb">
								</div>
								<div class="slick-slide">
									<img src="media/product/13.jpg" alt="thumb">
								</div>
							</div>
						</div>
						<!-- /.quickview-slider -->
					</div>
					<!-- /.col-md-6 -->

					<div class="col-md-6 col-sm-6">
						<div class="product-details">
							<span class="close-menu"> <i class="tim-cross-out"></i>
							</span>
							<h2 class="product-title">Exclusive Headphone</h2>

							<p class="price">
								<ins>
									<span class="woocommerce-Price-amount amount"> <span
										class="woocommerce-Price-currencySymbol">$</span>450
									</span>
								</ins>

								<del>
									<span class="woocommerce-Price-amount amount"> <span
										class="woocommerce-Price-currencySymbol">$</span>680
									</span>
								</del>
							</p>

							<div class="woocommerce-product-details__short-description">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Illum esse iusto neque reprehenderit rerum, et rem quos
									veritatis molestias.</p>
							</div>

							<div class="color-checkboxes">
								<h4>Choose Color:</h4>
								<input class="color-checkbox__input" type="radio" id="col-Blue1"
									name="colour" /> <label class="color-checkbox col-Blue-label"
									for="col-Blue1"></label> <span></span> <input
									class="color-checkbox__input" type="radio" id="col-Green1"
									value="#8bc34a" name="colour" /> <label
									class="color-checkbox col-Green-label" for="col-Green1"></label>
								<span></span> <input class="color-checkbox__input" type="radio"
									id="col-Yellow1" value="#fdd835" name="colour" /> <label
									class="color-checkbox col-Yellow-label" for="col-Yellow1"></label>
								<span></span> <input class="color-checkbox__input" type="radio"
									id="col-Orange1" value="#ff9800" name="colour" /> <label
									class="color-checkbox col-Orange-label" for="col-Orange1"></label>
								<span></span> <input class="color-checkbox__input" type="radio"
									id="col-Red1" value="#f44336" name="colour" /> <label
									class="color-checkbox col-Red-label" for="col-Red1"></label> <span></span>
							</div>

							<div class="options__item">
								<h4 class="option-title">Size:</h4>

								<span>S</span> <span class="active">M</span> <span>L</span> <span>XL</span>
							</div>

							<form action="#" class="product-cart" method="post">

								<div class="quantity">
									<span class="minus"><i class="fa fa-minus"></i></span> <input
										name="quantity" value="1"> <span class="plus"><i
										class="fa fa-plus"></i></span>
								</div>

								<button type="submit" name="add-to-cart" value="0"
									class="tim-cart-btn">
									<i class="fa fa-cart-plus"></i>Add to cart
								</button>
							</form>

							<div class="share-wrap">
								<h3>Share:</h3>
								<ul class="product-share-link">
									<li><a href="#" class="facebook-bg"><i
											class="fa fa-facebook"></i></a></li>
									<li><a href="#" class="twitter-bg"><i
											class="fa fa-twitter"></i></a></li>
									<li><a href="#" class="google-plus-bg"><i
											class="fa fa-google-plus"></i></a></li>
									<li><a href="#" class="pinterest-bg"><i
											class="fa fa-pinterest-p"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /.col-md-5 -->
				</div>
				<!-- /.row -->
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>

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

	<!-- AOS 적용 -->
	<script>
		AOS.init();
	</script>
	<!-- 등록버튼 효과 -->
	<script>
		$('.mobile-nav-btn').on('click', function(e) {
			e.preventDefault();

			$(document).scrollTop(0);
			toggleMobileHeader();
		});

		$(document).on('click', 'a[href^="#"]', function(event) {
			event.preventDefault();
			if ($($.attr(this, 'href')).length == 0) {
				location.href = '/' + $.attr(this, 'href');
			} else {
				$('html, body').animate({
					scrollTop : $($.attr(this, 'href')).offset().top
				}, 500);
			}
		});

		function toggleMobileHeader() {
			$('.wrapper > .header').toggleClass('menu-mobile');

			if ($('.wrapper > .header').hasClass('menu-mobile')) {
				$('html').addClass('mobile-overflow-hidden');
				$('body').addClass('mobile-overflow-hidden');
			} else {
				$('html').removeClass('mobile-overflow-hidden');
				$('body').removeClass('mobile-overflow-hidden');
			}
		}
	</script>

	<!-- 텍스트 에디터 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
	<script src="<c:url value='/vendor/js/quill.min.js'/>"></script>
	<script>
		var quill = new Quill('#editor-container', {
			modules : {
				formula : true,
				syntax : true,
				toolbar : '#toolbar-container'
			},
			placeholder : '내용을 입력하세요',
			theme : 'snow'
		});
	</script>