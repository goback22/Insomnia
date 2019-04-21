<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>

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
							<h5 class="comments-title">Application</h5>
							<table class="table table-hover text-center">
								<tr style="height: 40px; display: none">
									<td style="width: 10%;">No</td>
									<td class="B">${record.ap_no}</td>
								</tr>
								<tr style="height: 40px">
									<td style="height: 30px;">Subject</td>
									<td class="B">${record.ap_title == null ? "" : record.ap_title}</td>
								</tr>
								<tr style="height: 40px">
									<td style="width: 10%;">Name</td>
									<td class="B">${record.name}</td>
								</tr>
								<tr style="height: 40px; display: none">
									<td style="height: 30px;">Date</td>
									<td class="B">${record.ap_postdate}</td>
								</tr>
								<tr style="height: 350px">
									<td style="padding-top: 140px;">Content</td>
									<td style="text-align: left">${record.ap_content == null ? "" : record.ap_content}</td>
								<tr>
									<td style="height: 40px;">File</td>
									<td class="B"></td>
								</tr>
								<tr style="border-bottom: none">
									<td style="height: 40px;"> &nbsp;이전 글 <br> 다음 글 </td>
									<td class="B">
								 	 <a style="color:white;" href="<c:url value='/sub1/view.ins?ap_no=${prev.ap_no}'/>">${prev.ap_title == null ? "등록된 이전 글이 없습니다." : prev.ap_title}</a>
									 <br> 
									 <a style="color:white;" href="<c:url value='/sub1/view.ins?ap_no=${next.ap_no}'/>">${next.ap_title == null ? "등록된 다음 글이 없습니다." : next.ap_title}</a>
								</tr>
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