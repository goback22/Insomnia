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
									<c:if test="${empty record.login_chain}" var="isSocial">
										<img class="profile-img2" src="<c:url value='/upload/${record.profile_img}'/>"/>
									</c:if>
									<c:if test="${not isSocial}">
										<img class="profile-img2" src="${record.profile_img}"/>
									</c:if>
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



									<a href="<c:url value='/menu/mypage/edit.ins'/>"
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


					<div class="mypage-project bg">   <!-- 하단 부분 시작 -->
						<div class="tab-list">
							<ul id="historyTab">
								<li style="text-align:center;" class="active_click"><span>음반</span></li> <!-- 결제 -->
								<li style="text-align:center;"><span>공연</span></li>
								<li style="text-align:center;"><span>좋아한</span></li>	<!-- 좋아요 -->
							</ul>
						</div>
						<div class="project-list" style="text-align:center;">
							<div class="top-area">

								<!-- <div class="select-box icon-expand-more">
									<select id="selectProjectType">
										<option value="all" selected="selected">전체</option>
										<option value="invest"'="">투자</option>
										<option value="reward">리워드</option>
									</select>
								</div> -->
							</div> <!-- top-area 끝 -->
							
							<!-- 실질적으로 내용 뿌려주는 부분 -->
							<div id="projectCardList" style="text-align:center;" class="card-list">
								<!-- 내용이 없을 경우 -->
								<c:if test="${empty fundingRecords}" var="result">
									<p id="emptyProjectText" style="display: block">펀딩한 음악이  <!-- ajax에서도 같은기능 구현해야 -->
										없습니다.</p> <!-- 이거 효과줄라고 ajax에서 했는데, id라서 안 되네. class로 바꾸면 될래나? css때무네 -->
								</c:if>
								<!-- 내용이 있을 경우 -->
								<c:if test="${not result}">
									<div class="historyValue" style="width:1500px; height:450px; margin:auto; text-align:center;"> <!-- 루프 -->
										<c:forEach items="${fundingRecords}" var="funding">
										
											<!-- 여기에 ajax랑 똑같은 UI 뜨게 -->

											<div class='historyDiv'>
												<p class='historyName'>${funding.r_name}</p>
												<img class='historyImg' src="<c:url value='/resource/img/${funding.s_album_cover}'/>"/> 
												<p class="historyDesc">${funding.r_description}</p>  
												<p class="historyMusic">${funding.bm_name}</p>  
												<p class="historyAuthor">${funding.b_name}</p><p class="historyPrice">${funding.r_price}원</p>
											</div>
											 
										</c:forEach>
									</div>
								</c:if>
								
							</div>  <!-- projectCardList 끝 -->
							<div class="pagingDiv" style="text-align: center; margin:auto; width:1000px; margin-top:20px;">${pagingString}</div>
						
							
						</div>  <!-- projectList 끝 -->
					</div>  <!-- 하단 부분 끝 -->
					
				</div>  <!-- 상단/하단 전체 감싸는 div 끝 : myprofile-wrap  -->

			</div>
		</div>
		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		
		<!-- 스크립트 시작 -->

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
								
								/* console.log("데이터 " + data);
								console.log("post "  + pos);
								console.log("srcStr " + srcStr);
								
								 console.log("내가 조합한 주소" + srcStr + data); */
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
		

		
	
	<!--  -->	
	<script>
	
	$(function(){
		
		$('.tab-list ul li').hover(function(){
			
			$('.tab-list ul li').not($(this)).removeClass('active');
			$(this).addClass('active');
		}, 
		
		function(){
			
			$(this).removeClass('active');
			
		})/////////////
		
		///클릭했을 때.
		$('.tab-list ul li').click(function(){
			
			$('.tab-list ul li').not($(this)).removeClass('active_click');
			$(this).addClass('active_click');
		});
		

	})
	
	</script>
	
	<!-- 펀딩한, 좋아한, 만든 : ajax -->
	<script>
	
	
	var whichClick = "";
	
		$(function(){
			
			$('#historyTab li').click(function(){
				
				console.log("historyTab li가 클릭은 되니?");
				console.log("컨트롤러의 switch문에 전달하는 값은? " + $(this).find('span').html());
				
				///밑에서 음반, 공연, 등 나눠주기 위한 용도
				whichClick = $(this).find('span').html();
				
				$.ajax({
					url : '<c:url value="/mypage/history.ins"/>',
					type: 'post',
					dataType : 'json',
					data : {target:$(this).find('span').html()},
					success : function(data) {
						console.log("ajax succFunction 실행 전 코드");
						succFunction(data);
					},
					error : function(request, error) {
						console.log('상태코드:',request.status);
						console.log('서버로부터 받은 HTML데이타 :',request.responseText);
						console.log('에러:',error);	
						
					}
					
				});///////$.ajax
				
				$('.historyDiv *').trigger("create")
				
			});//////click 이벤트
			
		})///////제이쿼리 진입점
		
		function succFunction(data) {
			//값 받아서 뿌려주기 projectCardList, div 1개로 돌려막기? 3개 생성?
			console.log('succFunction이 받은 데이터' + data)
			
			
			var listString = "";
			var pageString = "";
			var isEmpty = false;
			var emptyMessage = "";
			$.each(data, function(index, element){
				
				if(element['noData'] != null) {
					//emptyMessage = "<p class='emptyMess'>아직 "+element["which"]+" 상품이 없습니다.</p>";
					emptyMessage = "<div class='emptyMess'>아직 "+element["which"]+" 상품이 없습니다.</div>";
					isEmpty = true;
					return;
				}
				 
				if(element['pagingString'] != null) {
					pageString = element['pagingString'];
					return;  
				}
				console.log("$.each()에 어떤 값이?" + whichClick);
				if(whichClick == "음반") {

					
					var imgSrc = element["S_Album_cover"];
					var src = '<c:url value="/resource/img/'+imgSrc+'"/>';
					
					listString += "<div class='historyDiv'>";  //전체 div
					listString += "<p class='historyName'>" + element["R_Name"] + "</p>"; 
					listString += "<img class='historyImg' src='"+src+"' />"  
					listString += "<p class='historyDesc'>"+element["R_Description"]+"</p>";
					listString += "<p class='historyMusic'>"+element["BM_name"]+"</p>";
					listString += "<p class='historyAuthor'>"+element["B_name"]+"</p><p class='historyPrice'>"+element["R_Price"]+"원</p>";

	
					listString += "</div>"  //전체 div끝
				}
				
				if(whichClick == "공연") {
					

					//var imgSrc = element["S_Album_cover"];
					var imgSrc = "yumicell.jpg";
					var src = '<c:url value="/resource/img/'+imgSrc+'"/>';
					
					listString += "<div class='historyDiv'>";  //전체 div
					listString += "<p class='historyName'>" + element["b_title"] + "</p>"; 
					listString += "<img class='historyImg' src='"+src+"'/>"  
					listString += "<p class='historyDesc'>"+element["b_content"]+"</p>";
					listString += "<p class='historyMusic'>"+element["concertDate"]+"</p>";
					var qty = Number(element["qty_bgs"]);
					var price = Number(element["price_bgs"]);
					listString += "<p class='historyAuthor'>예매수량:"+element["qty_bgs"]+"장</p><p class='historyPrice'>"+(qty*price)+"원</p>";

	
					listString += "</div>"  //전체 div끝
				}
				
			});
			

			console.log("이게 비어서 문젠가? " + listString + " 장소는 " + whichClick);
			
			console.log("페이지스트링 " + pageString);
			
			$('.pagingDiv').html(pageString)
			
			
			
			if(isEmpty) {
				$('.historyValue').html(emptyMessage);
				$('.pagingDiv').html("");
				return;
			}
			
			$('.historyValue').html(listString);
			
			
			
			
		}/////succFunction
	
	
	</script>
	

