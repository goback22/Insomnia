<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


       <style>
           body{
               width:100%;
               background-color:#171717;
           }
           #site{
               width:100%;
           }


           /* ë°°ë */
           .banner{
               width:100%;
           }
           .banner-video{
                width:100%;
           }
           .queen{
               width:100%;
           }
           
           .banner-title{
                font-family: 'Cormorant Garamond', serif;
                border-bottom:4px solid orange;
                color:white;
                position:absolute;
                padding:80px;
                top:300px;
                margin-left:27%;
                font-size:120px;
           }
           
           
       
       </style>

       <script>


       </script>
       

       </head>

    <body style="background-color:black;">
    
        <div id="site">
            
          <!-- 네비게이션 바 인클루드 -->
          <jsp:include page="../template/Nav.jsp"/>
          
            <!-- í¸ -->
            <div class="banner">
                <div class="banner-video"><video class="queen" loop autoplay muted src="resource/video/queen.mp4"></video></div>
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
     						<p style="font-size: 1.4em; color:#6c757d;">뜨거운 밴드, 뜨거운 음악들</p> 
                        </div>
                    </div>
                    <div class="swiper-container row" data-swiper-config='{ "loop": true, "prevButton":".swiper-button-prev", "nextButton": ".swiper-button-next", "speed": 700, "autoplay": "5000", "slidesPerView": 6, "spaceBetween": 0, "grabCursor": true,"breakpoints": { "1300": { "slidesPerView": 4 }, "767": { "slidesPerView": 3 }, "500": { "slidesPerView": 1 }}}'>
                        <ul class="artist-line-wrapper swiper-wrapper">
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a1.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
    
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a2.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
    
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a3.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
    
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a4.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a1.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
    
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a2.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
    
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a3.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
    
                            <li class="artist-single clearfix swiper-slide">
                                <img src="media/artist/a4.jpg" alt="">
                                <div class="artist-single-content">
                                    <ul>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="<c:url value='/#'/>"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <h6>James Hetfield</h6>
                                    <p>Band: Metallica</p>
                                </div>
                            </li>
                        </ul>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
                <!-- /.tim-container -->
            </section>
            <!-- /#about -->

            </div><!-- hot track ë -->

        </div>





