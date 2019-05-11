<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp"%>
<head>
<link rel="stylesheet"
	href="<c:url value='/vendor/css/subcontent.css'/>">
<script src="<c:url value='/vendor/js/subcontent.js'/>"></script>

<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="Specialising in lifestyle, interiors, 360 and aerial photography and videography, Clorova work across a range of advertising, editorial, pr and corporate clients in Bali and Jakarta.">

<link rel="apple-touch-icon" sizes="57x57" href="<c:url value='/resource/img/apple-icon-57x57.png'/>">
<link rel="apple-touch-icon" sizes="60x60" href="<c:url value='/resource/img/apple-icon-60x60.png'/>">
<link rel="apple-touch-icon" sizes="72x72" href="<c:url value='/resource/img/apple-icon-72x72.png'/>">
<link rel="apple-touch-icon" sizes="76x76" href="<c:url value='/resource/img/apple-icon-76x76.png'/>">
<link rel="apple-touch-icon" sizes="114x114" href="<c:url value='/resource/img/apple-icon-114x114.png'/>">
<link rel="apple-touch-icon" sizes="120x120" href="<c:url value='/resource/img/apple-icon-120x120.png'/>">
<link rel="apple-touch-icon" sizes="144x144" href="<c:url value='/resource/img/apple-icon-144x144.png'/>">
<link rel="apple-touch-icon" sizes="152x152" href="<c:url value='/resource/img/apple-icon-152x152.png'/>">
<link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/resource/img/apple-icon-180x180.png'/>">
<link rel="icon" type="image/png" sizes="192x192" href="<c:url value='/resource/img/android-icon-192x192.png'/>">
<link rel="icon" type="image/png" sizes="32x32" href="<c:url value='favicon-32x32.png'/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value='favicon-96x96.png'/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value='favicon-16x16.png'/>">
<link rel="manifest" href="<c:url value='/resource/img/manifest.json'/>">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="<c:url value='ms-icon-144x144.png'/>">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="index.html" />
<meta property="og:locale" content="en_US" />
<meta property="og:type" content="article" />
<meta property="og:title"
	content="Clorova | Bali & Jakarta Photography, Video, 360 Media Production" />
<meta property="og:description"
	content="Specialising in lifestyle, interiors, 360 and aerial photography and videography, Clorova work across a range of advertising, editorial, pr and corporate clients in Bali and Jakarta." />
<meta property="og:url" content="index.html" />
<meta property="og:site_name"
	content="Clorova | Bali & Jakarta Photography, Video, 360 Media Production" />
<meta property="article:publisher"
	content="https://www.facebook.com/clorova/" />
<meta property="og:image"
	content="<c:url value='/resource/img/clorova-banner.jpg'/>" />
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:description"
	content="Specialising in lifestyle, interiors, 360 and aerial photography and videography, Clorova work across a range of advertising, editorial, pr and corporate clients in Bali and Jakarta." />
<meta name="twitter:title"
	content="Clorova | Bali & Jakarta Photography, Video, 360 Media Production" />
<meta name="twitter:site" content="@Clorova" />
<meta name="twitter:image"
	content="<c:url value='clorova-banner.jpg'/>" />
<meta name="twitter:creator" content="@Clorova" />

<!-- JQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 구매하기 css -->
<link href="<c:url value='/vendor/css/custom.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/jquery.scrolling-tabs.css'/>" rel="stylesheet">

<!-- PayMoving js -->
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>

<script>
   $(function() {
      //구매하기 hide, show
      $('.option-btn').click(function() {
         if ($('#optionList').css('display') === 'none') {
            $('#optionList').show(1000);
         } else {
            $('#optionList').hide(1000);
         }
      });
   }); //function
</script>

