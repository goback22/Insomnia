<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<!-- 기본 부트스트랩 최신자와 제이쿼리 최신자 (적용되지 않는 스타일에 대해 구버전을 섞었음)-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- JQuery Migrate Plugin -->
<script src="vendor/js/jquery-migrate-1.4.1.min.js"></script>

<!-- site style sheets -->
<!-- Dependency Styles -->
<link rel="stylesheet"
	href="dependencies/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="dependencies/intro/css/stylesheet.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/swiper/swiper.min.css"
	type="text/css">
<link rel="stylesheet"
	href="dependencies/font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/wow/css/animate.css"
	type="text/css">
<link rel="stylesheet"
	href="dependencies/magnific-popup/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="dependencies/jquery-ui/css/jquery-ui.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/slick-carousel/css/slick.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/colornip/css/colornip.min.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/css-loader/css/css-loader.css"
	type="text/css">

<!-- Site Stylesheet -->
<link rel="stylesheet" href="assets/css/woocommerce.css" type="text/css">
<link rel="stylesheet" href="assets/css/app.css" type="text/css">
<link id="theme" rel="stylesheet"
	href="assets/css/theme-color/theme-default.css" type="text/css">

<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond"
	rel="stylesheet">


<style>
.user-login {
	padding-top: 7px;
}

.section-title.style-four {
	margin-top: 75px;
}

body {
	width: 100%;
	background-color: #171717;
}

#site {
	width: 100%;
}

/* 배너 */
.banner {
	width: 100%;
}

.banner-video {
	width: 100%;
}

.queen {
	width: 100%;
}

.banner-title {
	font-family: 'Cormorant Garamond', serif;
	border-bottom: 4px solid orange;
	color: white;
	position: absolute;
	padding: 80px;
	top: 300px;
	margin-left: 27%;
	font-size: 120px;
}
</style>

</head>
<!--=========================-->
<!--=        Navbar         =-->
<!--=========================-->

	<header class="header header-magic-line">
		<div class="header-inner">
			<div class="tim-container clearfix">
				<div class="header-magic-line-inner clearfix">
					<div id="site-logo" class="float-left">
						<a href="index.html" class="logo-main"> <img
							src="assets/img/teamlogo.png" alt="logo">
						</a> <a href="index.html" class="logo-stickky"> <img
							src="assets/img/teamlogo.png" alt="logo">
						</a>
					</div>

					<ul class="user-login">
						<li><a href="#" class="off-opener"> <i class="fa fa-bars"
								aria-hidden="true"></i>
						</a></li>
						<li><a href="#"><i class="fa fa-user-o"
								aria-hidden="true"></i> </a></li>

						<li class="cart-count"><a href="#"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i> <span
								class="badge">3</span>
						</a>

							<ul class="custom-content cart-overview">
								<li class="cart-item clearfix"><a
									href="single-product.html" class="product-thumbnail"> <img
										src="media/product/9.jpg" alt="">
								</a>
									<div class="product-details">
										<a href="single-product.html" class="product-title">Drums
											&amp; Percussion</a> <span class="product-quantity">1 x</span> <span
											class="product-price"> <span class="currency">$</span>
											300
										</span> <a href="#" class="product-remove tim-cross-out"></a>
									</div></li>
								<li class="cart-item clearfix"><a
									href="single-product.html" class="product-thumbnail"> <img
										src="media/product/10.jpg" alt="">
								</a>
									<div class="product-details">
										<a href="single-product.html" class="product-title">Rocking
											Guitar</a> <span class="product-quantity">2 x</span> <span
											class="product-price"> <span class="currency">$</span>
											250
										</span> <a href="#" class="product-remove tim-cross-out"> </a>
									</div></li>
								<li class="cart-item clearfix"><a
									href="single-product.html" class="product-thumbnail"> <img
										src="media/product/11.jpg" alt="">
								</a>
									<div class="product-details">
										<a href="single-product.html" class="product-title">Exclusive
											Headphones</a> <span class="product-quantity">3 x</span> <span
											class="product-price"> <span class="currency">$</span>
											550
										</span> <a href="#" class="product-remove tim-cross-out"></a>
									</div></li>
								<li class="cart-subtotal">Sub Total <span class="amount">
										<span class="currency">$</span> 1100.00
								</span>
								</li>
								<li class="cart-actions"><a href="cart.html"
									class="view-cart">View Cart</a> <a href="checkout.html"
									class="checkout button pill small"> <span
										class="icon-check"></span> Checkout
								</a></li>
							</ul></li>
						<li><a href="javascript:void(0)" class="search-trigger"><i
								class="fa fa-search" aria-hidden="true"></i></a>
							<div class="search-input-wrapper">
								<input class="search-input" placeholder="Search" type="text">
							</div></li>
					</ul>

					<div class="nav">
						<ul class="group" id="header-menu-magic-line">

							<li class="menu-item-has-children current_page_item"><a
								href="index.html">HOME</a></li>
							<li class="menu-item-has-children"><a href="#about">Introduce</a></li>
							<li class="menu-item-has-children"><a
								href="mainprojects.html">Projects</a>
								<ul class="sub-menu">
									<li><a href="mainprojects.html">Main Projects</a></li>
									<li><a href="SubProjects.jsp">Sub Projects</a></li>
								</ul></li>

							<li class="menu-item-has-ch	ildren"><a href="MyPage.jsp">My
									Page</a></li>
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

	<!-- 밑 두줄 필요(없으면 꺠지는 부분이 있음) -->
	<header id="mobile-nav-wrap"> </header>