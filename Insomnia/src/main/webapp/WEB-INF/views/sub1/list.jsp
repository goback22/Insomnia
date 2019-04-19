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

<!-- PayMoving js -->
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>

<!-- Dependency Styles -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/bootstrap.min.css'/>" type="text/css">

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

body {
	color: white;
	background-image: url('../resource/img/tempBG.jpg');
	background-attachment : fixed;
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

.comments-title {
	font-size: 22px;
	font-weight: 600;
	margin-top: -20px;
}

.col-md-10 {
	margin: auto;
}

#kyj {
	margin-left: 0px;
}

*{
border: none;
}

.table td, .table th{
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
									<h2>R E C R U I T</h2>
								</div>
							</div>
							<!-- /.col-xl- -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container -->
				</footer>
				<!-- /#footer -->

				<div class="row">
					<div class="col-md-10">
						<div>
							<h5 class="comments-title">
								Recruit Notice Board 
								<a href="<c:url value='/sub1/write.ins'/>" class="btn btn-success" style="margin-left: 760px;">등록</a>
								<a href="<c:url value='/sub1/subcontent.ins'/>" class="btn btn-success" style="margin-left: 16px;">돌아가기</a>
							</h5>
						</div>
						<table class="table table-hover text-center">
							<tr style="height: 35px;">
								<th style="width: 7%; text-align: center;">No</th>
								<th style="width: 63%; text-align: center;">Subject</th>
								<th style="width: 10%; text-align: center;">Name</th>
								<th style="width: 7%; text-align: center;">Read</th>
								<th style="width: 13%; text-align: center;">Date</th>
							</tr>
							<c:if test="${empty list }" var="isEmpty">
								<tr>
									<td colspan="5">등록된 게시물이 없어요</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty }">
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr>
										<td style="text-align: center; padding-top: 10px;">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
										<td
											style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
											href="<c:url value='/sub1/view.ins?ap_no=${item.ap_no}'/>"
											class="title">${item.ap_title == null ? "" : item.ap_title}</a></td>
										<td style="text-align: center; padding-top: 10px;">${item.name}</td>
										<td style="text-align: center; padding-top: 10px;color:red">${item.ap_visit == null ? "null" : item.ap_visit}</td>
										<td style="text-align: center; padding-top: 10px;">${item.ap_postdate}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>

						<!-- 페이징 -->
						<div class="row">
							<!-- 페이지네이션 가운데 배치:text-center -->
							<div class="col-md-12 text-center"
								style="color: white; margin-left: 550px; margin-top: 10px">${pagingString}</div>
						</div>


						<!-- 검색UI -->
						<div class="text-center">
							<form class="form-inline"
								style="margin-left: 370px; margin-top: 20px; padding-left: 10px"
								method="post" action="<c:url value='/sub1/list.ins'/>">
								<div class="form-group">
									<select name="searchColumn" class="form-control">
										<option value="ap_title">제목</option>
										<option value="name">작성자</option>
										<option value="ap_content">내용</option>
									</select>
								</div>
								<div class="form-group" style="margin-left: 5px">
									<input type="text" name="searchWord" class="form-control" />
								</div>
								<button style="margin-left: 10px" type="submit" id="temp"
									class="btn btn-primary">검색</button>
							</form>
						</div>
					</div>
				</div>
				<br> <br>
			</div>
		</section>
	</div>
	<!-- /.container -->
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
	<script src="<c:url value='/vendor/js/smoke.js'/>">
		
	</script>
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