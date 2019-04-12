<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/vendor/css/TermCSS.css'/>" type="text/css" />
<style>
body {
	background: url('../resource/img/background.jpg');
	color:white;
}
</style>

</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>
		<br>
		<br>
		<br>
		<br>
		<br>
		<!--===========================-->
		<!--=        	About         =-->
		<!--===========================-->

		<!-- <div class="find_mem_ttl_div">
				<strong class="find_mem_ttl">회원가입</strong>
		</div> -->

		<section id="album2">

			<!-- 여기부터 -->


			<section class="join-form">

				<div class="find_mem_sally">
					<img class="find_mem_sally" src="<c:url value='/img/sign-in.png'/>"/>
				</div>
				
			

				<p class="find_form_txt">회원가입 약관동의 및 본인인증단계입니다.</p>
				<section class="mem_agreement_wrap">
					<h5>
						&nbsp;홈페이지 이용약관 동의 <span class="essential">(필수)</span>
					</h5>

					<!-- <span class="chk1"><input type="checkbox"
						name="mem_agreeMent" id="mem_agreeMent_yes" class="mem"> <label
						for="mem_agreeMent_yes">동의</label></span> -->
						
						<input type="checkbox" name="agree1" class="chk1"/>

					<div class="mem_agreement_area mCustomScrollbar _mCS_1">
						<div id="mCSB_1"
							class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
							tabindex="0">
							<div id="mCSB_1_container" class="mCSB_container"
								style="position: relative; top: 0; left: 0;" dir="ltr">


								<div class="privacy_cont">
									<p class="title_text" id="title_text">


										<title>INSOMNIA Korea</title>
									<div id="popWrap">

										<div id="container">


											<!-- 개인정보의 수집 및 이용목적 내용 -->
											<div class="privacy_cont">
												<p class="tit">팀3은 고객님을 보호합니다.</p>
												<p class="t1">(주)스타벅스커피 코리아의 서비스의 이용과 관련하여 필요한 사항을
													규정합니다.</p>
												<p class="pri_tit" id="quick_01">제1장 총칙</p>
												<p class="sub_tit" id="quick_01_01">1. 목적</p>
												<ol class="pri_con pri_con2 mb40">
													<ul>
														<li>1. 내용1</li>

														<li>2. 내용2</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>
														<li>3. 내용3</li>

													</ul>
												</ol>
												<p class="sub_tit" id="quick_01_02">2. 약관의 수정</p>
												<ol class="pri_con pri_con2 mb40">
													<ul>
														<li>1. 내용1</li>
													</ul>
												</ol>
												<p class="sub_tit" id="quick_01_03">3. 이용자의 정의</p>
												<p class="mb40">'이용자”란 회사 홈페이지에 접속하여 본 약관에 따라 회사 인터넷
													회원으로 가입하여 회사 홈페이지가 제공하는 서비스를 받는 자를 말합니다.</p>
												<p class="pri_tit" id="quick_02">제 2장 회원 관리 및 서비스</p>
												<ol class="pri_con pri_con2 mb40">
													<li><span id="quick_02_01">1. 회원 <span
															class="en">ID</span>와 비밀번호
													</span>
														<ul>


															<li>회원 가입은 무료이며, 회원ID(회원번호)와 비밀번호(<span class="en">Password</span>)에
																관한 모든 관리 책임은 다 이용자에게 있습니다.<br>
															</li>


														</ul></li>
													<li><span id="quick_02_02">2. 회원 탈퇴</span>
														<ol>
															<li>1. 회원은 탈퇴를 희망하는 경우, <span class="en">my</span>
																INSOMNIA 페이지에서 “회원 탈퇴” 버튼을 통해 탈퇴 신청을 합니다.
																<ul>
																	<li>-INSOMNIA 기명식 선불 충전카드를 보유한 고객의 카드가 잔액이 남아 있고
																		정지 상태에 있는 회원의 경우, 카드의 환불 및 환급 등의 처리 절차가 모두 완료된 다음에 탈퇴할
																		수 있습니다.</li>
																	<li>-INSOMNIA <span class="en">e</span>-프리퀀시 이벤트
																		기간 중 탈퇴 시에는 적립 된 <span class="en">e</span>-스티커가 모두
																		소멸됩니다.
																	</li>
																</ul>
															</li>
														</ol></li>
												</ol>
											</div>
											<!-- 개인정보의 수집 및 이용목적 내용 end -->
										</div>

									</div>
								</div>


							</div>

						</div>
					</div>
				</section>

				<section class="mem_purpose_wrap">
					<h5>
						&nbsp;개인정보 수집 및 이용동의 <span class="essential">(필수)</span>
					</h5>

					<!-- <span class=" chk2"> <input type="checkbox"
						name="mem_purpose" id="mem_purpose_yes" class="mem"> <label
						for="mem_purpose_yes">동의</label>
					</span> -->
					
					<input type="checkbox" name="agree2" class="chk2"/>

					<div
						class="mem_purpose_area mem_purpose_area_v2 mCustomScrollbar _mCS_2">
						<div id="mCSB_2"
							class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
							tabindex="0">
							<div id="mCSB_2_container" class="mCSB_container"
								style="position: relative; top: 0; left: 0;" dir="ltr">
								<!-- 개인정보의 수집 및 이용목적 내용 -->
								<div class="privacy_cont">
									<p class="privacy_text" id="privacy_text">
									<div id="popWrap">

										<div id="container">


											<!-- 개인정보의 수집 및 이용목적 내용 -->
											<div class="privacy_cont">
												<p class="mb15">본인은 (주)INSOMNIA(이하 ‘회사’라 합니다)가 제공하는 회원
													서비스(이하 ‘서비스’라 합니다)를 이용하기 위해, 다음과 같이 ‘회사’가 본인의 개인정보를
													수집/이용하고, 개인정보의 취급을 위탁하는 것에 동의합니다.</p>

												<ul class="pri_con mb40">
													<li><span class="fontBold">1. 개인정보 항목·목적·보유기간</span></li>
												</ul>
											</div>
											<!-- 개인정보의 수집 및 이용목적 내용 end -->
										</div>
									</div>



									</p>
								</div>
								<!-- 개인정보의 수집 및 이용목적 내용 end -->
							</div>
							<div id="mCSB_2_scrollbar_vertical"
								class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical"
								style="display: block;">
								<div class="mCSB_draggerContainer">
									<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
										style="position: absolute; min-height: 33px; top: 0px; display: block; height: 18px; max-height: 118px;"
										oncontextmenu="return false;">
										<div class="mCSB_dragger_bar" style="line-height: 33px;"></div>
									</div>
									<div class="mCSB_draggerRail"></div>
								</div>
							</div>
						</div>
					</div>
				</section>

				<section class="mem_agreement_wrap mem_advertise_wrap">
					<h5>
						&nbsp;E-mail 및 SMS 광고성 정보 수신동의 <span class="essential">(선택)</span>
					</h5>
					<!-- <span class="agree-check chk3"> <input type="checkbox"
						name="mem_advertise" id="mem_advertise_yes" class="mem"> <label
						for="mem_advertise_yes">동의</label>
					</span> -->
					<dd id="mem_advertise_desc">&nbsp;다양한 프로모션 소식 및 신규 매장 정보를 보내 드립니다.</dd>
				</section>
				<section class="mem_join_note">
					<h5>회원가입 유의사항</h5>
					<ul>
						<li>· 반드시 회원님 명의로 된 휴대폰, 아이핀을 이용해주세요.</li>
						<li>· 타인의 개인정보를 도용하여 가입할 경우 향후 적발 시 서비스 이용제한 및 법적 제재를 받으실 수
							있습니다.</li>
					</ul>
				</section>
				<section class="mem_accreditation_wrap mb10">
					<h5>인증방식 선택</h5>
					<div class="mem_accreditation_info">
						<div class="li1">
							<figure>
								<img src="<c:url value='/img/smartphone.png'/>"
									alt="휴대폰 아이콘">
							</figure>
							<p class="mem_k_titl">휴대폰 인증</p>
							<p class="mem_k_txt">
								본인 명의의 휴대폰을 통해<br /> 인증합니다.
							</p>
							<p class="mem_k_btn">
								<a href="<c:url value='/register/form.ins'/>"
									title="휴대폰 본인 인증 새창열기">인증하기</a>
							</p>
						</div>
						<div class="li2">
							<figure>
								<img src="<c:url value='/img/laptop.png'/>"
									alt="아이핀 아이콘">
							</figure>
							<p class="mem_f_titl">
								아이핀 <span class="en">(i-PIN)</span>인증
							</p>
							<p class="mem_f_txt">
								가입한 아이핀 ID를 통해<br /> 인증합니다.
							</p>
							<p class="mem_f_btn">
								<a href="javascript:void(0)" title="아이핀 본인 인증 새창열기">인증하기</a>
							</p>
						</div>
					</div>
				</section>
			</section>




			<!-- 여기까지 -->

		</section>
		<!-- /#album -->






<br><br><br>

		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		