<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Noto Sans KR Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">


<link href="<c:url value='/vendor/css/content-reward.css'/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/vendor/css/content-wdetail.css'/>"
	rel="stylesheet" type="text/css">

<style>

#if {
	width: 0px;
	height: 0px;
	border: 0px;
}

.fromTopIn {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(0, 0);
	opacity: 1.0;
}

.fromTopOut {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(0, -10px);
	opacity: 0.0;
}

.fromBottomIn {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(0, 0);
	opacity: 1.0;
}

.fromBottomOut {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(0, 10px);
	opacity: 0.0;
}

.fromLeftIn {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(0, 0);
	opacity: 1.0;
}

.fromLeftOut {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(-10px, 0);
	opacity: 0.0;
	
}

.fromRightIn {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(0, 0);
	opacity: 1.0;
}

.fromRightOut {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: translate(10px, 0);
	opacity: 0.0;
}

.scaleUpIn {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: scale(1.0, 1.0);
	opacity: 1.0;
}

.scaleUpOut {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: scale(1.3, 1.3);
	opacity: 0.0;
}

.scaleDownIn {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: scale(1.0, 1.0);
	opacity: 1.0;
}

.scaleDownOut {
	transition: transform 1.0s ease, opacity 1.0s ease;
	transform: scale(0.7, 0.7);
	opacity: 0.0;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	letter-spacing: -.02em;
	color: rgba(0, 0, 0, .69);
	line-height: 1.5em;
	font-size: 15px;
	font-weight: 400;
}

.funding-now{
	background-color:white;
	transition: background-color 0.6s;
}

.funding-now:hover{
	background-color:rgb(151, 255, 234);
}

.count-entirety{
	padding:0px 10px;
	display:-webkit-inline-box;
}
.support-now{
	background-color:white;
	width:320px;
	padding:0 20px;
	width:280px;
	text-align:center;
}
.support-in{
	display:-webkit-inline-box;
	margin-bottom:0;
}
.band-info{
	background-color:white;
}



</style>


