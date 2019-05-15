<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/vendor/css/bootstrap2.min.css'/>">
<script src="<c:url value='/vendor/js/jquery2.js'/>"></script>
<script src="<c:url value='/vendor/js/bootstrap2.min.js'/>"></script>

<!-- 섬머노트 css,js -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/summernote.css'/>" type="text/css">
<script src="<c:url value='/vendor/js/summernote.js'/>"></script>

<!-- 섬머노트 awesome css,js -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/summernote-ext-emoji-ajax.css'/>"
	type="text/css">
<script src="<c:url value='/vendor/js/summernote-ext-emoji-ajax.js'/>"></script>

<!-- Site Stylesheet -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/woocommerce.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/app.css'/>"
	type="text/css">
<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond"
	rel="stylesheet">
	
	

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
							class="zerojin" src="<c:url value='/resource/img/logo_5.png'/>"
							alt="logo">
						</a> <a href="<c:url value='/home.ins'/>" class="logo-stickky"> <img
							class="zerojin" src="<c:url value='/resource/img/logo_5.png'/>"
							alt="logo">
						</a>
					</div>

					<!-- 로그인 아이콘 -->
					<ul class="user-login">
						<li><a href="<c:url value='/#'/>" class="off-opener"> <i
								class="fa fa-bars" aria-hidden="true"></i>
						</a></li>
					</ul>

					<div class="nav">
						<ul class="group" id="header-menu-magic-line">

							<li class="menu-item-has-children current_page_item"><a
								href="<c:url value='/#'/>">HOME</a></li>

							<li class="menu-item-has-children"><a
								href="<c:url value='/main/mainproject.ins'/>">Funding</a></li>

							<li class="menu-item-has-children"><a
								href="<c:url value='/sub1/subprojects.ins'/>">Sub Projects</a></li>

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

	<!-- 로그인/회원정보 페이지 시작 -->
	<c:if test="${empty sessionScope.id}" var="result">
		<!-- 비로그인 시 보여줄 화면 시작-->
		<div class="offset-menu-two">
			<a href="<c:url value='/#'/>" class="offset-closer"><img
				src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>
			<div class="div-form-login">
				<h2 class="text-title">로그인</h2>
				<form name="form-login" id="form-login" class="form-login"
					action="<c:url value='/login.ins'/>">


					<div class="field">
						<div class="input-login">
							<input type="text" id="id" name="id" class="input-text"
								placeholder="이메일 아이디">
							<!-- 타입 email 에서 text로 -->
						</div>
						<!--                   <p id="emailError" class="error-text">이메일 형식이 올바르지 않습니다.</p> -->
					</div>
					<div class="field">
						<div class="input-login">
							<input type="password" id="password" name="password"
								class="input-text" maxlength="17"
								placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자)">
						</div>
						<p id="loginError" class="error-text">Insomnia에 등록되지 않은 아이디거나,
							아이디 또는 비밀번호가 회원정보와 일치하지 않습니다.</p>
					</div>

					<div class="login-action">
						<label id="saveIdLabel" class="save"> <input
							id="saveUserId" type="checkbox" title="아이디 저장" class="chkbox">
							<span id="txtSaveId" class="wz text caption2">아이디 저장</span>
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
					<div id="naver_id_login">
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
				<a href=""> <img src="<c:url value='/resource/img/logo_5.png'/>"
					alt="">
				</a>
			</div>
		</div>

		<!-- 비 로그인시 보여줄 화면 끝-->
	</c:if>
	<c:if test="${not result}">

		<script>
			var isLogined = true;
		</script>

		<!-- 로그인 시 보여줄 화면 시작 -->
		<div class="offset-menu-two">
			<div class="afterLogin" style="margin-top: -370px">
				<a href="<c:url value='/#'/>" class="offset-closer"> <img
					style="margin-left: 270px; margin-top: -60px"
					src="<c:url value='/resource/img/offset-cross2.png'/>" alt=""></a>

				<div id="naver_id_login" style="display: none;"></div>


				<!-- 일반 로그인 시 보여줄 화면-->
				<c:if test="${empty socialName}" var="socialResult">
					<p style="font-weight: bold; font-size: 1.1em; color: white;">${id}님
						안녕하세요!</p>
				</c:if>
				<!-- 일반 로그인 시 보여줄 화면 끝-->

				<!-- 소셜 로그인 시 보여줄 화면 시작 -->
				<c:if test="${not socialResult}">
					<프로필 사진> <img src="${socialProfile}" />
					<p style="font-weight: bold; font-size: 1.1em; color: orange;">${socialName}님
						안녕하세요!</p>
					<p style="font-weight: bold; font-size: 1.1em; color: orange;">${socialEmail}</br>로
						이메일 인증을 진행하세요!
					</p>
					<p style="font-weight: bold; font-size: 1.1em; color: white;">
						회원님의 생일이 </br> <i style="color: orange; font-size: 30px;">${socialBirth}</i>인가요?</br>
						회원님의 생일에 특별한 혜택을 누려보세요.
					</p>
				</c:if>
				<!-- 소셜 로그인 시 보여줄 화면 끝 -->

				<a href="<c:url value='/menu/mypage.ins'/>" style="display: block;">마이페이지
					이동</a> <a href="<c:url value='/menu/mypage/edit.ins'/>"
					style="display: block;">개인정보 수정</a> <a
					href="<c:url value='/logout.ins'/>" style="display: block;">로그아웃</a>

				<img src="<c:url value='/resource/img/cat-eyes.jpg'/>"
					class="cat_eye" />
				<div class="offset-social-two">
					<a href=""> <img
						src="<c:url value='/resource/img/logo_5.png'/>" alt=""></a>
				</div>
			</div>
		</div>
		<!-- 로그인 시 보여줄 화면 끝 -->
	</c:if>
	<!-- 로그인/회원정보 페이지 끝 -->
	<!-- 소셜 로그인 : 히든 폼 시작 -->
	<form id="socialForm" action="<c:url value='/login/social.ins'/>"
		method="POST" style="display: none;">
		<input type="hidden" name="socialEmail" id="socialEmail" value="" />
		<input type="hidden" name="socialName" id="socialName" value="" /> <input
			type="hidden" name="socialProfile" id="socialProfile" value="" /> <input
			type="hidden" name="socialBirth" id="socialBirth" value="" />
	</form>
	<!-- 소셜 로그인 : 히든 폼 끝 -->
	<!--=============================-->
	<!--=        Mobile Nav         =-->
	<!--=============================-->
