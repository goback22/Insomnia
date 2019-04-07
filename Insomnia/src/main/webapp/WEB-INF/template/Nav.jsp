<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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