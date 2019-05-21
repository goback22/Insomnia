<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/vendor/css/content-reward.css'/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/vendor/css/content-wdetail.css'/>"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/app.css'/>"
	type="text/css">

<!-- 섬머노트에 필요해! -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/bootstrap2.min.css'/>">
<script src="<c:url value='/vendor/js/jquery2.js'/>"></script>
<script src="<c:url value='/vendor/js/bootstrap2.min.js'/>"></script>

<!-- 섬머노트 css,js -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/summernote.css'/>" type="text/css">
<script src="<c:url value='/vendor/js/summernote-bandSubmit.js'/>"></script>

<!-- 섬머노트 awesome css,js -->
<link rel="stylesheet"
	href="<c:url value='/vendor/css/summernote-ext-emoji-ajax.css'/>"
	type="text/css">
<script src="<c:url value='/vendor/js/summernote-ext-emoji-ajax2-bandSubmit.js'/>"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- 제목 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans"
	rel="stylesheet">
<!-- 배너 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding"
	rel="stylesheet">
<!-- Noto Sans KR Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<!-- 섬머노트와 ajaxform을 동시에 사용하기 위해서 밑에 3개는 주석처리 요망-->
<!-- ajaxForm을 사용하기 위한 최신자 제이쿼리 -->
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- 	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.js"></script> -->
<!-- 	<script src="https://ajax.aspnetcdn.com/ajax/jquery.migrate/jquery-migrate-3.0.0.min.js"></script> -->
<script src="http://malsup.github.com/jquery.form.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	letter-spacing: -.02em;
	color: rgba(0, 0, 0, .70);
	line-height: 1.5em;
	font-size: 15px;
	font-weight: 200;
}

.reward-description {
	font-size: 15px;
	color: gray;
	margin-top: 20px;
}

.textArea {
	width: 100%;
	height: 200px;
	font-size: 15px;
	color: gray;
	margin-top: -30px;
	font-weight: 150;
}

#video_img_url {
	width: 591.047px;
	height: 333.250px;
}

.content-textarea {
	width: 100%;
	height: 800px;
}

.section-title {
	margin-bottom: 100px;
	margin-top: 100px;
}

.section-title h2 {
	font-family: 'Black Han Sans', sans-serif;
	font-weight: 100;
}

body {
	font-famaily: 'Nanum Gothic Coding', monospace;
}

.b_name{
	color:black;
}

.b_description{
	color:black;
}

.modal-backdrop{
	width:0;
}

.no_band_header_div {
	margin:115px;
}

