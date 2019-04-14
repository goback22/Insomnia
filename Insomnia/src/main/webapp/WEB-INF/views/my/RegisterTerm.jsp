<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 스타벅스 약관 동의 폼 -->


<link href="<c:url value='/vendor/css/RegisterTerm-reset.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style_mem.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style_dt.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style_util.css'/>" rel="stylesheet">




<style>
	.space_for_nav{
		background-color:black;
		width:100%;
		height:80px;
	}
	
	.find_insomnia_logo{
		margin-top:50px;
		margin-left:24%;
	}
	
	
</style>


<script>

	
		
		var auth = function(way){
			if($("#mem_agreeMent_yes").get(0).checked && $('#mem_purpose_yes').get(0).checked){
				var advertise_flag = "";
				if($("#mem_advertise_yes").get(0).checked){
					advertise_flag = "?advertise=t";
				}//마케팅 제공 동의 선택여부 저장
				switch(way){
				case "phone":
					location.href="<c:url value='/register/form.ins"+advertise_flag+"'/>";
					break;
				case "ipin":
					location.href="<c:url value='/register/form.ins"+advertise_flag+"'/>";
					break;
				default:
					alert("잘못된 접근");	
				}//switch				
			}//약관 모두 동의
			else{
				alert("이용약관에 동의하셔야 합니다.");
				return;
			}//약관 동의 안할떄
		}//auth
		
	
	
</script>		
	
	

</head>

<body>
	<div id="wrap">
		
		
		<!-- navBar -->
		<div class="space_for_nav"></div>
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>

		
		<div id="container">
			<!-- 내용 -->
			<div class="find_mem_wrap asdasdadas"><!-- jsp 수정 : 클래스명 추가 -->
				<!-- 20160804 수정 -->
				<div class="find_mem_inner">
					<form action="" method="post">
						<fieldset>
							<legend class="hid">회원가입 이용약관 동의, 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간 및 파기절차, 파기 방법에 관한 폼</legend>
							
								<strong class="find_mem_ttl">회원가입</strong>
							
							<section class="renew_joinform_v2">
								<!-- 접근성_20171120 수정-->
								<img class="find_insomnia_logo" src="../resource/img/insomnia-logo.png"/>
								 <p class="find_form_txt">
									회원가입 약관동의 및 본인인증단계입니다.
								 </p>
								 
								<section class="mem_agreement_wrap">								
									<h5>홈페이지 이용약관 동의 <span class="t_006633">(필수)</span></h5>
									<span class="agree-check"><input type="checkbox" name="mem_agreeMent" id="mem_agreeMent_yes" class="mem" /> <label for="mem_agreeMent_yes">동의</label></span>
									<!-- 접근성_20171120 추가 end -->
									<div class="mem_agreement_area">

										<!--20180518 수정-->
										<div class="privacy_cont">
							                <p class="title_text" id="title_text">
												<jsp:include page="HomepageUseTerm.jsp"/>
											</p>
											
										</div>
										<!--//20180518 수정-->

									</div>
								</section>
								
								<section class="mem_purpose_wrap">
								<h5>개인정보 수집 및 이용동의 <span class="t_006633">(필수)</span></h5><!-- 20180726 문구수정 -->
								<!-- 접근성_20171120 추가 -->
								<span class="agree-check">
									<input type="checkbox" name="mem_purpose" id="mem_purpose_yes" class="mem" />
									<label for="mem_purpose_yes">동의</label>
								</span>
									<div class="mem_purpose_area mem_purpose_area_v2">
										<!-- 개인정보의 수집 및 이용목적 내용 -->
										<div class="privacy_cont">
							                <p class="privacy_text" id="privacy_text">
							                	<jsp:include page="PersonalInfoUseTerm.jsp"/>
							                </p>
										</div>
										<!-- 개인정보의 수집 및 이용목적 내용 end -->
									</div>
								</section>
								
								<!-- 20180726 ::E-mail 및 SMS 광고성 정보 수신동의 영역추가-->
								<section class="mem_agreement_wrap mem_advertise_wrap">
									<h5>E-mail 및 SMS 광고성 정보 수신동의 <span class="t_006633">(선택)</span></h5>
									<!-- 접근성_20171120 추가 -->
									<span class="agree-check">
										<input type="checkbox" name="mem_advertise" id="mem_advertise_yes" class="mem" />
										<label for="mem_advertise_yes">동의</label>
									</span>
									<p id="mem_advertise_desc">다양한 프로모션 소식 및 신규 매장 정보를 보내 드립니다.</p>
									<!-- 접근성_20171120 추가 end -->
								</section>
								<section class="mem_join_note">
									<h5>회원가입 유의사항</h5>
									<ul>
										<li>반드시 회원님 명의로 된 휴대폰, 아이핀을 이용해주세요.</li>
										<li>
											타인의 개인정보를 도용하여 가입할 경우 향후 적발 시 서비스 이용제한 및 법적 제재를 받으실 수 있습니다.
										</li>
										<li>
											스타벅스커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
										</li>
									</ul>
								</section>
								<section class="mem_accreditation_wrap mb10">
									<h5>인증방식 선택</h5>
									<ul class="mem_accreditation_info">
										<li class="li1">
											<figure><img src="//image.istarbucks.co.kr/common/img/util/mem/icon_find1.jpg" alt="휴대폰 아이콘"></figure>
											<p class="mem_k_titl">휴대폰 인증</p>
											<p class="mem_k_txt">본인 명의의 휴대폰을 통해 인증합니다.</p>
											<p class="mem_k_btn"><a href="javascript:auth('phone');" title="휴대폰 본인 인증 새창열기">인증하기</a></p><!-- 접근성_20171120 title 추가 -->
										</li>
										<li class="li2">
											<figure><img src="//image.istarbucks.co.kr/common/img/util/mem/icon_find2.jpg" alt="아이핀 아이콘"></figure>
											<p class="mem_f_titl">아이핀 <span class="en">(i-PIN)</span>인증 </p>
											<p class="mem_f_txt">가입한 아이핀 ID를 통해 인증합니다.</p>
											<p class="mem_f_btn"><a href="javascript:auth('ipin');" title="아이핀 본인 인증 새창열기">인증하기</a></p><!-- 접근성_20171120 title 추가 -->
										</li>
									</ul>
								</section>
							</section>
						</fieldset>	
					</form>
				</div>
			</div>
		<!-- 내용 end -->
		</div>
		</div>
		
		<input type="hidden" id="IS_APP" value="" />
		<input type="hidden" id="IS_IPHONE" value="" />


<!-- 스타벅스 끝 -->




<br><br><br>

		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		
		
		
		