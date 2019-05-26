<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<!-- Noto Sans KR Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- row class 를 쓰기위한 최신 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Site Stylesheet -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/MyPage2CSS.css'/>" />
	
		<!-- ajaxForm을 사용하기 위한 최신자 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.js"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery.migrate/jquery-migrate-3.0.0.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 


<!-- 제이쿼리 UI용 라이브러리 임베드 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- light box jquery -->
<link rel="stylesheet" href="<c:url value='/vendor/css/lightgallery.min.css'/>">
<script src="<c:url value='/vendor/js/lightgallery.min.js'/>"></script>
 <!-- A jQuery plugin that adds cross-browser mouse wheel support. (Optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>
<script src="<c:url value='/vendor/js/lightgallery.min.js'/>"></script>
<!-- lightgallery plugins -->
<script src="<c:url value='/vendor/js/lg-thumbnail.min.js'/>"></script>
<script src="<c:url value='/vendor/js/lg-fullscreen.min.js'/>"></script>



<style>
body {
   overflow-x: hidden;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   -webkit-font-smoothing: antialiased;
   letter-spacing: -.02em;
   color: rgba(0, 0, 0, .84);
   line-height: 1.5em;
   font-size: 15px;
   font-weight: 400;
}

.space_for_nav {
   background-color: black;
   width: 100%;
   height: 81px;
}

.no_have_band {
   height: 800px;
   background: url('/insomnia/resource/img/no_band_cover.jpg');
   background-position: center;
}

.no_band_header {
   text-align: center;
}

.no_band_header_cover {
   position: absolute;
   width: 50%;
   height: inherit;
   background-color: rgba(255, 255, 255, 0.2);
   text-align: center;
}

.no_band_header_cover h2 {
   margin-top: 350px;
   color: white;
   font-weight: 1000;
}

.no_band_header_cover h4 {
   color: white;
   font-weight: 500;
}

.no_band_header_div {
   height: 100%;
   width: 50%;
   margin: 0 50%;
   padding-top: 370px;
}

.no_band_header_btn {
   color: white;
   text-align: center;
   font-weight: 900;
   font-size: 20px;
   margin: auto;
   padding: 15px;
   background-color: rgb(0, 204, 163);
   width: 360px;
   height: 60px;
}

/* 해당 아이디에 등록된 밴드가 있을 경우 CSS */
.inner-section {
   margin-top: 50px;
}

.header-magic-line .header-inner {
   background: black;
}

.myinfo-content {
   max-width: 900px;
}

.myinfo-content dd {
   width: 200px;
}

.accnttype {
   margin-top: 0;
}

.myinfo-content .nickname {
   margin-bottom: 0;
   margin-top: 0;
}

.profile-img2 {
   min-width: 100px;
   min-height: 100px;
   max-width: 100px;
   max-height: 100px;
   border-radius: 50%;
   border: 1px solid rgb(230, 234, 237);
}

.mypage-project .tab-list ul li {
   width: 10%;
}

.insert-underbar-div {
   width: 960px;
   margin: 0 auto;
   padding: 0px;
}

.tab-list-underbar {
   width: 40px;
   border-bottom: 3px solid rgb(0, 204, 163);
   margin-left: 20px;
   transition: margin-left ease-in-out 1s;
   padding: 0 24px;
}

.mypage-project .project-list {
   width: 300%;
}

.project-list {
   margin-left: 0;
   transition: margin-left ease-in-out 1s;
}

/* 펀딩한 내역을 보여주는 다이브 */
.project-card {
   width: 270px;
   height: 404px;
   border: 1px solid rgb(230, 234, 237);
}

.card-img-section {
   width: 270px;
   height: 270px;
   background-size: 270px 270px;
}

.card-info-section {
   position: relative;
   padding: 0 20px;
   border: 1px solid #DADCE0;
   border-top: none;
   background: #fff;
   height: 134px;
}

.card-info-section h4 {
   padding: 16px 0 0;
   margin: 0 0 8px;
   font-size: 17px;
   font-weight: 600;
   letter-spacing: -.02em;
   line-height: 24px;
   max-height: 48px;
   color: #1D2129;
   overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 2;
   -webkit-box-orient: vertical;
   word-wrap: break-word;
}

.card-info-section h5 {
   margin: 0;
   padding-bottom: 16px;
   font-weight: 400;
   font-size: 13px;
   line-height: 18px;
   color: #90949c;
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}

.card-info-section .card-category {
   margin: 10px 0 0 34%;
}

.card-info-section .category {
   padding-left: 20px;
   width: 52%;
   text-align: left;
   font-size: 13px;
   color: rgb(70, 70, 70);
   letter-spacing: -1px;
   box-sizing: border-box !important;
}

.project-card, .project-card * {
   box-sizing: content-box !important;
}

.mypage-project .card-list {
   padding-top: 120px;
}

.mypage-project .card-list ul {
   width: 960px;
   margin: -2px auto 0;
   padding: 0 9px;
}

.mypage-project .card-list ul li {
   position: relative;
   margin-bottom: 16px;
   float: left;
   width: 300px;
   padding: 0 15px;
}

.project-card .progressbar-wrap {
   padding-top: 230px;
}

.project-card .progressbar-wrap dt {
   overflow-x: hidden;
}

.project-card .progressbar-wrap dl {
   padding: 8px 20px 0;
}

.project-card .progressbar-wrap dt span {
   display: block;
   height: 6px;
   background: #17e5bc;
}

.project-card .progressbar-wrap dd {
   position: relative;
   text-align: center;
   line-height: 20px;
   height: 20px;
}

.project-card .progressbar-wrap dd span {
   font-size: 14px;
   color: #fff;
   font-weight: 500;
   letter-spacing: -.02em;
   display: block;
}

.project-card .progressbar-wrap dd span.percent {
   position: absolute;
   left: 0;
   top: 0;
   text-align: left;
}

.project-card .progressbar-wrap dd span.amount {
   text-align: left;
   position: absolute;
   right: 0;
   top: 0;
}
/* 갤러리를 핀터레스트처럼 보여주는 CSS */
.thumbnail {
   width: 287px;
   margin-left: 20px;
   margin-bottom: 20px;
   box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.lightgallery-div {
   width: 100%;
   text-align: center;
}

.lightgallery-center-div {
   width: 1240px;
   text-align: left;
   margin: 0 auto;
}

.lightgallery {
   display: inline;
}

/* 뮤직 리스트를 보여주는 CSS */
.section-padding {
   width: 960px;
   margin: 0 auto;
}

#wait {
   font-size: 2.6em;
   font-weight: 1000;
   text-shadow: -2px;
   -webkit-font-smoothing: antialiased;
   -moz-osx-font-smoothing: grayscale;
   color: red;
   text-decoration: none;
}

.container {
   max-width: 1400px;
   width: 100%;
   padding-right: 15px;
   padding-left: 15px;
   margin-right: auto;
   margin-left: auto;
}

.tabs-filter-button li {
   position: relative;
   padding-left: 20px;
}

.tabs-filter-button {
   margin: 0;
   padding: 0;
   list-style: none;
   background: #313131;
   padding: 37px 0;
   display: -webkit-box;
   display: -ms-flexbox;
   display: flex;
   -ms-flex-wrap: wrap;
   flex-wrap: wrap;
   -ms-flex-pack: distribute;
   justify-content: space-around;
   text-align: center;
}

li {
   display: list-item;
   text-align: -webkit-match-parent;
}

.tim-isotope-3 {
   padding: 0 40px;
}

.tim-isotope {
   position: relative;
}

.tab-details .details {
   margin: 0;
   padding: 30px 40px;
   list-style: none;
   -webkit-box-shadow: 0px 5px 21px 0px rgba(142, 142, 142, 0.23);
   box-shadow: 0px 5px 21px 0px rgba(142, 142, 142, 0.23);
   background: rgba(255, 255, 255, 0.5);
}
.tab-details .details li:nth-child(1){
	width:25%;
}
.tab-details .details li:nth-child(2){
	width:13%;
}
.tab-details .details li:nth-child(3){
	width:55%;
}
.tab-details .details li:nth-child(4){
	width:5%;
}
.tab-details .details li {
   font-family: "Changa", sans-serif;
   font-size: 16px;
   font-weight: 500;
   color: #585757;
   position: relative;
   padding-bottom: 5px;
   display: inline-block;
   text-align: center;
   width: 33%;
}

.tabs-filter {
   margin: 0;
   padding: 0;
   list-style: none;
}

.tab-details .details li:before {
   bottom: 0;
   width: 25%;
   height: 1px;
   left: 50%;
   -webkit-transform: translateX(-50%);
   -ms-transform: translateX(-50%);
   transform: translateX(-50%);
}

.tab-details .details li:after {
   left: 47%;
   width: 15px;
   height: 4px;
   bottom: -1px;
}

.songs-details li {
   display: inline-block;
   width: 33%;
   text-align: center;
   font-size: 16px;
   font-weight: 500;
   font-family: "Changa", sans-serif;
}

#kyjImage{
   opacity: 0.7;
   margin-left:40px;
}

