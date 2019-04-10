<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 네비게이션 바 -->
		<div class="nav">

			<!--=========================-->
			<!--=        Navbar         =-->
			<!--=========================-->
			<header class="header header-magic-line">
				<div class="header-inner">
					<div class="tim-container clearfix">
						<div class="header-magic-line-inner clearfix">
							<div id="site-logo" class="float-left">
								<a href="index.html" class="logo-main"> <img
									src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
								</a> <a href="index.html" class="logo-stickky"> <img
									src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
								</a>
							</div>

							<ul class="user-login">
								<li><a href="<c:url value='/#'/>" class="off-opener"> <i
										class="fa fa-bars" aria-hidden="true"></i>
								</a></li>


								<li class="cart-count"><a href="<c:url value='/#'/>"> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i> <span
										class="badge">3</span>
								</a>

									<ul class="custom-content cart-overview">
										<li class="cart-item clearfix"><a
											href="single-product.html" class="product-thumbnail"> <img
												src="<c:url value='/media/product/9.jpg'/>" alt="">
										</a>
											<div class="product-details">
												<a href="single-product.html" class="product-title">Drums
													&amp; Percussion</a> <span class="product-quantity">1 x</span>
												<span class="product-price"> <span class="currency">$</span>
													300
												</span> <a href="<c:url value='/#'/>" class="product-remove tim-cross-out"></a>
											</div></li>
										<li class="cart-item clearfix"><a
											href="single-product.html" class="product-thumbnail"> <img
												src="<c:url value='/media/product/10.jpg'/>" alt="">
										</a>
											<div class="product-details">
												<a href="single-product.html" class="product-title">Rocking
													Guitar</a> <span class="product-quantity">2 x</span> <span
													class="product-price"> <span class="currency">$</span>
													250
												</span> <a href="<c:url value='/#'/>" class="product-remove tim-cross-out"> </a>
											</div></li>
										<li class="cart-item clearfix"><a
											href="single-product.html" class="product-thumbnail"> <img
												src="<c:url value='/media/product/11.jpg'/>" alt="">
										</a>
											<div class="product-details">
												<a href="single-product.html" class="product-title">Exclusive
													Headphones</a> <span class="product-quantity">3 x</span> <span
													class="product-price"> <span class="currency">$</span>
													550
												</span> <a href="<c:url value='/#'/>" class="product-remove tim-cross-out"></a>
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
										href="<c:url value='/#'/>">HOME</a></li>

									<li class="menu-item-has-children"><a href="#about">Introduce</a>
									</li>

									<li class="menu-item-has-children"><a
										href="<c:url value='/#'/>">Projects</a>
										<ul class="sub-menu">
											<li><a href="<c:url value='/main/mainproject.ins'/>">Main Projects</a></li>
											<li><a href="SubProjects.jsp">Sub Projects</a></li>
										</ul></li>

									<li class="menu-item-has-children"><a href="<c:url value='/menu/mypage.ins'/>">My Page</a></li>
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
			
			<!-- 로그인/회원정보 페이지 시작 -->
			<c:if test="${empty sessionScope.user_id}" var="result">
			<!-- 비로그인 시 보여줄 화면 시작-->
				<div class="offset-menu-two">
					<a href="<c:url value='/#'/>" class="offset-closer"><img
						src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>
					<div class="div-form-login">
						<h2 class="text-title">로그인</h2>
						<form name="form-login" id="form-login" class="form-login">
							<div class="field">
								<div class="input-login">
									<input type="email" id="userName" name="userName"
										class="input-text" placeholder="이메일 아이디">
								</div>
								<p id="emailError" class="error-text">이메일 형식이 올바르지 않습니다.</p>
							</div>
							<div class="field">
								<div class="input-login">
									<input type="password" id="password" name="password"
										class="input-text" maxlength="17"
										placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자)">
								</div>
								<p id="loginError" class="error-text">와디즈에 등록되지 않은 아이디거나, 아이디
									또는 비밀번호가 회원정보와 일치하지 않습니다.</p>
							</div>
							<!-- 
						<div class="recaptcha">
							<p id="recaptchaMessage" class="error-text">
								잘못된 아이디 또는 비밀번호로 여러번 로그인 시도하였습니다. <br>계정 보안 조치를 위해 아래 사항을 체크하신
								뒤 다시 진행하세요.
							</p>
							<p id="recaptchaComplete" class="complete-text">
								<span>계정 보안 조치가 완료되었습니다!</span>협조해주셔서 감사합니다. 로그인을 다시 시도하세요
							</p>
							<div class="g-recaptcha"
								data-sitekey="6Lcr70MUAAAAAHfmxpaHaXPDlgLIwiS6gRO5YCcB"
								data-size="600" id="recaptcha" data-callback="recaptchaComplete"
								style="display: none;">
								<div style="width: 304px; height: 78px;">
									<div>
										<iframe
											src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6Lcr70MUAAAAAHfmxpaHaXPDlgLIwiS6gRO5YCcB&amp;co=aHR0cHM6Ly93d3cud2FkaXoua3I6NDQz&amp;hl=ko&amp;v=v1552285980763&amp;size=normal&amp;cb=p8g2z520abgp"
											width="304" height="78" role="presentation"
											name="a-dh950kauq7sc" frameborder="0" scrolling="no"
											sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe>
									</div>
									<textarea id="g-recaptcha-response" name="g-recaptcha-response"
										class="g-recaptcha-response"
										style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
								</div>
							</div>
						</div> -->
							<div class="login-action">
								<label id="saveIdLabel" class="save"> <input
									id="saveUserId" type="checkbox" title="아이디 저장" class="chkbox"> <span
									id="txtSaveId" class="wz text caption2">아이디 저장</span>
								</label>
								<p class="forgot">
									<a class="wz text forgot_a" href="<c:url value='' />">아이디∙비밀번호
										찾기<i class="icon chevron-right"></i>
									</a>
								</p>
							</div>
							<button type="button" id="btnLogin" class="button-login">로그인</button>
						</form>
						<div class="separator">
							<span class="text">또는</span>
						</div>
						<div class="social-login">
							<button type="button" id="facebookLoginBtn" class="facebook"
								onclick="FB.login();">
								<img class="icon"
									src="<c:url value='/resource/img/f-ogo_RGB_HEX-58.png'/>" />
								<i class="facebook"></i>페이스북으로 로그인
							</button>
							<button type="button" id="custom-login-btn"
								onclick="javascript:loginWithKakao()">
								<img class="icon"
									src="<c:url value='/resource/img/kakaolink_btn_medium.png'/>" />
								<i class="kakao"></i>카카오
							</button>
							<!-- <a id="custom-login-btn" href="javascript:loginWithKakao()">
								<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
								</a> -->
	
	
							<button type="button" id="naverLoginBtn">
								<img class="icon"
									src="<c:url value='/resource/img/naver_login_icon.png'/>" />
								<i class="naver"></i>네이버
							</button>
							<button type="button" id="googleLoginBtn">
								<img class="icon"
									src="<c:url value='/resource/img/icons8-google-48.png'/>" />
								<i class="google color"></i>구글
							</button>
							<button type="button" onclick="pageLoginByTwitter()">
								<img class="icon"
									src="<c:url value='/resource/img/Twitter_Logo_WhiteOnBlue.png'/>" />
								<i class="twitter"></i>트위터
							</button>
						</div>
						<div class="bottom-message">
							<p class="text">
								아직 계정이 없나요?&nbsp;&nbsp;<a
									href="<c:url value='/register/term.ins'/>"
									data-return-url="">회원가입</a>
							</p>
						</div>
	
						<img src="<c:url value='/resource/img/cat-eyes.jpg'/>"
							class="cat_eye" />
					</div>
					
					<div class="offset-social-two">
						<a href=""> <img src="<c:url value='/resource/img/logo_5.png'/>" alt="">
						</a>
					</div>
					
				</div>
				
				<!-- 비 로그인시 보여줄 화면 끝-->
				</c:if>
				<c:if test="${not result}">
				<!-- 로그인 시 보여줄 화면 시작 -->
					<div class="offset-menu-two">
					
						<div class="afterLogin">
						
							<a href="<c:url value='/#'/>" class="offset-closer">
								<img src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>
								
							<p>${record.name}님! 안녕하세요!</p>
							
							<a href="<c:url value='/menu/mypage.ins'/>" style="display: block;">마이페이지 이동</a>
							<a href="<c:url value='/menu/mypage/edit.ins'/>" style="display: block;">개인정보 수정</a>
							
							<!-- position absoulute 없애자 -->
							
			
							<img src="<c:url value='/resource/img/cat-eyes.jpg'/>" class="cat_eye" />
							
							<div class="offset-social-two">
								<a href=""> <img src="<c:url value='/resource/img/logo_5.png'/>" alt=""></a>
							</div>
							
						</div>
					
					</div>
					
				
				<!-- 로그인 시 보여줄 화면 끝 -->
				</c:if>
				<!-- 로그인/회원정보 페이지 시작 -->
				
				
			

			<!--=============================-->
			<!--=        Mobile Nav         =-->
			<!--=============================-->
			<header id="mobile-nav-wrap">
				<div class="mob-header-inner d-flex justify-content-between">
					<div id="mobile-logo" class="d-flex justify-content-start">
						<a href="index.html"><img src="<c:url value='/resource/img/logo.png'/>"
							alt="Site Logo"></a>
					</div>

					<ul class="user-link nav justify-content-end">
						<li><a href="<c:url value='/#'/>"><i class="fa fa-user"></i>Login</a></li>
						<li><a href="<c:url value='/#'/>"><i class="fa fa-sign-in"></i>Sign Up</a></li>
					</ul>

					<div id="nav-toggle" class="nav-toggle hidden-md">
						<div class="toggle-inner">
							<span></span> <span></span> <span></span> <span></span>
						</div>
					</div>
				</div>
				<!-- /.mob-header-inner -->
			</header>
			<!-- /#mobile-header -->

			<div class="mobile-menu-inner">

				<div class="mobile-nav-top-wrap">
					<div class="mob-header-inner clearfix">
						<div class="d-flex justify-content-start mobile-logo">
							<a href="index.html"> <img src="<c:url value='/resource/img/logo-dark.png'/>"
								alt="Site Logo">
							</a>
						</div>

						<div class="close-menu">
							<span class="bar"></span> <span class="bar"></span>
						</div>
					</div>
					<!-- /.mob-header-inner -->

					<div class="close-menu">
						<span class="bar"></span> <span class="bar"></span>
					</div>
				</div>
				<!-- /.mobile-nav-top-wrap -->

				<nav id="accordian">
					<ul class="accordion-menu">
						<li><a href="#0" class="dropdownlink">Home</a>
							<ul class="submenuItems">
								<li><a href="index.html">Home One</a></li>
								<li><a href="index-two.html">Home Two</a></li>
								<li><a href="index-three.html">Home Three</a></li>
								<li><a href="index-four.html">Home Four</a></li>
							</ul></li>
						<li><a href="#0" class="dropdownlink">Artist</a>
							<ul class="submenuItems">
								<li><a href="artist.html">Artist</a></li>
								<li><a href="artist-single.html">Artist Details</a></li>
							</ul></li>
						<li><a href="album.html">Album</a></li>
						<li><a href="#0" class="dropdownlink">Events</a>
							<ul class="submenuItems">
								<li><a href="event.html">Events</a></li>
								<li><a href="contact.html">Contact Us</a></li>
							</ul></li>
						<li><a href="tabs.html">Tabs</a></li>
						<li><a href="#0" class="dropdownlink">Blog</a>
							<ul class="submenuItems">
								<li><a href="blog-list-right.html">Blog Standard</a></li>
								<li><a href="blog-grid-right.html">Blog Grid</a></li>
								<li><a href="blog-single.html">Blog Single</a></li>
							</ul></li>

						<li><a href="gallery.html">Gallery</a></li>
						<li><a href="#0" class="dropdownlink">Shop</a>
							<ul class="submenuItems">
								<li><a href="shop-right.html">Shop Right</a></li>
								<li><a href="shop-left.html">Shop Left</a></li>
								<li><a href="shop-single.html">Shop Details</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
			<!-- /.mobile-menu-inner -->

		</div>
		<!-- 네비게이션 바 끝 -->
	<!-- 밑 두줄 필요(없으면 꺠지는 부분이 있음) -->
	<header id="mobile-nav-wrap"> </header>
	
	<script>
	
	$(function(){
		
		$('#btnLogin').click(function(){
			
			if(!verifyEmail($('#userName').val())) {
				$('#emailError').css('display', 'block');		
			} else {
				$('#emailError').css('display', 'none');
			}
			
			//이메일 에러만 프론트 단에서 자바스크립트로 처리하고, 전체 로그인 에러(비밀번호 에러는 따로 표기하지 않는다.)는 컨트롤러에서 모델에 저장한 후 el로 표시하자?
			
		});
		
		
	})
	
	function verifyEmail(value) {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(value.match(regExp) != null)
			return true;
		else 
			return false;
	}
	
	
	</script>
	
	
	