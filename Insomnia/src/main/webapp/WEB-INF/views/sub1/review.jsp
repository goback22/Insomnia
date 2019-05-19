<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp"%>


<!-- Meta Data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta HTTP-EQUIV="Page-exit" content="BlendTrans(Duration=1)" />
<meta HTTP-EQUIV="Page-enter" content="BlendTrans(Duration=1)" />

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

<!-- 공지사항 -->
<script type="text/javascript" src="<c:url value='/vendor/js/obt.js'/>"></script>
<script type="text/javascript" src="<c:url value='/vendor/js/obt2.js'/>"></script>

<!-- JQuery UI -->
<script type="text/javascript" src="<c:url value='/vendor/js/jquery-ui.js'/>"></script>


<!-- PayMoving js -->
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>
<script>
   $(function() {
     //로드 시 작성 칸 숨기기
     $('#my').hide();
      
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
              
            //별점, 내용 유효성 체크
            if($('#starCount').val() == ''){
                 alert('별점을 클릭하세요');
                 return false;
            }
            
            else if($('#content').val() == ''){
                 alert('내용을 입력해주세요');
                 return false;
              }//if
              
              if($('.rating').hide()){
                 $('.rating').show();
               $('#frm').css('margin-top','0px');
              }
         }//if
         
          //Edit Commit 누를 때
          if ($(this).val() == '수정') {
             var action = "<c:url value='/sub1/memoedit.ins'/>";
             $('.rating').show();
          }
          
          //Reply Commit 누를 때
          if($(this).val() == '답변') {
             var action = "<c:url value='/sub1/replywrite.ins'/>";
             
             $('.rating').show();
             $('#frm').css('margin-top','0px');
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
//                if($('#submitComment').val()=='수정'){
//                   $('#submitComment').val('등록');
//                }
            },
            error : function(request, error) {
               console.log('상태코드:', request.status);
               console.log('서버로부터 받은 HTML데이타 :', request.responseText);
               console.log('에러:', error);
            }
         });
      })
      
      $(function(){         
         $('.star').click(function(){
            $('#starCount').val($(this).index());
            console.log($('#starCount').val()); //클릭하면 별의 개수가 카운터에 찍힌다.
         });
      });
   }); //function
   
   //무한 스크롤
   $(window).scroll(function () {
   if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
      console.log('스크롤이 충돌하였습니다.');
       //스크롤 충돌 시 새로운 10개 목록 보여주기
      var lastNo = $('.commentReply:last').attr('title');
       
       
       console.log('lastNo:'+lastNo);
       
       $.ajax({
          url : '<c:url value="/sub1/newCommentList.ins"/>',
          data : {r_no : lastNo}, 
          dataType : 'text',
          success : showNewComments,
          error : function(request, error) {
                console.log('상태코드:', request.status);
                console.log('서버로부터 받은 HTML데이타 :', request.responseText);
                console.log('에러:', error);
            }       
       })//ajax
      }//if
   });//function
   
   var showNewComments = function(data) {
      console.log('서버로부터 받은 데이타:', data);
      
      var tableString = "";
      if(data != ""){
      $.each(JSON.parse(data),function(index, element) {
         var B = 70;
         tableString += "<li>";
         tableString += "<article style='margin-left:"+B*element['DEPTH']+"px' class='review-comment'>";
           var A = "https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/" + element['PROFILE_IMG'] + "";
          tableString += "<div class='user-avatar'>";
          tableString += "<img style='border-radius:50px;height:70px;width:70px;' src='" +A+ "'>";

          tableString += "</div>";
          tableString += "<div class='comment-content'>";
          tableString += "<h5 class='name'>"
                + element['NAME'] + "</h5>";
          tableString += "<div class='comment-meta'>";
          if(element['DEPTH'] == '0'){
          tableString += "<div class='star-rating_"+element['STARS']+"'>";
          tableString += "<span>Rated <strong class='rating'>5.00</strong>out of 5</span>";
          tableString += "</div>";
          }
          tableString += "<span class='post-date'>"
                + element['POSTDATE'] + "</span>";
          tableString += "</div>";
          tableString += "<span>" + element['CONTENT'] + "</span>"
          if('${sessionScope.id}' == element   ['ID']){
          tableString += "<a href='#HH' class='commentEdit' title='"+element['R_NO']+"' style='color:white;font-size:0.8em;'>" + '&nbsp&nbsp[수정]' + "<span id='asd' style='display:none;'>"
                + element['CONTENT'] + "</span></a>"
          tableString += "<span class='commentDelete' title='"+element['R_NO']+"' style='color:white;font-size:0.8em;cursor:pointer'>"
                + '&nbsp&nbsp[삭제]' + "</span>";
          }//if
          tableString += "<span>" + '&nbsp;&nbsp;&nbsp;&nbsp;' + "</span>"
          tableString += "<a style='text-decoration:none;color:pink;font-weight:600;' class='commentReply' title='"+element['R_NO']+"' href='#HH'><i class='fa fa-reply'></i>Reply</a>";
          tableString += "<div>" + '<br>' + "</div>"
          tableString += "</div>";
         tableString += "</article>";
           tableString += "</li>";
        })//each
      }//if
      
    //리스트 뿌려주기
    $('#commentsNew').append(tableString);
   }//function

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

      var tableString = "";
      $.each(JSON.parse(data),function(index, element) {
            var B = 70;
            tableString += "<li>";
            tableString += "<article style='margin-left:"+B*element['DEPTH']+"px' class='review-comment'>";
           var A = "https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/" + element['PROFILE_IMG'] + "";
//             var A = element['PROFILE_IMG'];
//             console.log(A);
//             var B = "<c:url value='/upload/" +A+ "'/>;"
//             console.log(B);
            tableString += "<div class='user-avatar'>";
//             tableString += "<img src='<c:url value='/resource/img/commenttemp.jpg'/>'>";
            tableString += "<img style='border-radius:50px;height:70px;width:70px;' src='" +A+ "'>";

            tableString += "</div>";
            tableString += "<div class='comment-content'>";
            tableString += "<h5 class='name'>"
                  + element['NAME'] + "</h5>";
            tableString += "<div class='comment-meta'>";
            if(element['DEPTH'] == '0'){
            tableString += "<div class='star-rating_"+element['STARS']+"'>";
            tableString += "<span>Rated <strong class='rating'>5.00</strong>out of 5</span>";
            tableString += "</div>";
            }
            tableString += "<span class='post-date'>"
                  + element['POSTDATE'] + "</span>";
            tableString += "</div>";
            tableString += "<span>" + element['CONTENT'] + "</span>"
            if('${sessionScope.id}' == element   ['ID']){
            tableString += "<a href='#HH' class='commentEdit' title='"+element['R_NO']+"' style='color:white;font-size:0.8em;'>" + '&nbsp&nbsp[수정]' + "<span id='asd' style='display:none;'>"
                  + element['CONTENT'] + "</span></a>"
            tableString += "<span class='commentDelete' title='"+element['R_NO']+"' style='color:white;font-size:0.8em;cursor:pointer'>"
                  + '&nbsp&nbsp[삭제]' + "</span>";
            }//if
            tableString += "<span>" + '&nbsp;&nbsp;&nbsp;&nbsp;' + "</span>"
            tableString += "<a style='text-decoration:none;color:pink;font-weight:600;' class='commentReply' title='"+element['R_NO']+"' href='#HH'><i class='fa fa-reply'></i>Reply</a>";
            tableString += "<div>" + '<br>' + "</div>"
            tableString += "</div>";
            tableString += "</article>";
            tableString += "</li>";
            
         });
      //리스트 뿌려주기
      $('#comments').html(tableString);
      
      //답글
      $('.commentReply').click(function() {
         $('#my').show();
         $('.rating').hide();
         $('#frm').css('margin-top','-20px');
         
         console.log('클릭한 댓글의 키(답글):' + $(this).attr('title'));
         //form의 hidden속성중 name="cno"값 설정
         $('input[name=r_no]').val($(this).attr('title'));
   
         $('#submitComment').val('답변');
      })//
      
      //코멘트 수정]
      $('.commentEdit').click(function(){
        $('#my').show();
         console.log('클릭한 댓글의 키(r_no):',$(this).attr('title'));
         
         //클릭한 제목으로 텍스트박스 값 설정
         $('#content').val($(this).children().eq(0).html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
         $('#submitComment').val('수정');
         
         //form의 hidden속성중 name="cno"값 설정
         $('input[name=r_no]').val($(this).attr('title'));
      });

      //코멘트 삭제 
      $('.commentDelete').click(function() {
        //form의 hidden속성중 name="bsc_no"값 설정
      $('input[name=r_no]').val($(this).attr('title'));

         $.ajax({
            url : '<c:url value="/sub1/memodelete.ins"/>',
            data : $('#frm').serialize(),
            dataType : 'text',
            type : 'post',
            success : function(data){
               showComments();
               console.log('data가 뭐길래:'+data);
               if(data == '답글 있음') {
                  alert('답글이 있으므로 원글을 삭제할 수 없습니다.');
               }
               
            },
            error : function(request, error) {
               console.log('상태코드:', request.status);
               console.log('서버로부터 받은 HTML데이타 :', request.responseText);
               console.log('에러:', error);
            }
         });
      });
      
     //수정으로 돼있다면 등록으로 바꾸기
     $('#submitComment').click(function() {
         if ($('#submitComment').val() == '수정') {
            ($('#submitComment')).val('등록');
         }
      })
      
     $('#submitComment').click(function() {
         if ($('#submitComment').val() == '답변') {
            ($('#submitComment')).val('등록');
         }
      })
      
      //작성 버튼 눌렀을 때 수정으로 돼있다면 등록으로 바꾸기
      $('#about').click(function(){
         $('#my').show();
         
         if($('#submitComment').val() == '수정') {
            ($('#submitComment')).val('등록')   ;
         }
      })
     
   }
   
   //오늘 하루 그만보기
   //쿠키설정   
   function setCookie(name, value, expiredays) {
      var todayDate = new Date();
      todayDate.setDate(todayDate.getDate() + expiredays);
      document.cookie = name + '=' + escape(value) + '; path=/; expires='
            + todayDate.toGMTString() + ';'
   }

   //쿠키 불러오기
   function getCookie(name) {
      var obj = name + "=";
      var x = 0;
      while (x <= document.cookie.length) {
         var y = (x + obj.length);
         if (document.cookie.substring(x, y) == obj) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
               endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
         }
         x = document.cookie.indexOf(" ", x) + 1;
         if (x == 0)
            break;
      }
      return "";
   }

   //닫기 버튼 클릭시
   function closeWin(key) {
      if ($("#todaycloseyn").prop("checked")) {
         setCookie('notice-obt' + key, 'Y', 1);
      }
      $("#notice-obt" + key + "").hide();
   }

   $(function() {
      if (getCookie("notice-obt1") != "Y") {
         $("#notice-obt1").show();
      }
   });
   
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
#footer-3 {
   margin-top: -70px;
}

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

