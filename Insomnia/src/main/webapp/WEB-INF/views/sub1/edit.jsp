<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	
<style type="text/css">
body {
	color: #F5F5F5;
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

.title {
	color: white;
}

td:not (.A ){
	padding-top: 20px;
}

.B {
	text-align: left;
}

.col-md-10 {
	margin:auto;	
	margin-top: -75px;
	
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
		<!--=        	body          =-->
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
									<h2>E D I T</h2>
								</div>
							</div>
							<!-- /.col-xl- -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container -->
				</footer>
				<!-- /#footer -->
				<br> <br>

				<!-- 뷰 -->
				<div role="tabpanel">
					<div class="row">
						<div class="col-md-10">
							<h5 class="comments-title">Application</h5>
							<table class="table table-hover table-bordered text-center">
								<tr style="height: 35px">
									<td style="width: 10%; border: 1px solid black">작성자</td>
									<td class="B" style="border: 1px solid black"><input
										type="text" style="width: 30%;"></td>
								</tr>
								<tr style="height: 35px">
									<td style="height: 30px; border: 1px solid black">제목</td>
									<td class="B" style="border: 1px solid black"><input
										type="text" style="width: 30%;">
								</tr>
								<tr style="height: 300px;">
									<td style="padding-top: 140px; border: 1px solid black">자기
										소개</td>
									<td class="B" style="border: 1px solid black"><textarea
											style="width: 100%; height: 300px">
									</textarea>
								</tr>
								<tr style="height: 300px">
									<td style="padding-top: 140px; border: 1px solid black">지원
										동기</td>
									<td class="B" style="border: 1px solid black"><textarea
											style="width: 100%; height: 300px">
									</textarea>
								</tr>
							</table>
						</div>
					</div>
					<div class="row" style="margin-bottom: 10px">
						<div class="col-md-12 text-right">
							<a href="View.jsp" class="btn btn-success"
								style="margin-right: 120px;">완료</a>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
	</div>
	<!-- /.product-tab-wrapper -->

	<!-- /.container -->
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

				</div>
				<!-- /.row -->
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>