<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	/*===================로그인 후 회원화면=========================*/
.user_top dd, .user_top dt {
	
	display: inline;
	color: white;
	font-size: 15px;
}
.afterLogin p, .afterLogin a {
	color: white;
	font-size: 15px;
}
.user_picture {
	
	width: 70px;
	height: 50px;
	border-radius: 100%;
	margin-right: 20px;
	margin-left: 10px;
	margin-bottom: 5px;
	
}
.benefit span, .benefit dt, .benefit dd, .benefit a {
	font-size: 13px;
	margin-left: 5px;
}
#logout {
	font-size; 13px;
	float: right;
}
.afterLogin img {
	width: 30px;
}
/* table { */
/* 	width: 279px; */
/* 	text-align: center; */
/* } */
.user_middle table tr {
	width: 279px;
	text-align: center;
}
.user_middle table td  {
	width: 25%;
}
.user_middle td a {
	width: 100%;
	text-align: center;
	height: 100px;
}
.user_middle label {
	color: white;
	font-size: 15px;
}
.user_bottom li, .user_bottom ul {
	width: 100%
}
.user_bottom img{
	width: 20%
}
.user_bottom span{
	width: 80%
	text-align: center;
}
.profile_name {
	color: orange;
	font-size: 17px;
}
.user_top {	
	
	
}
.user_middle {
	
	
}
.user_bottom {
	
}
	
</style>

<link href="<c:url value='/vendor/css/LoginCSS.css'/>" rel="stylesheet" />

<!-- aws s3 사용을 위한 js -->
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.283.1.min.js"></script>

<script>
$(function(){
	//===================== aws s3 사용을 위한 설정] =====================
	var albumBucketName = 'insomnia4';
	var bucketRegion = 'ap-northeast-2';
	var IdentityPoolId = 'ap-northeast-2:739cd73f-a436-49af-b47e-58f780f27ebe';
	var albumName = "cover_Image";
	AWS.config.update({
	  region: bucketRegion,
	  credentials: new AWS.CognitoIdentityCredentials({
	    IdentityPoolId: IdentityPoolId
	  })
	});
	
	var s3 = new AWS.S3({
		  apiVersion: '2006-03-01',
		  params: {Bucket: albumBucketName}
	});		
	
	//===================== aws s3 사용을 위한 설정] =====================
	var albumPhotosKey = encodeURIComponent(albumName) + '/';
	s3.listObjects({Prefix: albumPhotosKey}, function(err, data) {
	  if (err) {
	    return alert('There was an error viewing your album: ' + err.message);
	  }
	  // 'this' references the AWS.Response instance that represents the response
	  var href = this.request.httpRequest.endpoint.href;
	  var bucketUrl = href + albumBucketName + '/';
	  var photoKey;
	  var photoUrl;
	  var photos = data.Contents.map(function(photo) {
		    photoKey = 'cover_Image/${id}_cover_Img.jpg';
		    photoUrl = bucketUrl + encodeURIComponent(photoKey);
	  });
	  console.log("photoUrl : "+photoUrl);
	  $(".mypage_1").click(function(){
		  $.ajax({
			 url: "<c:url value='/menu/mypage3.ins'/>",
			 type: 'post',
			 dataType: 'text',
			 data: 'photoUrl='+photoUrl,
			 success: function(data){
				 location.href = "<c:url value='/menu/mypage.ins?url="+data+"'/>";
			 },
			 error: function(){
			 }
		  });
	  })
	})
})
</script>

