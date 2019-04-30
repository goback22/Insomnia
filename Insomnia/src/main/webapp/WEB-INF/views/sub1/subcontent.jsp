<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp"%>


<!-- Meta Data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta HTTP-EQUIV="Page-exit" content="BlendTrans(Duration=1)" />
<meta HTTP-EQUIV="Page-enter" content="BlendTrans(Duration=1)" />

<!-- JQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 구매하기 css -->
<link href="<c:url value='/vendor/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/custom.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/jquery.scrolling-tabs.css'/>"
	rel="stylesheet">

<!-- 공지사항 -->
<script type="text/javascript" src="<c:url value='/vendor/js/obt.js'/>"></script>
<script type="text/javascript" src="<c:url value='/vendor/js/obt2.js'/>"></script>


<!-- PayMoving js -->
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>
<script>
   $(function() {
      //페이지 뿌리기
      showComments();

      //구매하기 hide, show
      $('.option-btn').click(function() {
         if ($('#optionList').css('display') === 'none') {
            $('#optionList').show(1000);
         } else {
            $('#optionList').hide(1000);
         }
      });

      //댓글 작성
      $('#submitComment').click(function() {
         if ($(this).val() == '등록') {
            var action = "<c:url value='/sub1/memowrite.ins'/>";
           	
            //별점, 내용 유효성 체크
            if($('#starCount').val() == ''){
           		alert('별점을 클릭하세요');
           		return false;
            }
            
            else if($('#content').val() == ''){
           		alert('내용을 입력해주세요');
           		return false;
           	}//if
         }//if
         
         else{//수정
            var action = "<c:url value='/sub1/memoedit.ins'/>";
         }

         $.ajax({
            url : action,
            data : $('#frm').serialize(),
            dataType : 'text',
            type : 'post',
            success : function() {
               //등록 후 현재 모든 댓글 뿌려주기
               showComments();

               //입력 댓글 클리어 및 포커스 주기
               $('#content').val('');
               $('#about').focus();
               
               //글 수정후 등록버튼으로 다시 교체하기
               if($('#submitComment').val()=='수정'){
                  $('#submitComment').val('등록');
               }
            },
            error : function(request, error) {
               console.log('상태코드:', request.status);
               console.log('서버로부터 받은 HTML데이타 :', request.responseText);
               console.log('에러:', error);
            }
         });
      })
      
      $(function(){         
         $('.star').click(function(){
            $('#starCount').val($(this).index());
            console.log($('#starCount').val()); //클릭하면 별의 개수가 카운터에 찍힌다.
         });
      });
   }); //function

   //리스트
   var showComments = function() { // ★ajax를 함수로 감싸서 리스트를 뿌릴 때 쓰기
      $.ajax({
         url : '<c:url value="/sub1/memolist.ins"/>',
         dataType : 'text',
         success : successAjax,
         error : function(request, error) {
            console.log('상태코드:', request.status);
            console.log('서버로부터 받은 HTML데이타 :', request.responseText);
            console.log('에러:', error);
         }
      });
   };//showComments

   var successAjax = function(data) {
      /*JSON배열을 출력할때는 $.each(data,function(index,index에 따른 요소값){}); 사용]
      data : 서버로부터 전송받은 데이타(JSON배열타입)
      index : JSON배열의 인덱스(0부터 시작)   
      index에 따른 요소 값 : JSON 배열에서 하나씩 꺼내온거를 담은 인자      
       */
      console.log('서버로부터 받은 데이타:', data);

      var tableString = "<li>";
      tableString += "<article class='review-comment'>";
      $.each(JSON.parse(data),
         function(index, element) {
    	  	var A = element['PROFILE_IMG'];
    	  	console.log(A);
    	  	var B = "<c:url value='/upload/" +A+ "'/>;"
    	  	console.log(B);
            tableString += "<div class='user-avatar'>";


//             tableString += "<img src='<c:url value='/resource/img/commenttemp.jpg'/>'>";
            tableString += "<img style='border-radius:50px;height:70px;width:70px;' src='" +B+ "'>";

            tableString += "</div>";
            tableString += "<div class='comment-content'>";
            tableString += "<h5 class='name'>"
                  + element['NAME'] + "</h5>";
            tableString += "<div class='comment-meta'>";
            tableString += "<div class='star-rating_"+element['STARS']+"'>";
            tableString += "<span>Rated <strong class='rating'>5.00</strong>out of 5</span>";
            tableString += "</div>";
            tableString += "<span class='post-date'>"
                  + element['POSTDATE'] + "</span>";
            tableString += "</div>";
            tableString += "<span>" + element['CONTENT']
                  + "</span>"
            tableString += "<a href='#HH' class='commentEdit' title='"+element['R_NO']+"' style='color:white;font-size:0.8em;'>" + '&nbsp&nbsp[수정]' + "<span id='asd' style='display:none;'>"
                  + element['CONTENT'] + "</span></a>"
            tableString += "<span class='commentDelete' title='"+element['R_NO']+"' style='color:white;font-size:0.8em;cursor:pointer'>"
                  + '&nbsp&nbsp[삭제]' + "</span>";
            tableString += "</div>";
         });
      tableString += "</article>";
      tableString += "</li>";
      //리스트 뿌려주기
      $('#comments').html(tableString);
      
      //코멘트 수정]
      $('.commentEdit').click(function(){
         console.log('클릭한 댓글의 키(r_no):',$(this).attr('title'));
         
         //클릭한 제목으로 텍스트박스 값 설정
         $('#content').val($(this).children().eq(0).html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
         $('#submitComment').val('수정');
         
         //form의 hidden속성중 name="cno"값 설정
         $('input[name=r_no]').val($(this).attr('title'));
      });

      //코멘트 삭제 
      $('.commentDelete').click(function() {
         console.log($('.commentDelete').attr('title'));

         $.ajax({
            url : '<c:url value="/sub1/memodelete.ins"/>',
            data : {
               r_no : $('.commentDelete').attr('title')
            },
            dataType : 'text',
            type : 'post',
            success : showComments(),
            error : function(request, error) {
               console.log('상태코드:', request.status);
               console.log('서버로부터 받은 HTML데이타 :', request.responseText);
               console.log('에러:', error);
            }
         });
      });
      
      //작성 버튼 눌렀을 때 수정으로 돼있다면 등록으로 바꾸기
      $('#about').click(function(){
         if($('#submitComment').val() == '수정') {
            ($('#submitComment')).val('등록')   ;
         }
      });
   }
   
   //오늘 하루 그만보기
   //쿠키설정   
   function setCookie(name, value, expiredays) {
      var todayDate = new Date();
      todayDate.setDate(todayDate.getDate() + expiredays);
      document.cookie = name + '=' + escape(value) + '; path=/; expires='
            + todayDate.toGMTString() + ';'
   }

   //쿠키 불러오기
   function getCookie(name) {
      var obj = name + "=";
      var x = 0;
      while (x <= document.cookie.length) {
         var y = (x + obj.length);
         if (document.cookie.substring(x, y) == obj) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
               endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
         }
         x = document.cookie.indexOf(" ", x) + 1;
         if (x == 0)
            break;
      }
      return "";
   }

   //닫기 버튼 클릭시
   function closeWin(key) {
      if ($("#todaycloseyn").prop("checked")) {
         setCookie('notice-obt' + key, 'Y', 1);
      }
      $("#notice-obt" + key + "").hide();
   }

   $(function() {
      if (getCookie("notice-obt1") != "Y") {
         $("#notice-obt1").show();
      }
   });
   