div.tab-content.left {
   margin-left: 130px;
   margin-top: 20px;
}

body>#standalone-container {
   margin: 50px auto;
   max-width: 720px;
}

#editor-container {
   height: 350px;
}

body {
   color: white;
/*    background-image: url('../resource/img/tempBG.jpg'); */
   background-color: #12111F;
/*    background-attachment: fixed; */
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
   margin-left: 30px;
   width: 650px;
   height: 480px;
   background-image: url('../resource/img/concert2.jpg');
}

.section2 {
   margin-top: 280px;
   margin-left: 690px;
   width: 650px;
   height: 480px;
   background-image: url('../resource/img/big concert hall.jpg');
}

.section3 {
   margin-top: 280px;
   margin-left: 30px;
   width: 650px;
   height: 480px;
   background-image: url('../resource/img/instruments3.png');
}

.tempImage {
   height: 360px;
   width: 275px;
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

/* notice */
.notice-obt {
   position: fixed;
   width: 420px;
   height: 440px;
   color: white;
   top: 200px;
   left: 100px;
   border: 1px solid #ccc;
   padding: 20px;
   background: black;
   z-index: 1000;
   margin-left: 0px;
   margin-top: 0px;
   box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
   display: none;
}

.notice-obt-close {
   position: relative;
   cursor: pointer;
   font-size: 35px;
   right: -360px;
}

.notice-obt-title {
   line-height: 80px;
   font-size: 24px;
   font-weight: bold;
   margin-top: -50px;
   l
}

.notice-obt-content {
   height: 270px;
   padding: 20px 10px;
   margin-left: -10px;
   margin-top: -35px;
   line-height: 2.3em;
}

.notice-obt-content a {
   color: #2196F3;
   font-weight: bold;
}

.notice-obt-bottom {
   text-align: right;
}

.live-ticket-count .countdown .CountdownContent {
   display: inline-block;
   height: 110px;
   width: 120px;
   font-size: 76px;
   font-weight: 600;
   color: red;
   font-family: "Changa", sans-serif;
   text-align: center;
   position: relative;
   background-image: url("../../media/background/1.png");
   background-size: contain;
   margin-right: 20px;
   background-repeat: no-repeat;
   padding: 24px 0;
}

.live-ticket-count .countdown .CountdownContent .CountdownLabel {
   display: block;
   text-align: center;
   font-size: 16px;
   font-family: "Roboto", sans-serif;
   padding-top: 15px;
}

.tim-container-box {
   width: 1200px;
   padding-right: 15px;
   padding-left: 15px;
   margin-right: auto;
   margin-left: auto;
}
</style>
</head>

<body id="home-version-1" class="home-version-1" data-style="default">
   <!--    <!-- 반응형 글씨 -->
   <!--    <a class="typewrite" data-period="3000" data-type='[ "#반응형 #모바일 #무료" ]'> -->
   <!--       <span class="wrap"></span> -->
   <!--    </a> -->

   <!-- 로딩 -->
   <!--    <div class="loader loader-bar-ping-pong is-active"></div> -->

   <!-- 공지 시작 -->
   <!-- 
   <div class="notice-obt" id="notice-obt1">
      <div class="notice-obt-close">×</div>
      <div class="notice-obt-title" style="color: red">방구석 기타리스트 가족 모집
      </div>
      <div class="notice-obt-content">
         <b>지난해, 모두를 광란의 도가니속으로 몰아 넣었던 <br>`방구석 기타리스트`가 2탄으로 다시
            찾아옵니다.
         </b> <br> <span style="font-style: bold">Insomnia는</span> 공연을 빛내줄
         여러분들을 기다립니다.<br> <a href="<c:url value='/sub1/list.ins'/>">모집
            게시판</a>을 통해 게시글을 등록해주세요.<br> &lt;참여 조건&gt; <br>연령 : 25세 이상 <br>
         장르 : 무관 <br>자격 : 음악을 사랑하는 누구나 <br>신청 기간 : ~ 2019. 6. 4 (6일
         발표)
      </div>
      <div class="notice-obt-bottom">
         <img
            style="margin-top: 60px; margin-left: 35px; height: 70px; width: 115px;"
            src="<c:url value='/resource/img/logo_5.png'/>">
      </div>
      <div class="button_area" style="margin-top: -45px">
         <input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>&nbsp;&nbsp;오늘
         이 창을 열지 않음 &nbsp;&nbsp;<a href='' onclick="javascript:closeWin(1);"><B>[닫기]</B></a>
      </div>
   </div>
    -->
   <!--  공지 끝 -->

   <div id="site">
      <!--=========================-->
      <!--=        Navbar         =-->
      <!--=========================-->
      <jsp:include page="/WEB-INF/template/Nav.jsp" />

      <!--===========================-->
      <!--=           About         =-->
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
                           <h2 style="margin-left: 58px">R e v i e w s</h2>
                        </div>
                     </div>
                     <!-- /.col-xl- -->
                  </div>
                  <!-- /.row -->
               </div>
               <!-- /.container -->
            </footer>
            <!-- /#footer -->

            <div class="product-tab-wrapper" style="margin-left: 110px;">
               <ul class="nav product-tabs" role="tablist" style="display:none">
                  <li class="nav-item"><a class="nav-link active"
                     href="#profile" role="tab" data-toggle="tab">Description</a></li>
                  <li class="nav-item"><a class="nav-link" href="#references"
                     role="tab" data-toggle="tab">Reviews</a></li>
                  <li class="nav-item"><a class="nav-link" href="#buzz"
                     role="tab" data-toggle="tab">Q&A</a></li>
               </ul>
               <br>

               <div class="tab-content">

                  <!-- 첫번째 카테고리 : 상품 설명 -->
                  <div role="tabpanel" class="tab-pane fade in active" id="profile">
                     <div class="single-product-wrapper">
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
                                       <li id="commentsNew">
                                          <!-- ajax로 아래에 코멘트 목록 뿌리기 -->
                                       </li>
                                       <div id="HH" style="width: 1px;height: 1px;background-color: black"></div>
                                    </ul>
                                 </div>
                              </div>
                              <!-- Leave Review -->
                           </div>
                        </div>

                        <!-- comment 등록 폼 -->
                        <div class="col-md-10" style="margin-top: 75px;" id="my">
                           <div style="margin-left: -15px">
                              <h5 class="comments-title">Write</h5>
                              <form id="frm" method="post" target="param">
                                 <!-- 원본글의 REFER/STEP/DEPTH 설정 : 생각해보니 여기선 필요없다.-->
<%--                                  <input type="hidden" name="refer" value="${record.refer}" /> --%>
<%--                                  <input type="hidden" name="step" value="${record.step}" /> --%>
<%--                                  <input type="hidden" name="depth" value="${record.depth}" /> --%>
                                 
                                 <ul class="rating">
                                    <li class="rating-title">Leave A Rating</li>&nbsp;&nbsp;
                                    <li class="star"><i class="fa fa-star"></i></li>
                                    <li class="star"><i class="fa fa-star"></i></li>
                                    <li class="star"><i class="fa fa-star"></i></li>
                                    <li class="star"><i class="fa fa-star"></i></li>
                                    <li class="star"><i class="fa fa-star"></i></li>

                                 </ul>
                                 <!-- 수정 및 삭제용 파라미터 -->
                                 <input type="hidden" name="r_no" />
                                 
                                  <input type="hidden" name="name" class="form-fname form-element large"
                                    placeholder="Name" style="width: 250px">&nbsp;&nbsp;
                                 <br> <br>
                                 <textarea name="content" id="content" class="form-message"
                                    placeholder="Review" tabindex="5"
                                    style="margin-top: -30px; width: 400px; height: 200px; border-radius: 20px; padding: 20px"></textarea>
                                 <input type="submit" id="submitComment" value="등록"
                                    class="btn btn-primary "
                                    style="width: 80px; margin-top: -30px; margin-left: 20px;">
                                 <input type="hidden" id="starCount" name="starCount" />
                                 <!-- iframe 설정 -->
                                 <iframe id="if" name="param"></iframe>
                              </form>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- 두번째 카테고리 : 리뷰 게시판 -->
                  <div role="tabpanel" class="tab-pane fade" id="references">
                     <div class="tab-content left">
                     </div>
                     <!-- /.row -->
                  </div>

                  <!-- 세번째 카테고리 : Q&A -->
                  <div role="tabpanel" class="tab-pane fade" id="buzz">
                     <table class="shop_attributes">
                        <tbody>
                           <tr>
                              <th>Weight</th>
                              <td class="product_weight">1.2 kg</td>
                           </tr>

                           <tr>
                              <th>Dimensions</th>
                              <td class="product_dimensions">38 x 28 x 15 cm</td>
                           </tr>

                           <tr>
                              <th>Color</th>
                              <td>
                                 <p>Blue, Grey, Red</p>
                              </td>
                           </tr>
                           <tr>
                              <th>Size</th>
                              <td>
                                 <p>32-36, 36-40, 40-46</p>
                              </td>
                           </tr>
                           <tr>
                              <th>Size</th>
                              <td>
                                 <p>H: 38cm/15″ W: 28cm/11″ D: 15cm/6″</p>
                              </td>
                           </tr>
                           <tr>
                              <th>Details</th>
                              <td>
                                 <p>Contrasting print, Adjustable shoulder straps, Grab
                                    handle</p>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
         <!-- /.product-tab-wrapper -->
      </section>
   </div>
   <!-- 끝 -->
   <!-- /.container -->

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
   <script src="<c:url value='/vendor/js/smoke.js'/>"> </script>
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
      
   //공지사항 닫기 버튼 활성화
   $('.notice-obt-close').on('click', function() {
      $('.notice-obt').remove();
   });
   
   //반응형 글씨
//    $('.notice-cbt-close, .notice-cbt').on('click', function() {
//         $('.notice-cbt').remove();
//     });

//     $('.notice-obt-close').on('click', function() {
//         qv_func.setCookie('notice_main',1,1);
//         $('.notice-obt').remove();
//     });

//     $('.start-btn').click(function(e){
//        location.href="template.html";
//     });
//     $('#main-slide').bind('slide.bs.carousel', function (e) {
//         //console.log('slide event!');
//     });

//     $('#main-slide').carousel({
// //        swipe: 30
// //        wrap: false
//     });

//     var TxtType = function(el, toRotate, period) {
//         this.toRotate = toRotate;
//         this.el = el;
//         this.loopNum = 0;
//         this.period = parseInt(period, 10) || 2000;
//         this.txt = '';
//         this.tick();
//         this.isDeleting = false;
//     };

//     TxtType.prototype.tick = function() {
//         var i = this.loopNum % this.toRotate.length;
//         var fullTxt = this.toRotate[i];

//         if (this.isDeleting) {
//             this.txt = fullTxt.substring(0, this.txt.length - 1);
//         } else {
//             this.txt = fullTxt.substring(0, this.txt.length + 1);
//         }

//         this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

//         var that = this;
//         var delta = 200 - Math.random() * 100;

//         if (this.isDeleting) { delta /= 2; }

//         if (!this.isDeleting && this.txt === fullTxt) {
//             delta = this.period;
//             this.isDeleting = true;
//         } else if (this.isDeleting && this.txt === '') {
//             this.isDeleting = false;
//             this.loopNum++;
//             delta = 500;

//             var count = $('.carousel').find('.carousel-inner .item').length;
//             var index = $('.carousel').find('.carousel-inner .item.active').index();
//             if (count - 1 > index) {
//                 $('.carousel').carousel(index + 1);
//             }
//             else {
//                 $('.carousel').carousel(0);
//             }
//         }

//         setTimeout(function() {
//             that.tick();
//         }, delta);
//     };

//     window.onload = function() {
//         var elements = document.getElementsByClassName('typewrite');
//         for (var i=0; i<elements.length; i++) {
//             var toRotate = elements[i].getAttribute('data-type');
//             var period = elements[i].getAttribute('data-period');
//             if (toRotate) {
//                 new TxtType(elements[i], JSON.parse(toRotate), period);
//             }
//         }
//         // INJECT CSS
//         var css = document.createElement("style");
//         css.type = "text/css";
//         document.body.appendChild(css);

//         //alert(screen.height);
//         //main-slide txt padding refit
//         //PC
//         if($("#main-slide").width()>600) {
//             if ($("#main-slide").height() < 700) {
//                 //console.log("resize");
//                 $("#main-slide .carousel-contents .slide-txt").css("padding", 0);
//             }
//         }

//         if(!qv_func.getCookie('notice_main')) {
//             //tmp
//             //$(".notice-obt").show();
//         }
//     };

//     $(window).resize(function(){
//         //main-slide txt padding refit
//         //PC
//         if($("#main-slide").width()>600) {
//             //console.log("resize");
//             if ($("#main-slide").height() < 700) {
//                 $("#main-slide .carousel-contents .slide-txt").css("padding", 0);
//             } else {
//                 $("#main-slide .carousel-contents .slide-txt").css("padding", "40px 40px 30px 40px");
//             }
//         }
//     });
   </script>

   <style>
.star-rating {
   overflow: hidden;
   position: relative;
   height: 1.618em;
   line-height: 1.618;
   font-size: 1em;
   width: 5.3em;
   font-family: star;
   font-weight: 400;
}

.star-rating_5 span:before {
   content: "\53\53\53\53\53";
   top: 0;
   position: absolute;
   left: 0;
   color: #2c2d33;
}

.star-rating_4 span:before {
   content: "\53\53\53\53";
   top: 0;
   position: absolute;
   left: 0;
   color: #2c2d33;
}

.star-rating_3 span:before {
   content: "\53\53\53";
   top: 0;
   position: absolute;
   left: 0;
   color: #2c2d33;
}

.star-rating_2 span:before {
   content: "\53\53";
   top: 0;
   position: absolute;
   left: 0;
   color: #2c2d33;
}

.star-rating_1 span:before {
   content: "\53";
   top: 0;
   position: absolute;
   left: 0;
   color: #2c2d33;
}

.star-rating_1 {
   overflow: hidden;
   position: relative;
   height: 1.618em;
   line-height: 1.618;
   font-size: 1em;
   width: 5.3em;
   font-family: star;
   font-weight: 400;
}

.star-rating_2 {
   overflow: hidden;
   position: relative;
   height: 1.618em;
   line-height: 1.618;
   font-size: 1em;
   width: 5.3em;
   font-family: star;
   font-weight: 400;
}

.star-rating_3 {
   overflow: hidden;
   position: relative;
   height: 1.618em;
   line-height: 1.618;
   font-size: 1em;
   width: 5.3em;
   font-family: star;
   font-weight: 400;
}

.star-rating_4 {
   overflow: hidden;
   position: relative;
   height: 1.618em;
   line-height: 1.618;
   font-size: 1em;
   width: 5.3em;
   font-family: star;
   font-weight: 400;
}

.star-rating_5 {
   overflow: hidden;
   position: relative;
   height: 1.618em;
   line-height: 1.618;
   font-size: 1em;
   width: 5.3em;
   font-family: star;
   font-weight: 400;
}

.star-rating_1 span {
   overflow: hidden;
   float: left;
   top: 0;
   left: 0;
   position: absolute;
   padding-top: 1.5em;
}

.star-rating_2 span {
   overflow: hidden;
   float: left;
   top: 0;
   left: 0;
   position: absolute;
   padding-top: 1.5em;
}

.star-rating_3 span {
   overflow: hidden;
   float: left;
   top: 0;
   left: 0;
   position: absolute;
   padding-top: 1.5em;
}

.star-rating_4 span {
   overflow: hidden;
   float: left;
   top: 0;
   left: 0;
   position: absolute;
   padding-top: 1.5em;
}

.star-rating_5 span {
   overflow: hidden;
   float: left;
   top: 0;
   left: 0;
   position: absolute;
   padding-top: 1.5em;
}

.star-rating_1 span:before {
   color: #e43a90;
}

.star-rating_2 span:before {
   color: #e43a90;
}

.star-rating_3 span:before {
   color: #e43a90;
}

.star-rating_4 span:before {
   color: #e43a90;
}

.star-rating_5 span:before {
   color: #e43a90;
}
</style>

<script>
var lastScrollTop = 0;
$(window).scroll(function(){
   var currentScrollTop = $(window).scrollTop();
   if(currentScrollTop - lastScrollTop > 0){
      lastScrollTop = currentScrollTop; 
   }//if
   else{
      lastScrollTop = currentScrollTop;
   }
})

var position = $('.commentReply:first').offset();
$('html,body').stop().animate({scrollTop : position.top}, 600, 'easeInQuint');
</script>