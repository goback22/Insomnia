<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insomnia</title>
	
	<meta name="theme-color" content="#e43a90">
	
	    <!-- 
       <link rel="stylesheet" href="<c:url value='/https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'/>" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">    
       
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="<c:url value='/https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css'/>">
        -->
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	
	<!-- Dependency Styles -->
	<link rel="stylesheet" href="<c:url value='/vendor/css/bootstrap.min.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/stylesheet.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/swiper.min.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/font-awesome.min.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/animate.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/magnific-popup.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/jquery-ui.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/slick.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/colornip.min.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/css-loader.css'/>" type="text/css">
	
	<!-- Site Stylesheet -->
	<link rel="stylesheet" href="<c:url value='/vendor/css/woocommerce.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/vendor/css/app.css'/>" type="text/css">
	
	<!-- fonts -->
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond" rel="stylesheet">
    
	<!-- 로그인 처리 CSS -->
	<link href="<c:url value='/vendor/css/LoginCSS.css'/>" rel="stylesheet" />
	<script src="<c:url value='/vendor/js/FacebookLogin.js'/>"></script>
	<!-- 페이스북 로그인 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- 카카오 로그인 -->
	<script src="<c:url value='/vendor/js/kakao.js'/>"></script>
	
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value='/vendor/js/jquery.min.js'/>"></script>
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
	<script src="<c:url value='/vendor/js/soundmanager2.js'/>"></script>
	<script src="<c:url value='/vendor/js/mp3-player-button.js'/>"></script>
	<script src="<c:url value='/vendor/js/smoke.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery.fittext.js'/>"></script>
	<script src="<c:url value='/vendor/js/gmap3.min.js'/>"></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js'></script>
	<script src='<c:url value="/vendor/js/tilt.jquery.js"/>'></script>
	<script src='<c:url value="/vendor/js/parallax.min.js"/>'></script>
	<!-- Player -->
	<script src="<c:url value='/vendor/js/jquery.jplayer.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/jplayer.playlist.min.js'/>"></script>
	<script src="<c:url value='/vendor/js/myplaylist.js'/>"></script>
	<script src="<c:url value='/vendor/js/jquery-migrate-1.4.1.min.js'/>"></script>

	<!--Google map api -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsBrMPsyNtpwKXPPpG54XwJXnyobfMAIc"></script>

	<!-- Site Scripts -->
	<script src="<c:url value='/vendor/js/app.js'/>"></script>
	
	<tiles:insertAttribute name="Body"/>
	
	<!-- 푸터 부분 -->
	<tiles:insertAttribute name="Footer"/>
	
	<%--                jsp페이지 작성 규칙
	1. css파일과 js파일들의 개별화를 위해 layout.jsp에서 제공해주지 않는다.
		개별적으로 css, js를 추가시켜 </head>로 헤드를 닫아주어야 한다.
		
	2. Body부분까지 작성한 후에 </body>를 닫지않는다.
		layout.jsp가 제공해준다 </body>와 </html>태그가 포함되어있다.
		
	3. Navigation Bar는 개별적으로 jsp페이지에 붙여 사용 하도록 한다.
	사용법 : 네비게이션 바가 들어갈 자리에 jsp:include 태그를 사용한다.
	
			<jsp:include page="/WEB-INF/template/Nav.jsp"/>
			
	위의 태그를 그대로 복붙해서 사용하면 된다.
	 --%> 
	 
	 


	
	
<script>
$('.mobile-nav-btn').on('click', function(e) {
	e.preventDefault();

	$(document).scrollTop(0);
	toggleMobileHeader();
});

// a태그 (href) 클릭 시 해당 위치로 부드럽게 스크롤
$(document).on('click', 'a[href^="#"]', function (event) {
    event.preventDefault();

    // 클릭했는데 해당 id 객체가 없으면 객체가 있는 페이지로 이동시켜준다
    if ($($.attr(this, 'href')).length == 0) {
        location.href = '/' + $.attr(this, 'href');
    }
    else {
        $('html, body').animate({
            scrollTop: $($.attr(this, 'href')).offset().top
        }, 500);
    }
});

function toggleMobileHeader() {
	$('.wrapper > .header').toggleClass('menu-mobile');

	if ($('.wrapper > .header').hasClass('menu-mobile')) {
		//            $('html').css('overflow', 'hidden');
		//            $('body').css('overflow', 'hidden');
		$('html').addClass('mobile-overflow-hidden');
		$('body').addClass('mobile-overflow-hidden');
	} else {
		//            $('html').css('overflow', 'auto');
		//            $('body').css('overflow', 'auto');
		$('html').removeClass('mobile-overflow-hidden');
		$('body').removeClass('mobile-overflow-hidden');
	}
}
</script>

<!-- 글씨 효과 -->
<script>
var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
        this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
        this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
        delta = this.period;
        this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
        this.isDeleting = false;
        this.loopNum++;
        delta = 500;

        var count = $('.carousel').find('.carousel-inner .item').length;
        var index = $('.carousel').find('.carousel-inner .item.active').index();
        if (count - 1 > index) {
            $('.carousel').carousel(index + 1);
        }
        else {
            $('.carousel').carousel(0);
        }
    }

    setTimeout(function() {
        that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
            new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    document.body.appendChild(css);

    //alert(screen.height);
    //main-slide txt padding refit
    //PC
    if($("#main-slide").width()>600) {
        if ($("#main-slide").height() < 700) {
            //console.log("resize");
            $("#main-slide .carousel-contents .slide-txt").css("padding", 0);
        }
    }

    /* 자꾸 오류나서 주석해둠
    if(!qv_func.getCookie('notice_main')) {
        //tmp
        //$(".notice-obt").show();
    }
    */
};

$(window).resize(function(){
    //main-slide txt padding refit
    //PC
    if($("#main-slide").width()>600) {
        //console.log("resize");
        if ($("#main-slide").height() < 700) {
            $("#main-slide .carousel-contents .slide-txt").css("padding", 0);
        } else {
            $("#main-slide .carousel-contents .slide-txt").css("padding", "40px 40px 30px 40px");
        }
    }
});
</script>
</body>
</html>
