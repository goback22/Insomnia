<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<link rel="stylesheet" href="<c:url value='/vendor/css/RegisterCompleteCSS.css'/>" />

<style>
body {
	background: url('../resource/img/background.jpg');
}}
</style>

</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>

		<!--===========================-->
		<!--=        	About         =-->
		<!--===========================-->

		<section id="album">

			<!-- 여기부터 -->

			<section class="renew_joinform_v2">
				<p class="join_last_txt">
					<!-- 홍길동  -->
					서기환고객님!<br> INSOMNIA <br class="for_mob"> 회원가입이 완료되었습니다.
				</p>
				<figure class="icon_mem_sally">
					<img
						src="//image.istarbucks.co.kr/common/img/util/mem/icon_join_sally_last.jpg"
						alt="축하합니다">
					<!-- 접근성_20171120 alt 추가 -->
				</figure>
				<div class="agreement_status_wrap">
					<p class="status_txt dateTxt">블라블라</p>

					<div class="agreement_status">
						<table summary="이메일 수신동의 여부 처리 결과">

							<tbody>

								<tr>
									<th class="agreeth">이메일 및 SMS 광고성 정보</th>
									<td class="agree">수신거부</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>


			<!-- =============================================================================있어도 그만 -->


			<section class="mem_card_tab">
				<!-- 첫번째 탭 -->

				<!-- <strong class="card_tab card_tab1"><a href="" title="탭열기" role="button" onclick="fnHidden();">INSOMNIA 카드 등록</a></strong> -->
				<strong class="card_tab card_tab1">INSOMNIA 카드 등록</strong>

				<!--두번째 탭 -->
				<strong class="card_tab card_tab2 off on">Card 구매</strong>

				<div class="card_tab_cont1" style="display: none;">
					<strong class="card_info_ttl">INSOMNIA 카드 정보 입력</strong>
					<p class="btn_gift_card">
						<a id="cardRegistOkBtn" href="">카드 등록</a>
					</p>
				</div>



				<div class="card_tab_cont2" style="display: block;">
					<div class="card_egift_wrap">
						<strong class="tab_content_title">INSOMNIA e-Gift Card 란?</strong>
						<p class="tab_content_txt">
							실물 카드를 직접 구매하는 번거로움 없이 <br> 웹/앱에서 휴대폰 또는 e-Mail으로 손쉽게 <br>
							구매 하실 수 있습니다.<br>
						</p>
						<figure class="content_img">
							<img
								src="<c:url value='/Insomnia/ProjectImg/e912149e7a4e195e5e71f3250c2e3edf.png'/>"
								alt="You make me Happy">
						</figure>
						<p class="btn_gift_card">
							<a href="javascript:void(0);" required="login"
								data-href="/msr/sceGift/gift_step1.do">이것도 사보세요</a>
						</p>
					</div>
				</div>
			</section>




			<!-- 여기까지 -->

		</section>
		<!-- /#album -->





		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		

	<script>
		$(function() {

			/* $('.card_tab1').click(function(){
				$('.card_tab_cont').show();
				$('.card_egift_wrap').hide();
				console.log('탭1클릭');
				
			});
			
			$('.card_tab2').click(function(){
				$('.card_egift_wrap').show();
				$('.card_tab_cont').hide();
				console.log('탭2클릭');
				
			}); */

			$('.card_tab1').click(function() {
				$('.card_tab_cont1').css('display', 'block');
				$('.card_tab_cont2').css('display', 'none');
				console.log('탭1클릭');

			});

			$('.card_tab2').click(function() {
				$('.card_tab_cont2').css('display', 'block');
				$('.card_tab_cont1').css('display', 'none');
				console.log('탭2클릭');

			});

			/* 
			jQuery('#toggle').click(function () {  
			    if($("#id").css("display") == "none"){   
			        jQuery('#id').css("display", "block");   
			    } else {  
			        jQuery('#id').css("display", "none");   
			    }  
			});


			출처: https://rocabilly.tistory.com/71 [프로그램이 좋다]
			 */

		})
	</script>

