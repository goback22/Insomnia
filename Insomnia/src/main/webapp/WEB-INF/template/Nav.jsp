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

									<li class="menu-item-has-children"><a href="">Introduce</a>
									</li>

									<li class="menu-item-has-children"><a
										href="<c:url value='/#'/>">Projects</a>
										<ul class="sub-menu">
											<li><a href="<c:url value='/main/mainproject.ins'/>">Main Projects</a></li>
											<li><a href="<c:url value='/sub1/subprojects.ins'/>">Sub Projects</a></li>
										</ul></li>
										<% if("admin".equals(session.getAttribute("id")) || "ADMIN".equals(session.getAttribute("id"))){   %>
									<li class="menu-item-has-children"><a href="<c:url value='/admin/index.ins'/>">Admin Page</a></li>
									<li class="menu-item-has-children"><a href="<c:url value ='/Pay/PayPage.ins'/>">PayPage(Test)</a></li>
									<% } else{%> 
									<li class="menu-item-has-children"><a href="<c:url value='/menu/mypage.ins'/>">My Page</a></li>
									<%} %>
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
			<c:if test="${empty sessionScope.id}" var="result">
			<!-- 비로그인 시 보여줄 화면 시작-->
				<div class="offset-menu-two">
					<a href="<c:url value='/#'/>" class="offset-closer"><img
						src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>
					<div class="div-form-login">
						<h2 class="text-title">로그인</h2>
						<form name="form-login" id="form-login" class="form-login" action="<c:url value='/login.ins'/>" >
							<div class="field">
								<div class="input-login">
									<input type="text" id="id" name="id"
										class="input-text" placeholder="이메일 아이디">  <!-- 타입 email 에서 text로 -->
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
							<button type="submit" id="btnLogin" class="button-login">로그인</button>
						</form>
						<div class="separator">
							<span class="text">또는</span>
						</div>
						<div class="social-login">
							<button type="button" id="facebookLoginBtn" class="facebook"
								>
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
							<!-- naverLoginBtn -->
							<button type="button" id="naver_id_login">
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
						<div class="afterLogin" style="margin-top: -370px">
							<a href="<c:url value='/#'/>" class="offset-closer">

							<img style="margin-left: 270px;margin-top: -60px" src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>
				

							<!-- 일반 로그인 시 보여줄 화면-->
							<c:if test="${empty socialName}" var="socialResult">
								<p style="font-weight: bold;font-size: 1.1em;color:white;">${id}님  안녕하세요!</p>
							</c:if>
							<!-- 일반 로그인 시 보여줄 화면 끝-->
							
							<!-- 소셜 로그인 시 보여줄 화면 시작 -->
							<c:if test="${not result}">
								<프로필 사진>
								<img src="${socialProfile}"/>
								<p style="font-weight: bold;font-size: 1.1em;color:orange;">${socialName}님  안녕하세요!</p>
								<p style="font-weight: bold;font-size: 1.1em;color:orange;">${socialEmail}</br>로 이메일 인증을 진행하세요!</p>
								<p style="font-weight: bold;font-size: 1.1em;color:white;">
									회원님의 생일이 </br>
									<i style="color: orange; font-size: 30px;">${socialBirth}</i>인가요?</br>
									회원님의 생일에 특별한 혜택을 누려보세요.
								</p>
							</c:if>
							<!-- 소셜 로그인 시 보여줄 화면 끝 -->


							<a href="<c:url value='/menu/mypage.ins'/>" style="display: block;">마이페이지 이동</a>
							<a href="<c:url value='/menu/mypage/edit.ins'/>" style="display: block;">개인정보 수정</a>





				
			

							<a href="<c:url value='/logout.ins'/>" style="display: block;">로그아웃</a>

							<img src="<c:url value='/resource/img/cat-eyes.jpg'/>" class="cat_eye" />
							<div class="offset-social-two">
								<a href=""> <img src="<c:url value='/resource/img/logo_5.png'/>" alt=""></a>
							</div>
						</div>
					</div>
				<!-- 로그인 시 보여줄 화면 끝 -->
				</c:if>
				<!-- 로그인/회원정보 페이지 끝 -->
				<!-- 소셜 로그인 : 히든 폼 시작 -->

				
				<form id="socialForm" action="<c:url value='/login/social.ins'/>" method="POST" style="display: none;">
					<input type="hidden" name="socialEmail" id="socialEmail" value=""/>
					<input type="hidden" name="socialName" id="socialName" value=""/>	
					<input type="hidden" name="socialProfile" id="socialProfile" value=""/>
					<input type="hidden" name="socialBirth" id="socialBirth" value=""/>
				</form>
				
				<!-- 소셜 로그인 : 히든 폼 끝 -->				

				
			
			<!--=============================-->
			<!--=        Mobile Nav         =-->
			<!--=============================-->


		</div>
		<!-- 네비게이션 바 끝 -->
	<!-- 밑 두줄 필요(없으면 꺠지는 부분이 있음) -->
	<header id="mobile-nav-wrap"> </header>
	
	<script>
	
	$(function(){
		$('#btnLogin').click(function(){
				if(!verifyEmail($('#id').val())) {
					$('#emailError').css('display', 'block');		
				} else {
					$('#emailError').css('display', 'none');
				}
			
			//이메일 에러만 프론트 단에서 자바스크립트로 처리하고, 전체 로그인 에러(비밀번호 에러는 따로 표기하지 않는다.)는 컨트롤러에서 모델에 저장한 후 el로 표시하자?
			
		});
		
		
	})
	
	function verifyEmail(value) {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		
		if(value.match(regExp) != null || value.toUpperCase == 'ADMIN')  //null처리는? &&앞에?
			return true;
		else 
			return false;
	};
	
	
	
	
	
	</script>
	
	
	<script>
	
	////////페이스북 로그인. 내 파일에서는 정상 실행되는데??
	
	 window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '1073792512792998',
		      cookie     : true,  // enable cookies to allow the server to access 
		                          // the session
		      xfbml      : true,  // parse social plugins on this page
		      version    : 'v3.2' // The Graph API version to use for the call
		    });
	 };
	 
	 (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "https://connect.facebook.net/ko_KR/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk'));
		    
	
	$(function(){
		
		$('#facebookLoginBtn').click(function(){
			
			FB.login(function(response) {
				  if (response.status === 'connected') {
					  
					  //확인용 alert()
					  alert('소셜 로그인에 성공했습니다.');
				  
				      /////사용자 정보를 갖고 온다.
					   FB.api('/me', {locale : 'ko_KR'}, {fields: 'name,email,birthday,picture'}, function(response) {
					      if(response && !response.error) {
					    	  
					      	  console.log("받은 json 객체" + JSON.stringify(response));
					    	  $('#socialName').prop('value', response.name);
					    	  $('#socialEmail').prop('value', response.email);
					    	  $('#socialBirth').prop('value', response.birthday);
					    	  $('#socialProfile').prop('value', response.picture.data.url);
					    	  
					    	  $('#socialForm').submit();
					    	  
					    	 				    	 
					      }//if블럭
	      			   });//함수의 인자인 함수(1급객체)
	      			   
					  
				  } else {
					  
					  alert('로그인에 실패했습니다.');
				    
				  }
				});
			
		});
		
	})
	
	////현재 문제점 : 페이지 이동 후 돌아오면, 세션 영역에 저장된 이름은 화면에 표시되지만, 동적으로 받아오는 생일, 이메일, 사진은 표시되지 않는다. 한 번 회원가입 후에는 
	//관련 정보를 DB에 저장해 둔 뒤, 추후 다시 로그인 하면, 그 때 정보를 업데이트 하는 식으로 수정해야 할 듯 하다.
	
	</script>
	
<!-- 네이버로그인 -->
<%--    

   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> 
   <script>
   
   
       var naver_id_login = new naver_id_login("baw69zHb2FPVPqvEd5sl", "https://localhost:8080/insomnia/");
         var state = naver_id_login.getUniqState();
         naver_id_login.setButton("white", 2,40);
         naver_id_login.setDomain("https://localhost:8080/insomnia/");
         naver_id_login.setState(state);
         naver_id_login.setPopup();
         naver_id_login.init_naver_id_login();
   
   </script>
   
   <script>
       // 접근 토큰 값 출력
     /* alert(naver_id_login.oauthParams.access_token); */
       
      // 네이버 사용자 프로필 조회
     naver_id_login.get_naver_userprofile("naverSignInCallback()");
      
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
     function naverSignInCallback() {
       alert(naver_id_login.getProfileData('email'));
       alert(naver_id_login.getProfileData('nickname'));
       alert(naver_id_login.getProfileData('age'));
     }
   
   
   </script>
   --%>
   
   
   
   
   
	
	
	
	