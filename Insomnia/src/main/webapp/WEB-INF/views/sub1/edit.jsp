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

.col-md-10 {
	margin: auto;
	margin-top: -75px;
}

.frm{
	margin-left : 180px;
	margin-top: 15px;
	height: 1500px;
}

.KYJ{
	position:absolute;
	left: 260px;
	top:11px;
}

.KYJ2{
	position:absolute;
	left: 260px;
	top:68px;
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
							<form class="frm" id="frm" method="post" action="<c:url value='/sub1/edit.ins'/>">
								<div class="form-group">
 								<input type="hidden" name="ap_no" value="${record.ap_no}" /> 
									<label for="ap_title" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-7 KYJ">
										<input value="${record.ap_title}" type="text" class="form-control" name="ap_title"
											id="ap_title" placeholder="제목을 입력하세요" />
									</div>
								</div>
								<div class="form-group">
									<label for="ap_content" class="col-sm-2 ">내용</label>
									<div class="col-sm-10 KYJ2">
										<textarea rows="10" id="ap_content" name="ap_content" style="width: 650px;height:370px;"
											class="form-control" placeholder="내용을 입력하세요">${record.ap_content}</textarea>
									</div>
								</div>
								<div class="row" style="margin-top: 355px">
									<div class="col-md-12 text-right">
									<input type="submit" style="margin-right: 10px" class="btn btn-info" value="등록" />
									<a href="<c:url value='/sub1/subcontent.ins'/>" class="btn btn-success"
										style="margin-right: 230px;">취소</a>
									</div>
								</div>
							</form>
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

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
