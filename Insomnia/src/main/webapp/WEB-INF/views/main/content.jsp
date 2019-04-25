<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Noto Sans KR Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">


<link href="<c:url value='/vendor/css/content-reward.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/vendor/css/content-wdetail.css'/>" rel="stylesheet" type="text/css">






       <style>
          
  
    
        /*****************************ì¤í¬ë¡¤ CSS****************************/

.fromTopIn{
    transition: transform 1.0s ease, opacity 1.0s ease;
    transform: translate(0,0);
    opacity: 1.0;
}
.fromTopOut{
    transition: transform 1.0s ease, opacity 1.0s ease;
    transform: translate(0,-10px);
    opacity: 0.0;
}
.fromBottomIn{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: translate(0,0);
    opacity: 1.0;
}
.fromBottomOut{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: translate(0,10px);
    opacity: 0.0;
}
.fromLeftIn{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: translate(0,0);
    opacity: 1.0;
}
.fromLeftOut{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: translate(-10px,0);
    opacity: 0.0;
}
.fromRightIn{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: translate(0,0);
    opacity: 1.0;
}
.fromRightOut{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: translate(10px, 0);
    opacity: 0.0;
}
.scaleUpIn{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: scale(1.0,1.0);
    opacity: 1.0;
}
.scaleUpOut{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: scale(1.3,1.3);
    opacity: 0.0;
}
.scaleDownIn{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: scale(1.0,1.0);
    opacity: 1.0;
}
.scaleDownOut{
    transition: transform 1.0s ease, opacity 1.0s ease;

    transform: scale(0.7,0.7);
    opacity: 0.0;
}


body{
	font-family: 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	letter-spacing: -.02em;
	color: rgba(0,0,0,.69);
	line-height: 1.5em;
	font-size: 15px;
    font-weight: 400;
    }

       </style>




  
