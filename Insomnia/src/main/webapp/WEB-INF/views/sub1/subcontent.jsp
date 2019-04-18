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

<!-- 구매하기 css -->
<link href="<c:url value='/vendor/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/custom.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/jquery.scrolling-tabs.css'/>"
	rel="stylesheet">

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
			}
			else{
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
				tableString += "<div class='user-avatar'>";
				tableString += "<img src='<c:url value='/resource/img/commenttemp.jpg'/>'>";
				tableString += "</div>";
				tableString += "<div class='comment-content'>";
				tableString += "<h5 class='name'>"
						+ element['NAME'] + "</h5>";
				tableString += "<div class='comment-meta'>";
				tableString += "<div class='star-rating'>";
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
			$('#content').val($(this).children().eq(0).text());
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
				($('#submitComment')).val('등록')	;
			}
		})
	}
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

body>#standalone-container {
	margin: 50px auto;
	max-width: 720px;
}

#editor-container {
	height: 350px;
}

body {
	/* 	background-color: black; */
	color: white;
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
	margin-left: 60px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_A.jpg');
}

.section2 {
	margin-top: 280px;
	margin-left: 740px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_D.jpg');
}

.section3 {
	margin-top: 280px;
	margin-left: 60px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_C.jpg');
}

.section4 {
	margin-top: 280px;
	margin-left: 740px;
	margin-bottom: 200px;
	width: 550px;
	height: 450px;
	background-image: url('../resource/img/sub1_B.jpg');
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

#kyj {
	margin-left: 0px;
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
									<h2>D E T A I L S</h2>
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
					<ul class="nav product-tabs" role="tablist" id="abd">
						<li class="nav-item"><a class="nav-link active"
							href="#profile" role="tab" data-toggle="tab">Description</a></li>
						<li class="nav-item"><a class="nav-link" href="#buzz"
							role="tab" data-toggle="tab">Recruit</a></li>
						<li class="nav-item"><a class="nav-link" href="#references"
							role="tab" data-toggle="tab">Reviews</a></li>
					</ul>
					<br>

					<div class="tab-content">

						<!-- 첫번째 카테고리 : 상품 설명 -->
						<div role="tabpanel" class="tab-pane fade in active" id="profile">
							<div class="single-product-wrapper">
								<div class="row">
									<div class="col-md-12 col-sm-6">
										<div class="quickview-slider">
											<!-- 											<div> -->
											<!-- 												<span class="text1">What comes to your mind when you -->
											<!-- 													think about 'Guitarist'?</span> -->
											<!-- 											</div> -->
											<!-- section1 -->
											<div class="section section1" data-aos="fade-up">
												<div style="width: 400px">
													<!-- 													<span style="color: red; font-weight: bold; width: 100px;">Like -->
													<!-- 														this? </span> -->
												</div>
											</div>

											<!-- section2 -->
											<div class="section section2" data-aos="fade-down">
												<div>
													<!-- 													<span>Support and <br /> Purchase -->
													<!-- 													</span> -->
												</div>
											</div>

											<!-- section3 -->
											<div class="section section3" data-aos="slide-up">
												<div>
													<!-- 													<span>Listen and <br /> Participate -->
													<!-- 													</span> -->
												</div>
											</div>

											<!-- section4 -->
											<div class="section section4" data-aos="flip-up">
												<div>
													<!-- 													<span>Support and <br /> Purchase -->
													<!-- 													</span> -->
												</div>
											</div>
										</div>
									</div>
								</div>

								<footer id="footer-4">
									<div class="container">
										<div class="d-flex justify-content-center row">
											<div class="col-xl-10">
												<div class="section-title style-four">
													<h2>I&nbsp;N&nbsp;F&nbsp;O&nbsp;R&nbsp;M&nbsp;A&nbsp;T&nbsp;I&nbsp;O&nbsp;N</h2>
												</div>
												<div class="footer-three-bottom">
													<div class="footer-three-left">
														<a href="#"> </a>
													</div>
												</div>
											</div>
											<!-- /.col-xl- -->
										</div>
										<!-- /.row -->
									</div>
									<!-- /.container -->
								</footer>
								<!-- /#footer -->

								<div id="map" style="width: 500px; height: 400px;"></div>
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
														<div class="option-box-left" style="padding-top: 10px">
															<div class="option-box-amount">${bgs1.C_CONSERTDATE}</div>
															<div class="mt5" style="padding-top: 5px">
																<span><strong>13석 남음</strong></span> <span
																	style="opacity: 0.5;">&nbsp;&nbsp;|&nbsp;&nbsp;
																	12석 판매</span>
															</div>
														</div>
														
														<div class="option-box-center" style="padding-top: 10px">
															<div class="option-box-title">${bgs1.B_TITLE}</div>
															<div class="option-box-desc mt5" style="margin-top: 10px">${bgs1.B_CONTENT}</div>
														</div>
														<div class="box_inventory option_box_grey">
															<input type="hidden" name="limited_qty_yn" value="">
															<input type="hidden" name="limited_min_qty" value="1">
															<input type="hidden" name="limited_max_qty" value="999">
															<div style="padding-top: 1px;">
																<span class="txt_count_inventory option_title">수량&nbsp;&nbsp;&nbsp;</span> 
																<input name="qty" type="text" value="1" style="color:white; background-color: black; width: 38px; height: 20px; text-align: center"
																	class="input_add" onkeyup="checkQty(this);"
																	onfocus="this.select();" style="line-height: 18px">
																<a href="javascript:void(0)" style="font-size: 1.5em">&nbsp;+&nbsp;</a>
																<a href="javascript:void(0)" style="font-size: 1.5em">-</a>
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
														<div class="option-box-amount">${bgs2.C_CONSERTDATE}</div>
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
								<div class="optionBtnBox">
									<div class="optionStepBtn">다음단계</div>
								</div>
							</div>
						</div>

						<!-- 두번째 카테고리 : 기타리스트 모집(게시판)-->
						<div role="tabpanel" class="tab-pane fade" id="buzz">
							<div class="row">
								<div class="col-md-10">
									<div>
										<h5 class="comments-title">
											Recruit Notice Board <a
												href="<c:url value='/sub1/write.ins'/>"
												class="btn btn-success" style="margin-left: 850px;">등록</a>
										</h5>
									</div>
									<table class="table table-hover table-bordered text-center">
										<tr style="height: 35px;">
											<th style="width: 7%; text-align: center;">번호</th>
											<th style="width: 70%; text-align: center;">제목</th>
											<th style="width: 10%; text-align: center;">작성자</th>
											<th style="width: 13%; text-align: center;">등록일</th>
										</tr>
										<c:if test="${empty list }" var="isEmpty">
											<tr>
												<td colspan="4">등록된 게시물이 없어요</td>
											</tr>
										</c:if>
										<c:if test="${not isEmpty }">
											<c:forEach var="item" items="${list}" varStatus="loop">
												<tr>
													<td style="text-align: center; padding-top: 10px;">${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
													<td
														style="text-align: left; padding-left: 10px; padding-top: 10px;"><a
														href="<c:url value='/sub1/view.ins?ap_no=${item.ap_no}'/>"
														class="title">${item.ap_title}</a></td>
													<td style="text-align: center; padding-top: 10px;">${item.name}</td>
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
											style="margin-left: 370px; margin-top: 20px" method="post" action="<c:url value='/sub1/subcontent.ins'/>">
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
						<!-- 세번째 카테고리 : 리뷰 게시판 -->
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
																<img
																	src="<c:url value='/resource/img/commenttemp.jpg'/>"
																	alt="Avatar">
															</div>
															<div class="comment-content">
																<h5 class="name" >Michael Cunningham</h5>
																<div class="comment-meta">
																	<div class="star-rating" id="HH">
																		<span>Rated <strong class="rating">5.00</strong>
																			out of 5
																		</span>
																	</div>
																	<span class="post-date">2018-12-25</span>
																</div>
																<p>
																	Description says it's water proof. This isn't really
																	the case, but then again I guess it's obvious from the
																	title of the product.<br> Overall very happy that
																	I purchased this jacked, plus I got a discount!
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
								<div class="col-md-10" style="margin-top: 75px">
									<div>
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
											<textarea name="content" id="content"
												class="form-message" placeholder="Review" tabindex="5"
												style="margin-top: -30px; width: 400px; height: 200px"></textarea>
											<input type="submit" id="submitComment" value="등록"
												class="btn btn-primary "
												style="width: 80px; margin-top: -30px; margin-left: 20px;">
												
											<!-- iframe 설정 -->
											<iframe id="if" name="param"></iframe>
										</form>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>
			</div>
			<!-- /.product-tab-wrapper -->
	</div>
	<!-- /.container -->
	</section>

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
	<s7cript src="<c:url value='/vendor/js/smoke.js'/>"></script>
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
	</script>