</script>

<!-- aos 구동 -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<!-- Dependency Styles -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/bootstrap.min.css'/>" type="text/css">
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

<style>
#footer-3 {
	margin-top: -70px;
}

element.style {
	background-color: white;
	color: white;
}

/* iframe을 숨기기 위한 css*/
#if {
	width: 0px;
	height: 0px;
	border: 0px;
}

div.tab-content.left {
	margin-left: 130px;
	margin-top: 20px;
}

body>#standalone-container {
	margin: 50px auto;
	max-width: 720px;
}

#editor-container {
	height: 350px;
}

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

.section {
	text-align: center;
	color: white;
	font-size: 40px;
	text-shadow: 1px 1px 10px black;
	z-index: 50;
	letter-spacing: 10px;
	line-height: 180%;
	font-weight: 500;
	padding-left: 95px;
	padding-right: 150px;
	padding-top: 170px;
	padding-bottom: 50px;
	border: none;
	font-family: 'Cormorant Garamond', serif;
}

.section1 {
	margin-top: 20px;
	margin-left: 30px;
	width: 650px;
	height: 480px;
	background-image: url('../resource/img/concert2.jpg');
}

.section2 {
	margin-top: 280px;
	margin-left: 690px;
	width: 650px;
	height: 480px;
	background-image: url('../resource/img/big concert hall.jpg');
}

