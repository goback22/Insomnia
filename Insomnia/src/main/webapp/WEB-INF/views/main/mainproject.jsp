<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>


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
        background-image:url(../resource/img/person.png);
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
        background-image:url(../resource/img/instruments.png);
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
    .section1{               /* ë°ë¼ë / í¬í¬ */
        background-image:url('../resource/img/main-folk.jpg');    
        background-size:cover;
        background-position:left center;
        height:100%;
        background-attachment:fixed;
        
    }
    .section2{               /* ì¬ì¦ */
        background-image:url('../resource/img/main-jazz.jpg');
        background-size:cover;
        background-position:top center;
        height:100%;
        background-attachment:fixed;
    }
    .section3{               /* íí© */
        background-image:url('../resource/img/main-hiphop.jpg');
        background-size:cover;
        background-position:left center;
        height:100%;
        background-attachment:fixed;
    }
    .section4{               /* ëì¤ */
        background-image:url('../resource/img/main-dance.jpg');
        background-size:cover;
        background-position:top center;
        height:100%;
        background-attachment:fixed;
    }
    .section5{               /* ë½ / ë©í */
        background-image:url('../resource/img/main-rock.jpg');
        background-size:cover;
        background-position: left center;
        height:100%;
        background-attachment:fixed;
    }
    .section6{               /* í´ëì */
        background-image:url('../resource/img/korea.jpg');
        background-size:cover;
        background-position:top center;
        height:100%;
        background-attachment:fixed;
    }


    /* ê°ê°ì ì¨ë² ì»¤ë²ë¤ */
    .box-shadow{
        box-shadow: 9px 9px 20px -2px rgba(0,0,0,0.4);
    }

.DIV{
	display:inline-block;
	position:relative;
	background-position: center;
	bandground-repeat: no-repeat;
	background-size:cover;
	transition-property: width, height;
    transition-duration: 0.2s, 0.2s;
    transition-timing-function:ease-in-out;
}
    
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

       
       </style>

       <script>

        
$(function(){
       
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
        	});//each        
        
       });///ready     

       
        

       </script>

       </head>

    <body>
    
        <div id="site">
            
             <jsp:include page="../../template/Nav.jsp"/>
              
                <div><!-- Section  -->

        <div class="section">

           
           	<!--  
            <div class="person"></div>
            <div class="instruments"></div>
             --> 
            

            <!--  음악 카테고리별 섹션 section -->
            <div class="sec section1" id="ballad">
            	<c:forEach items="${folk }" var="folk">
            		<a href='/insomnia/band/bandInfo.ins?b_no=${folk.b_no }'>
			        	<div class='DIV box-shadow' data-scroll='toggle(.scaleUpIn, .scaleDownOut)'
			        	 style="width:${folk.wh}; 
			        	 height:${folk.wh}; 
			        	 margin:${folk.mt} ${folk.mr} ${folk.mb} ${folk.ml};
			        	background-image:url(/insomnia/upload/band/cover/${folk.b_album_cover});">
			        	</div>
			        </a>
            	</c:forEach>
            </div> <!-- Ballad / Fork -->
            <div class="sec section2" id="jazz">
            	<c:forEach items="${jazz }" var="jazz">
            		<a href='/insomnia/band/bandInfo.ins?b_no=${jazz.b_no }'>
			        	<div class='DIV box-shadow' data-scroll='toggle(.scaleUpIn, .scaleDownOut)'
			        	 style="width:${jazz.wh}; 
			        	 height:${jazz.wh}; 
			        	 margin:${jazz.mt} ${jazz.mr} ${jazz.mb} ${jazz.ml};
			        	background-image:url(/insomnia/upload/band/cover/${jazz.b_album_cover});">
			        	</div>
			        </a>
            	</c:forEach>
            </div> <!-- Jazz / Classic -->
            <div class="sec section3" id="hiphop">
            	<c:forEach items="${hiphop }" var="hiphop">
            		<a href='/insomnia/band/bandInfo.ins?b_no=${hiphop.b_no }'>
			        	<div class='DIV box-shadow' data-scroll='toggle(.scaleUpIn, .scaleDownOut)'
			        	 style="width:${hiphop.wh};
			        	 height:${hiphop.wh}; 
			        	 margin:${hiphop.mt} ${hiphop.mr} ${hiphop.mb} ${hiphop.ml};
			        	background-image:url(/insomnia/upload/band/cover/${hiphop.b_album_cover});">
			        	</div>
			        </a>
            	</c:forEach>
            </div> <!-- Hip Hop -->
            <div class="sec section4" id='dance'>
            	<c:forEach items="${dance }" var="dance">
            		<a href='/insomnia/band/bandInfo.ins?b_no=${dance.b_no }'>
			        	<div class='DIV box-shadow' data-scroll='toggle(.scaleUpIn, .scaleDownOut)'
			        	 style="width:${dance.wh}; 
			        	 height:${dance.wh}; 
			        	 margin:${dance.mt} ${dance.mr} ${dance.mb} ${dance.ml};
			        	background-image:url(/insomnia/upload/band/cover/${dance.b_album_cover});">
			        	</div>
			        </a>
            	</c:forEach>
            </div> <!-- Dance -->
            <div class="sec section5" id="rock">
            	<c:forEach items="${rock }" var="rock">
            		<a href='/insomnia/band/bandInfo.ins?b_no=${rock.b_no }'>
			        	<div class='DIV box-shadow' data-scroll='toggle(.scaleUpIn, .scaleDownOut)'
			        	 style="width:${rock.wh}; 
			        	 height:${rock.wh}; 
			        	 margin:${rock.mt} ${rock.mr} ${rock.mb} ${rock.ml};
			        	background-image:url(/insomnia/upload/band/cover/${rock.b_album_cover});">
			        	</div>
			        </a>
            	</c:forEach>
            </div> <!-- Rock / Metal -->
            <div class="sec section6" id="korea">
            	<c:forEach items="${traditional }" var="traditional">
            		<a href='/insomnia/band/bandInfo.ins?b_no=${traditional.b_no }'>
			        	<div class='DIV box-shadow' data-scroll='toggle(.scaleUpIn, .scaleDownOut)'
			        	 style="width:${traditional.wh}; 
			        	 height:${traditional.wh}; 
			        	 margin:${traditional.mt} ${traditional.mr} ${traditional.mb} ${traditional.ml};
			        	background-image:url(/insomnia/upload/band/cover/${traditional.b_album_cover});">
			        	</div>
			        </a>
            	</c:forEach>
            </div> <!-- Korea -->
        </div><!-- section -->
                </div>
         
        </div>





  

		<!--ScrollTrigger-->
    	<script src="<c:url value='/vendor/js/ScrollTrigger.min.js'/>"></script>
        
        <script>
        document.addEventListener('DOMContentLoaded', function(){
        var trigger = new ScrollTrigger();
        });
        
        
        function goBandInfoGET(b_no){
        	alert("goBandInfoGET : " + b_no);
        	var form = document.createElement("form");
        	form.action ="/insomnia/band/bandInfo.ins?b_no="+b_no;
        	form.method = "GET";
        	document.body.appendChild(form);
        	form.submit();
        }//goBandInfoGET
        
        
        
        </script>
