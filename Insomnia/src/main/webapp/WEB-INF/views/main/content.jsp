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
</style>

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
				data-bg-image="<c:url value='/resource/img/drumset.jpg'/> ">
				<div class="container" style="margin-top: 5%;">
					<div class="section-title text-center">
						<h2>Artist BiO History</h2>
						<p>
							There are many variations of passages of Lorem Ipsum available
							but the majority have suffered<br> alteration in some
							injected humour.
						</p>
					</div>
					<!-- /.section-title -->

					<div class="row">
						<div class="col-lg-6 col-md-6 col-full-width">
							<div class="artist-image">
								<img src="<c:url value='/resource/img/drumset.jpg'/>"
									alt="artist">
							</div>
							<!-- /.artist-image -->
						</div>
						<!-- /.col-lg-6 col-md-6 col-full-width -->

						<div class="col-lg-6 col-md-6 col-full-width">
							<div class="artist-details">
								<h3 class="artist-name">Itâs james robinson</h3>
								<h4 class="band-name">Band Name Here</h4>

								<div class="details">
									<h3>About Me</h3>

									<p>There are many variations of passages of Lorem Ipsum
										availabe, but the majority have suffered alteration in some
										form by injected humour our randomiswords which don't look
										even slightlyassages of Lorem Ipsum availabe, but the majority
										have suffered alteration in some form by injected humour.</p>

									<p>There are many variations of passages of Lorem Ipsum
										availabe, but the majority have suffered alteration in some
										form by injected humour</p>

									<a href="<c:url value='/main/bandSubmit.ins'/>"><img
										src="<c:url value='/media/artist/2.png'/>" alt="Artist- Sing"
										class="sng"></a>
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
									<p>There are many variations of passages of Lorem Ipsum
										available but the majority.</p>
								</div>
								<div class="show-archive-wrapper row no-gutters">
									<div class="offset-xs-0 offset-sm-4 col-sm-4 col-6">
										<div class="single-show-archive">
											<img src="<c:url value='/media/album/18.jpg'/>" alt="">
											<a href="#"><i class="fa fa-link" aria-hidden="true"></i>
											</a>
										</div>
									</div>
									<div class="col-6 col-sm-4">
										<div class="single-show-archive">
											<img src="<c:url value='/media/album/19.jpg'/>" alt="">
											<a href="#"><i class="fa fa-link" aria-hidden="true"></i>
											</a>
										</div>
									</div>
									<div class="col-xs-12 col-sm-8">
										<div class="single-show-archive video-archive">
											<img src="<c:url value='/media/album/20.jpg'/>" alt="">
											<div class="video-player">
												<a href="https://www.youtube.com/watch?v=0I8GmbDU7c4"
													class="video-btn-three popup-video-btn"> <i
													class="fa fa-play"></i>
												</a>
												<div class="video-btn-shade">
													<i class="fa fa-play"></i>
												</div>
												<div class="text">
													<p>Show Stoppers Time</p>
													<span>(Live in Tokyo, 2017)</span>
												</div>

											</div>
										</div>
									</div>
									<div class="col-12 col-sm-4">
										<div class="single-show-archive">
											<img src="<c:url value='/media/album/21.jpg'/>" alt="">
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

						<div class="entry-content-wrapper">

							<div class="entry-meta entry-meta-footer">
								<ul class="meta">
									<li><span class="author">By <span> <a
												href="#">Admin</a>
										</span>
									</span></li>

									<li><span class="category">In <span> <a
												href="#"> <span>Men & woman Club</span>
											</a>
										</span>
									</span></li>
								</ul>
							</div>
							<!-- .entry-meta -->

							<header class="entry-header">
								<h1 class="entry-title">Tony Don Make the Show Bning</h1>
							</header>
							<!-- .entry-header -->

							<div class="entry-content">
								<p>At vero eos et accusamus et iusto odio dignissimos
									ducimus qui blanditiis praesentium voluptatum deleniti atque
									corrupti quos dolores et quas molestias excepturi sint
									occaecati cupiditate non provident, similique sunt in culpa qui
									officia deserunt mollitia animi, id est laborum et dolorum
									fuga. Et harum quidem rerum facilis est.</p>

								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									tunit aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodo
									consequat. Duis aute irure dolor in reprehenderit in voluptate
									velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
									sint occaecat datat non proident, sunt in culpa quiing elit,
									sed do eiusmod tempor incididu officia deserunt.</p>
							</div>
							<!-- /.entry-content -->

							<blockquote>
								<span class="quote-icon"><i class="fa fa-quote-right"></i></span>
								Joining a company can be an intimidating experience, espeally if
								the company has a closegh-knit culture or the team has been
								together for some time
							</blockquote>

							<p>Dolor sit amet, consectetur adipisicing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna tunit
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor in reprehenderit in voluptate velit esse cillum
								dolore eu fugiat.</p>

							<ul class="clearfix">
								<li>Consectetur adipisicing elit, sed do eiusmod</li>
								<li>Ullamco laboris nisi ut aliquip ex ea</li>
								<li>Tempor incididunt ut labore et dolore magna</li>
								<li>Voluptate velit esse cillum dolore eu fugiat.</li>
								<li>Llamco laboris nisi ut aliquip ex ea commodo world</li>
								<li>Ut enim ad minim veniam, quis nostrud</li>
								<li>Sed do eiusmod tempor incididu officia deserunt.</li>
								<li>Exercitation ullamco laboris nisi ut aliquip</li>
							</ul>

							<p>Amet, consectetur adipisicing elit, sed do eiusmod tempor
								incididunt ut labore et dolore magna tunit aliqua. Ut enim ad
								minim veniam, quis nostrud exercitation ullamco laboris nisi ut
								aliquip ex ea commodo consequat. Duis aute irure dolor in
								reprehenderit in voluptate velit esse cillum dolore eu fugiat.</p>

							<footer class="blog-footer clearfix">

								<div class="blog-count-details float-left">
									<a href="#"><i class="fa fa-comments"></i>20</a> <a href="#"><i
										class="fa fa-heart-o"></i>5</a> <a href="#"><i
										class="fa fa-eye"></i>125</a>
								</div>
								<!-- /.blog-count-details -->
											
								<ul class="shared-link float-right">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram"></i></a></li>
								</ul>
							</footer>

						</div>
						<!-- .entry-content-wrapper -->

					</article>
					<div class="clearfix"></div>



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
							<h3 class="project-right-title">리워드 선택</h3>

							<!--  여기부터 리워드 리스트 시작 -->


							<div class="rightinfo-reward-list" style="width: 100%;"
								onclick="">
								<div class="top-info" style="width: 100%">
									<dl class="reward-info">
										<dt>179,000원 펀딩</dt>
										<dd>
											<p class="reward-name">[슈퍼얼리버드] 루퍼 - NICK백팩</p>
											<p>
												슈퍼얼리버드 NICK백팩을 리워드 할 수 있습니다.<br>45%할인 혜택<br>316,000원
												-> 179,000원 <br> <br>선착순 100명 한정<br> <br>제품구성<br>+
												NICK 백팩 (사이즈 S,M,L)<br>+ 고급 노트북파우치 무료 제공<br>+ SIM
												카드 보관 파우치 (목걸이 포함) 무료 제공<br>
											</p>
										</dd>
									</dl>

									<ul class="data-info">
										<li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li>
										<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2019년
												06월 초 (1~10일) 예정</em>
										</li>
									</ul>
								</div>
								<p class="hover-text">이 리워드 펀딩하기</p>
							</div>



							<div class="rightinfo-reward-list" style="width: 100%;"
								onclick="">
								<div class="top-info" style="width: 100%">
									<dl class="reward-info">
										<dt>179,000원 펀딩</dt>
										<dd>
											<p class="reward-name">[슈퍼얼리버드] 루퍼 - NICK백팩</p>
											<p>
												슈퍼얼리버드 NICK백팩을 리워드 할 수 있습니다.<br>45%할인 혜택<br>316,000원
												-> 179,000원 <br> <br>선착순 100명 한정<br> <br>제품구성<br>+
												NICK 백팩 (사이즈 S,M,L)<br>+ 고급 노트북파우치 무료 제공<br>+ SIM
												카드 보관 파우치 (목걸이 포함) 무료 제공<br>
											</p>
										</dd>
									</dl>

									<ul class="data-info">
										<li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li>
										<li class="date" style="width: 100%;">리워드 발송 시작일 <em>2019년
												06월 초 (1~10일) 예정</em>
										</li>
									</ul>

								</div>

								<p class="hover-text">이 리워드 펀딩하기</p>
							</div>


						</div>
						<!-- 여기 위에 추가시키면 리워드 늘어남 -->



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