#kyjImage:hover{
   opacity: 1;
/*    transform: rotate( 720deg ); */
}

.div_select_category {
   margin-top: -40px;
   text-align: center;
}

.select_category {
   margin-top: 50px;
   width: 450px;
   height: 55px;
   padding: 16px;
   border: 1px solid rgb(230, 234, 237);
}

#exclamationmark{
   width: 30px;
   height: 30px;
   margin-left: 80px;
}

.kyj {
  animation:  kyj-spin infinite 3s linear;
  height: 40vmin;
  pointer-events: none;
}

@keyframes kyj-spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.select_category option {
   
}

.upload-music-div {
   border: 1px solid rgb(230, 234, 237);
   width: 450px;
   margin: 0 auto;
   margin-top: 20px;
}

.new-music-title {
   margin-left: 20px;
   width: 240px;
   height: 55px;
   padding: 16px;
   font-weight: 600;
   font-size: larger;
}

#upload_band_music {
   width: 80px;
   margin-left: 20px;
   margin-right: 20px;
}

#upload_band_music_description{
	border: 1px solid rgb(230, 234, 237);
    margin: 20px 0 0 8px;
    width: 450px;
    padding: 16px;
}



</style>


</head>
<body>

<script>
	var playList = new Array(); //playList를 저장하기 위한 배열
	
	//1000단위로 콤마찍기
	function setComma(obj, n) {
	    var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	    n += '';                          // 숫자를 문자열로 변환         
	    while (reg.test(n)) {
	       n = n.replace(reg, '$1' + ',' + '$2');
	    }         
	    $(obj).text(n+"원 달성");
	    console.log(n);
	}