<script>
	$(function() {
		//페이지 뿌리기
		showComments();
		
	    //댓글 작성
	    $('#submit').click(function() {
	    	//Send Commit 누를 때
	       if ($(this).val() == 'Send Comment') {
	    	  //console.log('SEND COMMENT가 인식됩니다.');
	          var action = "<c:url value='/main/memowrite.ins'/>";
	          if($('#c_content').val() == ''){
	         		alert('내용을 입력해주세요');
	         		$('#c_content').focus();
	         		return false;
	         	}//if
	       }//if
	       //Edit Commit 누를 때
	       if ($(this).val() == 'Edit Comment') {
	          var action = "<c:url value='/main/memoedit.ins'/>";
	          console.log('액션 찍힘');
	       }
	       
	       //Reply Commit 누를 때
	       if($(this).val() == 'Reply Comment') {
		          var action = "<c:url value='/main/memoedit.ins'/>";
		          console.log('액션 찍힘');
	       }
	       $.ajax({
	          url : action,
	          data : $('#commentform').serialize(),
	          dataType : 'text',
	          type : 'post',
	          success : function() {
	             //등록 후 현재 모든 댓글 뿌려주기
	             showComments();
	             //입력 댓글 클리어 및 포커스 주기
	             $('#c_content').val('');
	             //$('#about').focus();
	             //글 수정후 등록버튼으로 다시 교체하기
	             if($('#submit').val()=='EDIT COMMENT'){
	                $('#submit').val('SEND COMMENT');
	             }
	          },
	          error : function(request, error) {
	             console.log('상태코드:', request.status);
	             console.log('서버로부터 받은 HTML데이타 :', request.responseText);
	             console.log('에러:', error);
	          }
	       });
	    })
	})//function
	//리스트
	var showComments = function() { // ★ajax를 함수로 감싸서 리스트를 뿌릴 때 쓰기
		$.ajax({
			url : '<c:url value="/main/memolist.ins"/>',
			dataType : 'json',
			success : successAjax,
			error : function(request, error) {
				console.log('왜 에러로 들어오니');
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
		console.log('successAjax로 들어왔어요');
		console.log('서버로부터 받은 데이타:', data);
			
		var tableString = "";
		$.each(data, function(index, element) {
			var A = element['PROFILE_IMG'];
			var B = "<c:url value='/upload/" +A+ "'/>;"
			console.log(B);
			
			tableString += "<li>"
			tableString += "<article class='comment-body'>";
			tableString += "<footer class='comment-meta'>";
			tableString += "<div class='comment-author'>";
			tableString += "<div class='author-thumb'>";
			tableString += "<img style='border-radius:50px;height:100px;width:100px;' alt='' src=' " +B+ "' class='avatar'>";
			tableString += "</div>";
			tableString += "<div class='author-name'>";
			tableString += "<a href='#' style='font-weight:600;font-size:1.2em' class='url'>" + element['NAME'] + "</a>";
			tableString += "<div class='comment-metadata'>";
			tableString += "<a href='#'>" + element['C_POST_DATE'] + "</a>";
			tableString += "</div>";
			tableString += "</div>";
			tableString += "</div>";
			tableString += "</footer>";
			tableString += "<div class='comment-content'>";
			tableString += "<span>" + element['C_CONTENT'] + "</span>";
			tableString += "<a href='#HH' class='commentEdit' title='"+element['BSC_NO']+"' style='color:black;font-size:0.8em;'>" + '&nbsp&nbsp[수정]' + "<span id='asd' style='display:none;'>"
            + element['C_CONTENT'] + "</span></a>"
      		tableString += "<span class='commentDelete' title='"+element['BSC_NO']+"' style='color:black;font-size:0.8em;cursor:pointer'>"
            + '&nbsp&nbsp[삭제]' + "</span>";
			tableString += "</div>";
			tableString += "<div class='reply'>";
			tableString += "<a class='comment-reply-link' href='#kyj'><i class='fa fa-reply'></i>Reply</a>";
			tableString += "</div>";
			tableString += "</article>";
			tableString += "</li>";
		});//each
		console.log("tableString:"+tableString);
		
		//리스트 뿌려주기
		$('#commentWrite').html(tableString);
		
		 //코멘트 수정]
	      $('.commentEdit').click(function(){
	         console.log('클릭한 댓글의 키(bsc_no):',$(this).attr('title'));
	         
	         //클릭한 제목으로 텍스트박스 값 설정
	         $('#c_content').val($(this).children().eq(0).html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
	         $('#submit').val('Edit Comment');
	         
	         //form의 hidden속성중 name="cno"값 설정
	         $('input[name=bsc_no]').val($(this).attr('title'));
	      });
		
	      //코멘트 삭제 
	      $('.commentDelete').click(function() {
	         console.log($('.commentDelete').attr('title'));
	         $.ajax({
	            url : '<c:url value="/main/memodelete.ins"/>',
	            data : {
	               bsc_no : $('.commentDelete').attr('title')
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
	      
	      //수정으로 돼있다면 등록으로 바꾸기
	      $('#submit').click(function(){
	         if($('#submit').val() == 'Edit Comment') {
	            ($('#submit')).val('Send Comment');
	         }
	      })
	      
	      //Reply아이콘 누를 때
	  	  $('.comment-reply-link').click(function() {
			$('#submit').val('Reply Comment');
		  })
		  
	}//successAjax
</script>

</head>

<body>


	<div id="site">

		<jsp:include page="/WEB-INF/template/Nav.jsp" />

		<!--=============================-->
		<!--=        	Artitst         =-->
		<!--=============================-->
		<div>
			<!-- Section  -->
			<section id="artist" class="section-padding section-dark"
				data-parallax="image"
				data-bg-image="<c:url value='/upload/content/main/banner/${record.sw_banner }'/> ">
				<div class="container" style="margin-top: 5%;">
					<div class="section-title text-center">
						<h2 style="padding-bottom:50px; letter-spacing:25px;">${record.b_name}</h2>
					</div>
					<!-- /.section-title -->

					<div class="row">
						<div class="col-lg-6 col-md-6 col-full-width">
							<div class="artist-image">
								<img src="<c:url value='/upload/content/main/banner/${record.sw_banner }'/>"
									alt="artist">
							</div>
							<!-- /.artist-image -->
						</div>
						<!-- /.col-lg-6 col-md-6 col-full-width -->

						<div class="col-lg-6 col-md-6 col-full-width">
							<div class="artist-details">
								<h3 class="artist-name">${record.sw_short_description }</h3>
								<h4 class="band-name">Album name</h4>

								<div class="details">
									<h3>About Me</h3>

									${record.sw_long_description }

								</div>
							</div>
							<!-- /.artist-details -->
						</div>
						<!-- /.col-lg-6 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.tim-container -->
			</section>
			<!-- /#artist -->

			<!-- Music Player -->
			<section id="banner-one">
				<div class="swiper-container banner-slider-two"
					data-swiper-config='{"loop": true, "effect": "slide", "prevButton":"#banner-nav-prev", "nextButton": "#banner-nav-next", "speed": 700, "autoplay": 500000, "paginationClickable": true}'>

					<div class="header_player">
						<div class="tim-container ">

							<!-- Audio Player -->
							<div class="player-container">
								<div class="current-tracks">
									<div id="main_player" class="jp-jplayer"></div>
									<div id="nowPlaying">
										<h3 class="track-name"></h3>
										<span class="artist-name"></span>
									</div>
									<!-- #nowPlaying -->
								</div>
								<!-- /.current-tracks -->

								<div id="header_player" class="jp-audio" role="application"
									aria-label="media player">
									<div class="jp-type-playlist clearfix">
										<div class="jp-gui jp-interface">
											<div class="jp-controls">
												<button class="jp-previous" tabindex="0">
													<i class="fa fa-backward"></i>
												</button>
												<button class="jp-play" tabindex="0">
													<i class="fa fa-play"></i>
												</button>
												<button class="jp-next" tabindex="0">
													<i class="fa fa-forward"></i>
												</button>
											</div>
											<!-- Display the track inside player -->

											<div class="jp-progress">
												<div class="jp-seek-bar">
													<div class="jp-play-bar"></div>
												</div>
											</div>

											<div class="jp-duration" role="timer" aria-label="duration"></div>

											<div class="vel-wrap">
												<button class="jp-mute" tabindex="0">
													<i class="fa fa-volume-up"></i>
												</button>

												<div class="jp-volume-bar">
													<div class="jp-volume-bar-value"></div>
												</div>

											</div>
											<!-- /.vel-wrap -->

											<button id="playlist-toggle" class="">
												<i class="fa fa-list"></i>
											</button>

											<!-- Playlist -->
											<div class="jp-playlist">
												<ul>
													<li></li>
												</ul>
											</div>
											<!-- PlayList END -->
										</div>
										<!-- class jp-gui jp-interface -->
									</div>
									<!-- class jp-type-playlist clearfix -->
								</div>
								<!-- class header-player -->
							</div>
							<!-- class player-container -->
						</div>
					</div>
					<!-- /.header_player -->
				</div>
			</section>
			<!-- /#banner-one -->

			<!-- MusicPlayer END -->


			<!--==============================-->
			<!--=     	Show schedule        =-->
			<!--==============================-->
			<div class="section">

				<section class="show-archive">
					<div class="container">
						<div class="d-flex justify-content-center row">
							<div class="col-xl-10">
								<div class="section-title style-five">
									<h2>PREVIOUS SHOWS</h2>
									<p>뭐라고 쓸까 음...</p>
								</div>
								<div class="show-archive-wrapper row no-gutters">
									<div class="offset-xs-0 offset-sm-4 col-sm-4 col-6">
										<div class="single-show-archive">
											<img src="<c:url value='/upload/content/main/shows/${record.sw_image_1 }'/>" alt="">
										</div>
									</div>
									<div class="col-6 col-sm-4">
										<div class="single-show-archive">
											<img src="<c:url value='/upload/content/main/shows/${record.sw_image_2 }'/>" alt="">
											<a href="#"><i class="fa fa-link" aria-hidden="true"></i>
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-8">
										<div class="single-show-archive video-archive">
											<img style="width:638px;" src="${record.sw_youtube_thumbnail }" alt="">
											<div class="video-player">
												<a href="${record.sw_youtube }"
													class="video-btn-three popup-video-btn"> <i
													class="fa fa-play"></i>
												</a>
												<div class="video-btn-shade">
													<i class="fa fa-play"></i>
												</div>
												<div class="text">
													<p style="margin-top: 17px;">${record.sw_youtube_title }</p>
												</div>

											</div>
										</div>
									</div>
									<div class="col-12 col-sm-4">
										<div class="single-show-archive">
											<img src="<c:url value='/upload/content/main/shows/${record.sw_image_3 }'/>" alt="">
											<a href="#"><i class="fa fa-link" aria-hidden="true"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.col-xl -->
						</div>
						<!-- /.row -->
					</div>
				</section>
				<!-- /#about -->

			</div>
			<!-- section -->


		</div>
		<!-- section -->

		<div class="container" style="margin-top: 10%;">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<article class="blog-post-list">

						<figure class="post-thumbnail">
							<a href="#"> <!--<img src="media/blog/5.jpg" alt="blog Thumb">-->
							</a>
						</figure>
						<!-- .post-thumbnail -->

						<div class="entry-content-wrapper" style="margin-top:20px;">

							<!-- 						여기에 콘텐트 내용 들어간다. -->
							
							${record.sw_content }
							
						</div>
						<!-- .entry-content-wrapper -->

					</article>
					<div class="clearfix"></div>
					
					
					<c:if test="${isSubmit == 'T'}"><!-- submit이 완료된 상태에서만 보이는 댓글창if -->
							<!-- 댓글 뿌려주는 곳 -->
							
							<div class="comments-area">
		
								<div class="comment-inner">
									<div class="reply-title">
										<h3>Comment</h3>
									</div>
									
									<ul class="comment-list" id="commentWrite">
									<!-- 이 곳에 ajax로 뿌려준다 -->
									</ul>
		
									<ul class="comment-list">
		
										<li class="comment">
											<article class="comment-body">
												<footer class="comment-meta">
													<div class="comment-author">
														<div class="author-thumb">
															<img alt="" src="<c:url value='/media/blog/10.jpg'/>"
																class="avatar">
														</div>
														<div class="author-name">
															<a href="#" class="url">John Doe</a>
		
															<div class="comment-metadata">
																<a href="#"> 14 Mar, 2018 at 7:57 am </a>
															</div>
															<!-- .comment-metadata -->
														</div>
													</div>
													<!-- .comment-author -->
		
		
													<div class="reply">
														<a class="comment-reply-link" href="#"><i
															class="fa fa-reply"></i>Reply</a>
													</div>
												</footer>
												<!-- .comment-meta -->
		
												<div class="comment-content">
													<p>Amet, consectetur adipisicing elit, sed do eiusmod
														tempor incididunt ut labore et dolore magna tunit aliqad
														minim veniam, quis nostrud exercitation ullamco labori.</p>
												</div>
												<!-- .comment-content -->
		
		
											</article> <!-- .comment-body -->
		
											<ul class="children">
												<li class="comment">
													<article class="comment-body">
														<footer class="comment-meta">
															<div class="comment-author">
																<div class="author-thumb">
																	<img alt="" src="<c:url value='/media/blog/11.jpg'/>"
																		class="avatar">
																</div>
		
																<div class="author-name">
																	<a href="#" id="HH" class="url">Jane Bloggs</a>
																	<div class="comment-metadata">
																		<a href="#">March 14, 2013 at 8:01 am</a>
																	</div>
																	<!-- .comment-metadata -->
																</div>
															</div>
															<!-- .comment-author -->
														</footer>
														<!-- .comment-meta -->
		
														<div class="comment-content">
															<p id="kyj">Amet, consectetur adipisicing elit, sed do eiusmod
																tempor incididunt ut labore et dolore magna tunit aliqad
																minim veniam, quis nostrud exercitation ullamco labori.</p>
														</div>
														<!-- .comment-content -->
		
														<div class="reply">
															<a class="comment-reply-link" href="#"><i
																class="fa fa-reply"></i>Reply</a>
														</div>
													</article> <!-- .comment-body -->
												</li>
												<!-- #comment-## -->
											</ul> <!-- .children -->
		
										</li>
										<!-- #comment-## -->
		
										<!-- #comment-## -->
									</ul>
								</div>
								<!-- /.comment-inner -->
		
								<div id="respond" class="comment-respond"
									style="margin-bottom: 30px;">
									<h3 id="reply-title" class="comment-reply-title">Leave a
										comment</h3>
									<form id="commentform" class="comment-form" target="param">
										<!-- 수정 삭제용 피라미터 -->
										<input type="hidden" name="bsc_no" />
										<p class="comment-form-comment">
											<textarea placeholder="Your Comment*" id="c_content"
												name="c_content"></textarea>
										</p>
		
										<p class="comment-form-author">
											<input placeholder="Name" id="name" name="name" type="hidden">
										</p>
		
										<p class="comment-form-email">
											<input placeholder="Email" id="email" name="email" type="hidden">
										</p>
		
										<p class="form-submit">
											<input name="submit" type="submit" id="submit" class="submit"
												value="Send Comment">
										</p>
										<!-- iframe 설정 -->
										<iframe id="if" name="param"></iframe>
									</form>
								</div>
							</div>
							<!-- /.comments-area -->
							
							<!-- 댓글 뿌려주는 곳 END -->
					</c:if><!-- submit이 완료된 상태에서만 보이는 댓글창if -->

				</div>
				<!-- /.col-lg-8 -->
				<div class="col-sm-offset-1 col-sm-3"
					style="margin-left: 100px; margin-top: 30px;">

					<!-- ------------------------------------------------------------------------------------------------------------------ -->
					<!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
					<!-- ------------------------------------------------------------------------------------------------------------------ -->

					<div id="campaign-rewards" style="position: relative; top: -50px;"></div>
					<div class="moveRewards">

						<div class="wd-ui-gift">
							
							<h3 class="project-right-title">밴드 정보</h3>		
							<div class="rightinfo-reward-list band-info" style="padding:20px;">
								<dl style="display:-webkit-inline-box; margin-bottom:0;">
									<dt>
										<a href="<c:url value='/band/bandInfo.ins?b_no=${band.b_no }'/>">
											<img src="<c:url value='/upload/band/cover/${band.b_album_cover}'/>" style="border-radius: 50%; width:80px; height:80px; margin-right:20px;">
										</a>
									</dt>
									<dd>
										<p style="font-weight:bold;font-size:20px;">${band.b_name }</p>
										<p>${band.b_description }밴드설명!</p>
									</dd>
								</dl>
							</div>
						
							<h3 class="project-right-title">리워드 선택</h3>

							<!--  여기부터 리워드 리스트 시작 -->
					

							<c:forEach items="${rewardList }" var="rewardList"> <!-- 리스트 뿌려주는 foreach문 시작 -->
							
								<div class="rightinfo-reward-list" style="width: 100%;"
									onclick="">
									<div class="top-info" style="width: 100%">
										<dl class="reward-info">
											<dt>${rewardList.rw_price }원 펀딩</dt>
											<dd>
												<p class="reward-name">${rewardList.rw_name }</p>
												<p>
													${rewardList.rw_description }
												</p>
											</dd>
										</dl>
	
										<ul class="data-info">
											<li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li>
										</ul>
										<div class="reward-count-box" style="font-size:10px;color:#929292;text-align:center;">
											<div class="up count-entirety" onclick="javascript:up(this);">△</div>
											<div class="reward-count count-entirety" style="font-size:12px;" id="${rewardList.rw_no }">0</div>
											<div class="down count-entirety" onclick="javascript:down(this);">▽</div>
										</div>
									</div>
									<p class="hover-text">이 리워드 펀딩하기</p>
								</div>
								
							</c:forEach> <!-- 리스트 뿌려주는 foreach문 END -->
							
							<!-- 후원하기 입력창 추가 -->
							<div class="rightinfo-reward-list support-now">
								<p class="support-in">후원하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><input type="text" class="support-in" style="width:160px; height:60px; border:none;"><p class="support-in">&nbsp;원</p>
							</div>
							<!-- 후원하기 입력창 추가 끝 -->
							
							<!-- 펀딩하기 버튼 추가 -->
							<div class="rightinfo-reward-list funding-now"
									onclick=""
									style="text-align:center; padding:20px; width:88%;"
									>
								<p style="margin-bottom:0;">펀딩하기!</p>	
							</div>
							<!-- 펀딩하기 버튼 추가 끝 -->

					</div>
					<!-- 와디즈 사이드 리워드 리스트 끝 -->
				</div>
				<!-- 사이드 리워드 리스트 -->

			</div>
			<!-- row -->
		</div>
	</div>
	<!--site-->
		
	<!-- 등록버튼 누르면 천천히 이동하기 -->
	
	
	
	
	
	<script>
	
	

	
	
	$(function(){
		
		//등록된 youtube링크로 썸네일 따와서 세팅
		setYoutubeThumbnail();
		//섬머노트에 기록된 텍스트 불러와서 태그안에 삽입 //컨트롤러에서 불러와서 그냥 쏴주자
		//setSummernote();
		
	});;//window.onload
	
	
	//등록된 youtube링크로 썸네일 따와서 세팅
	function setYoutubeThumbnail(url){
		var youtube = "${waiting.sw_youtube}";
		var thUrl = "http://img.youtube.com/vi/" + youtube.trim().split("watch?v=")[1] + "/mqdefault.jpg";
		$("#youtube-thumbnail").attr("src", thUrl);
	};//setYoutubeThumbnail
	
	
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
	
	
	
	
	/////////////////////////////////리워드 리스트 up down누르면 수량변경
	
	function up(obj){
		$(obj).next().text(parseInt($(obj).next().text()) + 1);
	}//up(obj)
	
	function down(obj){
		if(parseInt($(obj).prev().text()) == 0){} // 0 이라면 숫자가 밑으로 내려가지 않는다.
		else
			$(obj).prev().text(parseInt($(obj).prev().text()) - 1);
	}//down(obj)
	
	
	
	
	//////////////////////////////// b_no로 playList 가져오기
jQuery(document).ready(function($) {
  var b_no = "${record.b_no}";
  
  $.ajax({
	  url:"<c:url value='/band/loadPlayList.ins'/>",
	  type:'post',
	  dataType:'json',
	  success: function(data){
		  console.log(data);
		  loadMusicList(data);  
	  },
	  error:function(request, error){
		console.log('상태코드:',request.status);
		console.log('서버로부터 받은 HTML데이타 :',request.responseText);
		console.log('에러:',error);	
	  }
  });
  
  function loadMusicList(data){

  $('#header_player').each(function() {
    var myPlaylist = new jPlayerPlaylist({
      jPlayer: "#main_player",
      cssSelectorAncestor: "#header_player"
    },
    data, 
    {
      playlistOptions: {
        enableRemoveControls: true,
        html: '.play',
        // autoPlay: true,
      },
      swfPath: "dependencies/jPlayer/js",
      supplied: "oga, mp3",
      wmode: "window",
      useStateClassSkin: true,
      toggleDuration: true,
      autoBlur: false,
      smoothPlayBar: true,
      keyEnabled: true,
      displayTime: 'slow',
    });



    // Show The Current Track !!
    $("#main_player").on(
      $.jPlayer.event.ready + ' ' + $.jPlayer.event.play,
      function(event) {
        var current = myPlaylist.current;
        var playlist = myPlaylist.playlist;
        $.each(playlist, function(index, obj) {
          if (index == current) {
            $("#nowPlaying .track-name").html(obj.title);
            $("#nowPlaying .artist-name").html(obj.artist);
          }
        });
      });
  });
}//function showMusicList

  new jPlayerPlaylist({
    jPlayer: "#jquery_jplayer_1",
    cssSelectorAncestor: "#jp_container_1"
  }, [{
      title: "Cro Magnon Man",
      mp3: "http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3",
      oga: "http://www.jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg"
    },
    {
      title: "Your Face",
      mp3: "http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
      oga: "http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg"
    },
    {
      title: "Cyber Sonnet",
      mp3: "http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
      oga: "http://www.jplayer.org/audio/ogg/TSP-07-Cybersonnet.ogg"
    },
    {
      title: "Tempered Song",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg"
    },
    {
      title: "Hidden",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-02-Hidden.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg"
    },
    {
      title: "Lentement",
      free: true,
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-03-Lentement.ogg"
    },
    {
      title: "Lismore",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-04-Lismore.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-04-Lismore.ogg"
    },
    {
      title: "The Separation",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-05-The-separation.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-05-The-separation.ogg"
    },
    {
      title: "Beside Me",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-06-Beside-me.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-06-Beside-me.ogg"
    },
    {
      title: "Bubble",
      free: true,
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-07-Bubble.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
    },
    {
      title: "Stirring of a Fool",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-08-Stirring-of-a-fool.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-08-Stirring-of-a-fool.ogg"
    },
    {
      title: "Partir",
      free: true,
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-09-Partir.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-09-Partir.ogg"
    },
    {
      title: "Thin Ice",
      mp3: "http://www.jplayer.org/audio/mp3/Miaow-10-Thin-ice.mp3",
      oga: "http://www.jplayer.org/audio/ogg/Miaow-10-Thin-ice.ogg"
    }
  ], {
    swfPath: "../../dist/jplayer",
    supplied: "oga, mp3",
    wmode: "window",
    useStateClassSkin: true,
    autoBlur: false,
    smoothPlayBar: true,
    keyEnabled: true
  });

});
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	