.section3 {
	margin-top: 280px;
	margin-left: 30px;
	width: 650px;
	height: 480px;
	background-image: url('../resource/img/instruments3.png');
}

.tempImage {
	height: 360px;
	width: 275px;
}

.review-comments {
	margin-top: -10px;
}

.title {
	color: white;
}

.comments-title {
	font-size: 24px;
	font-weight: 600;
	margin-top: -20px;
}

.col-md-10 {
	margin: auto;
}

/* notice */
.notice-obt {
	position: fixed;
	width: 420px;
	height: 440px;
	color: white;
	top: 200px;
	left: 100px;
	border: 1px solid #ccc;
	padding: 20px;
	background: black;
	z-index: 1000;
	margin-left: 0px;
	margin-top: 0px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
	display: none;
}

.notice-obt-close {
	position: relative;
	cursor: pointer;
	font-size: 35px;
	right: -360px;
}

.notice-obt-title {
	line-height: 80px;
	font-size: 24px;
	font-weight: bold;
	margin-top: -50px;
	l
}

.notice-obt-content {
	height: 270px;
	padding: 20px 10px;
	margin-left: -10px;
	margin-top: -35px;
	line-height: 2.3em;
}

.notice-obt-content a {
	color: #2196F3;
	font-weight: bold;
}

.notice-obt-bottom {
	text-align: right;
}

.live-ticket-count .countdown .CountdownContent {
	display: inline-block;
	height: 110px;
	width: 120px;
	font-size: 76px;
	font-weight: 600;
	color: red;
	font-family: "Changa", sans-serif;
	text-align: center;
	position: relative;
	background-image: url("../../media/background/1.png");
	background-size: contain;
	margin-right: 20px;
	background-repeat: no-repeat;
	padding: 24px 0;
}

.live-ticket-count .countdown .CountdownContent .CountdownLabel {
	display: block;
	text-align: center;
	font-size: 16px;
	font-family: "Roboto", sans-serif;
	padding-top: 15px;
}

