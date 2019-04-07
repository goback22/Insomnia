<!doctype html>

<html lang="en">
<head>
   <meta charset="utf-8">
   <title>unNamed.html</title>



       <!-- 기본 부트스트랩 최신자와 제이쿼리 최신자 (적용되지 않는 스타일에 대해 구버전을 섞었음)-->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
       <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
       <!-- JQuery Migrate Plugin -->
       <script src="vendor/js/jquery-migrate-1.4.1.min.js"></script>

       <!-- JQuery for ScrollTrigger -->
       <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

       

       <!-- site style sheets -->
       	<!-- Dependency Styles -->
	<link rel="stylesheet" href="dependencies/bootstrap/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="dependencies/intro/css/stylesheet.css" type="text/css">
	<link rel="stylesheet" href="dependencies/font-awesome/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="dependencies/wow/css/animate.css" type="text/css">
	<link rel="stylesheet" href="dependencies/magnific-popup/magnific-popup.css" type="text/css">


	<!-- Site Stylesheet -->
	<link rel="stylesheet" href="assets/css/woocommerce.css" type="text/css">
	<link rel="stylesheet" href="assets/css/app.css" type="text/css">
	

       <!-- fonts -->
       <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond" rel="stylesheet">





       <style>
          
  
    
        /*****************************스크롤 CSS****************************/

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



.floating-menu{
   border:1px solid red; 
   top:1px; 
   left:1px;
   position:absolute;
}

       </style>




  
<script>

    //////////////// 따라다니는 jquery //////////////////


$(document).ready(function() {

	var currentPosition = parseInt($(".floating-menu").css("top")); 
    $(window).scroll(function() { 

        var position = $(window).scrollTop()+currentPosition; 

    $(".floating-menu").stop().animate({
        "top":position+"px"
        },1000); 

        console.log($(".floating-menu").css("top"));

        });



});

 
        

       </script>

       </head>

    <body>
    
        <div id="site">
            
              <jsp:include page="../template/Nav.jsp"/>
                
		<!--=============================-->
		<!--=        	Artitst         =-->
        <!--=============================-->
        <div><!-- Section  -->
		<section id="artist" class="section-padding section-dark" data-parallax="image" data-bg-image="vendor/img/drumset.jpg">
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
							<img src="vendor/img/drumset.jpg" alt="artist">
						</div>
						<!-- /.artist-image -->
					</div>
					<!-- /.col-lg-6 col-md-6 col-full-width -->

					<div class="col-lg-6 col-md-6 col-full-width">
						<div class="artist-details">
							<h3 class="artist-name">It’s james robinson</h3>
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

								<img src="media/artist/2.png" alt="Artist- Sing" class="sng">
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



                    
		<!--==============================-->
		<!--=     	Show schedule        =-->
		<!--==============================-->
        <div class="section">

		<section class="show-archive">
			<div class="container" style="margin-top:20%;">
				<div class="d-flex justify-content-center row">
					<div class="col-xl-10">
						<div class="section-title style-five">
							<h2>PREVIOUS SHOWS</h2>
							<p>There are many variations of passages of Lorem Ipsum available but the majority.</p>
						</div>
						<div class="show-archive-wrapper row no-gutters">
							<div class="offset-xs-0 offset-sm-4 col-sm-4 col-6">
								<div class="single-show-archive">
									<img src="media/album/18.jpg" alt="">
									<a href="#"><i class="fa fa-link" aria-hidden="true"></i>
							</a>
								</div>
							</div>
							<div class="col-6 col-sm-4">
								<div class="single-show-archive">
									<img src="media/album/19.jpg" alt="">
									<a href="#"><i class="fa fa-link" aria-hidden="true"></i>
							</a>
								</div>
							</div>
							<div class="col-xs-12 col-sm-8">
								<div class="single-show-archive video-archive">
									<img src="media/album/20.jpg" alt="">
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
									<img src="media/album/21.jpg" alt="">
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
                                                            <img alt="" src="media/blog/10.jpg" class="avatar">
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
                                                                    <img alt="" src="media/blog/11.jpg" class="avatar">
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
                                                            <img alt="" src="media/blog/12.jpg" class="avatar">
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
    
                                <div id="respond" class="comment-respond">
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
                        <!-- 콘텐트 설명 끝 -->
                        <!-- 사이드 노래 사기 -->
                        <div class="col-sm-offset-1 col-sm-3" style="border:1px solid green;">
                            <div class="floating-menu">
                                <a href="#" class=" tim-btn">Support it!</a>
                            </div>
                        </div>


         
        </div><!--site-->






        <!--ScrollTrigger-->
        <script src="vendor/js/ScrollTrigger.min.js"></script>
        
        <script>
        document.addEventListener('DOMContentLoaded', function(){
        var trigger = new ScrollTrigger();
        });
        </script>

