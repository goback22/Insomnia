<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
	width: 100%;
	background-color: #171717;
}

#site {
	width: 100%;
}

/* ë°°ë */
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
<!-- 로그인 처리 CSS -->
<link href="<c:url value='/vendor/css/LoginCSS.css'/>" rel="stylesheet" />
</head>

<body style="background-color: black;">

	<div id="site">

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
								<a href="<c:url value='/home.ins'/>" class="logo-main"> <img
									src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
								</a> <a href="<c:url value='/home.ins'/>" class="logo-stickky">
									<img src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
								</a>
							</div>

							<ul class="user-login">
								<li><a href="<c:url value='/#'/>" class="off-opener"> <i
										class="fa fa-bars" aria-hidden="true"></i>
								</a></li>
							</ul>

							<!-- 로그인 아이콘 -->
							<div class="nav">
								<ul class="group" id="header-menu-magic-line">

									<li class="menu-item-has-children current_page_item"><a
										href="<c:url value='/#'/>">HOME</a></li>


									<li class="menu-item-has-children"><<a
										href="<c:url value='/main/mainproject.ins'/>">Funding</a>
									</li>

									<li class="menu-item-has-children"><a
										href="<c:url value='/sub1/subprojects.ins'/>">Sub Projects</a>
									</li>

									<%
										if ("admin".equals(session.getAttribute("id")) || "ADMIN".equals(session.getAttribute("id"))) {
									%>
									<li class="menu-item-has-children"><a
										href="<c:url value='/admin/index.ins'/>">Admin Page</a></li>
									<li class="menu-item-has-children"><a
										href="<c:url value ='/Pay/PayPage.ins'/>">PayPage(Test)</a></li>
									<%
										} else {
									%>
									<li class="menu-item-has-children"><a
										href="<c:url value='/menu/mypage.ins'/>">My Page</a></li>
									<%
										}
									%>
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


			<!-- 여기부터 -->
			<p id="isError" style="display:none;">${errorMessage}</p>
			<!-- 로그인/회원정보 페이지 시작 -->
			<c:if test="${empty sessionScope.id}" var="result">
				<!-- 비로그인 시 보여줄 화면 시작-->
				<div class="offset-menu-two">
					<a href="<c:url value='/#'/>" class="offset-closer"><img
						src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>
					<div class="div-form-login">
						<h2 class="text-title">로그인</h2>
						<form name="form-login" id="form-login" class="form-login"
							action="<c:url value='/login.ins'/>" method="POST">
							<div class="field">
								<div class="input-login">
									<input type="text" id="id" name="id" class="input-text"
										placeholder="이메일 아이디">
									<!-- 타입 email 에서 text로 -->
								</div>