.no_band_header_btn {
   color: white;
   text-align: center;
   font-weight: 900;
   font-size: 20px;
   margin: auto;
   padding: 15px;
   background-color: rgb(228, 58, 144);
   width: 360px;
   height: 60px;
   background: linear-gradient(124deg, #ff2400, #e81d1d, #e8b71d, #e3e81d, #1de840, #1ddde8, #2b1de8, #dd00f3, #dd00f3);
background-size: 1800% 1800%;

-webkit-animation: rainbow 18s ease infinite;
-z-animation: rainbow 18s ease infinite;
-o-animation: rainbow 18s ease infinite;
  animation: rainbow 18s ease infinite;
}
@-webkit-keyframes rainbow {
    0%{background-position:0% 82%}
    50%{background-position:100% 19%}
    100%{background-position:0% 82%}
}
@-moz-keyframes rainbow {
    0%{background-position:0% 82%}
    50%{background-position:100% 19%}
    100%{background-position:0% 82%}
}
@-o-keyframes rainbow {
    0%{background-position:0% 82%}
    50%{background-position:100% 19%}
    100%{background-position:0% 82%}
}
@keyframes rainbow { 
    0%{background-position:0% 82%}
    50%{background-position:100% 19%}
    100%{background-position:0% 82%}
}

</style>


<script>
</script>

</head>

<body>

	<div id="site">

		<jsp:include page="/WEB-INF/template/Nav.jsp" />

		<!--=============================-->
		<!--=        	Artitst         =-->
		<!--=============================-->
		<div>
			<!-- Section  -->
			<section id="artist"
				class="section-padding section-dark parallax-window"
				data-parallax="image"
				data-bg-image="/insomnia/upload/content/main/banner/${empty profile_name ? 'default_band_profile_img.jpg' : profile_name }">

				<!--  <c:url value='/resource/img/default_band_profile_img.jpg'/>  -->

				<div class="container" style="margin-top: 5%;">
					<div class="section-title text-center">
						<h2 style="padding-bottom:50px; letter-spacing:25px;">
							${bandDto.b_name}
						</h2>
					</div>
					<!-- /.section-title -->

					<div class="row">
						<div class="col-lg-6 col-md-6 col-full-width">
							<div class="artist-image">
								<div class="single-show-archive" style="margin-top: 45px;">
									<img id="bi_profile"
										src="<c:url value='/resource/img/default_band_profile_img.jpg'/>"
										alt="artist"> <a href="javascript:upload('profile');"
										data-toggle="modal" data-target="#modal_profile"><i
										class="fa fa-link" aria-hidden="true" title="프로필 이미지 설정"></i></a>
								</div>
							</div>
							<!-- /.artist-image -->
						</div>
						<!-- /.col-lg-6 col-md-6 col-full-width -->

						<div class="col-lg-6 col-md-6 col-full-width">
							<div class="artist-details">
								<h3 class="artist-name">
									<input type="text" name="b_description" id="b_description"
										class="b_desciption" style="color:black;">
								</h3>
								<h4 class="band-name">밴드 주 설명</h4>

								<div class="details">
									<h3>About Me</h3>

									<textarea name="b_banner_description" id="b_banner_description"
										class="b_banner_description"></textarea>

									<!-- <a href="<c:url value='/main/bandSubmit.ins'/>"></a>  -->
									<div class="watch-inner text-center" style="margin-top: 100px;">
										<!-- <a href="javascript:submit();" class="tim-btn tim-btn-bg" >SUBMIT!</a> 
									</div>

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


			<!-- 프로필 이미지를 설정하는 모달창 -->
			<!-- fade: 최초 실행 시 모달창 숨기는 클래스 -->

			<div id="modal_profile" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 모달 닫기:data-dismiss="modal" -->
							<img class="find_insomnia_logo"
								src="../resource/img/insomnia-logo.png"
								style="margin-left: 86px;" />
						</div>

						<div class="modal-body">
							<br />
							<p style="font-size: 25px; text-align: center;">프로필</p>
							<br />
							<form name="frm_profile" id="frm_profile" method="post"
								accept="image/*"
								action="<c:url value='/bandsubmit/setprofile.ins'/>"
								enctype="multipart/form-data">
								<input type="file" id="upload_profile" name="upload_profile">
							</form>
							<br />
							<br />
							<p style="color: gray;">※ 이미지를 설정하면 배너 전체 이미지도 동일하게 설정됩니다.</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-info" id="setprofile" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</div>



			<!--==============================-->
			<!--=     	Show schedule        =-->
			<!--==============================-->
			<div class="section">

				<section class="show-archive">
					<div class="container" style="margin-top: 20%;">
						<div class="d-flex justify-content-center row">
							<div class="col-xl-10">
								<div class="section-title style-five">
									<h2>PREVIOUS SHOWS</h2>
									<p>There are many variations of passages of Lorem Ipsum
										available but the majority.</p>
								</div>
								<div class="show-archive-wrapper row no-gutters" style="">
									<div class="offset-xs-0 offset-sm-4 col-sm-4 col-6">
										<div class="single-show-archive">
											<img id="image1" src="<c:url value='/media/album/18.jpg'/>"
												alt=""> <a href="javascript:void(0)"
												data-toggle="modal" data-target="#modal_images"><i
												class="fa fa-link" aria-hidden="true"></i> </a> <input id="asd"
												type="file" hidden="hidden">
										</div>
									</div>
									<div class="col-6 col-sm-4">
										<div class="single-show-archive">
											<img id="image2" src="<c:url value='/media/album/19.jpg'/>"
												alt=""> <a href="javascript:void(0)"
												data-toggle="modal" data-target="#modal_images"><i
												class="fa fa-link" aria-hidden="true"></i> </a>
										</div>
									</div>
									<div id="padding-div" class="col-xs-12 col-sm-8"
										style="width: 633px; height: 356px;">

										<div class="single-show-archive">
											<a href="javascript:upload('video');"><i
												class="fa fa-link" aria-hidden="true" title="  비디오 등록"></i></a>
											<img id="video_img_url"
												src="<c:url value='/resource/img/default_video_cover.jpg'/>"
												alt="">
											<div class="video-player">
												<a id="video_url"
													href="https://www.youtube.com/watch?v=kD4T-rNklsY"
													class="video-btn-three popup-video-btn"> <i
													class="fa fa-play"></i>
												</a>

												<div class="video-btn-shade">
													<i class="fa fa-play"></i>
												</div>
												<div class="text">
													<p style="margin-top: 17px;">
														제목<input style="width: 200px; margin-left: 15px; color:black;" type="text" id="video-title" name="video-title">
													</p>
												</div>

											</div>
										</div>
									</div>

									<div class="col-12 col-sm-4">
										<div class="single-show-archive">
											<img id="image3" src="<c:url value='/media/album/21.jpg'/>"
												alt=""> <a href="javascript:void(0)"
												data-toggle="modal" data-target="#modal_images"><i
												class="fa fa-link" aria-hidden="true"></i></a>
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

			</div>
			<!-- section -->


		</div>
		<!-- section -->



		<!-- 동영상 주변 이미지를 설정하는 모달창 -->
		<!-- fade: 최초 실행 시 모달창 숨기는 클래스 -->
		<div id="modal_images" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<!-- 모달 닫기:data-dismiss="modal" -->
						<img class="find_insomnia_logo"
							src="../resource/img/insomnia-logo.png"
							style="margin-left: 86px;" />
					</div>
					<div class="modal-body">
						<br />
						<p style="font-size: 25px; text-align: center;">이미지</p>
						<br />
						<form name="frm_images" id="frm_images" method="post"
							accept="image/*"
							action="<c:url value='/bandsubmit/setimages.ins'/>"
							enctype="multipart/form-data" style="text-align: center;">

							&nbsp;&nbsp;사진 1&nbsp;&nbsp; <input id="upload_image1" name="upload_image1" type="file"><br /> 
							&nbsp;&nbsp;사진 2&nbsp;&nbsp; <input id="upload_image2" name="upload_image2" type="file"><br /> 
							&nbsp;&nbsp;사진 3&nbsp;&nbsp; <input id="upload_image3" name="upload_image3" type="file">

						</form>
						<br />
						<br />
						<p style="color: gray;">※ 이미지를 설정하지 않으면 기본 이미지 그대로 게시됩니다.</p>
					</div>
					<div class="modal-footer">
						<button id="btn_setImages" class="btn btn-info" type="button"
							data-dismiss="modal">확인</button>
						<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- modal_image -->






		<div class="container" style="margin-top: 10%;">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<article class="blog-post-list">

						<figure class="post-thumbnail">
							<a href="#"> <!--<img src="media/blog/5.jpg" alt="blog Thumb">-->
							</a>
						</figure>
						<!-- .post-thumbnail -->

						<div class="entry-content-wrapper">
							<textarea rows="10" id="summernote" class="content-textarea"
								placeholder=""></textarea>
						</div>
						<!-- .entry-content-wrapper -->

					</article>
					<!-- blog post -->
				</div>
				<!-- col-lg-8 -->


				<div class="col-sm-4" style="margin-top: 30px;">


					<!-- ------------------------------------------------------------------------------------------------------------------ -->
					<!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
					<!-- ------------------------------------------------------------------------------------------------------------------ -->


					<div id="campaign-rewards" style="position: relative; top: -50px;"></div>
					<div class="moveRewards">

						<div class="wd-ui-gift">
							<h3 class="project-right-title">리워드 선택</h3>

							<!-- 리워드가 추가될 공간 -->
							<div class="reward-list"></div>
							<!--  여기부터 리워드 리스트 시작 밑으로 추가시켜야 리워드 늘어남 -->

							<!-- 리워드 추가할때 시작 -->
							<div class="rightinfo-reward-list" style="width: 100%;"
								onclick="">
								<div class="top-info" style="width: 100%">
									<dl class="reward-info">
										<dt>금액</dt>
										<dt>
											<input type="number" name="r_price" id="r_price" value="">
											￦
										</dt>
										<dd>
											<p class="reward-name">리워드 이름</p>
										</dd>
										<dd>
											<input type="text" name="r_name" id="r_name" value="">
										</dd>
										<dd>
											<p class="reward-description">리워드 내용</p>
											<br>
											<textarea class="textArea" id="r_description"></textarea>
										</dd>
									</dl>

									<ul class="data-info">
										<li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li>
									</ul>

									<!--  추가 삭제 버튼 테스트
									<div class="reward-list-button-footer"
										style="text-align: center;">
										<div id="add" class="tim-btn" onclick="javascript:add();">추가</div>
										<div id="delete" class="tim-btn"
											onclick="javascript:remove();">삭제</div>
									</div>
									 -->

									<div class="watch-inner text-center reward-list-button-footer">
										<a href="javascript:add();" id="add"
											class="tim-btn tim-btn-bg">ADD</a> <a
											href="javascript:remove();" id="delete"
											class="tim-btn tim-btn-bg">DEL</a>
									</div>

								</div>
							</div>
							<!-- 리워드 추가할때 끝 -->



						</div>
						<!-- 여기 위에 추가시키면 리워드 늘어남 -->



					</div>
					<!-- 와디즈 사이드 리워드 리스트 끝 -->
				</div>
				<!-- 사이드 리워드 리스트 -->

			</div>
			<!-- row -->
		</div><!-- content -->
		
		<div class="no_band_header_div" onclick="javascript:submit();"> <!-- onclick="javascript:submit();" -->
			<div class="no_band_header_btn">S U B M I T</div>
		</div>
		
		
	</div>
	<!--site-->
		<div class="fcmDiv" style="display:none;">
			<%-- <form action="<c:url value='/'/>" method="post" id="fcmForm"> --%>
			<form action="<c:url value='/fcm/pushToPhone.ins'/>" method="post" id="fcmForm">
				<table style="border-spacing:1px;background-color:gray;width:400px">
					<tr style="border-spacing:1px;background-color:white">
						<td style="width:20%">제목</td>
						<td><input type="text" name="title" id="fcmTitle" style="width:90%"/></td>
					</tr>
					<tr style="border-spacing:1px;background-color:white">
						<td colspan="2">메시지</td>
					</tr>
					<tr style="border-spacing:1px;background-color:white">
						
						<td colspan="2"><textarea name="message" id="fcmMessage" style="width:90%;height:200px" ></textarea></td>
					</tr>
					<tr style="border-spacing:1px;background-color:white">
						<td colspan="2" style="text-align:center"><input type="submit" value="확인"/></td>			
					</tr>  
				</table>
			</form>
		</div>


	<script>
		console.log('version 106'); //////version

		//section태그에 id를 부여할 인덱스 선언
		var index = 1;

		// 리워드 추가 버튼
		var add = function() {
			var innerRewards = $(".reward-list").html();
			var r_price = $("#r_price").val();
			var r_name = $("#r_name").val();
			var r_description = $("#r_description").val().replace(
					/(?:\r\n|\r|\n)/g, "<br/>");

			var addHtml = '<section id="reward_created_'+index+'">';
			addHtml += '<div class="rightinfo-reward-list" style="width:100%;" onclick="" >';
			addHtml += '<div class="top-info" style="width:100%">';
			addHtml += '<dl class="reward-info"><dt>';
			addHtml += r_price + "원 펀딩</dt><dd>";
			addHtml += '<p class="reward-name">' + r_name + '</p>';
			addHtml += '<p class="reward-description">' + r_description + '</p></dd></dl>';
			addHtml += '<ul class="data-info"><li class="shipping" style="width: 100%; margin-bottom: 5px;">배송비<em>4,500원</em></li></ul>';
			addHtml += '</section>';
			index++;

			$(".reward-list").html(innerRewards + addHtml);
			$("#r_price").val("");
			$("#r_name").val("");
			$("#r_description").val("");
		};//// add()

		// 가장 last로 작성한 리워드 삭제 
		var remove = function() {
			var isExistSection = $("[id^='reward_created']").last().length == 0 ? null
					: $("[id^='reward_created']").last();
			if (isExistSection != null) {
				isExistSection.remove();
				index--;
			}//if
		};/////////////////remove()

		var upload = function(way) {
			switch (way) {
			case "video": //얘는 prompt
				var video = $("#video_url");
				var img = $("#video_img_url");
				var url = prompt("유튜브 주소를 입력하세요", "");
				if (url == null || url == "") {
					video.attr("href",
							"https://www.youtube.com/watch?v=vsl3gBVO2k4");
					img
							.attr("src",
									"<c:url value='/resource/img/default_video_cover.jpg'/>");
				}//if
				else {
					console.log("else");
					video.attr("href", url.trim());
					img.attr("src", "http://img.youtube.com/vi/"
							+ url.trim().split("watch?v=")[1]
							+ "/mqdefault.jpg");
					console.log("else end");
				}//else
				break;
			case 'profile': //얘도 모달!
				$("#modal_profile").modal();
				break;
			case '1': //modal로 쇼부보자!
				$("#modal_images").modal();
				break;
			default:
				alert("등록되지 않은 케이스");
			}//switch
		};//upload

		$(function() {
			
			
			

			console.log("콘솔에 찍어본 c:url 주소" + $('.profile-img2').prop('src'));

			$.ajaxSetup({
				type : 'post'
			});
			$('#setprofile')
					.on(
							"click",
							function() {

								var extensionPos = $("#upload_profile").val()
										.lastIndexOf('.') + 1;
								var extension = $("#upload_profile").val()
										.substring(extensionPos);
								console.log("확장자 = " + extension);

								var match = [ 'jpg', 'png', 'gif', 'jpeg',
										'bmp', 'tif' ];

								console.log("타입은 대체?"
										+ $("#upload_profile").type);

								if ($.inArray(extension.toLowerCase(), match) == -1) {
									alert('이미지 파일만 등록해주세요.');
									return;
								}

								var uploadOk = confirm('이미지를 프로필 사진으로 등록하시겠습니까?');

								if (uploadOk) {
									$('#frm_profile')
											.ajaxForm(
													{

														url : '<c:url value="/bandsubmit/setprofile.ins"/>',
														enctype : 'multipart/form-data',
														dataType : 'text',
														success : function(data) {
															console.log(data);
															$("#artist")
																	.css(
																			"background-image",
																			"url('/insomnia/upload/content/main/banner/"
																					+ data
																					+ "')");
															$("#artist")
																	.attr(
																			"data-bg-image",
																			"/insomnia/upload/content/main/banner/"
																					+ data);
															$("#artist")
																	.removeAttr(
																			"data-bg-image");
															$("#bi_profile")
																	.get(0).src = "/insomnia/upload/content/main/banner/"
																	+ data;
															console
																	.log($(
																			"#artist")
																			.attr(
																					"data-image-src"));
														},//success
														error : function(
																request, error) {
															console
																	.log(
																			'상태코드:',
																			request.status);
															console
																	.log(
																			'서버로부터 받은 HTML데이타 :',
																			request.responseText);
															console.log('에러11:',
																	error);
														}

													});///$.ajaxForm(); */

									$('#frm_profile').submit();

								}//uploadOk
							});///setprofile onclick

			$("#btn_setImages").on("click", function() {
				var uploadOk = confirm('이미지를 등록하시겠습니까?');
				if (uploadOk) {
					$('#frm_images').ajaxForm({
						url : '<c:url value="/bandsubmit/setimages.ins"/>',
						enctype : 'multipart/form-data',
						dataType : 'json',
						type : 'post',
						success : function(data) {
							fn_setImages(data);
						},
						error : function(error) {
							alert("파일 업로드에 실패하였습니다.");
							console.log(error);
							console.log(error.status);
						}
					});//ajaForm
					$("#frm_images").submit();
					console.log("btn_setImages click event END");
				}//if uploadOK
			});//btn_setImages.on("click")

		});//window.onload

		function fn_setImages(data) {
			//var jsonString = JSON.stringify(data);
			console.log("fn_setImages START");
			console.log(data);
			$.each(data,function(index, element) {
				$("#image" + (parseInt(index) + 1)).get(0).src = "<c:url value='/upload/content/main/shows/"+element["image"+index]+"'/>";
			}); //each
		};//function fn_setImage


		$('#b_banner_description')
				.summernote(
						{
							height : 300,
							width : 700,
							toolbar : [
									[ 'style', [ 'style' ] ],
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[
											'font',
											[ 'strikethrough', 'superscript',
													'subscript' ] ],
									[ 'fontsize', [ 'fontsize' ] ],
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'insert', [ 'picture', 'link', 'emoji' ] ]

							],
// 							placeholder : '내용을 입력하세요',
							hint : {
								words : [ '힌트1', '힌트2', '힌트3', '힌트3' ],
								match : /\b(\w{1,})$/,
								search : function(keyword, callback) {
									callback($.grep(this.words, function(item) {
										return item.indexOf(keyword) === 0;
									}));
								}//search
							},//hint
							callbacks:{
								//이미지를 업로드했을때 server에 저장해서 경로로 반환
								onImageUpload : function(files, editor, welEditable){
									for(var i = files.length - 1; i>=0; i--){
										sendFile(files[i], this);
									}//for
								}//onImageUpload
							}//callbacks
						});//summernote
						
	
		 $('#summernote')
			.summernote(
					{
						height : 600,
						width : 600,
						toolbar : [
								[ 'style', [ 'style' ] ],
								[
										'style',
										[ 'bold', 'italic', 'underline',
												'clear' ] ],
								[
										'font',
										[ 'strikethrough', 'superscript',
												'subscript' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'insert', [ 'picture', 'link', 'emoji' ] ]

						],
//						placeholder : '내용을 입력하세요',
						hint : {
							words : [ '힌트1', '힌트2', '힌트3', '힌트3' ],
							match : /\b(\w{1,})$/,
							search : function(keyword, callback) {
								callback($.grep(this.words, function(item) {
									return item.indexOf(keyword) === 0;
								}));
							}//search
						},//hint
						
						callbacks:{
							onImageUpload : function(files, editor, welEditable){
								for(var i= files.length -1; i>=0; i--)
									sendFile(files[i], this);
							}//onImages Upload
						}//callbacks
					});//.sumernot
						
						
			function sendFile(file, el){
				var form_data = new FormData();
				form_data.append('file', file);
				$.ajax({
					data : form_data,
					type:'post',
					url:'<c:url value="/bandsubmit/b_banner_description.ins"/>',
					cache:false,
					contentType:false,
					enctype:'multipart/form-data',
					processData:false,
					success:function(img_name){
						$(el).summernote('editor.insertImage', img_name);
					}
				});//$.ajax
			}//sendFile
			
	
		 //////최종 서브밋
		 function submit(){
			
			var isSuccess = true; // db까지 무사히 등록되었는지 판별하는 validate용
				
			var b_description =$('#b_description').val();
			var b_banner_description = $('#b_banner_description').val();
			var bi_profile = $("#bi_profile").attr("src");
			bi_profile = bi_profile.substring(bi_profile.lastIndexOf("/")+1);
			var video_title = $("#video-title").val();
			var image1 = $("#image1").attr("src");
			image1 = image1.substring(image1.lastIndexOf("/")+1);
			var image2 = $("#image2").attr("src");
			image2 = image2.substring(image2.lastIndexOf("/")+1);
			var image3 = $("#image3").attr("src");
			image3 = image3.substring(image3.lastIndexOf("/")+1);
			var youtube = $("#video_url").attr("href");
			var summernote = $("#summernote").val();
			
			//ajax처리할 json객체 생성
			var json = {
					'sw_short_description' : b_description,
					'sw_long_description' : b_banner_description,
					'sw_banner' : bi_profile,
					'sw_image_1' : image1,
					'sw_image_2' : image2,
					'sw_image_3' : image3,
					'sw_youtube' : youtube,
					'sw_youtube_title' : video_title,
					'sw_content' : summernote
				};
			
			//reward를 제외한 나머지를 먼저 bandSubmitWaiting에 등록한다.
			$.ajax({
				url:'<c:url value="/bandsubmit/addNewBandSubmitWaiting.ins"/>',
				data : json,
				type: 'post',
				dataType: 'text',
				async: false,
				success : function(data){
					if(data == "SUC"){}
					else{
						isSuccess = false;}
					
				},
				error : function(error){
					console.log(error);
					console.log(error.status);
					alert("에러");
					isSuccess = false;}
			});//$.ajax
			
			
			
			//reward 내용 rewardWaiting 에 설정
			$("section[id^=reward_created]").each(function(){
				
				var rw_price = parseInt($(this).find("dt").text());
				var rw_name = $(this).find(".reward-name").text();
				var rw_description = $(this).find(".reward-description").text();
				
				var rwJson = {
					'rw_price' : rw_price,
					'rw_name' : rw_name,
					'rw_description' : rw_description
				};
				
				$.ajax({
					url : '<c:url value="/bandsubmit/addRewardWaiting.ins"/>',
					data : rwJson,
					dataType:'text',
					async: false,
					success:function(data){
						if(data == "FAIL")
							isSuccess = false;
					},
					error : function(error){
						console.log(error);
						console.log(error.status);
						alert("에러");
						isSuccess = false;
					}
				});//$.ajax
			});//$.each fn
			
			if(isSuccess){
				alert("등록 성공!");
				b_description = $('#b_description').val();
				b_banner_description = $('#b_banner_description').val();
				location.href='<c:url value="/band/bandInfo.ins?fcm=fcm&b_description='+b_description+'&b_banner_description='+b_banner_description+'"/>';
			}else
				alert("등록 실패 .. ㅠㅠ");
		 }///submit;
		 
		 
		 
		 
		 </script>
	
	
	
	

<!-- app.css를 안건드리기 위해 여기다 적음 -->
<style>
.artist-details .details p {
	color: black;
}
</style>