<!-- 네비게이션 바 -->
<div class="nav loginAllDiv">

	<!--=========================-->
	<!--=        Navbar         =-->
	<!--=========================-->
	<header class="header header-magic-line">
		<div class="header-inner loginAllDiv" >
			<div class="tim-container clearfix">
				<div class="header-magic-line-inner clearfix">
					<div id="site-logo" class="float-left">
						<a href="<c:url value='/home.ins'/>" class="logo-main"> <img
							src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
						</a> <a href="<c:url value='/home.ins'/>" class="logo-stickky"> <img
							src="<c:url value='/resource/img/logo_5.png'/>" alt="logo">
						</a>
					</div>

					<!-- 로그인 아이콘 -->
					<ul class="user-login">
						<li><a href="<c:url value='/#'/>" class="off-opener"> <i
								class="fa fa-bars" aria-hidden="true"></i>
						</a></li>
					</ul>

					<div class="nav">
						<ul class="group" id="header-menu-magic-line">

							<li class="menu-item-has-children current_page_item"><a
								href="<c:url value='/home.ins'/>">HOME</a></li>

							<li class="menu-item-has-children"><a
								href="<c:url value='/main/mainproject.ins'/>">Funding</a>
							</li>

							<li class="menu-item-has-children"><a
								href="<c:url value='/sub1/subprojects.ins'/>">Sub Projects</a></li>

							<%
								if ("admin".equals(session.getAttribute("id")) || "ADMIN".equals(session.getAttribute("id"))) {
							%>
							<li class="menu-item-has-children">
							<a href="<c:url value='/admin/index.ins'/>" id="adminpage">Admin Page</a></li>
<!-- 							<li class="menu-item-has-children"><a -->
<%-- 								href="<c:url value ='/Pay/PayPage.ins'/>">PayPage(Test)</a></li> --%>
							<%
								} else {
							%>

							<li class="menu-item-has-children">
							<a href="" class="mypage_1">My Page</a></li>
							<%
								}
							%>
						</ul>
					</div>
					<!-- /.nav -->
				</div>
			</div>
			<!-- /.tim-container -->
		</div>
		<!-- /.header-inner -->
	</header>
	<!-- /#header -->


	<!-- 여기부터 -->
			
				<!-- 로그인 시 보여줄 화면 시작 -->
				<div class="offset-menu-two">
					<div class="afterLogin" style="margin-top: -370px">
					<!-- 닫기 버튼 -->
						<a href="javascript:return false;" class="offset-closer">
							<img style="margin-left: 270px; margin-top: -60px; width:15px; height:15px;" src="<c:url value='/resource/img/offset-cross2.png'/>" alt="">
						</a>
					<!-- 네이버 로그인 display:none -->
					<div id="naver_id_login" style="display: none;"></div>
						
					<!-- 사용자 계정정보 -->
				
	            	<div class="user_top">		<!-- 상단메뉴:div -->
              			<!-- 프로필 이미지 -->
						

						<!-- 소셜 로그인 이미지 시작 -->
	  
	            		
	            		<!-- 소셜 회원 조건 -->
	            		<c:if test="${empty loginRecord.login_chain}" var="notSocial">  <!-- 실행코드가 없는 조건: 소셜회원 -->
						</c:if>
						<!-- 프로필이 S3형식인지 조건 : 소셜과 비소셜 모두 포함되므로 isSocial과 함께 써야 한다. -->
						<c:if test="${fn:contains(loginRecord.profile_img, 'cover_Img.jpg')}" var="isChanged">
						</c:if>
						<!-- ========================================== -->
						<!-- 소셜 회원이 아닌 경우 -->
						<c:if test="${notSocial}">
							<img class="user_picture" src="https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/${loginRecord.profile_img}"/>
						</c:if>
						
						<!-- 소셜 회원이면서 프로필 안 바꾼 경우 -->
						<c:if test="${not notSocial and not isChanged}"> 
                			<img class="user_picture" src="${loginRecord.profile_img}"/>
						</c:if>
						
						<!-- 소셜 회원인데도 프로필 바꿔서 S3형식으로 출력해야 하는 경우 -->
						<c:if test="${not notSocial and isChanged}"> 
                			<img class="user_picture" src="https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/${loginRecord.profile_img}"/>
						</c:if>
	            		
						
						<!-- 소셜 로그인 이미지 끝 -->
              			<!-- 사용자 이름 -->
              			<a href="<c:url value='/menu/mypage.ins'/>" class=""><span class="profile_name">${loginRecord.name}</span>님 환영합니다!</a>
              			<!-- 쿠폰, 포인트 -->
			             <dl class="c">
			               <dt>쿠폰</dt>
			               <dd><a href="javascript:void(0)"><span id="">0</span>장</a></dd>
			               <dt>포인트</dt>
			               <dd><a href="javascript:void(0)"><span id="">0</span>P</a></dd>
			             </dl>
            		</div>
		            <table class="user_middle">	<!-- 중간메뉴:ul -->	<!-- ul이 1 칸 차지, li display : inline -->
		              <tr>
			              <td><a id="middle1" href="javascript:return void(0)"><img src="<c:url value='/img/iconfinder_apple-music-2_2301791.png'/>"/></a></td>

			              <td class="mypage_1"><a id="middle2" href="javascript: return void(0)" class=""><img src="<c:url value='/img/iconfinder_microphone_1055023.png'/>"/></a></td>

			              <td><a id="middle3" href="javascript: return void(0)" class=""><img src="<c:url value='/img/followers.png'/>"/></a></td>
			              <td><a id="middle4" href="<c:url value='/freeBoard/Free_Board.ins'/>" class=""><img src="<c:url value='/img/iconfinder_heart_289619.png'/>"/></a></td>
			           </tr>
			           <tr>
		           		  <td><label for="middle1">리워드</label></td>
		           		  <td class="mypage_1"><label for="middle2">마이페이지</label></td>
		           		  <td><label for="middle3">링크공유</label></td>
		           		  <td><label for="middle4">FAQ</label></td>
			           		
			           </tr>
		            </table>
		            
		            <!-- display:none 끝 -->
		            <%-- <ul class="user_bottom">		<!-- 하단메뉴 --> <!-- ul이 1칸 차지, li display: inline -->
		              <li>
		                <a id="" class="" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_mail_1055030.png'/>"/>
		                  		<span class="">메시지</span>
		                </a>
		              </li>
		              <li><a class="" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_humans_1216581.png'/>"/><span>친구 초대하기</span></a></li>
		              <li><a class="" href="javascript:void(0)"><img src="<c:url value='/img/iconfinder_wrench_416405.png'/>"/><span>설정</span></a></li>
		              <li><a class="" href="<c:url value='/logout.ins'/>"><img src="<c:url value='/img/exit.png'/>"/><span>로그아웃</span></a></li>
		            </ul> --%>
		            <a id="logout" href="<c:url value='/logout.ins'/>">로그아웃</a>
		            <a href="<c:url value='/band/bandInfo.ins'/>">밴드관리</a>
            
          		</div> <!-- afterLogin div 끝 -->
						
			<!-- 여기까지 -->
						
						
		</div>
				
				<!-- 로그인 시 보여줄 화면 끝 -->
			<!-- 로그인/회원정보 페이지 끝 -->
			



			<!-- 여기까지 -->

	<!-- 여기까지 -->

<!--로그인 처리-->



	<!--=============================-->
	<!--=        Mobile Nav         =-->
	<!--=============================-->
	
	<!-- hover 효과 -->
		<script> 
			$(function(){
				
				$('.afterLogin label, #logout').hover(function(){
					
					$(this).css('color', 'rgb(222, 255, 239)');
					
				}, function(){
					$(this).css('color', 'white');
				});
				
				
			})
			
		</script>
		
		<script>
			$(function(){
				
				$('.user_middle td:first-child').click(function(){
					/* location.href="<c:url value=''/>"; */
				});
				

				$('.user_middle td:nth-child(2)').click(function(){
					location.href="<c:url value='/menu/mypage3.ins'/>";
				});

				
				$('.user_middle td:nth-child(3)').click(function(){
					/* location.href="<c:url value=''/>"; */
				});
				
				$('.user_middle td:nth-child(4)').click(function(){
					/* location.href="<c:url value=''/>"; */
				});

				
			})
		
		</script>


</div>
<!-- 네비게이션 바 끝 -->
<!-- 밑 두줄 필요(없으면 꺠지는 부분이 있음) -->
<header id="mobile-nav-wrap"> </header>