</script>

	<div class="root_div">

		<!-- ==============body 시작 -->
		<!-- ============== navBar 시작 -->
		<jsp:include page="/WEB-INF/template/Nav.jsp" />
		<div class="space_for_nav"></div>
		<!-- ============== navBar END -->


		<!-- 아직 등록된 밴드가 없는 아이디일 경우 -->
		<c:if test="${isBandMember == 'F'}">
		
			<div class="no_have_band">
				<div class="no_band_header"></div>
				<div class="no_band_header_cover">
					<h2> 아직 등록한 밴드가 없으시군요? </h2><br/>
					<h4> 밴드를 등록하고 INSOMNIA의 크라우드 펀딩에 도전해 보세요</h4>
				</div>
				<div class="no_band_header_div">
					<div class="no_band_header_btn">밴드 등록하기</div>
				</div>
			</div>
		
		</c:if>
  
		<!-- 아직 등록된 밴드가 없는 아이디일 경우 끝 -->
		<!-- 등록된 밴드가 있는 아이디일 경우 시작 -->
		<c:if test="${isBandMember == 'T' }">

		<div class="have_band">

			<div id="wadizContainer">
				<div id="mypageWrap">

					<div class="myprofile-wrap">

						<div class="myinfo-wrap">
							<!-- 상단부분  시작-->

							<div class="inner-section">
								<div class="myinfo-content">
									<dl>
										<dd>
											<p id="b_no" style="display:none;">${record.b_no}</p>
											<p class="nickname" style="font-weight: 600">${record.b_name}</p>
											<p class="accnttype">등록된 밴드</p>
											<p class="otherinfo"></p>
										</dd>
										<dt style="padding-right: 100px;">
											<img class="profile-img2"
												src="<c:url value='/upload/band/cover/${record.b_album_cover}'/>" />
										</dt>
									</dl>
									<p style="display: hidden" id="imgSrc"></p>
									<form id="imgForm"
										action="<c:url value='/edit/profileImg.ins'/>" method="POST"
										enctype="multipart/form-data">
										<input type="file" id="imgUpload" name="imgUpload"
											accept="image/*">
									</form>
									<ul class="activity-list">
										<li><strong class="count">0</strong><span>펀딩</span></li>
																										<!-- 기환쓰 좋아요 처리할 부분임당~ -->
										<li><a href="javascript:void(0)"
											<c:if test="${thirdLook == 'T'}"> onclick="likeBand();" </c:if>
										>
										<!-- 밴드 좋아요 처리 -->
										<strong class="count likeNfollow" id="like">${like}</strong><em>좋아요</em></a></li>
										<li><a href="javascript:void(0)"><strong
												class="count likeNfollow" id="follow">${follow}</strong><em>팔로워</em></a></li>
									</ul>
									<p class="introduce"></p>
									<ul class="interest-list">
									</ul>

									<ul class="activity-list">
										<li>
											<div class="btn-wrap" style="margin-right: 15px;">
												<a href="javascript:void(0)" class="wz button btn-edit">프로필
													편집</a>
											</div>
										</li>
										<li>
											<div class="btn-wrap">
											<c:if test="${thirdLook !=  'T'}">
												<a href="<c:url value='/main/bandSubmit.ins'/>"
													class="wz button btn-edit">펀딩 시작!</a>
											</c:if>
											</div>
										</li>
									</ul>

								</div>
							</div>
						</div>
						<!-- 상단 부분 끝 -->
						<script type="text/javascript">
							$(document).ready(function() {
								$('.moreKeyword').hide();
								$('.btn-more.keyword').click(function() {
									$('.moreKeyword').show();
									$('li.more').hide();
								});
							});
						</script>


						<div class="mypage-project bg ">
							<!-- 하단 부분 시작 -->
							<div class="tab-list">
								<div class="insert-underbar-div">
									<ul id="historyTab">
										<li class="active" style='border-bottom:none;'><span id="card-funding" style="color: rgba(0,0,0,.84); border-bottom:none;">펀딩한</span></li>
										<!-- 결제 -->
										<li><span id="card-gallery">갤러리</span></li>
										<!-- 좋아요 -->
										<li><span id="card-music">수록곡</span></li>
										<!-- 밴드/방구석 -->
									</ul>
									<!-- 밑에 붙는 색상 언더바 -->
									<div class="tab-list-underbar"></div>
								</div>
							</div>

							<div class="project-list row">

								<!-- 실질적으로 내용 뿌려주는 부분 -->
								<div id="projectCardList" class="card-list col-sm-4">
									<c:if test="${not result}">
										<div class="historyValue">
											<!-- 루프 -->

										</div>
									</c:if>


									<!-- -------------------------------펀딩한 내역을 등록하는 다이브--------------------------------------- -->
									<ul>
										
										<c:forEach items="${waiting}"  var="waiting"  varStatus="waitingStatus">
											<c:if test="${waiting.sw_isComplete != 'T' }" var="isComplete"><!-- bandSubmit이 완료되지 않았을때(신청중) -->
											<c:if test="${thirdLook != 'T'}">
											
												   <li >
					                                 <div class="project-card">
					                                    <div class="card-img-section" style="opacity: 0.4; background-image: url(/insomnia/upload/content/main/banner/${waiting.sw_banner});">
					                                       <a style="text-decoration: none"
					                                          href="<c:url value='/main/content.ins'/>"> <span
					                                          id="wait"><br>
					                                          
					                                          <br>
					                                          <br>
					                                          <br>
					                                          <c:if test="${waiting.sw_isAccept == 'T'}" var="isAccept">
					                                          	<span style="margin-left: 40px">허가된 펀딩</span></span>
					                                          </c:if>
					                                          <c:if test="${!isAccept }">
					                                          	<span style="margin-left: 70px">신 청 중</span></span>
					                                          </c:if>
					                                       </a>
					                                       <div id="test" class="progressbar-wrap"></div>
					                                    </div>
					                                    <div class="card-info-section">
					                                       <h4>${waiting.sw_short_description } 
					                                      	 <c:if test="${waiting.sw_isAccept == 'T'}">
					                                      	 <a id="kyjImage" href="<c:url value='/main/writeAdditional.ins?b_no=${waiting.b_no}&sw_no=${waiting.sw_no}'/>"><img class="kyj" id="exclamationmark" src="<c:url value='/resource/img/exclamation-mark.png'/>" /></a>
					                                      	 </c:if>
					                                       </h4>
					                                       <h5>${waiting.b_name }</h5>
					                                       <div class="card-category">
					                                          <span class="category">${waiting.ct_name }</span>
					                                       </div>
					                                    </div>
					                                 </div>
					                              </li>
					                              
					                          </c:if>
					                          </c:if>
					                          
					                          
					                          <c:if test="${!isComplete}"><!-- bandsubmit이 완료된 상태일때  -->					                            
													<li>
														<div class="project-card">
														<a href="<c:url value='/main/content.ins?s_no=${waiting.s_no }'/>">
															<div class="card-img-section" style="background-image: url(/insomnia/upload/content/main/banner/${waiting.sw_banner});">
																<em class="project-img"></em>
																<div id="test" class="progressbar-wrap">
																<c:set var="result" value="${(waiting.s_goal_accumulation / waiting.s_goal_price)*100}"/>
																	<dl>
																		<dt>
																			<span style="width: ${result-(result%1)}%"></span>
																		</dt>
																		<dd>
																			<span class="percent">${result-(result%1)}%</span> 
																			<span class="amount">${waiting.comma_Accumulation }원 달성</span>
																		</dd>
																	</dl>
																</div>
															</div>	
														</a>
															<div class="card-info-section">
																<h4>${waiting.sw_short_description }</h4>
																<h5>${waiting.b_name }</h5>
																<div class="card-category">
																	<span class="category">${waiting.ct_name }</span>
																</div>
															</div>
														</div>
													</li>
					                          </c:if><!-- 펀딩내역끝 -->
										</c:forEach>

									</ul>
									<!-- -------------------------------펀딩한 내역을 등록하는 다이브 끝------------------------------------ -->
						

								</div>
								<!-- projectCardList 끝 -->

								<!-- 사진 갤러리 -->
								
								<div id="card-list-gallery" class="card-list col-sm-4">
								<!-- 갤러리에 추가를 안 했을 때 나오는 p태그 
									<p id="emptyProjectText" style="display: block">갤러리가 비었습니다.</p>
								 -->
									<div class="lightgallery-div">
										<div class="lightgallery-center-div">
										<!-- 여기부터 이미지 추가 -->
										
										<!-- 
											<div class="lightgallery" id="lightgallery">
											    <a href="<c:url value='/upload/temp/a.jpg'/>">
											        <img class="thumbnail" src="<c:url value='/upload/temp/a.jpg'/>" />										  
											    </a>
											</div>

											 -->
										<!-- 여기부터 이미지 추가 끝 -->
										
										<!-- 새로운 이미지를 등록하는 다이브 -->
										<c:if test="${thirdLook != 'T'}">
											<div data-toggle="modal" data-target="#modal-upload-img" class="plus-image" style="display:inline-block; width:287px; height:287px; text-align:center; padding-top:125px; margin:0 0 20px 20px; box-shadow: 2px 2px 5px rgba(0,0,0,0.5);">
											    <img style="width:30px; height:30px;" src="<c:url value='/resource/img/plus-button.png'/>" />
											</div>
										</c:if>
										<!-- 새로운 이미지를 등록하는 다이브 끝 -->
										</div>
									</div>
									
								</div>
								
								<!-- -------------modal upload cover-------------- -->
								<!-- 새로운 밴드 이미지를 등록하는 모달창 -->
								 <div id="modal-upload-img" class="modal fade">
						         <div class="modal-dialog">
						            <div class="modal-content">
						               <div class="modal-header">
						                  <!-- 모달 닫기:data-dismiss="modal" -->
						                  <img class="find_insomnia_logo" src="../resource/img/insomnia-logo.png" style="margin-left:86px;"/>
						               </div>
						                
						               <div class="modal-body">
						               <br/>
						                 <p style="font-size:25px; text-align:center;">이미지 업로드</p>
						               <br/>
						               <form name="frm-band-img" id="frm-band-img" method="post" accept="image/*" action="<c:url value='/band/uploadBandImageInBandInfo.ins'/>" enctype="multipart/form-data">
						                  	<input type="file" id="upload_band_img" name="upload_band_img">
						               </form>
						                  <br/><br/>
						                  <p style="color:gray;">
						                     ※ 새로운 밴드 이미지를 등록해 주세요.
						                  </p>
						               </div>
						               <div class="modal-footer">
						               	  <button class="btn btn-info" id="add-band-img" data-dismiss="modal">확인</button>
						                  <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
						               </div>
						               
						            </div>
						         </div>
						      </div>
								<!-- 새로운 밴드 이미지를 등록하는 모달창 끝 -->
								<!-- -------------modal upload cover-------------- -->
										

								<!-- 음악 갤러리 -->
								<div id="music-gallery" class="col-sm-4">
								<!--		등록한 음악이 없을 때 보여주는 음악 리스트 
									<p id="emptyProjectText" style="display: block">음악 리스트가
										비었습니다.</p>
								 -->
										<!-- ---------------------------등록한 음악을 보여주는 다이브 ----------------------------------------- -->
										
															
												<!--===========================-->
												<!--=        	Tabs          =-->
												<!--===========================-->
												
										<section id="music-tabs" class="section-padding">
											<div class="container">
												<div class="tab-filter-wraper">
													<ul class="tim-isotope-filter tabs-filter-button">
														<li class="current">
															<a href="" data-filter="*">All</a>
														</li>
														<li>
															<a href="" data-filter=".folk-pop">포크·팝</a>
														</li>
														<li>
															<a href="" data-filter=".jazz-classic">재즈·클래식</a>
														</li>
														<li>
															<a href="" data-filter=".hiphop">힙합</a>
														</li>
														<li>
															<a href="" data-filter=".dance-electronic">댄스·일렉트로닉</a>
														</li>
														<li>
															<a href="" data-filter=".rock-metal">락·메탈</a>
														</li>
														<li>
															<a href="" data-filter=".traditional">국악</a>
														</li>
													</ul>
								
													<div class="tab-details">
														<ul class="details">
															<li>Title</li>
															<li>Type</li>
															<li>Description</li>
															<li>play</li>
														</ul>
													</div>
													<!-- /.tab-details -->
								
													<div class="tim-isotope tim-isotope-3">
														<ul id="music-list" class="tim-filter-items tabs-filter grid">
															<li class="grid-sizer"></li>
															
															
																<c:forEach items="${playList}"  var="playList" varStatus="status" >
																	<li class="tim-songs-items grid-item ${playList.ct_name_css }">
																		<ul class="songs-details">
																			<li style="width:25%">${playList.bm_name}</li>
																			<li style="width: 13%">${playList.ct_name}</li>
																			<li style="width:55%">${playList.bm_description}</li>
																			<li style="width:5%" id="${playList.bm_filename}" title="${status.index}" onclick="javascript:playSwitch(this);">play</li>
																		</ul>
																	</li>
																	
																	<!-- 오디오객체 생성 -->
																	<script>
																		playList[${status.index}] = new Audio("<c:url value='/upload/band/music/${playList.bm_filename}'/>");
																	</script>
																</c:forEach>
															
															
															<!-- 리스트 추가 시작 -->
															<!-- 			리스트 추가 예제
															<li class="tim-songs-items grid-item rock-metal dance-electronic">
																<ul class="songs-details">
																	<li>smells like teen spirit</li>
																	<li>Rock</li>
																	<li>play</li>
																</ul>
															</li>
															
															 -->
															<!-- 리스트 추가 END -->
															<!-- 새로운 넘버를 추가하는 div --> <!-- 밴드 멤버 본인만 보여줘야 한다. -->
															<c:if test="${thirdLook != 'T'}">
																<li id="add-music-li" class="tim-songs-items grid-item" data-toggle="modal" data-target="#modal-upload-music">
																	<ul class="songs-details">
																																				<li style="width:100%;"><img style="width:22px;" src="<c:url value='/resource/img/plus-button.png'/>"></li>
																	</ul>
																</li>
															</c:if>
															<!-- 새로운 넘버를 추가하는 div 끝 -->
															
														</ul>
													</div>
												</div>
												<!-- /.tab-filter-wraper -->
											</div>
											<!-- /.tim-container -->
										</section>
										<!-- /#music-tabs -->
										<!-- ---------------------------등록한 음악을 보여주는 다이브 끝--------------------------------------- -->
								</div>
								
															<!-- -------------modal upload cover-------------- -->
								<!-- 새로운 밴드 음악을 등록하는 모달창 -->
								 <div id="modal-upload-music" class="modal fade">
						         <div class="modal-dialog">
						            <div class="modal-content">
						               <div class="modal-header">
						                  <!-- 모달 닫기:data-dismiss="modal" -->
						                  <img class="find_insomnia_logo" src="../resource/img/insomnia-logo.png" style="margin-left:86px;"/>
						               </div>
						                
						               <div class="modal-body">
						               <br/>
						                 <p style="font-size:25px; text-align:center;">음악 업로드</p>
						               <br/>
						               <form name="frm-band-music" id="frm-band-music" method="post" accept="image/*" action="<c:url value='/band/uploadBandMusicInBandInfo.ins'/>" enctype="multipart/form-data">
						                  	
						                  	<!-- 장르를 선택하는 셀렉박스 -->
						                  	<div class="div_select_category">
									          <select class="select_category" name="select_category">
									              <option value="" selected disabled>카테고리 선택하기</option>
									              <option value="folk-pop">포크·팝</option>
									              <option value="jazz-classic">재즈·클래식</option>
									              <option value="hiphop">힙합</option>
									              <option value="dance-electronic">댄스·일렉트로닉</option>
									              <option value="rock-metal">락·메탈</option>
									              <option value="traditional">국악</option>
									          </select>
									        </div><!-- select div -->
						                  	<div class="upload-music-div">
						                  		<!-- 음악 타이틀 -->
							                  	<label style="margin-bottom:0; padding-left:20px;"> 타이틀 <input class="new-music-title" id="title" name="title" type="text"></label>
							                  	<!-- 업로드할 파일 -->
							                  	<input style="width:80px;" type="file" id="upload_band_music" name="upload_band_music">
						                  	</div>
						                  	<input type="text" placeholder="곡 설명"  id="upload_band_music_description" name="upload_band_music_description">
						               </form>
						                  <br/><br/>
						                  <p style="color:gray;">
						                     ※ 새로운 밴드 음악을 등록해 주세요.
						                  </p>
						               </div>
						               <div class="modal-footer">
						               	  <button class="btn btn-info" id="add-band-music" data-dismiss="modal">확인</button>
						                  <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
						               </div>
						               
						            </div>
						         </div>
						      </div>
								<!-- 새로운 밴드 음악을 등록하는 모달창 끝 -->
								<!-- -------------modal upload cover-------------- -->
											

							</div>
							<!-- projectList 끝 -->
						</div>
						<!-- 하단 부분 끝 -->

					</div>
					<!-- 상단/하단 전체 감싸는 div 끝 : myprofile-wrap  -->

				</div>
			</div>


			<!-- 여기까지 -->

		</div>

		<!-- 등록된 밴드가 있는 아이디일 경우 끝 -->
		</c:if><!-- 등록된 밴드가 있는 아이디일 경우 c:if태그 끝 -->



	</div>
	<!-- root_div -->
	<script>
		console.log("version 1010");
		console.log("isMember : ${isBandMember}");
		console.log("thirdLook : ${thirdLook}");
		
		$(function() {
			$.ajaxSetup({type:'post'});
			
			$(".no_band_header_btn").on("click", function() {
				console.log("no_band_header_btn on click");
				location.href = "<c:url value='/band/createNewBand.ins'/>";
			});
			// 카드를 클릭시 언더바 이동하는 스크립트
			$("#card-funding").on("click", function() {
				$(".tab-list-underbar").css("margin-left", "20px");
				$(".project-list").css("margin-left", "0");
			});
			$("#card-gallery").on("click", function() {
				$(".tab-list-underbar").css("margin-left", "112px");
				$(".project-list").css("margin-left", "-100%");
			});
			$("#card-music").on("click", function() {
				$(".tab-list-underbar").css("margin-left", "203px");
				$(".project-list").css("margin-left", "-200%");
			});
			// 카드 클릭시 언더바 이동하는 스크립트 끝
			//다이브 클릭시 해당 content로 이동
			/*
			$(".project-card").on("click", function() {
				location.href = "<c:url value='/main/content.ins'/>";
			});
			*/
			
			//lightGallery.js 플러그인을 사용하기 위한 시작
			 $("#lightgallery").lightGallery(); 
			
			
			////////////////////////////////////////////// 플러스 버튼을 클릭해 새로운 밴드 이미지 등록
			$("#add-band-img").on("click", function(){
					var uploadOk = confirm('이미지를 밴드 이미지로 등록하시겠습니까?');
					if(uploadOk){
							$("#frm-band-img").ajaxForm({
								url:'<c:url value="/band/uploadBandImageInBandInfo.ins"/>',
								enctype: 'multipart/form-data',
								dataType:'text',
								success:function(data){
									var path ="<c:url value='/upload/band/img/"+data+"'/>";
									console.log(data);
									addBandImg(path);
								},//success
								error : function(request,error){
									console.log('상태코드:',request.status);
									console.log('서버로부터 받은 HTML데이타 :',request.responseText);
									console.log('에러:',error);}
							});//frm_cover.ajaxForm
							
							$("#frm-band-img").submit();
					}//if uploadOk
			});//#add-band-img onClick
			//////////////////////////////////////////////플러스 버튼을 클릭해 새로운 밴드 이미지 등록 끝
		
			//////////////////////////////////////////////플러스 버튼을 클릭해 새로운 밴드 음악 등록
			$("#add-band-music").on("click", function(){
				var uploadOk = confirm('음악파일을 밴드 넘버로 등록하시겠습니까?');
				if(uploadOk){
						$("#frm-band-music").ajaxForm({
							url:'<c:url value="/band/uploadBandMusicInBandInfo.ins"/>',
							enctype: 'multipart/form-data',
							dataType:'json',
							success:function(data){
								console.log(data);
								addBandMusic(data);
							},
							error:function(request, error){
								console.log('상태코드:',request.status);
								console.log('서버로부터 받은 HTML데이타 :',request.responseText);
								console.log('에러:',error);}
						});//$("#frm-band-music").ajaxForm
				}//if
				$("#frm-band-music").submit();
			});//add-band-music on Click
			
			//////////////////////////////////////////////플러스 버튼을 클릭해 새로운 밴드 음악 등록 끝
			
			
			
			
			////////////////////////////////////////////// 서브밋된 내역이 있는지 검사하는 ajax와 다이브 추가
			
			showSubmitList();
			showGalleryList();
			
		});//window.onload
		
		
		////////////////////////////////////////////// bandInfo 내역이 있는지 검사하는 ajax와 다이브 추가
		////// sumbit내역
		function showSubmitList(){
			var bandNo = '${record.b_no}';
			var jsonB_no = {'b_no' : bandNo};
			
			$.ajax({
				url : '<c:url value="/band/getBandSubmitWaitingList.ins"/>',
				data : jsonB_no,
				dataType : 'json',
				success : function(data){
					createSubmitDiv(data);},
				error:function(request, error){
					console.log('상태코드:',request.status);
					console.log('서버로부터 받은 HTML데이타 :',request.responseText);
					console.log('에러:',error);}
			});//$.ajax
		}///showSubmitList
		
		function createSubmitDiv(data){
			console.log(data);
			$.each(data, function(idx, element){
				//펀딩대기중인 내역이 없음을 반환했을경우
				if(element['isExist'] == 'F'){
					var emptySubmit = '<p id="emptyProjectText" style="display: block">펀딩한 내역이 없습니다.</p>';
					$('#projectCardList').html(emptySubmit);
				}//if
				
				//펀딩 대기중인 내역이 있을 경우
				else{
					
				}//else
			})///each
		}//createSubmitDiv
		
		///// gallery내역
		function showGalleryList(){
			var bandNo = '${record.b_no}';
			var jsonB_no = {'b_no' : bandNo};
			
			$.ajax({
				url : '<c:url value="/band/getBandImgList.ins"/>',
				data : jsonB_no,
				dataType:'json',
				success:function(data){
					createGalleryDiv(data);},
				error:function(request, error){
					console.log('상태코드:',request.status);
					console.log('서버로부터 받은 HTML데이타 :',request.responseText);
					console.log('에러:',error);}
			});//#.ajax
		}///showGalleryList
		
		function createGalleryDiv(data){
			console.log(data);
			//다이브 초기화
			$(".lightgallery-center-div").html("");
			//추가 버튼 생성
			if(${thirdLook != 'T'}){
				var addDiv = '<div data-toggle="modal" data-target="#modal-upload-img" class="plus-image" style="width:287px; height:287px; text-align:center; padding-top:125px; margin:0 0 20px 20px; box-shadow: 2px 2px 5px rgba(0,0,0,0.5); display:inline-block;">';
				addDiv += '<img style="width:30px; height:30px;" src="/insomnia/resource/img/plus-button.png"/></div>';
				$.each(data, function(idx, element){
	
					//2019 05 17 임한결 수정/// 자신의 밴드일 경우 갤러리 비었다는 메세지를 보여주지 않고 addDiv만 보여주도록 한다.
					//case 1 /// 자신의 밴드이면서 밴드가 등록한 이미지가 없을떄
					/*
					if(element['isExist'] == 'F'){ //갤러리에 등록된 이미지가 없을때
						var emptyString = '<p id="emptyProjectText" style="display: block">갤러리가 비었습니다.</p>';
						$("#card-list-gallery").html(emptyString+addDiv);
						return;
					}//if
					else{ //있을 때
						var beforeString = $(".lightgallery-center-div").html(); 
						var afterString = '<div class="lightgallery" id="lightgallery">';
						afterString += ' <a href="/insomnia/upload/band/img/'+ element['image'] + '">';
						afterString += '<img class="thumbnail" src="/insomnia/upload/band/img/' + element['image'] + '"/></a></div>';
						$(".lightgallery-center-div").html(beforeString + afterString+addDiv);
					}*/
					/*
					var beforeString = $(".lightgallery-center-div").html(); 
					var afterString = '<div class="lightgallery" id="lightgallery">';
					afterString += ' <a href="/insomnia/upload/band/img/'+ element['image'] + '">';
					afterString += '<img class="thumbnail" src="/insomnia/upload/band/img/' + element['image'] + '"/></a></div>';
					$(".lightgallery-center-div").html(beforeString + afterString+addDiv);
					*/
					
					if(element['image'] == null){}////
					
					///2019 05 17 임한결 수정 끝
					else{
						var beforeString = $(".lightgallery-center-div").html(); 
						var afterString = '<div class="lightgallery" id="lightgallery">';
						afterString += ' <a href="/insomnia/upload/band/img/'+ element['image'] + '">';
						afterString += '<img class="thumbnail" src="/insomnia/upload/band/img/' + element['image'] + '"/></a></div>';
						$(".lightgallery-center-div").html(beforeString + afterString);
					}//else
					
				});//$.each
				//추가버튼 마지막으로 붙임
				var beforeString = $(".lightgallery-center-div").html();
				$(".lightgallery-center-div").html(beforeString + addDiv);
			}//if 자신의 밴드일 경우
			else{
				$.each(data, function(idx, element){
					if(element['isExist'] == 'F'){ //갤러리에 등록된 이미지가 없을때
						var emptyString = '<p id="emptyProjectText" style="display: block">갤러리가 비었습니다.</p>';
						$("#card-list-gallery").html(emptyString);
						return;
					}//if
					else{ //있을 때
						var beforeString = $(".lightgallery-center-div").html(); 
						var afterString = '<div class="lightgallery" id="lightgallery">';
						afterString += ' <a href="/insomnia/upload/band/img/'+ element['image'] + '">';
						afterString += '<img class="thumbnail" src="/insomnia/upload/band/img/' + element['image'] + '"/></a></div>';
						$(".lightgallery-center-div").html(beforeString + afterString);
					}
				});//$.each
				//추가버튼 마지막으로 붙임
				var beforeString = $(".lightgallery-center-div").html();
				$(".lightgallery-center-div").html(beforeString);
			}//자신의 밴드가 아닐 경우
		}//createGalleryDiv
		
		
		
		//////////////////////////////////////////////플러스 버튼을 클릭해 새로운 밴드 이미지 등록
		function addBandImg(path){
			console.log("addBandImg fn START path : " + path);
			$(".plus-image").remove();
			var beforeString = $(".lightgallery-center-div").html();
			
			// 갤러리에 추가 버튼을 등록함
			var addDiv = '<div data-toggle="modal" data-target="#modal-upload-img" class="plus-image" style="width:287px; height:287px; text-align:center; padding-top:125px; margin:0 0 20px 20px; box-shadow: 2px 2px 5px rgba(0,0,0,0.5); display:inline-block;">';
			addDiv += '<img style="width:30px; height:30px;" src="/insomnia/resource/img/plus-button.png"/></div>';
			
			var afterString = '<div class="lightgallery" id="lightgallery">';
			afterString += ' <a href=' + path + '">';
			afterString += '<img class="thumbnail" src="' + path + '"/></a></div>';
			console.log("div 생성");
			//재등록
			$(".lightgallery-center-div").html(beforeString + afterString + addDiv);
			console.log("div 재등록 완료");
		}///addBandImg
		///////////////////////////////////////////////// 플러스 버튼을 클릭해 새로운 밴드 이미지 등록 끝
		
		///////////////////////////////////////////////// 플러스 버튼을 클릭해 새로운 밴드 음악 등록
		function addBandMusic(data){
			console.log("addBandMusic fn START data : " + data);
			location.href='/insomnia//band/bandInfo.ins';}
		
		
		// 플레이버튼 클릭하여 플레이
		function playSwitch(obj){
			//해당 객체의 파일 이름을 얻어온다. / 현재 상태를 얻어옴
			var status = $(obj).html();
			var fileName = $(obj).attr("id");
			var varName = $(obj).attr("title");
			switch(status){
			case 'play': 
				playList[varName].play()
				$(obj).html("stop");
				break;
			case 'stop': 
				playList[varName].pause();
				playList[varName].currentTime = 0;
				$(obj).html("play");
				break;
			}//switch
		}//fn playSwitch
		
		
		/*
		////////// 밴드 좋아요 처리
		function likeBand(){
			
		}////밴드 좋아요 처리
		*/
		
	$(function(){
			
			var b_no = $('#b_no').html();
			
			$('.likeNfollow').click(function(){
				var choice = $(this).prop('id');
				var self = $(this);
				$.ajax({
					url:"<c:url value='/band/like.ins'/>",
					type:'post',
					data:{"b_no":b_no, "choice":choice},
					dataType:'text',
					success:function(data){
						console.log("들어오는지 " + data);
						self.html(data);
					},
					error:function(request, error){
						console.log('상태코드:',request.status);
						console.log('서버로부터 받은 HTML데이타 :',request.responseText);
						console.log('에러:',error);	
					}
					
				});////////$.ajax
			});/////click
		})////제이쿼리 진입점
		
			
	</script>