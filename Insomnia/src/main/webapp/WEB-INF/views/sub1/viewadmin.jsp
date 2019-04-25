<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- aos 구동 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<meta HTTP-EQUIV="Page-exit" content="BlendTrans(Duration=1)" />
<meta HTTP-EQUIV="Page-enter" content="BlendTrans(Duration=1)" />

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
	color: white;
	background-image: url('../resource/img/tempBG.jpg');
	background-attachment: fixed;
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

.B {
	wdith: 90%;
	text-align: left;
	padding-left: 15px;
}

.col-md-10 {
	margin: auto;
	margin-top: -75px;
}

.table td, .table th {
	border-bottom: 1px solid gray;
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
									<h2>V I E W</h2>
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
							<table class="table table-hover text-center">
								<tr style="height: 40px; display: none">
									<td style="width: 10%;">No</td>
									<td class="B"></td>
								</tr>
								<tr style="height: 40px">
									<td style="height: 30px;">Subject</td>
									<td class="B">게시글 작성 시 주의사항</td>
								</tr>
								<tr style="height: 40px">
									<td style="width: 10%;">Name</td>
									<td class="B">관리자</td>
								</tr>
								<tr style="height: 40px; display: none">
									<td style="height: 30px;">Date</td>
									<td class="B"></td>
								</tr>
								<tr style="height: 350px">
									<td style="padding-top: 140px;">Content</td>
									<td style="text-align: left">사이트 관리자입니다.<br>게시글 신청 시 기입해야하는 목록에 대해서 말씀드리겠습니다.</td>
							</table>
						</div>
					</div>

					<div class="row" style="margin-bottom: 10px;">
						<div class="col-md-12 text-right">
							<c:if test="${sessionScope.id == record.id }">
								<!-- 로그인한 아이디와 글쓴 아이디가 같다면 수정,삭제 버튼을 보여준다. -->
								<a href="<c:url value='/sub1/list.ins'/>"
									class="btn btn-success" style="margin-right: 20px;">목록</a>
								<a href="<c:url value='/sub1/edit.ins?ap_no=${record.ap_no}'/>"
									class="btn btn-success" style="margin-right: 20px;">수정</a>
								<a href="javascript:isDelete()" class="btn btn-success"
									style="margin-right: 120px;">삭제</a>
							</c:if>
							<c:if test="${sessionScope.id != record.id }">
								<!-- 로그인한 아이디와 글쓴 아이디가 같다면 수정,삭제 버튼을 보여준다. -->
								<a href="<c:url value='/sub1/list.ins'/>"
									class="btn btn-success" style="margin-right: 120px;">목록</a>
							</c:if>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
		</section>
	</div>

	<script>
		var isDelete = function() {
			if (confirm("정말로 삭제 하시겠습니까?")) {
				location
						.replace("<c:url value='/sub1/delete.ins?ap_no=${record.ap_no}'/>");
			}
		};
	</script>


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