<script>

    //////////////// ë°ë¼ë¤ëë jquery //////////////////




 
        

       </script>

       </head>

    <body>
    
        <div id="site">
            
              <jsp:include page="/WEB-INF/template/Nav.jsp"/>
                
		<!--=============================-->
		<!--=        	Artitst         =-->
        <!--=============================-->
        <div><!-- Section  -->
		<section id="artist" class="section-padding section-dark" data-parallax="image" data-bg-image="<c:url value='/resource/img/drumset.jpg'/> ">
			<div class="container" style="margin-top:5%;">
				<div class="section-title text-center">
					<h2>Artist BiO History</h2>
					<p>
						There are many variations of passages of Lorem Ipsum available but the majority have suffered<br> alteration in some injected humour.
					</p>
				</div>
				<!-- /.section-title -->

				<div class="row">
					<div class="col-lg-6 col-md-6 col-full-width">
						<div class="artist-image">
							<img src="<c:url value='/resource/img/drumset.jpg'/>" alt="artist">
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

								<p>
									There are many variations of passages of Lorem Ipsum availabe, but the majority have suffered alteration in some form by injected humour our randomiswords which don't look even slightlyassages of Lorem Ipsum availabe, but the majority have suffered alteration
									in some form by injected humour.
								</p>

								<p>
									There are many variations of passages of Lorem Ipsum availabe, but the majority have suffered alteration in some form by injected humour
								</p>

								<a href="<c:url value='/main/bandSubmit.ins'/>"><img src="<c:url value='/media/artist/2.png'/>" alt="Artist- Sing" class="sng"></a>
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
<!-- Music Player -->
<!-- Music Player -->
<!-- Music Player -->
<!-- Music Player -->
<section id="banner-one">
			<div class="swiper-container banner-slider-two" data-swiper-config='{"loop": true, "effect": "slide", "prevButton":"#banner-nav-prev", "nextButton": "#banner-nav-next", "speed": 700, "autoplay": 500000, "paginationClickable": true}'>

				<div class="header_player">
					<div class="tim-container ">
						
							<!-- Audio Player -->
						<div class="player-container">
							<div class="current-tracks">
								<div id="main_player" class="jp-jplayer">

								</div>
								<div id="nowPlaying">
									<h3 class="track-name"></h3>
									<span class="artist-name"></span>
								</div>
								<!-- #nowPlaying -->
							</div>
							<!-- /.current-tracks -->

							<div id="header_player" class="jp-audio" role="application" aria-label="media player">
								<div class="jp-type-playlist clearfix">
									<div class="jp-gui jp-interface">
										<div class="jp-controls">
											<button class="jp-previous" tabindex="0"><i class="fa fa-backward"></i></button>
											<button class="jp-play" tabindex="0"><i class="fa fa-play"></i></button>
											<button class="jp-next" tabindex="0"><i class="fa fa-forward"></i></button>
										</div>
										<!-- Display the track inside player -->

										<div class="jp-progress">
											<div class="jp-seek-bar">
												<div class="jp-play-bar"></div>
											</div>
										</div>

										<div class="jp-duration" role="timer" aria-label="duration"></div>

										<div class="vel-wrap">
											<button class="jp-mute" tabindex="0"><i class="fa fa-volume-up"></i></button>

											<div class="jp-volume-bar">
												<div class="jp-volume-bar-value"></div>
											</div>

										</div>
										<!-- /.vel-wrap -->

										<button id="playlist-toggle" class=""><i class="fa fa-list"></i></button>

										<!-- Playlist -->
										<div class="jp-playlist">
											<ul>
												<li></li>
											</ul>
										</div>
										<!-- PlayList END -->
									</div><!-- class jp-gui jp-interface -->
								</div><!-- class jp-type-playlist clearfix -->
							</div><!-- class header-player -->
						</div><!-- class player-container -->
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
							<p>There are many variations of passages of Lorem Ipsum available but the majority.</p>
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
										<a href="https://www.youtube.com/watch?v=0I8GmbDU7c4" class="video-btn-three popup-video-btn">
									<i class="fa fa-play"></i>
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
           
        </div><!-- section -->


                </div> <!-- section -->

                <div class="container" style="margin-top:10%;">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <article class="blog-post-list">
    
                                <figure class="post-thumbnail">
                                    <a href="#">
                                <!--<img src="media/blog/5.jpg" alt="blog Thumb">-->
                            </a>
                                </figure>
                                <!-- .post-thumbnail -->
    
                                <div class="entry-content-wrapper">
    
                                    <div class="entry-meta entry-meta-footer">
                                        <ul class="meta">
                                            <li>
                                                <span class="author">By
                                            <span>
                                                <a href="#">Admin</a>
                                            </span>
                                                </span>
                                            </li>
    
                                            <li>
                                                <span class="category">In
                                            <span>
                                                <a href="#">
                                                    <span>Men & woman Club</span>
                                                </a>
                                                </span>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- .entry-meta -->
    
                                    <header class="entry-header">
                                        <h1 class="entry-title">
                                            Tony Don Make the Show Bning
                                        </h1>
                                    </header>
                                    <!-- .entry-header -->
    
                                    <div class="entry-content">
                                        <p>
                                            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia
                                            animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est.
                                        </p>
    
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna tunit aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                                            dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat datat non proident, sunt in culpa quiing elit, sed do eiusmod tempor incididu officia deserunt.
                                        </p>
                                    </div>
                                    <!-- /.entry-content -->
    
                                    <blockquote>
                                        <span class="quote-icon"><i class="fa fa-quote-right"></i></span> Joining a company can be an intimidating experience, espeally if the company has a closegh-knit culture or the team has been together for some time
                                    </blockquote>
    
                                    <p>
                                        Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna tunit aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
                                        reprehenderit in voluptate velit esse cillum dolore eu fugiat.
                                    </p>
    
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
    
                                    <p>
                                        Amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna tunit aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                                        in voluptate velit esse cillum dolore eu fugiat.
                                    </p>
    
                                    <footer class="blog-footer clearfix">
    
                                        <div class="blog-count-details float-left">
                                            <a href="#"><i class="fa fa-comments"></i>20</a>
                                            <a href="#"><i class="fa fa-heart-o"></i>5</a>
                                            <a href="#"><i class="fa fa-eye"></i>125</a>
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
                                        <h3>Comment 3</h3>
                                    </div>
    
                                    <ul class="comment-list">
                                        <li class="comment">
                                            <article class="comment-body">
                                                <footer class="comment-meta">
                                                    <div class="comment-author">
                                                        <div class="author-thumb">
                                                            <img alt="" src="<c:url value='/media/blog/10.jpg'/>" class="avatar">
                                                        </div>
                                                        <div class="author-name">
                                                            <a href="#" class="url">John Doe</a>
    
                                                            <div class="comment-metadata">
                                                                <a href="#">
                                                            14 Mar, 2018 at 7:57 am
                                                        </a>
                                                            </div>
                                                            <!-- .comment-metadata -->
                                                        </div>
                                                    </div>
                                                    <!-- .comment-author -->
    
    
                                                    <div class="reply">
                                                        <a class="comment-reply-link" href="#"><i class="fa fa-reply"></i>Reply</a>
                                                    </div>
                                                </footer>
                                                <!-- .comment-meta -->
    
                                                <div class="comment-content">
                                                    <p>
                                                        Amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna tunit aliqad minim veniam, quis nostrud exercitation ullamco labori.
                                                    </p>
                                                </div>
                                                <!-- .comment-content -->
    
    
                                            </article>
                                            <!-- .comment-body -->
    
                                            <ul class="children">
                                                <li class="comment">
                                                    <article class="comment-body">
                                                        <footer class="comment-meta">
                                                            <div class="comment-author">
                                                                <div class="author-thumb">
                                                                    <img alt="" src="<c:url value='/media/blog/11.jpg'/>" class="avatar">
                                                                </div>
    
                                                                <div class="author-name">
                                                                    <a href="#" class="url">Jane Bloggs</a>
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
                                                            <p>
                                                                Amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna tunit aliqad minim veniam, quis nostrud exercitation ullamco labori.
                                                            </p>
                                                        </div>
                                                        <!-- .comment-content -->
    
                                                        <div class="reply">
                                                            <a class="comment-reply-link" href="#"><i class="fa fa-reply"></i>Reply</a>
                                                        </div>
                                                    </article>
                                                    <!-- .comment-body -->
                                                </li>
                                                <!-- #comment-## -->
                                            </ul>
                                            <!-- .children -->
    
                                        </li>
                                        <!-- #comment-## -->
    
                                        <li class="comment">
                                            <article class="comment-body">
                                                <footer class="comment-meta">
                                                    <div class="comment-author">
                                                        <div class="author-thumb">
                                                            <img alt="" src="<c:url value='/media/blog/12.jpg'/>" class="avatar">
                                                        </div>
                                                        <div class="author-name">
                                                            <a href="#" class="url">Jane Doe</a>
    
                                                            <div class="comment-metadata">
                                                                <a href="#">18 Mar, 2018 at 7:00 am</a>
                                                            </div>
                                                            <!-- .comment-metadata -->
                                                        </div>
                                                    </div>
                                                    <!-- .comment-author -->
    
                                                </footer>
                                                <!-- .comment-meta -->
    
                                                <div class="comment-content">
                                                    <p>
                                                        Amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna tunit aliqad minim veniam, quis nostrud exercitation ullamco labori.
                                                    </p>
                                                </div>
                                                <!-- .comment-content -->
    
                                                <div class="reply">
                                                    <a class="comment-reply-link" href="#"><i class="fa fa-reply"></i>Reply</a>
                                                </div>
    
                                            </article>
                                            <!-- .comment-body -->
                                        </li>
                                        <!-- #comment-## -->
                                    </ul>
                                </div>
                                <!-- /.comment-inner -->
    
                                <div id="respond" class="comment-respond" style="margin-bottom:30px;">
                                    <h3 id="reply-title" class="comment-reply-title">
                                        Leave a comment
                                    </h3>
                                    <form action="#" id="commentform" class="comment-form">
    
                                        <p class="comment-form-comment">
                                            <textarea placeholder="Your Comment*" id="comment" name="comment"></textarea>
                                        </p>
    
                                        <p class="comment-form-author">
                                            <input placeholder="Name" id="author" name="author" type="text">
                                        </p>
    
                                        <p class="comment-form-email">
                                            <input placeholder="Email" id="email" name="email" type="text">
                                        </p>
    
                                        <p class="comment-form-website">
                                            <input placeholder="Your Web Site" id="website" name="website" type="text">
                                        </p>
    
                                        <p class="form-submit">
                                            <input name="submit" type="submit" id="submit" class="submit" value="Send Comment">
                                        </p>
    
                                    </form>
                                </div>
                            </div>
                            <!-- /.comments-area -->
                        </div>
                        <!-- /.col-lg-8 -->
                        <!-- ì½íí¸ ì¤ëª ë -->
                        <!-- ì¬ì´ë ë¸ë ì¬ê¸° -->
                        <div class="col-sm-offset-1 col-sm-3" style="margin-left:100px; margin-top:30px;">
                            
                            
                            <!-- ------------------------------------------------------------------------------------------------------------------ -->
                                								 <!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
                            <!-- ------------------------------------------------------------------------------------------------------------------ -->    								 
                                								 
                                								 
			              <div id="campaign-rewards" style="position: relative; top:-50px;"></div>
			              <div class="moveRewards">
			              
			                <div class="wd-ui-gift">
			                  <h3 class="project-right-title">리워드 선택</h3>
			                  
			                  <!--  여기부터 리워드 리스트 시작 -->
			                  
			                  
			                  <div class="rightinfo-reward-list" style="width:100%;" onclick="" >
			                  <div class="top-info" style="width:100%">
			                    <dl class="reward-info">
			                      <dt>
			                        179,000원 펀딩
			                      </dt>
			                      <dd>
			                        <p class="reward-name">[슈퍼얼리버드] 루퍼 - NICK백팩</p>
			                        <p>슈퍼얼리버드 NICK백팩을 리워드 할 수 있습니다.<br>45%할인 혜택<br>316,000원 -> 179,000원  <br><br>선착순 100명 한정<br><br>제품구성<br>+ NICK 백팩 (사이즈 S,M,L)<br>+ 고급 노트북파우치 무료 제공<br>+ SIM 카드 보관 파우치 (목걸이 포함) 무료 제공<br></p>
			                      </dd>
			                    </dl>
			                    
			                    <ul class="data-info">
			                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li>
			                      <li class="date" style="width: 100%;">리워드 발송 시작일
			                        <em>2019년 06월 초 (1~10일) 예정</em>
			                      </li>
			                    </ul>
			                  </div>
			                    <p class="hover-text">이 리워드 펀딩하기</p>
			                  </div>
			                  
			                  
			                  
			                  <div class="rightinfo-reward-list" style="width:100%;" onclick="" >
			                  <div class="top-info" style="width:100%">
			                    <dl class="reward-info">
			                      <dt>
			                        179,000원 펀딩
			                      </dt>
			                      <dd>
			                        <p class="reward-name">[슈퍼얼리버드] 루퍼 - NICK백팩</p>
			                        <p>슈퍼얼리버드 NICK백팩을 리워드 할 수 있습니다.<br>45%할인 혜택<br>316,000원 -> 179,000원  <br><br>선착순 100명 한정<br><br>제품구성<br>+ NICK 백팩 (사이즈 S,M,L)<br>+ 고급 노트북파우치 무료 제공<br>+ SIM 카드 보관 파우치 (목걸이 포함) 무료 제공<br></p>
			                      </dd>
			                    </dl>
			                    
			                    <ul class="data-info">
			                      <li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li>
			                      <li class="date" style="width: 100%;">리워드 발송 시작일
			                        <em>2019년 06월 초 (1~10일) 예정</em>
			                      </li>
			                    </ul>
			               
			                  </div>
			                  
			                    <p class="hover-text">이 리워드 펀딩하기</p>
			                  </div>
			                  
			                  
			              </div><!-- 여기 위에 추가시키면 리워드 늘어남 -->
			            
			              
			              
                        </div><!-- 와디즈 사이드 리워드 리스트 끝 -->
					</div><!-- 사이드 리워드 리스트 -->
					
				</div><!-- row -->
         	</div>
        </div><!--site-->






