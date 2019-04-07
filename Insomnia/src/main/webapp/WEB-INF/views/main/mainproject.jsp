

       <style>
          
    body{
        overflow-x:hidden;
    }

    .section{
        width:100%;
        z-index:30;
    }
    .person{
        position:fixed;
        background-image:url(vendor/img/person.png);
        background-repeat:no-repeat;
        background-size:cover;
        margin-top:16%;
        margin-left:44%;
        width:193px;
        height:311px;
        z-index:40;
    }
    .instruments{
        position:fixed;
        background-image:url(vendor/img/instruments.png);
        background-repeat:no-repeat;
        background-size:cover;
        margin-top:22%;
        height:45px;
        width:7185px;
        left:20px;
        z-index:50;
    }
    .sec{
        padding:150px;
    }
    .section1{               /* 발라드 / 포크 */
        background-image:url('vendor/img/boat.jpg');    
        background-size:cover;
        background-position:left center;
        height:100%;
        background-attachment:fixed;
        
    }
    .section2{               /* 재즈 */
        background-image:url('vendor/img/jazz.jpg');
        background-size:cover;
        background-position:top center;
        height:100%;
        background-attachment:fixed;
    }
    .section3{               /* 힙합 */
        background-image:url('vendor/img/mic.jpg');
        background-size:cover;
        background-position:left center;
        height:100%;
        background-attachment:fixed;
    }
    .section4{               /* 댄스 */
        background-image:url('vendor/img/dance.jpg');
        background-size:cover;
        background-position:top center;
        height:100%;
        background-attachment:fixed;
    }
    .section5{               /* 락 / 메탈 */
        background-image:url('vendor/img/rock.jpg');
        background-size:cover;
        background-position: left center;
        height:100%;
        background-attachment:fixed;
    }
    .section6{               /* 클래식 */
        background-image:url('vendor/img/korea.jpg');
        background-size:cover;
        background-position:top center;
        height:100%;
        background-attachment:fixed;
    }


    /* 각각의 앨범 커버들 */
    .box-shadow{
        box-shadow: 9px 9px 20px -2px rgba(0,0,0,0.4);
    }

    
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

       
       </style>

       <script>

        
$(function(){
        ///////////////////////////////////////////////////////////////////////////
        ////////////////////////////// 컨텐츠 div 생성하기 /////////////////////////
        
        var seCount = 6;
        var count = Math.round(Math.random()*5) + 20; // 카테고리별 div개수 설정 20~30
        var wh = (Math.round(Math.random()*100) + 100) + 'px';// div에 크기 설정 100~200
        var color = Math.round(Math.random()*255); // rgb값 설정을 위한           0~255
        var m = Math.round(Math.random()*50)+ 'px';// margin값 
        

        
        
        for(var i=1; i-1 < seCount; i++){

            var resultString = "";

            for(var j=0; j < count; j++){
            wh = (Math.round(Math.random()*200) + 50) + 'px';
            var red = Math.round(Math.random()*255);
            var green = Math.round(Math.random()*255);
            var blue = Math.round(Math.random()*255);
            mt = Math.round(Math.random()*100)+ 'px ';// margin값 
            mr = Math.round(Math.random()*100)+ 'px ';// margin값 
            ml = Math.round(Math.random()*100)+ 'px ';// margin값 
            mb = Math.round(Math.random()*100)+ 'px ';// margin값 

            resultString = resultString + "<div class='DIV box-shadow'  data-scroll='toggle(.scaleUpIn, .scaleDownOut)' style='width:"+wh+"; height:"+wh+";background-color:rgb("+red+","+green+","+blue+");display:inline-block; display:inline-block; position:relative; margin:"+mt+mr+ml+mb+";'></div>";
            }     

            $('.section'+i).html(resultString);
            $('.DIV').each(function(){
                var w = $(this).width();
                var h = $(this).height();
                $(this).hover(function(){
                $(this).css('transition-property', 'width, height');
                $(this).css('transition-duration', '0.2s, 0.2s');
                $(this).css('transition-timing-function', 'ease-in-out');
                $(this).css('width',w*1.3);
                $(this).css('height',h*1.3);
                },function(){
                $(this).css('width',w);
                $(this).css('height',h);
                });
            });

        }///for

        ///////////////////////////////////////////////////////////////////////////
        ////////////////////////////// 악기 바꿔주는 JQuery ////////////////////////

            $(window).scroll(function(){
                var ins = $('.instruments');
               
                if($(this).scrollTop() >= ($('.section3').position().top - 500)){
                    ins.css('transition-property', 'left');
                    ins.css('transition-duration', '1s');
                    ins.css('transition-timing-function', 'ease-in-out');
                    ins.css('left','-3660px');
                }else if($(this).scrollTop() >= ($('.section2').position().top - 500)){
                    ins.css('transition-property', 'left');
                    ins.css('transition-duration', '1s');
                    ins.css('transition-timing-function', 'ease-in-out');
                    ins.css('left','-1978px');}
                else{
                    ins.css('transition-property', 'left');
                    ins.css('transition-duration', '1s');
                    ins.css('transition-timing-function', 'ease-in-out');
                    ins.css('left','20px');
                }
            })

            /////////////////////////////////////////////////////////////////////////////
            
       });///ready     

       
        

       </script>

       </head>

    <body>
    
        <div id="site">
            
             <jsp:include page="../../template/Nav.jsp"/>
              
                <div><!-- Section  -->

        <div class="section">

            <!-- 카테고리를 알려주는 악기 transform -->
            <!-- 배경 테스트 후 적용 예정 -->
            
            <div class="person"></div>
            <div class="instruments"></div> 
            

            <!-- 앨범커버들을 띄우기 위한 section -->
            <div class="sec section1" id="ballad"></div> <!-- Ballad / Fork -->
            <div class="sec section2" id="jazz"></div> <!-- Jazz / Classic -->
            <div class="sec section3" id="hiphop"></div> <!-- Hip Hop -->
            <div class="sec section4" id='dance'></div> <!-- Dance -->
            <div class="sec section5" id="rock"></div> <!-- Rock / Metal -->
            <div class="sec section6" id="korea"></div> <!-- Korea -->
        </div><!-- section -->
                </div>
         
        </div>





        <!-- /#site -->
	<!-- Dependency Scripts -->
        <!-- 상단 네비게이션 스크롤시 다운 -->
    <script src="dependencies/jquery-ui/jquery-ui.min.js"></script>
	<script src="dependencies/bootstrap/js/bootstrap.min.js"></script>
	<script src="dependencies/swiper/js/swiper.min.js"></script>
	<script src="dependencies/swiperRunner/swiperRunner.min.js"></script>
	<script src="dependencies/magnific-popup/js/jquery.magnific-popup.min.js"></script>
	<script src="dependencies/slick-carousel/js/slick.min.js"></script>
	<script src="assets/js/headroom.js"></script>

    <!-- 사이트 스크립트 -->
    <script src="assets/js/app.js"></script>

        <!--ScrollTrigger-->
        <script src="vendor/js/ScrollTrigger.min.js"></script>
        
        <script>
        document.addEventListener('DOMContentLoaded', function(){
        var trigger = new ScrollTrigger();
        });
        </script>

    </body>
    
    
    </html>