<!-- 								<p id="emailError" class="error-text">이메일 형식이 올바르지 않습니다.</p> -->
							</div>
							<div class="field">
								<div class="input-login">
									<input type="password" id="password" name="password"
										class="input-text" maxlength="17"
										placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자)">
								</div>
								<p id="loginError" class="error-text">Insomnia에 등록되지 않은 아이디거나,</br>
									비밀번호가 회원정보와 일치하지 않습니다.</p>
							</div>

							<div class="login-action">
								<label id="saveIdLabel" class="save"> <input
									id="saveUserId" type="checkbox" name="saveUserId"
									title="아이디 저장" class="chkbox" value="saveUserId"> <span
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
							<button type="button" id="facebookLoginBtn" class="facebook">
								<img class="icon"
									src="<c:url value='/resource/img/f-ogo_RGB_HEX-58.png'/>" /> <i
									class="facebook"></i>페이스북으로 로그인
							</button>
							<button type="button" id="custom-login-btn"
								onclick="javascript:loginWithKakao()">
								<img class="icon"
									src="<c:url value='/resource/img/kakaolink_btn_medium.png'/>" />
								<i class="kakao"></i>카카오
							</button>
							<!-- naverLoginBtn -->
							<div id="naver_id_login" style="width: 201px; height: 48px;">
								<!-- <button type="button"> -->
								<%-- <img class="icon"
								src="<c:url value='/resource/img/naver_login_icon.png'/>" /> <i
								class="naver"></i>네이버 --%>
								<!-- </button> -->
							</div>
							<button type="button" id="googleLoginBtn">
								<img class="icon"
									src="<c:url value='/resource/img/icons8-google-48.png'/>" /> <i
									class="google color"></i>구글
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
									href="<c:url value='/register/term.ins'/>" data-return-url="">회원가입</a>
							</p>
						</div>

						<img src="<c:url value='/resource/img/cat-eyes.jpg'/>"
							class="cat_eye" />
					</div>

					<div class="offset-social-two">
						<a href=""> <img
							src="<c:url value='/resource/img/logo_5.png'/>" alt="">
						</a>
					</div>

				</div>


				<!-- 비 로그인시 보여줄 화면 끝-->
			</c:if>
			<c:if test="${not result}">

				<!-- 로그인 시 보여줄 화면 시작 -->
				<div class="offset-menu-two">
					<div class="afterLogin" style="margin-top: -370px">
						<a href="<c:url value='/#'/>" class="offset-closer"> <img
							style="margin-left: 270px; margin-top: -60px"
							src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>

						<div id="naver_id_login" style="display: none;"></div>
						
						<%-- <!-- 새로 만든 개인정보 화면 -->
						<img id="userImg" src="${record.profile_img}">
						<div id="userName">${record.name}</div>
						<div id="birthPromotion">${record.birthDay}</div> --%>
						


						<%-- <a href="<c:url value='/menu/mypage.ins'/>"
							style="display: block;">마이페이지 이동</a> <a
							href="<c:url value='/menu/mypage/edit.ins'/>"
							style="display: block;">개인정보 수정</a> <a
							href="<c:url value='/logout.ins'/>" style="display: block;">로그아웃</a>

						<img src="<c:url value='/resource/img/cat-eyes.jpg'/>"
							class="cat_eye" />
						<div class="offset-social-two">
							<a href=""> <img
								src="<c:url value='/resource/img/logo_5.png'/>" alt=""></a>
						</div> --%>
						
						
						<!-- 여기부터 -->
				<div class="wz-popover-user user-private">
	            <div class="user-profile">
              		<!-- <a href="javascript:void(0)"> 이름 -->
                		<!-- <div class="user-picture" role="img"></div> -->
                		<img class="user-picture" src="<c:url value='/upload/${record.profile_img}'/>"/>
              		<!-- </a> -->
              <p><a href="<c:url value='/menu/mypage.ins'/>" class="user-link">${record.name}</a></p>
              <dl class="user-benefit">
                <dt>쿠폰</dt>
                <dd><a href="/web/wmypage/mybenefit/coupon/my"><span id="header-user-coupon">0</span>장</a></dd>
                <dt>포인트</dt>
                <dd><a href="/web/wmypage/mybenefit/pointlist"><span id="header-user-point">0</span>P</a></dd>
              </dl>
            </div>
            <ul class="user-menu">
              <li>
                  <a id="btn-myequity" class="icon-my-equity" href="javascript:void(0)" data-is-valid-email="true">
                    	나의 투자
                  </a>
              </li>
              <li><a href="javascript:void(0)" class="icon-my-reward">나의 리워드</a></li>
              <li><a href="javascript:void(0)" class="icon-group-o">팔로잉</a></li>
              <li><a href="javascript:void(0)" class="icon-favorite-o">좋아한</a></li>
              <!-- <li class="menu-event-reward"><a href="javascript:void(0)" class="icon-gift-o">친구 초대하기</a></li> -->
            </ul>
            <!-- display:none 시작 -->
            <ul id="header-user-myproject" class="maker-menu" style="display: none">
              <li><a href="javascript:void(0)" class="icon-archive-o">만든 프로젝트 <span style="display: none"></span></a></li>
            </ul>
            <!-- display:none 끝 -->
            <ul class="unb">
              <li>
                <a id="header-user-message" class="icon-chat-o" href="javascript:void(0)">
                  		메시지<span class="wz primary empty badge"></span>
                </a>
              </li>
              <li><a class="icon-gift-o" href="javascript:void(0)">친구 초대하기</a></li>
              <li><a class="icon-setting-o" href="javascript:void(0)">설정</a></li>
              <li><a class="icon-app-out" href="<c:url value='/logout.ins'/>">로그아웃</a></li>
            </ul>
            
          </div>
						
			<!-- 여기까지 -->
			<a href="<c:url value='/logout.ins'/>">로그아웃</a>
						
						
						
						
					</div>
				</div>
				<!-- 로그인 시 보여줄 화면 끝 -->
			</c:if>
			<!-- 로그인/회원정보 페이지 끝 -->
			<!-- 소셜 로그인 : 히든 폼 시작 -->


			<form id="socialForm" action="<c:url value='/login/social.ins'/>"
				method="POST" style="display: none;">
				<input type="hidden" name="socialId" id="socialId" value="" /> <input
					type="hidden" name="socialEmail" id="socialEmail" value="" /> <input
					type="hidden" name="socialName" id="socialName" value="" /> <input
					type="hidden" name="socialProfile" id="socialProfile" value="" />
				<input type="hidden" name="socialBirth" id="socialBirth" value="" />
			</form>

			<!-- 소셜 로그인 : 히든 폼 끝 -->



			<!-- 여기까지 -->



			<!--=============================-->
			<!--=        Mobile Nav         =-->
			<!--=============================-->


		</div>
		<!-- 네비게이션 바 끝 -->
		<!-- 밑 두줄 필요(없으면 꺠지는 부분이 있음) -->
		<header id="mobile-nav-wrap"> </header>

		<script>
			$(function() {
				$('#btnLogin').click(function() {
					if (!verifyEmail($('#id').val())) {
						$('#emailError').css('display', 'block');
					} else {
						$('#emailError').css('display', 'none');
					}

					//이메일 에러만 프론트 단에서 자바스크립트로 처리하고, 전체 로그인 에러(비밀번호 에러는 따로 표기하지 않는다.)는 컨트롤러에서 모델에 저장한 후 el로 표시하자?

				});

			})

			function verifyEmail(value) {
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

				if (value.match(regExp) != null
						|| value.toUpperCase() == 'ADMIN') //null처리는? &&앞에?
					return true;
				else
					return false;
			};
		</script>

		<!-- 페이스북 로그인 시작 -->
		<script>
			////////페이스북 로그인. 내 파일에서는 정상 실행되는데??

			window.fbAsyncInit = function() {
				FB.init({
					appId : '1073792512792998',
					cookie : true, // enable cookies to allow the server to access 
					// the session
					xfbml : true, // parse social plugins on this page
					version : 'v3.2' // The Graph API version to use for the call
				});
			};

			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id))
					return;
				js = d.createElement(s);
				js.id = id;
				js.src = "https://connect.facebook.net/ko_KR/sdk.js";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));

			$(function() {

				$('#facebookLoginBtn')
						.click(
								function() {

									FB
											.login(function(response) {
												if (response.status === 'connected') {

													//확인용 alert()
													alert('소셜 로그인에 성공했습니다.');

													///이 부분에서 최초 로그인의 경우, 회원가입으로 진행, 

													/////사용자 정보를 갖고 온다.
													FB
															.api(
																	'/me',
																	{
																		locale : 'ko_KR'
																	},
																	{
																		fields : 'id, name,email,birthday,picture'
																	},
																	function(
																			response) {
																		if (response
																				&& !response.error) {

																			console
																					.log("받은 json 객체"
																							+ JSON
																									.stringify(response));
																			$(
																					'#socialId')
																					.prop(
																							'value',
																							response.id);
																			$(
																					'#socialName')
																					.prop(
																							'value',
																							response.name);
																			$(
																					'#socialEmail')
																					.prop(
																							'value',
																							response.email);
																			$(
																					'#socialBirth')
																					.prop(
																							'value',
																							response.birthday);
																			$(
																					'#socialProfile')
																					.prop(
																							'value',
																							response.picture.data.url);

																			$(
																					'#socialForm')
																					.submit();

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
		<!-- 페이스북 로그인 끝 -->

		<!-- 네이버 로그인 시작 -->
		<script type="text/javascript"
			src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
			charset="utf-8"></script>
		<script>
			var naver_id_login = new naver_id_login("baw69zHb2FPVPqvEd5sl",
					"https://localhost:8080/insomnia/");
			var state = naver_id_login.getUniqState();
			naver_id_login.setButton("white", 2, 40);
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
		<!-- 네이버 로그인 끝 -->
		<!-- 아이디 저장 시작(쿠키) -->
		<script>
			$(function() {

				//최초 페이지 로드시, 저장된 쿠키 값 가져오기, 없으면 null
				var userInputId = getCookie("userInputId");

				//위에서 얻은 JS변수를 ID태그의 값으로 넣어준다. 값이 없으면 null이므로 아무 것도 들어가지 않는다.
				$('#id').val(userInputId);

				//새로 페이지 로드시, 쿠키값이 존재해서 ID태그에 값이 들어 있다면, 체크 박스 선택. 없으면 if문으로 들어가지 않으니,  
				if ($('#id').val() != "") {
					$('#saveUserId').prop('checked', true);
				}

				//위는 처음 로드시에 있을 때고, 지금부터는 이 페이지에서 새로 클릭하거나 클릭해제 했을 때
				$('#saveUserId').change(function() {
					//체크시
					if ($('#saveUserId').is(':checked')) {
						var userInputId = $('#id').val(); //ID태그의 값을 변수로 저장
						setCookie("userInputId", userInputId, 7); //일주일 동안 쿠키 보관

					} else { //해제시
						deleteCookie("userInputId");
					}
				})

				//id를 저장하기 체크된 상태에서 아이디를 또 입력하는 경우도. (새로?, 기존?)
				$('#id').keyup(function() {
					if ($('#saveUserId').is(':checked')) {
						var userInputId = $('#id').val();
						setCookie("userInputId", userInputId, 7);
					}
				})

			})

			//메서드 목록
			function setCookie(cookieName, value, exdays) {
				var exdate = new Date();
				exdate.setDate(exdate.getDate + exdays);

				var cookieValue = escape(value)
						+ ((exdays == null) ? "" : "; expires="
								+ exdate.toGMTString());
				document.cookie = cookieName + "=" + cookieValue;
			}

			function deleteCookie(cookieName) {
				var expireDate = new Date();
				expireDate.setDate(expireDate.getDate - 1);
				document.cookie = cookieName + "=" + "; expires="
						+ expireDate.toGMTString();
			}

			function getCookie(cookieName) {
				cookieName = cookieName + "=";
				var cookieData = document.cookie;
				var start = cookieData.indexOf(cookieName);
				var cookieValue = "";
				if (start != -1) {
					start += cookieName.length;
					var end = cookieData.indexOf(';', start);
					if (end == -1)
						end = cookieData.length;
					cookieValue = cookieData.substring(start, end);
				}
				return unescape(cookieValue);
			}
		</script>

		<!-- 아이디 저장 끝(쿠키) -->
		
		<!-- 아이디 유효성 -->
		
		<script>
		
			$(function(){
				
				if($('#isError').html() != "") {
					alert('아이디 혹은 비밀번호가 올바르지 않습니다.');
					$('#loginError').css('display', 'block');
				}
				
				
			})
		
		
		</script>
		
		
		

		<!-- í¸ -->
		<div class="banner">
			<div class="banner-video">
				<video class="queen" loop autoplay muted
					src="resource/video/queen.mp4"></video>
			</div>
			<div class="banner-title">I N S O M N I A</div>

		</div>
		<!-- ê²ì-->
		<div class="search"></div>
		<!-- HOT Track-->
		<div class="hottrack">

			<!--==============================-->
			<!--=        	Artist lineup         =-->
			<!--==============================-->
			<section class="section-padding-two artist-lineup">
				<div class="tim-container clearfix">
					<div class="row">
						<div class="section-title style-four">
							<h2 id="about">HOT Track</h2>
							<p style="font-size: 1.4em; color: #6c757d;">ë¨ê±°ì´
								ë°´ëë¤, ë¨ê±°ì´ ììë¤</p>
						</div>
					</div>
					<div class="swiper-container row"
						data-swiper-config='{ "loop": true, "prevButton":".swiper-button-prev", "nextButton": ".swiper-button-next", "speed": 700, "autoplay": "5000", "slidesPerView": 6, "spaceBetween": 0, "grabCursor": true,"breakpoints": { "1300": { "slidesPerView": 4 }, "767": { "slidesPerView": 3 }, "500": { "slidesPerView": 1 }}}'>
						<ul class="artist-line-wrapper swiper-wrapper">
							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a1.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>

							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a2.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>

							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a3.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>

							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a4.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>
							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a1.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>

							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a2.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>

							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a3.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>

							<li class="artist-single clearfix swiper-slide"><img
								src="media/artist/a4.jpg" alt="">
								<div class="artist-single-content">
									<ul>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-facebook" aria-hidden="true"></i></a></li>
										<li><a href="<c:url value='/#'/>"><i
												class="fa fa-twitter" aria-hidden="true"></i></a></li>
									</ul>
									<h6>James Hetfield</h6>
									<p>Band: Metallica</p>
								</div></li>
						</ul>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<!-- /.tim-container -->
			</section>
			<!-- /#about -->

		</div>
		<!-- hot track ë -->

	</div>