.tim-container-box {
	width: 1200px;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<!--    <!-- 반응형 글씨 -->
	<!--    <a class="typewrite" data-period="3000" data-type='[ "#반응형 #모바일 #무료" ]'> -->
	<!--       <span class="wrap"></span> -->
	<!--    </a> -->

	<!-- 로딩 -->
	<!--    <div class="loader loader-bar-ping-pong is-active"></div> -->

	<!-- 공지 시작 -->
	<div class="notice-obt" id="notice-obt1">
		<div class="notice-obt-close">×</div>
		<div class="notice-obt-title" style="color: red">방구석 기타리스트 가족 모집
		</div>
		<div class="notice-obt-content">
			<b>지난해, 모두를 광란의 도가니속으로 몰아 넣었던 <br>`방구석 기타리스트`가 2탄으로 다시
				찾아옵니다.
			</b> <br> <span style="font-style: bold">Insomnia는</span> 공연을 빛내줄
			여러분들을 기다립니다.<br> <a href="<c:url value='/sub1/list.ins'/>">모집
				게시판</a>을 통해 게시글을 등록해주세요.<br> &lt;참여 조건&gt; <br>연령 : 25세 이상 <br>
			장르 : 무관 <br>자격 : 음악을 사랑하는 누구나 <br>신청 기간 : ~ 2019. 6. 4 (6일
			발표)
		</div>
		<div class="notice-obt-bottom">
			<img
				style="margin-top: 60px; margin-left: 35px; height: 70px; width: 115px;"
				src="<c:url value='/resource/img/logo_5.png'/>">
		</div>
		<div class="button_area" style="margin-top: -45px">
			<input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>&nbsp;&nbsp;오늘
			이 창을 열지 않음 &nbsp;&nbsp;<a href='' onclick="javascript:closeWin(1);"><B>[닫기]</B></a>
		</div>
	</div>
	<!--  공지 끝 -->

	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp" />

		<!--===========================-->
		<!--=           About         =-->
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
									<h2 style="margin-left: 58px">D E T A I L S</h2>
								</div>
							</div>
							<!-- /.col-xl- -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container -->
				</footer>
				<!-- /#footer -->

				<div class="product-tab-wrapper">
					<ul class="nav product-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							href="#profile" role="tab" data-toggle="tab">Description</a></li>
						<li class="nav-item"><a class="nav-link" href="#references"
							role="tab" data-toggle="tab">Reviews</a></li>
						<li class="nav-item"><a class="nav-link" href="#buzz"
							role="tab" data-toggle="tab">Q&A</a></li>
					</ul>
					<br>

					<div class="tab-content">

						<!-- 첫번째 카테고리 : 상품 설명 -->
						<div role="tabpanel" class="tab-pane fade in active" id="profile">
							<div class="single-product-wrapper">
								<div class="row">

									<!-- 타이머 -->
									<header id="mobile-nav-wrap"> </header>
									<section id="ticket" class="parallax" data-speed="0.-3"
										data-height="700px">
										<div class="tim-container"
											style="margin-top: -40px; margin-left: -15px">
											<p
												style="color: black; font-weight: 600; font-size: 3em; margin-left: 360px; width: 1000px">By
												the Beginning of Concert...</p>
											<div class="row">
												<div class="col-lg-8">
													<div class="live-ticket">
														<div class="live-ticket-count">
															<div
																style="width: 1000px; height: 150px; margin-left: 382px"
																class="countdown" data-count-year="2019"
																data-count-month="6" data-count-day="2"></div>
														</div>
													</div>
													<!-- /.live-ticket -->
												</div>
												<!-- /.col-lg-8 -->
											</div>
											<!-- /.row -->
										</div>
										<!-- /.tim-container -->
									</section>
									<!-- 타이머 끝 -->

									<p
										style="margin-left: 390px; color: black; font-weight: 600; height: 220px; font-size: 2.5em; border-bottom: 3px solid aqua">
										<br> <br> <br> <br> <br> <br>'
										'밴드 공연'하면 어떤 것이 떠오르십니까?<br> <br> <br> <br>
										<br> <br> <br> <br> <br> <br> <br>
										<br> <br>
									<p>
									<div class="col-md-12 col-sm-6" style="margin-top: 50px">
										<div class="quickview-slider" style="margin-top: 300px">
											<div class="section section1" data-aos="flip-up">
												<div style="width: 400px; margin-left: -150px"></div>
											</div>
											<br>
											<p
												style="color: black; font-weight: 600; font-size: 2.7em; margin-left: 70px;">"
												Fantastic Performance? "</p>

											<!-- section2 -->
											<div class="section section2" data-aos="fade-down"></div>
											<br>
											<p
												style="color: black; font-weight: 600; font-size: 2.7em; margin-left: 830px;">"
												Big ConcertHall? "</p>

											<!-- section3 -->
											<div class="section section3" data-aos="slide-up"></div>
											<br>
											<p
												style="color: black; font-weight: 600; font-size: 2.7em; margin-left: 120px;">"
												a lot of Instruments? "</p>
										</div>
									</div>
								</div>


								<div>

									<br> <br> <br>
								</div>


								<!-- Concert Information -->
								<section id="event-about" style="margin-top: 100px;">
									<div class="container">
										<div class="row">
											<div class="col-lg-6">
												<div class="event-thumb">
													<img style="width: 605px; height: 250px"
														src="https://cdn.wadiz.kr/ft/images/green001/2018/0313/20180313155451433_84.jpg/wadiz/format/jpg/quality/80/optimize"
														class="fr-fic fr-dib">
													<div id="map" style="width: 605px; height: 400px;"></div>
													<script type="text/javascript"
														src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c32fad4a1c57880bfba793d4634c4d7"></script>
													<script>
							                           var container = document
							                                 .getElementById('map');
							                           var options = {
							                              center : new daum.maps.LatLng(
							                                    33.450701, 126.570667),
							                              level : 3
							                           };
							
							                           var map = new daum.maps.Map(container,
							                                 options);
							                        </script>
													<!-- 약도 -->
<!-- 													<img style="width: 605px; height: 400px" -->
<!-- 														src="https://cdn.wadiz.kr/ft/images/green001/2018/0313/20180313155519079_84.png/wadiz/format/jpg/quality/80/optimize" -->
<!-- 														class="fr-fic fr-dib"> -->
												</div>
											</div>
											<!-- /.col-lg-6 -->

											<div class="col-lg-6">
												<div class="event-content"
													style="width: 600px; height: 440px; margin-left: 10px; line-height: 35px">
													<h2 style="text-transform: none;">
														<span style="font-size: 0.9em"><br> <br>
															<br> <br> <br> <br>공연 정보 및 일시</span>
													</h2>

													<div class="event-details">
														<ul>
															<li></li>
														</ul>
														<div style="color: black; font-weight: 600">
															＊ 일시 : 2019년 6월 1일 <span
																style="color: blue; font-weight: 600">토</span>요일
														</div>
														<div>＊ 시간 : 10:00 ~ 12:00(오전), 16:00 ~ 18:00(오후)</div>
														<div>＊ 장소 : 대학로 스푼 잉글리쉬</div>
														<div>＊ 연락처 : 010 - 1234 - 5678</div>
													</div>

													<h4></h4>
													<p></p>

													<!-- 													<a href="#" class="tim-btn">Buy Tickets</a> -->

												</div>
												<!-- /.event-content -->
											</div>
											<!-- /.col-lg-6 -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.tim-container-two -->
								</section>



								<!-- =========================================================================================================== -->
								<!-- buy 폼 -->
								<div>
									<div class="option-container">
										<div class="option-btn"
											style="font-size: 1.2em; width: 10px; height: 50px; padding-top: 3px; margin-left: 20px;">B
											u y</div>
										<div id="optionList" class="option-area"
											style="display: none;">
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
																		248석 판매</span>
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


								<!-- 인기 프로젝트 뿌려주기 -->
								<section class="section-padding-two artist-lineup"
									style="margin-top: 120px">
									<div class="tim-container clearfix">
										<div class="row">
											<div class="section-title style-four">
												<h2>
													<span style="color: black">Relative</span>&nbsp;&nbsp;Projects
												</h2>
												<p>There are many variations of passages of Lorem Ipsum
													available but the majority have suffered alteration in some
													injected humour.</p>
											</div>
										</div>
										<div
											style="margin-top: -50px; width: 120%; height: 360px; margin-left: -100px"
											class="swiper-container row"
											data-swiper-config='{ "loop": true, "prevButton":".swiper-button-prev", "nextButton": ".swiper-button-next", "speed": 700, "autoplay": "5000", "slidesPerView": 6, "spaceBetween": 0, "grabCursor": true,"breakpoints": { "1300": { "slidesPerView": 4 }, "767": { "slidesPerView": 3 }, "500": { "slidesPerView": 1 }}}'>
											<ul class="artist-line-wrapper swiper-wrapper">
												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/A.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
														</ul>
														<h6>James Hetfield</h6>
														<p>Band: Metallica</p>
													</div></li>

												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/J.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
														</ul>
														<h6>James Hetfield</h6>
														<p>Band: Metallica</p>
													</div></li>

												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/U.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
														</ul>
														<h6>James Hetfield</h6>
														<p>Band: Metallica</p>
													</div></li>

												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/Q.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
														</ul>
														<h6>James Hetfield</h6>
														<p>Band: Metallica</p>
													</div></li>

												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/O.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
														</ul>
														<h6>James Hetfield</h6>
														<p>Band: Metallica</p>
													</div></li>

												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/F.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
														</ul>
														<h6>James Hetfield</h6>
														<p>Band: Metallica</p>
													</div></li>

												<li class="artist-single clearfix swiper-slide"><img
													src="<c:url value='/resource/img/H.jpg'/>"
													class="tempImage" alt="">
													<div class="artist-single-content">
														<ul>
															<li><a href="#"><i class="fa fa-facebook"
																	aria-hidden="true"></i></a></li>
															<li><a href="#"><i class="fa fa-twitter"
																	aria-hidden="true"></i></a></li>
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

								<!-- =========================================================================================================== -->

								<div class="optionBtnBox">
									<div class="optionStepBtn">다음단계</div>
								</div>
							</div>
						</div>

						<!-- 두번째 카테고리 : 리뷰 게시판 -->
						<div role="tabpanel" class="tab-pane fade" id="references">
							<div class="tab-content left">
								<div class="row">
									<div class="col-md-10">
										<!-- Reviews -->
										<div class="review-comments">
											<h5 class="comments-title">
												Reviews <a href="#HH" id="about" class="btn btn-success"
													style="margin-left: 40px;">작성</a>
											</h5>
											<br>
											<div class="review-comments">
												<ul class="review-list">
													<li id="comments">
														<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
													</li>
													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img src="<c:url value='/resource/img/catcat.jpg'/>"
																	style="height: 70px" alt="cat">
															</div>
															<div class="comment-content">
																<h5 class="name">김건모</h5>
																<div class="comment-meta">
																	<div class="star-rating" id="HH">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">2018-12-25</span>
																</div>
																<p>
																	처음엔 프로들의 공연도 아닌데 티켓 값이 너무 비싼 거 아닌가 생각했는데 
																	공연을 보고 그런 생각을 한 제가 창피할 정도였습니다.
																	<br> 오늘 공연을 한 젊은이들이 꼭 성공하길 바랍니다.
																</p>
															</div>
														</article>
													</li>
													<li>
														<article class="review-comment">
															<div class="user-avatar">
																<img src="<c:url value='/resource/img/dogdog.jpg'/>"
																	style="height: 70px" alt="cat">
															</div>
															<div class="comment-content">
																<h5 class="name">나문희</h5>
																<div class="comment-meta">
																	<div class="star-rating" id="HH">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">2018-12-25</span>
																</div>
																<p>
																	자식들이 방구석 기타리스트라는 공연을 보러가자길래 처음엔 기대를 안하고 갔으나,
																	생각보다 공연자들의 실력이 너무 우수했고 감동적이였습니다. <br>
																	많지 않았을 시간동안 그들이 그 정도의 합을 맞췄다는게 믿겨지지 않네요!
																	다음 공연에는 어떤 참가자들이 어떤 공연을 할 지 너무 기대됩니다.
																</p>
															</div>
														</article>
													</li>
												</ul>
											</div>
										</div>
										<!-- Leave Review -->
									</div>
								</div>

								<!-- comment 등록 폼 -->
								<div class="col-md-10" style="margin-top: 75px;">
									<div style="margin-left: -15px">
										<h5 class="comments-title">Write</h5>
										<form id="frm" method="post" target="param">
											<ul class="rating">
												<li class="rating-title">Leave A Rating</li>&nbsp;&nbsp;
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>
												<li class="star"><i class="fa fa-star"></i></li>

											</ul>
											<!-- 수정 및 삭제용 파라미터 -->
											<input type="hidden" name="r_no" /> <input type="hidden"
												name="name" class="form-fname form-element large"
												placeholder="Name" style="width: 250px">&nbsp;&nbsp;
											<br> <br>
											<textarea name="content" id="content" class="form-message"
												placeholder="Review" tabindex="5"
												style="margin-top: -30px; width: 400px; height: 200px; border-radius: 20px; padding: 20px"></textarea>
											<input type="submit" id="submitComment" value="등록"
												class="btn btn-primary "
												style="width: 80px; margin-top: -30px; margin-left: 20px;">
											<input type="hidden" id="starCount" name="starCount" />
											<!-- iframe 설정 -->
											<iframe id="if" name="param"></iframe>
										</form>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>

						<!-- 세번째 카테고리 : Q&A -->
						<div role="tabpanel" class="tab-pane fade" id="buzz">
							<table class="shop_attributes">
								<tbody>
									<tr>
										<th>Weight</th>
										<td class="product_weight">1.2 kg</td>
									</tr>

									<tr>
										<th>Dimensions</th>
										<td class="product_dimensions">38 x 28 x 15 cm</td>
									</tr>

									<tr>
										<th>Color</th>
										<td>
											<p>Blue, Grey, Red</p>
										</td>
									</tr>
									<tr>
										<th>Size</th>
										<td>
											<p>32-36, 36-40, 40-46</p>
										</td>
									</tr>
									<tr>
										<th>Size</th>
										<td>
											<p>H: 38cm/15″ W: 28cm/11″ D: 15cm/6″</p>
										</td>
									</tr>
									<tr>
										<th>Details</th>
										<td>
											<p>Contrasting print, Adjustable shoulder straps, Grab
												handle</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.product-tab-wrapper -->
		</section>
	</div>
	<!-- 끝 -->
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
	<script src="<c:url value='/vendor/js/smoke.js'/>"> </script>
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

	<!-- AOS 적용 -->
	<script>
      AOS.init();
   </script>
	<!-- 등록버튼 효과 -->
	<script>
      $(document).on('click', 'a[href^="#"]', function(event) {
         event.preventDefault();
         if ($($.attr(this, 'href')).length == 0) {
            location.href = '/' + $.attr(this, 'href');
         } else {
            $('html, body').animate({
               scrollTop : $($.attr(this, 'href')).offset().top
            }, 500);
         }
      });
      
   //공지사항 닫기 버튼 활성화
   $('.notice-obt-close').on('click', function() {
      $('.notice-obt').remove();
   });
   
   //반응형 글씨
//    $('.notice-cbt-close, .notice-cbt').on('click', function() {
//         $('.notice-cbt').remove();
//     });

//     $('.notice-obt-close').on('click', function() {
//         qv_func.setCookie('notice_main',1,1);
//         $('.notice-obt').remove();
//     });

//     $('.start-btn').click(function(e){
//        location.href="template.html";
//     });
//     $('#main-slide').bind('slide.bs.carousel', function (e) {
//         //console.log('slide event!');
//     });

//     $('#main-slide').carousel({
// //        swipe: 30
// //        wrap: false
//     });

//     var TxtType = function(el, toRotate, period) {
//         this.toRotate = toRotate;
//         this.el = el;
//         this.loopNum = 0;
//         this.period = parseInt(period, 10) || 2000;
//         this.txt = '';
//         this.tick();
//         this.isDeleting = false;
//     };

//     TxtType.prototype.tick = function() {
//         var i = this.loopNum % this.toRotate.length;
//         var fullTxt = this.toRotate[i];

//         if (this.isDeleting) {
//             this.txt = fullTxt.substring(0, this.txt.length - 1);
//         } else {
//             this.txt = fullTxt.substring(0, this.txt.length + 1);
//         }

//         this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

//         var that = this;
//         var delta = 200 - Math.random() * 100;

//         if (this.isDeleting) { delta /= 2; }

//         if (!this.isDeleting && this.txt === fullTxt) {
//             delta = this.period;
//             this.isDeleting = true;
//         } else if (this.isDeleting && this.txt === '') {
//             this.isDeleting = false;
//             this.loopNum++;
//             delta = 500;

//             var count = $('.carousel').find('.carousel-inner .item').length;
//             var index = $('.carousel').find('.carousel-inner .item.active').index();
//             if (count - 1 > index) {
//                 $('.carousel').carousel(index + 1);
//             }
//             else {
//                 $('.carousel').carousel(0);
//             }
//         }

//         setTimeout(function() {
//             that.tick();
//         }, delta);
//     };

//     window.onload = function() {
//         var elements = document.getElementsByClassName('typewrite');
//         for (var i=0; i<elements.length; i++) {
//             var toRotate = elements[i].getAttribute('data-type');
//             var period = elements[i].getAttribute('data-period');
//             if (toRotate) {
//                 new TxtType(elements[i], JSON.parse(toRotate), period);
//             }
//         }
//         // INJECT CSS
//         var css = document.createElement("style");
//         css.type = "text/css";
//         document.body.appendChild(css);

//         //alert(screen.height);
//         //main-slide txt padding refit
//         //PC
//         if($("#main-slide").width()>600) {
//             if ($("#main-slide").height() < 700) {
//                 //console.log("resize");
//                 $("#main-slide .carousel-contents .slide-txt").css("padding", 0);
//             }
//         }

//         if(!qv_func.getCookie('notice_main')) {
//             //tmp
//             //$(".notice-obt").show();
//         }
//     };

//     $(window).resize(function(){
//         //main-slide txt padding refit
//         //PC
//         if($("#main-slide").width()>600) {
//             //console.log("resize");
//             if ($("#main-slide").height() < 700) {
//                 $("#main-slide .carousel-contents .slide-txt").css("padding", 0);
//             } else {
//                 $("#main-slide .carousel-contents .slide-txt").css("padding", "40px 40px 30px 40px");
//             }
//         }
//     });
   </script>

	<style>
.star-rating {
	overflow: hidden;
	position: relative;
	height: 1.618em;
	line-height: 1.618;
	font-size: 1em;
	width: 5.3em;
	font-family: star;
	font-weight: 400;
}

.star-rating_5 span:before {
	content: "\53\53\53\53\53";
	top: 0;
	position: absolute;
	left: 0;
	color: #2c2d33;
}

.star-rating_4 span:before {
	content: "\53\53\53\53";
	top: 0;
	position: absolute;
	left: 0;
	color: #2c2d33;
}

.star-rating_3 span:before {
	content: "\53\53\53";
	top: 0;
	position: absolute;
	left: 0;
	color: #2c2d33;
}

.star-rating_2 span:before {
	content: "\53\53";
	top: 0;
	position: absolute;
	left: 0;
	color: #2c2d33;
}

.star-rating_1 span:before {
	content: "\53";
	top: 0;
	position: absolute;
	left: 0;
	color: #2c2d33;
}

.star-rating_1 {
	overflow: hidden;
	position: relative;
	height: 1.618em;
	line-height: 1.618;
	font-size: 1em;
	width: 5.3em;
	font-family: star;
	font-weight: 400;
}

.star-rating_2 {
	overflow: hidden;
	position: relative;
	height: 1.618em;
	line-height: 1.618;
	font-size: 1em;
	width: 5.3em;
	font-family: star;
	font-weight: 400;
}

.star-rating_3 {
	overflow: hidden;
	position: relative;
	height: 1.618em;
	line-height: 1.618;
	font-size: 1em;
	width: 5.3em;
	font-family: star;
	font-weight: 400;
}

.star-rating_4 {
	overflow: hidden;
	position: relative;
	height: 1.618em;
	line-height: 1.618;
	font-size: 1em;
	width: 5.3em;
	font-family: star;
	font-weight: 400;
}

.star-rating_5 {
	overflow: hidden;
	position: relative;
	height: 1.618em;
	line-height: 1.618;
	font-size: 1em;
	width: 5.3em;
	font-family: star;
	font-weight: 400;
}

.star-rating_1 span {
	overflow: hidden;
	float: left;
	top: 0;
	left: 0;
	position: absolute;
	padding-top: 1.5em;
}

.star-rating_2 span {
	overflow: hidden;
	float: left;
	top: 0;
	left: 0;
	position: absolute;
	padding-top: 1.5em;
}

.star-rating_3 span {
	overflow: hidden;
	float: left;
	top: 0;
	left: 0;
	position: absolute;
	padding-top: 1.5em;
}

.star-rating_4 span {
	overflow: hidden;
	float: left;
	top: 0;
	left: 0;
	position: absolute;
	padding-top: 1.5em;
}

.star-rating_5 span {
	overflow: hidden;
	float: left;
	top: 0;
	left: 0;
	position: absolute;
	padding-top: 1.5em;
}

.star-rating_1 span:before {
	color: #e43a90;
}

.star-rating_2 span:before {
	color: #e43a90;
}

.star-rating_3 span:before {
	color: #e43a90;
}

.star-rating_4 span:before {
	color: #e43a90;
}

.star-rating_5 span:before {
	color: #e43a90;
}
</style>