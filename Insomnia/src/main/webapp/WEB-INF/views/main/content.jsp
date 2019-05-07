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

							<c:forEach items="${rewardList }" var="rewardList">
							
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
									</div>
									<p class="hover-text">이 리워드 펀딩하기</p>
								</div>
								
							</c:forEach>
							
							<!-- 펀딩 예제
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
						--> 
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	