</div>
<!-- 네비게이션 바 끝 -->
<header id="mobile-nav-wrap"> </header>

<style type="text/css">
body {
	color: white;
	background-color: #000000;
}


</style>
<script>
	function formCheck(frm) {
		if (frm.ap_title.value == "") {
			alert('제목을 입력해 주세요');
			frm.free_title.focus();
			return false;
		} else if (frm.ap_content.value == "") {
			alert("내용을 입력해주세요");
			frm.free_content.focus();
			return false;
		}
		return true;
	}
</script>
</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<!--===========================-->
		<!--=           body          =-->
		<!--===========================-->
		<section class="single-product"
			style="margin-left: -30px; margin-top: -17px">
			<div class="container">
				<br> <br>
				<!-- DETAILS 문구 -->
				<footer id="footer-4">
					<div class="container">
						<div class="d-flex justify-content-center row">
							<div class="col-md-12">
								<div class="section-title style-four" id="ad">
									<h2>W R I T E</h2>
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
				<div role="tabpanel" class="container">
					<div class="row">
						<div class="col-md-10" style="margin-left: -50px;">
							<form class="form-horizontal" onsubmit="return formCheck(this)"
								enctype="multipart/form-data" id="frm" name="userinput"
								method="post" action="<c:url value='/freeBoard/Free_Board_View.ins'/>"
								style="margin-left: 158px">
								<div class="form-group">
									<label for="title" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="free_title"
											id="free_title" placeholder="제목을 입력하세요" />
									</div>
								</div>
								<div class="form-group">
									<label for="content" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-5">
										<textarea rows="10" id="summernote" name="free_content" class="form-control" placeholder="내용을 입력하세요"></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 text-center" style="margin-left: 75px; margin-top: 15px">
										<input type="submit" class="btn btn-info" value="등록" /> 
										<a href="<c:url value='/freeBoard/Free_Board.ins'/>" class="btn btn-success" style="margin-left: 25px">취소</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<br> <br> <br> <br> <br>
				<!-- /.row -->
			</div>
		</section>
		
	</div>
	
	<%@ include file="/WEB-INF/template/Footer.jsp"%>
</body>
<script>
	$('#summernote')
			.summernote(
					{
						height : 300,
						width : 700,
						toolbar : [
								[ 'style', [ 'style' ] ],
								[
										'style',
										[ 'bold', 'italic', 'underline',
												'clear' ] ],
								[
										'font',
										[ 'strikethrough', 'superscript',
												'subscript' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'insert', [ 'picture', 'link', 'emoji' ] ]

						],
						placeholder : '내용을 입력해 주세요'
					});
	
	//F5키 막기
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode = 2;
			return false;
		} else if (event.ctrlKey
				&& (event.keyCode == 78 || event.keyCode == 82)) {
			return false;
		}
	}
	document.onkeydown = noEvent;
</script>
