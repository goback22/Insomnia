<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="http://malsup.github.com/jquery.form.js"></script> 

<!-- aws s3 사용을 위한 js -->
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.283.1.min.js"></script>

<!-- Site Stylesheet -->
<link rel="stylesheet" href="<c:url value='/vendor/css/MyPage2CSS.css'/>" />

<style>

.header-magic-line .header-inner {
    background: black;
}

</style>

<style type="text/css">
	.current {
  color: green;
}

#pagin li {
  display: inline-block;
}

.prev {
  cursor: pointer;
}

.next {
  cursor: pointer;
}

.last{
  cursor:pointer;
  margin-left:5px;
}

.first{
  cursor:pointer;
  margin-right:5px;
}

.project-list {
	height:485px;
}

.historyValue {
	height:450px;
}

#pagin {
	margin-top:80px;
}

@media ( max-width: 768px ) {

	body {
		height:auto;
	}

	#wadizContainer {
		height:auto;
	}

	.project-list {
		height:auto;
	}
	
	#projectCardList {
		height:auto;
	}


	.mypage-project {
		height:auto;
	}


	.historyValue {
		height:auto;
	}
	
	.historyValue {
		height:auto;
	}
	
	


}


</style>


<!-- 제이쿼리 UI용 라이브러리 임베드 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body {
	
} 
</style>
<style>
	.filebox label { 
		display: inline-block;
		padding: .5em .75em;
		color: #999;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #fdfdfd;
		cursor: pointer;
		border: 1px solid #ebebeb;
	    border-bottom-color: rgb(235, 235, 235);
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
		width: 103px;
		margin-top: 7px;
	} 
	
	.filebox input[type="file"] {
		 /* 파일 필드 숨기기 */ 
		 position: absolute; 
		 width: 1px; 
		 height: 1px; 
		 padding: 0; 
		 margin: -1px; 
		 overflow: hidden; 
		 clip:rect(0,0,0,0); 
		 border: 0; 
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
										<p class="nickname">${loginRecord.name}</p>
										<p class="accnttype">개인 회원</p>
										<p class="otherinfo"></p>
									</dd>
									<dt>
									
							
									<!-- =================================== -->
									
									<!-- 소셜 로그인 이미지 시작 -->
	  
	            		
				            		<!-- 소셜 회원 조건 -->
				            		<c:if test="${empty loginRecord.login_chain}" var="notSocial">  <!-- 실행코드가 없는 조건: 소셜회원이 아닌 경우 -->
									</c:if>
									<!-- 프로필이 S3형식인지 조건 : 소셜과 비소셜 모두 포함되므로 isSocial과 함께 써야 한다. -->
									<c:if test="${fn:contains(loginRecord.profile_img, 'cover_Img.jpg')}" var="isChanged">
									</c:if>
									<!-- ========================================== -->
									<!-- 소셜 회원이 아닌 경우 -->
									<c:if test="${notSocial}">
										<img class="profile-img2" src="https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/${loginRecord.profile_img}"/>
									</c:if>
									
									<!-- 소셜 회원이면서 프로필 안 바꾼 경우 -->
									<c:if test="${not notSocial and not isChanged}"> 
			                			<img class="profile-img2" src="${loginRecord.profile_img}"/>
									</c:if>
									
									<!-- 소셜 회원인데도 프로필 바꿔서 S3형식으로 출력해야 하는 경우 -->
									<c:if test="${not notSocial and isChanged}"> 
			                			<img class="profile-img2" src="https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/${loginRecord.profile_img}"/>
									</c:if>
				            		
									
									<!-- 소셜 로그인 이미지 경우의 수 끝 -->

									<div class="filebox">
										<label for="imgUpload1">프로필 변경</label> 
										<input type="file" id="imgUpload1" name="imgUpload1" accept="image/*">
									</div>

									</dt>
								</dl>
								<p style="display:hidden" id="imgSrc"></p>
								<!-- <input type="file" id="imgUpload" name="imgUpload" accept="image/*"> -->
								<ul class="activity-list">
									<li><strong class="count">${fundingCount}</strong><span>펀딩</span></li>
									<li><a href="javascript:void(0)"> <strong
											class="count">${bgsCount}</strong> <em>공연</em>
									</a></li>
									<li><a href="javascript:void(0)"><strong
											class="count">${likeCount}</strong><em>좋아요</em></a></li>
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


					<div class="mypage-project bg" style="width:100%;">   <!-- 하단 부분 시작 -->
						<div class="tab-list">
							<ul id="historyTab" style="width:50%;">
								<li style="text-align:center;" class="active_click"><span>음반</span></li> <!-- 결제 -->
								<li style="text-align:center;"><span>공연</span></li>
								<li style="text-align:center;"><span>좋아한</span></li>	<!-- 좋아요 -->
							</ul>
						</div>
						<div class="project-list" style="text-align:center;">
							
							<!-- 실질적으로 내용 뿌려주는 부분 -->
							<div id="projectCardList" style="text-align:center;" class="card-list">
							<!-- <div class="historyValue paginated" style="width:1500px; height:450px; margin:auto; text-align:center;"> --> <!-- 루프 -->
								<div class="historyValue paginated" style="width:100%; margin:auto; text-align:center;">
									<!-- 내용이 없을 경우 -->
									<c:if test="${empty fundingRecords}" var="result">
										<!-- <div class="historyEmptyValue" style="width:1500px; height:450px; margin:auto; text-align:center;"> -->
											<p id="emptyProjectText" style="display: block">펀딩한 음악이  <!-- ajax에서도 같은기능 구현해야 -->
												없습니다.</p> <!-- 이거 효과줄라고 ajax에서 했는데, id라서 안 되네. class로 바꾸면 될래나? css때무네 -->
										<!-- </div> -->
									</c:if>
									<!-- 내용이 있을 경우 -->
									<c:if test="${not result}">
										
											<c:forEach items="${fundingRecords}" var="funding">
											
												<!-- 여기에 ajax랑 똑같은 UI 뜨게 -->
	
												<div class='historyDiv'>
													<p class='historyName'>${funding.r_name}</p>
													<img class='historyImg' src="<c:url value='/upload/band/cover/${funding.sw_banner}'/>"/> 
													<p class="historyDesc">${funding.sw_short_description}</p>  
													<p class="historyMusic"">${funding.r_name}</p>  
													<p class="historyAuthor">${funding.b_name}</p><p class="historyPrice">${funding.r_price}원</p>
												</div>
												 
											</c:forEach>
										
									</c:if>
								</div>
								
							</div>  <!-- projectCardList 끝 -->
							<%-- <div class="pagingDiv" style="text-align: center; margin:auto; width:1000px; margin-top:20px;">${pagingString}</div> --%>
						
							<div id="pagin" style="width:100%;"></div>
							<script>
							
								$(function(){
									page();
								})
							
							</script>
							

						</div>  <!-- projectList 끝 -->
					</div>  <!-- 하단 부분 끝 -->
					
				</div>  <!-- 상단/하단 전체 감싸는 div 끝 : myprofile-wrap  -->

			</div>
		</div>
		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		
		<form>
			<div class="s3_id" style="display: none;">${id }</div>
		</form>
		
		<!-- 스크립트 시작 -->

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
				$.ajaxSetup({type:'post'});
				
				$('#imgUpload1').change(function(){
					
					var extensionPos = $(this).val().lastIndexOf('.')+1;
					var extension = $(this).val().substring(extensionPos);
					console.log("확장자 = " + extension);
					
					var match = ['jpg', 'png', 'gif', 'jpeg', 'bmp', 'tif'];
					
					//console.log("타입은 대체?" + $(this).type);
					
					if($.inArray(extension.toLowerCase(), match) == -1) {
						alert('이미지 파일만 등록해주세요.');
						return;
					}
					
					var uploadOk = confirm('이미지를 프로필 사진으로 등록하시겠습니까?');
					
					//FormData 객체 사용!
					/* var form = new FormData($('#imgForm'));  */ //자바스크립트 객체의 인자로 제이쿼리 객체 넣어도 되나?
					
					if(uploadOk) {
						var files = document.getElementById('imgUpload1').files;
						//console.log("files : "+files);
				  		//console.log("files.length : "+files.length);
						if (!files.length) {
						    return alert('Please choose a file to upload first.');
						}
				    	var file = files[0];
						//console.log("file : "+file)
						var file_length = file.name.lastIndexOf('.')+1;
						
					    var fileName = '${id }' + '_cover_Img.jpg';
					    console.log(fileName);
						var albumPhotosKey = encodeURIComponent(albumName) + '/';
						//console.log(albumName);
						var photoKey = albumPhotosKey + fileName;
						s3.upload({
					      Key: photoKey,
					      Body: file,
					      ACL: 'public-read'
						}, function(err, data) {
							if (err) { 
								return alert('There was an error uploading your photo: ', err.message); 
								} 
						  }); 
						}
					//서기환의 페이지
					$.ajax({
						url: '<c:url value="/edit/profileImgAjax.ins"/>',
						dataType: 'text',
						data: 'fileName='+fileName,
						success: function(data){
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
							    
							    console.log("path : "+photoUrl);
							    
							    $('.profile-img2').prop('src', photoUrl); // 이미지 변경
							    $('.user_picture').prop('src', photoUrl);
							    
							  });
						}
						,error:function(data){
							console.log("에러다!!");
						}
					});
				});
						
			});
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
			
			//var historyAjax;
			
			$('#historyTab li').click(function historyAjax(){
				
				console.log("historyTab li가 클릭은 되니?");
				console.log("컨트롤러의 switch문에 전달하는 값은? " + $(this).find('span').html());
				
				///밑에서 음반, 공연, 등 나눠주기 위한 용도
				
				if($(this) == null || typeof($(this)) == undefined) {
					$(this) = $('#historyTab li .active')
				}
				whichClick = $(this).find('span').html();
				
				console.log('$(this가 뭘까)' + $(this) + ' span의 html은?' + $(this).find('span').html());
				
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
			
			/////////내가 추가
			
			$('.pagingLi').click(function(){
				page();
			})
			
			/////////내가 추가
			
			
			
		})///////제이쿼리 진입점
		
		
		/////페이징 ajax?
				
		////페이징 ajax?
		
		
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
					emptyMessage = "<p class='emptyCont' style='font-size:17px;'>아직 "+element["which"]+" 상품이 없습니다.</p>";
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
					var src = '<c:url value="/upload/band/cover/'+imgSrc+'"/>';
					
					listString += "<div class='historyDiv'>";  //전체 div
					listString += "<p class='historyName'>" + element["R_Name"] + "</p>"; 
					listString += "<img class='historyImg' src='"+src+"' />"  
					listString += "<p class='historyDesc'>"+element["R_Description"]+"</p>";
					listString += "<p class='historyMusic'>"+element["R_Name"]+"</p>";
					//listString += "<p class='historyMusic'></p>";
					listString += "<p class='historyAuthor'>"+element["B_name"]+"</p><p class='historyPrice'>"+element["R_Price"]+"원</p>";
	
					listString += "</div>"  //전체 div끝
					
				}////펀딩
				
				if(whichClick == "공연") {
					

					//var imgSrc = element["S_Album_cover"];  ///이미지 바꿔야.
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
					
				}////공연
				
				if(whichClick == "좋아한") {
					
					var imgSrc = element['b_album_cover'];
					var src = '<c:url value="/upload/band/cover/'+imgSrc+'"/>';
					
					listString += "<div class='historyDiv'>";  //전체 div
					
					listString += "<p class='historyName'>" + element["b_name"] + "</p>"; 
					listString += "<img class='historyImg' src='"+src+"' />"  
					listString += "<p class='historyDesc'>"+element["b_description"]+"</p>";
					listString += "<p class='historyMusic'>"+element["bm_name"]+"</p>";
					listString += "<p class='historyPrice' style='border:none; text-align:right;'>♥ x "+element["b_liked"]+"</p>";
					

	
					listString += "</div>"  //전체 div끝
					
					
				}/////좋아한
				
			});
			

			console.log("이게 비어서 문젠가? " + listString + " 장소는 " + whichClick);
			
			console.log("페이지스트링 " + pageString);
			console.log('왜 엠프티 메세지 안뜨지?' + emptyMessage);
			
			//$('.pagingDiv').html(pageString);
			
			
			if(isEmpty) {
				
				/* $('.historyEmptyValue').css('display', 'none') */
				$('.historyValue').html(emptyMessage);
				$('.historyValue').css('padding-top', '80px');
			/* 	$('.historyValue').css('display', 'block'); */
				$('.pagingDiv').html("");
			
				//$('#pagin').css('display', 'block');
				$('#pagin').html("");
				
				return;
			}
			
		/* 	$('.historyValue').css('display', 'block'); */
			$('.historyValue').html(listString);
			$('.historyValue').css('padding-top', '0px');
			/* $('.historyEmptyValue').css('display', 'none') */
			
			page();
			
			
			
		}/////succFunction
		
		
		
		function page(){ 
			
			//Pagination
			pageSize = 2;   ///한페이지에 보여줄 글 수
			incremSlide = 5;  //하단에 보여줄 페이징 수
			startPage = 0;
			numberPage = 0;
			
			var pageCount =  $(".historyDiv").length / pageSize;  
			var totalSlidepPage = Math.floor(pageCount / incremSlide);  
			
			
			console.log('=========== $(".historyDiv").length는? ' + $(".historyDiv").length);
			console.log('=========pageCount는? ' + pageCount);
			
			$('#pagin').html('');
			
			for(var i = 0 ; i<pageCount;i++) {
				
				//urll2 = "javascript:historyAjax();"
			    $("#pagin").append('<li class="pagingLi"><a href="javascript:void(0)">'+(i+1)+'&nbsp;&nbsp;&nbsp;</a></li>');
				
			    if(i>pageSize){  ////전체 페이징 숫자 중 3보다 큰 숫자는 숨긴다.
			       $("#pagin li").eq(i).hide();
			    }
			}
			
			var prev = $("<li/>").addClass("prev").html("Prev").click(function(){  //변수 prev를 만든 다음 붙일 예정
				   startPage-=5; //1, 6, 11 : 5씩 증감
				   incremSlide-=5;  //하단에 보여줄 페이징 수 5씩 증감
				   numberPage--;  //-1
				   slide();
				   
			});
			
			prev.hide();
			
			var next = $("<li/>").addClass("next").html("Next").click(function(){	//변수 next를 만든 다음 붙일 예정
				   startPage+=5;
				   incremSlide+=5;
				   numberPage++;
				   slide();
				   
			});
			
			next.hide();
			
			$("#pagin").prepend(prev).append(next);  //앞에다 prev를 붙이고 뒤에다 next를 붙임
			
			$("#pagin li").first().find("a").addClass("current");

			slide = function(sens){   //prev에서도 호출되고 next에서도 호출됨
				   $("#pagin li").hide();
				   
					
				   for(t=startPage;t<incremSlide;t++){
				     $("#pagin li").eq(t+1).show();
				   }
				   
				   
				 
				   
				   if(startPage == 0){
				     next.show();
				     prev.hide();
				   }else if(numberPage == totalSlidepPage){
				     next.hide();
				     prev.show();
				   }else {
				     next.show();
				     prev.show();
				   } 
				   
				   
			}
			
			showPage = function(page) {
				  $(".historyDiv").hide();
				  $(".historyDiv").each(function(n) {
				      if (n >= pageSize * (page - 1) && n < pageSize * page)
				          $(this).show();
				  });        
			}
			
			showPage(1);
			
			$('#pagin').css('display', 'block');
			
			$("#pagin li a").eq(0).addClass("current");
			
			$("#pagin li a").click(function() {
				 $("#pagin li a").removeClass("current");
				 $(this).addClass("current");
				 showPage(parseInt($(this).text()));
			});
			
			
	
		}
					
	</script>
	
	
	

