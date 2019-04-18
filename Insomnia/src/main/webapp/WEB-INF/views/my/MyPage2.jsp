<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>

<script src="http://malsup.github.com/jquery.form.js"></script> 


<!-- Site Stylesheet -->
<link rel="stylesheet" href="<c:url value='/vendor/css/MyPage2CSS.css'/>" />

<style>

.header-magic-line .header-inner {
    background: black;
}

</style>

<!-- 제이쿼리 UI용 라이브러리 임베드 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body {
	
} 
</style>

</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site" >
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>
		<br><br><br><br>
		
		<!--===========================-->
		<!--=        	About         =-->
		<!--===========================-->
		<!-- 여기부터 -->

		<div id="wadizContainer">
			<div id="mypageWrap">

				<div class="myprofile-wrap">

					<div class="myinfo-wrap">    <!-- 상단부분  시작-->
						
						<div class="inner-section">
							<div class="myinfo-content">
								<dl>
									<dd>
										<p class="nickname">${record.name}</p>
										<p class="accnttype">개인 회원</p>
										<p class="otherinfo"></p>
									</dd>
									<dt>
									<!-- 비 ajax : 새로고침 된다. -->
									<%-- <c:if test="${empty record.profile_img}" var="isExistProfile">
										<em class="profile-img"
											style="background-image: url(https://www.wadiz.kr/wwwwadiz/green001/sns_profile_pics/20190304205851548_59178389.jpg);"></em>
										<a id="editImage">이미지 등록</a>
									</c:if>
									<c:if test="${not isExistProfile}">
										<img class="profile-img" src="<c:url value='/upload/${fileName}'/>"> <!-- DB에서 갖고오자! -->
										<a id="editImage">이미지 수정</a>
									</c:if> --%>
									<!-- ajax -->
									<img class="profile-img2" src="<c:url value='/upload/${record.profile_img}'/>"/>
									<a id="editImage">${empty record.profile_img ? '이미지등록' : '이미지수정'}</a>
									</dt>
								</dl>
								<p style="display:hidden" id="imgSrc"></p>
								<form id="imgForm" action="<c:url value='/edit/profileImg.ins'/>" method="POST" enctype="multipart/form-data">
										<input type="file" id="imgUpload" name="imgUpload" accept="image/*">
								</form>
								<ul class="activity-list">
									<li><strong class="count">0</strong><span>펀딩</span></li>
									<li><a href="javascript:void(0)"> <strong
											class="count">0</strong> <em>지지서명</em>
									</a></li>
									<li><a href="javascript:void(0)"><strong
											class="count">0</strong><em>팔로워</em></a></li>
									<li><a href="javascript:void(0)"><strong
											class="count">0</strong><em>팔로잉</em></a></li>
								</ul>
								<p class="introduce"></p>
								<ul class="interest-list">


								</ul>
								<div class="btn-wrap">



									<a href="javascript:void(0)"
										class="wz button btn-edit">프로필 편집</a>

								</div>
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


					<div class="mypage-project bg ">   <!-- 하단 부분 시작 -->
						<div class="tab-list">
							<ul>
								<li><a href="javascript:void(0)">펀딩한</a></li> <!-- 결제 -->
								<li><a href="javascript:void(0)">좋아한</a></li>	<!-- 좋아요 -->
								<li class="active"><a
									href="javascript:void(0)">만든</a></li>	<!-- 밴드/방구석 -->
							</ul>
						</div>
						<div class="project-list">
							<div class="top-area">

								<div class="select-box icon-expand-more">
									<select id="selectProjectType">
										<option value="all" selected="selected">전체</option>
										<option value="invest"'="">투자</option>
										<option value="reward">리워드</option>
									</select>
								</div>
							</div> <!-- top-area 끝 -->

							<div id="projectCardList" class="card-list">
								<p id="emptyProjectText" style="display: block">만든 음악이
									없습니다.</p>
								<ul>
									<!-- S : 전체 리스트 -->

									<!-- E : 전체 리스트 -->

									<!-- S : 리워드 리스트 -->



								</ul>
							</div>  <!-- projectCardList 끝 -->
						</div>  <!-- projectList 끝 -->
					</div>  <!-- 하단 부분 끝 -->
					
				</div>  <!-- 상단/하단 전체 감싸는 div 끝 : myprofile-wrap  -->

			</div>
		</div>


		<!-- 여기까지 -->
		
		<!-- 이미지 프로필 수정 모달 -->
		
		<!-- <div id="imgModal" class="modal">
		
			<div class="modal-content">
				<span class="close">&times;</span>
				<label for="imgUpload">이미지 업로드</label>
				<input type="file" name="imgUpload" size="3,145,728" id="imgUpload">  용량제한 3MB
			</div>
		</div> -->
		
		<!-- 모달 자바스크립트 -->
		<!-- <script>
		
			$(function(){
				
				$('.editImage').click(function(){
					$('#imgModal').css('display', 'block');
				});
				
				$('.close').click(function(){
					$('#imgModal').css('display', 'none');
				});
				
			})
		
		</script> -->
		<script>
		
		
			$(function(){
				
				console.log("콘솔에 찍어본 c:url 주소" + $('.profile-img2').prop('src'));
				
				$.ajaxSetup({type:'post'});
				
				$('#editImage').click(function(){
					$('#imgUpload').trigger('click');
				});
				
				$('#imgUpload').change(function(){
					
					
					var extensionPos = $(this).val().lastIndexOf('.')+1;
					var extension = $(this).val().substring(extensionPos);
					console.log("확장자 = " + extension);
					
					var match = ['jpg', 'png', 'gif', 'jpeg', 'bmp', 'tif'];
					
					console.log("타입은 대체?" + $(this).type);
					
					if($.inArray(extension.toLowerCase(), match) == -1) {
						alert('이미지 파일만 등록해주세요.');
						return;
					}
					
					var uploadOk = confirm('이미지를 프로필 사진으로 등록하시겠습니까?');
					
					//FormData 객체 사용!
					/* var form = new FormData($('#imgForm'));  */ //자바스크립트 객체의 인자로 제이쿼리 객체 넣어도 되나?
					
					if(uploadOk) {
						//방법1.  
						//$('#imgForm').submit();
						//방법2.
						$('#imgForm').ajaxForm({
							
							url : '<c:url value="/edit/profileImgAjax.ins"/>',
							enctype: 'multipart/form-data',
							dataType : 'text',	
							success : function(data){
								
								
								var pos = $('.profile-img2').prop('src').indexOf("/upload");
								var srcStr = $('.profile-img2').prop('src').substring(0, pos+7) + "/";
								
								 console.log("데이터 " + data);
								console.log("post "  + pos);
								console.log("srcStr " + srcStr);
								
								 console.log("내가 조합한 주소" + srcStr + data);
								$('.profile-img2').prop('src', srcStr + data);
								
								if($('.editImage').html() == '이미지등록') {
									$('.editImage').html('이미지수정');
								}
								
							},
							error : function(request,error){
								console.log('상태코드:',request.status);
								console.log('서버로부터 받은 HTML데이타 :',request.responseText);
								console.log('에러:',error);	
								
							}
							
						});///$.ajaxForm(); */
						
						$('#imgForm').submit();
						
					}
				});
				
			})
		
		</script>
		

		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		
	<script>
	
	$(function(){
		
		$('.tab-list ul li').hover(function(){
			$(this).addClass('active');
		}, 
		
		function(){
			$(this).removeClass('active');
		})
		
	})
	
	</script>
	
	<!-- 펀딩한, 좋아한, 만든 : ajax -->
	<script>
	
		$(function(){
			
			$.ajaxSetup({type:'post'});
			
			$('.tab-list ul li a').click(function(){
				
				$.ajax({
					url : '<c:url value="/mypage/history.ins"/>',
					dataType : 'json',
					data : {id:"${sessionScope.id}", target:$(this).html()},
					success : function(data) {
						succFunction(data);
					},
					error : function(data) {
						failFunction(data);
					}
					
				});///////$.ajax
				
			});
			
		})///////제이쿼리 진입점
		
		function succFunction() {
			//값 받아서 뿌려주기 projectCardList, div 1개로 돌려막기? 3개 생성?
		}
	
	
	</script>