<body class=" ">
	<div id="svg-sprite" style="display: none">
		<svg xmlns="http://www.w3.org/2000/svg">

		<!-- arrow left -->
		<symbol viewBox="0 0 14 26" id="icn_arrow_left">
			<path
				d="M13,26c-0.256,0-0.512-0.098-0.707-0.293l-12-12c-0.391-0.391-0.391-1.023,0-1.414l12-12c0.391-0.391,1.023-0.391,1.414,0s0.391,1.023,0,1.414L2.414,13l11.293,11.293c0.391,0.391,0.391,1.023,0,1.414C13.512,25.902,13.256,26,13,26z" /> 
		</symbol>

		<!-- arrow right -->
		<symbol viewBox="0 0 14 26" id="icn_arrow_right">
			<path
				d="M1,0c0.256,0,0.512,0.098,0.707,0.293l12,12c0.391,0.391,0.391,1.023,0,1.414l-12,12c-0.391,0.391-1.023,0.391-1.414,0s-0.391-1.023,0-1.414L11.586,13L0.293,1.707c-0.391-0.391-0.391-1.023,0-1.414C0.488,0.098,0.744,0,1,0z" />
		</symbol>

		<!-- map pin -->
		<symbol viewBox="0 0 9 13" id="icn_map_pin">
			<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
				<g id="6.contact-us" transform="translate(-977.000000, -67.000000)"
				fill="#F26724">
	        <g id="Menu" transform="translate(81.000000, 37.000000)">
	          <g id="Group-10" transform="translate(603.000000, 27.000000)">
							<path
				d="M297.493232,16 C297.605734,16 297.712366,15.4875294 297.786715,15.4031079 C297.959283,15.2072343 302.014051,10.5685558 301.999963,7.50979368 C301.988811,5.02317838 299.970036,3 297.50008,3 C295.018579,3 293,5.02396187 293,7.51175242 C293,10.5687516 297.027571,15.2062549 297.199161,15.4021285 C297.273315,15.4869418 297.37486,15.5329721 297.493232,15.5357143 L297.493232,16 Z M297.500094,6 C296.67298,6 296,6.6729375 296,7.5 C296,8.32725 296.67298,9 297.500094,9 C298.327208,9 299,8.32725 299,7.5 C299,6.6729375 298.327208,6 297.500094,6 Z"
				id="17-copy-17"></path>
						</g>
					</g>
				</g>
			</g>
		</symbol>

		<!-- FLEAVA LOGO -->

    <symbol id="fleava_logo" viewBox="0 0 307 86">
      <path
				d="M11.9,29.5H0v-4.1h11.9v-7.9c0-8.2,2.3-13.4,12.9-13.4c2.2,0,5,0.3,7.8,0.6v4.1c-2.2-0.4-5.1-0.6-7.2-0.6
        c-2.3,0-8.9,0-8.9,7.9v9.3h14.7v4.1H16.5v48.3h-4.6V29.5z" />
      <path d="M48.4,4.7h4.6v73.1h-4.6V4.7z" />
      <path
				d="M68.5,52.6c0.3,13.1,8.9,22.7,24.2,22.7c15.8,0,19.8-10.2,21.6-14.9h4.6c-4.3,13.2-13.2,19-26.7,19
        c-17.3,0-28.2-10.8-28.2-28.3c0-11,6.7-27.4,28.3-27.4c17.6,0,27.7,12.1,27.9,28.9H68.5z M115.1,48.5
        c-1.9-14.3-11.6-20.7-23.3-20.7c-13.1,0-21.3,8.2-23.3,20.7H115.1z" />
      <path
				d="M129.3,41.6c1.7-13.2,8.2-17.8,23.6-17.8c14.8,0,23.3,3.6,23.3,15.4v29.4c0,3.9,0,6.2,3.4,6.2c1.5,0,3-0.3,4.5-0.8V78
        c-1.4,0.5-3.3,0.8-5.6,0.8c-6.2,0-6.2-4.5-6.2-11.5H172c-5.7,10.7-17.5,12.1-24.2,12.1c-4.4,0-20.8,0-20.8-16
        c0-10.7,8.8-14.4,19.1-15l17.7-1.2c5.3-0.4,7.7-1,7.7-7.5c0-7.1-3.9-11.9-18.8-11.9c-13.4,0-17.5,4.3-18.9,13.7H129.3z
         M171.6,48.5h-0.2c-1.1,1.2-3.8,2.5-8.1,2.8l-17.1,1.2c-8.5,0.6-14.6,3.1-14.6,11c0,10.6,10.4,11.9,16.6,11.9
        c10.1,0,23.5-4.7,23.5-17.2V48.5z" />
      <path
				d="M185.9,25.4h5.2l22.2,47.7l22.2-47.7h5.2l-25.1,52.4h-4.6L185.9,25.4z" />
      <path
				d="M248.1,41.6c1.7-13.2,8.2-17.8,23.6-17.8c14.8,0,23.3,3.6,23.3,15.4v29.4c0,3.9,0,6.2,3.4,6.2c1.5,0,3-0.3,4.5-0.8V78
        c-1.4,0.5-3.3,0.8-5.6,0.8c-6.2,0-6.2-4.5-6.2-11.5h-0.2c-5.7,10.7-17.5,12.1-24.2,12.1c-4.4,0-20.8,0-20.8-16
        c0-10.7,8.8-14.4,19.1-15l17.7-1.2c5.3-0.4,7.7-1,7.7-7.5c0-7.1-3.9-11.9-18.8-11.9c-13.4,0-17.5,4.3-18.9,13.7H248.1z
         M290.4,48.5h-0.2c-1.1,1.2-3.8,2.5-8.1,2.8L265,52.5c-8.5,0.6-14.6,3.1-14.6,11c0,10.6,10.4,11.9,16.6,11.9
        c10.1,0,23.5-4.7,23.5-17.2V48.5z" />
      <polygon points="81,17.3 83.8,19 101.9,7.4 97.6,4.1   " />
    </symbol>


    <!-- CLOROVA LOGO -->

    <symbol id="clorova_logo" viewBox="0 0 389 85">
      <path
				d="M337.367273,53.6490909 C330.703636,54.5672727 325.912727,56.1218182 323.167273,58.3036364 C320.476364,60.4218182 319.103636,63.3581818 319.103636,67.0309091 C319.103636,70.8854545 320.549091,73.9036364 323.530909,76.2218182 C326.503636,78.5218182 330.585455,79.6945455 335.676364,79.6945455 C339.021818,79.6945455 342.067273,79.1763636 344.712727,78.14 C347.376364,77.1127273 349.621818,75.64 351.394545,73.7490909 C353.676364,71.4309091 355.249091,69.1218182 356.076364,66.8672727 C356.921818,64.5672727 357.358182,61.2763636 357.358182,57.0581818 L357.358182,51.3490909 C350.976364,51.8763636 344.258182,52.6490909 337.367273,53.6490909 Z M363.976364,83.1854545 L358.794545,83.1854545 L358.730909,82.8218182 C358.130909,79.8763636 357.803636,76.5581818 357.730909,72.9127273 C355.621818,76.3036364 352.767273,79.0309091 349.267273,81.0218182 C345.358182,83.2309091 340.549091,84.3581818 334.94,84.3581818 C328.567273,84.3581818 323.367273,82.7672727 319.485455,79.6218182 C315.585455,76.4672727 313.603636,72.2672727 313.603636,67.14 C313.603636,62.1763636 315.412727,58.1581818 318.985455,55.1945455 C322.512727,52.2581818 328.485455,50.1672727 336.74,48.9854545 C344.476364,47.9309091 351.412727,47.1490909 357.358182,46.6763636 L357.358182,43.6945455 C357.358182,37.7672727 355.794545,33.3127273 352.703636,30.4309091 C349.621818,27.5581818 345.349091,26.1036364 340.030909,26.1036364 C334.376364,26.1036364 329.94,27.4854545 326.849091,30.2127273 C323.758182,32.9309091 322.030909,36.6127273 321.712727,41.1581818 L321.685455,41.5763636 L316.176364,41.5763636 L316.212727,41.0854545 C316.64,35.1309091 318.949091,30.3218182 323.085455,26.7672727 C327.203636,23.2309091 332.912727,21.4490909 340.030909,21.4490909 C346.903636,21.4490909 352.449091,23.34 356.503636,27.0672727 C360.567273,30.8218182 362.612727,36.5309091 362.612727,44.0490909 L362.612727,68.7854545 C362.612727,74.3672727 363.030909,79.0309091 363.849091,82.6309091 L363.976364,83.1854545 Z M282.485455,78.7763636 L271.34,51.1581818 L260.285455,23.9127273 L254.467273,23.9127273 L279.085455,84.0763636 L279.203636,84.3581818 L285.767273,84.3581818 L310.376364,24.5309091 L310.64,23.9127273 L304.803636,23.9127273 L282.485455,78.7763636 Z M238.512727,33.1490909 C234.558182,28.4763636 228.94,26.1127273 221.830909,26.1127273 C214.794545,26.1127273 209.221818,28.4763636 205.276364,33.1490909 C201.303636,37.8581818 199.294545,44.4854545 199.294545,52.84 C199.294545,61.2036364 201.303636,67.84 205.276364,72.5309091 C209.212727,77.2127273 214.794545,79.5854545 221.830909,79.5854545 C228.949091,79.5854545 234.558182,77.2127273 238.512727,72.5309091 C242.476364,67.8490909 244.494545,61.2218182 244.494545,52.84 C244.494545,44.4672727 242.476364,37.8490909 238.512727,33.1490909 Z M242.485455,29.7490909 C247.476364,35.3036364 250.003636,43.0763636 250.003636,52.84 C250.003636,62.6127273 247.476364,70.3854545 242.485455,75.94 C237.503636,81.5218182 230.549091,84.3581818 221.830909,84.3581818 C213.112727,84.3581818 206.176364,81.5218182 201.230909,75.94 C196.285455,70.3854545 193.785455,62.6036364 193.785455,52.84 C193.785455,43.0763636 196.285455,35.3036364 201.230909,29.7490909 C206.176364,24.1672727 213.112727,21.3309091 221.830909,21.3309091 C230.549091,21.3309091 237.503636,24.1672727 242.485455,29.7490909 Z M186.403636,23.5490909 C181.621818,23.5490909 177.421818,24.6218182 173.921818,26.7218182 C170.849091,28.5854545 168.34,31.1581818 166.467273,34.3945455 L166.467273,23.9127273 L161.085455,23.9127273 L161.085455,84.3581818 L166.467273,84.3581818 L166.467273,50.8490909 C166.467273,43.6581818 168.267273,38.1036364 171.812727,34.34 C175.367273,30.5945455 180.312727,28.44 186.521818,28.44 C187.567273,28.44 188.730909,28.5218182 190.076364,28.6672727 L190.585455,28.7218182 L190.585455,23.9854545 L190.212727,23.9127273 C189.012727,23.6763636 187.721818,23.5490909 186.403636,23.5490909 Z M133.730909,72.5309091 C137.694545,67.8490909 139.712727,61.2218182 139.712727,52.84 C139.712727,44.4672727 137.694545,37.8490909 133.730909,33.1490909 C129.776364,28.4763636 124.167273,26.1127273 117.049091,26.1127273 C110.003636,26.1127273 104.44,28.4763636 100.485455,33.1490909 C96.5218182,37.8581818 94.5036364,44.4854545 94.5036364,52.84 C94.5036364,61.2036364 96.5218182,67.84 100.485455,72.5309091 C104.430909,77.2127273 110.003636,79.5854545 117.049091,79.5854545 C124.176364,79.5854545 129.785455,77.2127273 133.730909,72.5309091 Z M137.703636,29.7490909 C142.694545,35.3036364 145.212727,43.0763636 145.212727,52.84 C145.212727,62.6127273 142.694545,70.3854545 137.703636,75.94 C132.712727,81.5218182 125.767273,84.3581818 117.049091,84.3581818 C108.34,84.3581818 101.403636,81.5218182 96.4490909,75.94 C91.5036364,70.3854545 89.0036364,62.6036364 89.0036364,52.84 C89.0036364,43.0763636 91.5036364,35.3036364 96.4490909,29.7490909 C101.403636,24.1672727 108.34,21.3309091 117.049091,21.3309091 C125.767273,21.3309091 132.712727,24.1672727 137.703636,29.7490909 Z M67.8672727,84.3581818 L73.2490909,84.3581818 L73.2490909,0.00363636364 L67.8672727,0.00363636364 L67.8672727,84.3581818 Z M49.5036364,62.3854545 L52.6218182,62.3854545 C52.0218182,68.8854545 49.4218182,74.2309091 44.8854545,78.2672727 C40.34,82.3036364 34.5490909,84.3581818 27.6854545,84.3581818 C19.1309091,84.3581818 12.3036364,81.5218182 7.39454545,75.94 C2.48545455,70.3854545 0.00363636364,62.6036364 0.00363636364,52.84 C0.00363636364,43.0854545 2.48545455,35.3036364 7.39454545,29.7490909 C12.3036364,24.1672727 19.1309091,21.3309091 27.6854545,21.3309091 C34.54,21.3309091 40.3309091,23.3218182 44.8763636,27.24 C49.4218182,31.1672727 52.0218182,36.3763636 52.6218182,42.7218182 L47.4309091,42.7309091 C47.0127273,37.8309091 44.5672727,33.8036364 41.04,30.74 C37.5127273,27.6763636 33.0127273,26.1127273 27.6854545,26.1127273 C20.8127273,26.1127273 15.34,28.4763636 11.4218182,33.1490909 C7.50363636,37.8672727 5.50363636,44.4854545 5.50363636,52.84 C5.50363636,61.2036364 7.50363636,67.8309091 11.4218182,72.5309091 C15.3309091,77.2127273 20.8036364,79.5854545 27.6854545,79.5854545 C33.0127273,79.5854545 37.4854545,77.9490909 40.9763636,74.7127273 C44.4672727,71.5127273 46.4854545,67.3490909 46.9763636,62.3672727 L49.5036364,62.3854545 Z"
				id="Fill-1" fill="#FEFEFE"></path>
      <polygon id="Fill-4" fill="#EC2026"
				points="378.790909 84.3572727 388.372727 84.3572727 388.372727 68.8936364 378.790909 68.8936364"></polygon>
    </symbol>

	</svg>

	</div>

	<div id="head" class="header">
		<a href="<c:url value='/home.ins'/>" class="logo hover-target" id="main-logo"
			title="Clorova — Bali Media Production">
						<div class="logo-wrap" id="logo-wrap">
				<svg width="107px" height="24px" style="display: none">
		    <use xlink:href="#clorova_logo"></use>
		  </svg>
			</div>
			<div class="logo-box" id="logo-box" style="display:none;"></div> <span style="display:none">Media
				Production</span>
			<img style="width: 170px;height: 55px;margin-top: -50px;" src="<c:url value='/resource/img/logo_5.png'/>">
			<div class="logo-box" id="logo-box"></div> <span style="display: none">Media
				Production</span>
		</a> <a href="<c:url value='/sub1/subprojects.ins'/>" class="works q_magnet hover-target">All
			projects</a>
		</li>

		<div class="nav-menu hover-target" id="nav">
			<span class="line"></span> <span class="line"></span> <span
				class="line"></span> <span class="text">Menu</span>
		</div>
	</div>

	<div class="menu-overlay" id="menu-overlay"></div>

	<div id="menu" class="menu hideOnLoad">

		<div class="section_fixed" id="menu-inner">
			<div class="section__clip" id="menuClip">
				<div class="section__content">

					<header>
						<div class="header-wrap">
							<a href="http://fleava.com/" target="_blank"
								class="logo fleava hover-target"
								title="Fleava — Bali Digital Agency"> <svg width="105px"
									height="24px" style="display: none">
				        <use xlink:href="#fleava_logo"></use>
				      </svg> <span style="display: none">Digital Agency</span>
							</a>
						</div>
					</header>
					<div class="nav-menu close hover-target" id="navClose">
						<span class="line"></span>
					</div>
					<div class="menu-content">

						<div class="columns">
							<div class="column q-1-5">
								<span class="line"></span> <a href="<c:url value='/sub1/list.ins'/>"
									class="flare-hover hover-target barba_nav">
									<h1 class="large">
										<span class="q_split"><span
											class="q_split_wrap menu-item">Recruit</span> </span>
									</h1>
								</a>

							</div>
							<div class="column q-1-5">
								<span class="line"></span> <a href="<c:url value='/sub1/review.ins'/>"
									class="flare-hover hover-target barba_nav">
									<h1 class="large">
										<span class="q_split"><span
											class="q_split_wrap menu-item">Review</span> </span>
									</h1>
								</a>
								<div class="text">
								</div>
							</div>
							<div class="column q-1-5">
								<span class="line"></span> <a onclick="showPopup();" title="Contact Clorova"
									class="flare-hover hover-target">
									<h1 class="large">
										<span class="q_split"><span
											class="q_split_wrap menu-item">Chatting</span> </span>
									</h1>
								</a>
								<div class="text">
								</div>
							</div>

						</div>
					</div>


				</div>
			</div>
		</div>

	</div>


	<div class='cursor' id="cursor"></div>
	<div class='cursor2' id="cursor2"></div>
	<div class='cursor3' id="cursor3"></div>

	<div id="dynamicLoad" class="dynamic_load">
		<div class="progress">
			<div class="bar" id="dynamicBar"></div>
		</div>
	</div>


	<div id="barba-wrapper">
		<div class="barba-container">
			<div id="main" class="q_smooth">
				<div id="section-header">
					<section class="section">
						<div class="q-container container-inner">
							<div class="columns">
								<div class="column q-1-2"></div>
								<div class="column q-1-2">
									<div class="title">
										<p>
											<span class="q_split"><span style="font-size: 1.1em"
												class="q_split_wrap rev_item"># 인기 프로젝트</span> </span>
										</p>
										<h1>
											<span class="q_split"><span
												class="q_split_wrap rev_item">방구석</span> </span> <span
												class="q_split"><span class="q_split_wrap rev_item">기타리스트</span>
											</span>
										</h1>
										<div class="line"></div>
										</p>
									</div>
								</div>
							</div>
					</section>

					<section>
						<figure class="picture">
							<div class="rev_clip">
								<img src="<c:url value='/resource/img/banner.jpg'/>"
									alt="About Clorova | Bali & Jakarta Photography, Video, 360 Media Production"
									class="vs-div" data-speed="-0.4" />
							</div>
						</figure>
					</section>

				</div>

				<section class="section">
					<div class="q-container container-inner reveal">
						<div class="columns">
							<div class="column">
								<h2>
									<span class="line rev_line"></span>
									<span class="q_split"><span
										class="q_split_wrap rev_item">Description.</span></span>
								</h2>
							</div>
						</div>
						<div class="columns">
							<div class="column q-1-2"></div>
							<div class="column q-1-2">
								<p class="rev_item">세상에는 음악적으로 성공한 수 많은 음악인들이 있습니다. 또한 그들처럼
									되기 위해 방구석이라는 곳에서 성공이라는 꿈을 키우며 묵묵히 연습하는 이들도 있겠지요. Insomnia에서는
									그들과 여러분들이 소통할 수 있는 공연장을 마련해보고자 합니다.</p>
								<p class="rev_item">물론 열정이 있다고 해서 누구나 공연에 설 수 있는건 아닙니다. 관심있는 청년들이 신청을
									해주면 저희 Insomnia에서 그 중 가장 실력있는 젊은이들을 초대하여 한 달이라는 시간동안 함께 연습할 수
									있도록 함께 연습을 시킬 것입니다. 때문에 퀄리티있는 공연을 기대하셔도 좋습니다.</p>
							</div>
						</div>
					</div>
				</section>

				<section class="section small-pt">
					<div class="q-container container-inner reveal" style="margin-top: 40px">
						<div class="columns">
							<div class="column q-1-3"></div>
							<div class="column q-2-3">
								<h2>
									<span class="line rev_line"></span>
									<span class="q_split"><span
										class="q_split_wrap rev_item">Information.</span></span>
								</h2>
							</div>
						</div>
					</div>
				</section>

				<section id="q_slide" class="half-width" animate='stagTop' autoplay='8000' parallax=".25" opacity=".3">
						<div >
							<a href="#" onClick="window.open('http://map.daum.net/link/to/블루스퀘어,37.541102,127.002446','길찾기','width=2090, height=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
							<img style="opacity: 0.9;max-width: 100%;height: auto" src="<c:url value='/resource/img/YakDo.png'/>"
								alt="360 Virtual Tour" class="image1" />
							</a>
						</div>
						
						<div >
							<a href="#" onClick="window.open('http://map.daum.net/link/to/블루스퀘어,37.541102,127.002446','길찾기','width=2050, height=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
							<img style="opacity: 0.9;max-width: 100%;height: auto;display: none" src="<c:url value='/resource/img/YakDo.png'/>"
								alt="360 Virtual Tour" class="image2" />
							</a>
						</div>
				</section>

				<section class="section">
					<div class="q-container container-inner reveal">
						<div class="columns">
							<div class="column">
								<h2>
									<span class="line rev_line"></span> <span class="q_split"><span
										class="q_split_wrap rev_item">A Trusted</span></span> <span
										class="q_split"><span class="q_split_wrap rev_item">Partner.</span></span>
								</h2>
							</div>
						</div>
						<div class="columns">
							<div class="column">
								<div class="clients">
								<img src="<c:url value='/resource/img/1.png'/>" class="rev_client" alt="Starwood" /> 
									<img src="<c:url value='/resource/img/2.png'/>" class="rev_client"
										alt="Starwood" /> <img src="<c:url value='/resource/img/2.png'/>"
										class="rev_client" alt="Prama Sanur" /> <img
										src="<c:url value='/resource/img/3.png'/>" class="rev_client"
										alt="Preference Hotels" /> <img
										src="<c:url value='/resource/img/4.png'/>" class="rev_client"
										alt="Sintesa Group" /> <img
										src="<c:url value='/resource/img/5.png'/>" class="rev_client"
										alt="Four Points" /> <img
										src="<c:url value='/resource/img/6.png'/>" class="rev_client"
										alt="PNK Hotels" /> <img src="<c:url value='/resource/img/8.png'/>"
										class="rev_client" alt="Alaya Hotels" /> <img
										src="<c:url value='/resource/img/9.png'/>" class="rev_client"
										alt="Mowilex" /> 
								</div>
							</div>
						</div>
					</div>
				</section>

				<footer id="footer" style="background-color: #12111F;">
					<section class="section">
						<div class="q-container container-inner reveal">
							<div class="columns">
								<div class="column q-1-3"></div>
								<div class="column q-2-3">
									<a href="mailto:wndrhtkfurh@naver.com" class="hover-target"
										title="Contact Clorova">
										<h2>
											<span class="line rev_line"></span> <span class="q_split"><span
												style="color: white;" class="q_split_wrap rev_item">Send
													a</span></span> <span class="q_split"><span style="color: white;"
												class="q_split_wrap rev_item">Request.</span></span>
										</h2>
										<p class="rev_item" style="font-weight: 600">If you have any questions.</p>
									</a>
								</div>
							</div>
						</div>
					</section>
					
					<div style="margin-top: 200px;margin-left: 850px;">
						<a href="javascript:shareFB();"  title="facebook 공유">
						<img style="width: 55px;height: 55px" class="kyj" src="<c:url value='/resource/img/facebook128.png'/>"/></a>
						
						<img style="width: 55px;height: 55px;margin-left: 30px" class="kyj" src="<c:url value='/resource/img/instagram128.png'/>"/>
						
						<a href="javascript:shareTW();" class="tw" title="twitter 공유">
						<img style="width: 55px;height: 55px;margin-left: 30px" class="kyj" src="<c:url value='/resource/img/twitter128.png'/>"/></a>
					</div>
				</footer>

			</div>
		</div>
	</div>
	
	<!-- 구매폼 -->
	<div>
		<div class="option-container">
			<div class="option-btn"
				style="font-size: 1.2em; width: 10px; height: 50px; padding-top: 3px; margin-left: 350px;">B
				u y</div>
			<div id="optionList" class="option-area" style="display: none;margin-left:980px">
				<div class="option-area-content">
					<div class="option-area-content-step1">
						<div class="common-flex-between">
							<span class="option-title mt10 xs-mt25">Buy Tickets</span>
						</div>
		
						<div class="option-box option-box-blue">
							<div class="aa" style="display: contents">
								<div class="option-box-left" style="padding-top: 10px">
									<div class="option-box-amount">${bgs1.C_CONCERTDATE}</div>
									<div class="mt5" style="padding-top: 5px">
										<span><strong>52석 남음</strong></span> <span
											style="color:white">&nbsp;&nbsp;|&nbsp;&nbsp;
											48석 판매</span>
									</div>
								</div>
								<form action="<c:url value='/Pay/PayPage.ins'/>"
									id="bgs_sub_item_list" style="display: none">
									<input type="hidden" name="bgs1_title"
										value="${bgs1.B_TITLE }"> <input type="hidden"
										name="bgs1_content" value="${bgs1.B_CONTENT }">
									<input type="hidden" name="bgs1_price" value="">
									<input type="hidden" name="bgs1_qty" value="">
								</form>
								<div class="option-box-center" style="padding-top: 10px">
									<div class="option-box-title">${bgs1.B_TITLE}</div>
									<div class="option-box-desc mt5"
										style="margin-top: 10px">${bgs1.B_CONTENT}</div>
								</div>
							</div> 
							<div class="box_inventory option_box_grey">
								<input type="hidden" name="limited_qty_yn" value="">
								<input type="hidden" name="limited_min_qty" value="1">
								<input type="hidden" name="limited_max_qty" value="999">
								<div style="padding-top: 1px;">
									<span class="txt_count_inventory option_title">수량&nbsp;&nbsp;&nbsp;</span>
									<input disabled="disabled" id="qtyqty" name="qty"
										type="text" value="1"
										style="color: white; background-color: black; width: 38px; height: 20px; text-align: center"
										class="input_add" onkeyup="checkQty(this);"
										onfocus="this.select();" style="line-height: 18px">
									<a id="plus_ordered" href="javascript:void(0)"
										style="font-size: 1.5em">&nbsp;+&nbsp;</a> <a
										id="minus_ordered" href="javascript:void(0)"
										style="font-size: 1.5em">-</a>
								</div>
								<div style="padding-top: 2px">
									<span>금액&nbsp;&nbsp;&nbsp;</span> <span id="bgs_price"></span>원
									<script>
                                            $("#bgs_price").text(String(${bgs1.C_PRICE}).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
                                         </script>
								</div>
							</div>

						</div>

					</div>

					<div class="option-box" style="margin-top: -25px;">
						<div class="option-box-left">
							<div class="option-box-amount">${bgs2.C_CONCERTDATE}</div>
							<div class="mt5" style="padding-top: 5px">
								<strong class="font-pink">Sold out</strong> <span
									style="opacity: 0.5;">&nbsp;&nbsp;|&nbsp;&nbsp;
									판매 완료</span>
							</div>
						</div>
						<div class="option-box-center">
							<div class="option-box-title">${bgs2.B_TITLE}</div>
							<div class="option-box-desc mt5" style="margin-top: 10px">${bgs2.B_CONTENT}</div>
						</div>
						<div class="hidden-xs option-delivery-date">
							<strong class="font-pink"
								style="font-size: 1.6em; margin-top: 200px">Sold
								out</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- =========================================================================================================== -->

	<div class="optionBtnBox">
		<div class="optionStepBtn">다음단계</div>
	</div>
</body>

<!-- 웹 채팅 -->
<script>
function showPopup() {
     window.open("<c:url value='/bgsChat.jsp'/>", "방구석 채팅!", "width=400, height=600, left=100, top=50");
}
</script>

<!-- 약도,SNS API 반응형으로 만들기 -->
<style>
@media only screen and (max-width: 600px) {
  .image1 {	
	  margin-left: 0;
  }    
} 
@media only screen and (min-width: 601px) {
  .image1 {	
	  margin-left: 300px;
  }    
} 
@media only screen and (max-width: 600px) {
  .kyj {	
	  display:none;
  }    
} 

.kyj {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.kyj:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
</style>

<script>
function shareFB() {
   window.open('http://www.facebook.com/sharer/sharer.php?u=http://127.0.0.1:8083/insomnia/');
}
function shareTW() {
   window.open('http://twitter.com/share?url=http://127.0.0.1:8083/insomnia/&text=당신을 Insomnia로 초대합니다.');
}

</script>