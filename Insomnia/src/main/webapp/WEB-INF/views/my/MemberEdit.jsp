<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<c:url value='/vendor/css/MemberEditCSS.css'/>" />
<style>
body {
	background: url('../resource/img/background.jpg');
}
</style>

</head>

<body id="home-version-1" class="home-version-1" data-style="default">

	<!-- 	<div class="loader loader-bar-ping-pong is-active"></div> -->
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

			<fieldset>
				<legend class="hid">회원가입 이용약관 동의, 수집하는 개인정보의 항목, 개인정보의 수집 및
					이용목적, 개인정보의 보유 및 이용기간 및 파기절차, 파기 방법에 관한 폼</legend>

				<div class="find_mem_ttl_div">
					<strong class="find_mem_ttl">개인정보 수정</strong>
				</div>
				<form id="frm">
					<section class="renew_joinform_v2">
						
						<div class="find_mem_sally">
							<img class="find_mem_sally" src="../resource/img/약관_편집_폼.jpg"/>
						</div>
						
						<p class="find_form_txt">수정할 정보를 입력해 주세요.</p>
						<!-- <div class="renew_input_box id_chk">
						<label for="user_id" class="hid">아이디</label><input type="text"
							name="user_id" id="user_id" placeholder="아이디" maxlength="13">
						<a class="id_chk" href="javascript:void(0);">중복확인</a>
						<p class="limit_txt id_chk_txt" id="id_chk_txt">영문(대소문자 구분
							없음), 숫자로 4~13자리만 입력 가능합니다.</p>
					</div> -->
						<div class="renew_input_box pw_chk">
							<label for="user_pwd" class="hid">비밀번호</label> <input
								id="user_pwd" name="user_pwd" type="password" maxlength="20"
								placeholder="비밀번호" autocomplete="off">
							<p class="limit_txt user_pwd_txt" id="user_pwd_txt">
								<!-- 영문, 숫자 혼합하여 10~20자리 이내로 입력하세요. -->
							</p>
						</div>
						<div class="renew_input_box pw_chk bd_none">
							<label for="user_pwd_chk" class="hid">비밀번호확인</label> <input
								type="password" id="user_pwd_chk" name="user_pwd_chk"
								placeholder="비밀번호 확인" maxlength="20" autocomplete="off">
							<p class="limit_txt user_pwd_chk_txt" id="user_pwd_chk_txt">입력하신
								패스워드를 다시 한 번 입력해주세요.</p>
						</div>
					</section>
					<section class="renew_joinform_v2">
						<div class="renew_input_box gender_chk">
							<strong>이름(필수)</strong>
							<p class="nofix_name">서기환</p>
							<input type="hidden" id="user_nm" name="user_nm" value="서기환"
								required="required">
							<div class="user_gender">
								<a class="male on" href="javascript:void(0);">남</a> <a
									class="female " href="javascript:void(0);">여</a> <input
									type="hidden" id="gender" name="gender" value="M">
							</div>
						</div>
						<div class="renew_input_box birth_chk">
							<strong>생년월일(필수)</strong>
							<div class="select_birth_box">
								<div class="birth_select year">
									<label for="birth_year" class="a11y">1994년</label> <select
										id="birth_year" name="birth_year" required="required"><option
											value="">선택</option>
										<option value="2005">2005년</option>
										<option value="2004">2004년</option>
										<option value="2003">2003년</option>
										<option value="2002">2002년</option>
										<option value="2001">2001년</option>
										<option value="2000">2000년</option>
										<option value="1999">1999년</option>
										<option value="1998">1998년</option>
										<option value="1997">1997년</option>
										<option value="1996">1996년</option>
										<option value="1995">1995년</option>
										<option value="1994">1994년</option>
										<option value="1993">1993년</option>
										<option value="1992">1992년</option>
										<option value="1991">1991년</option>
										<option value="1990">1990년</option>
										<option value="1989">1989년</option>
										<option value="1988">1988년</option>
										<option value="1987">1987년</option>
										<option value="1986">1986년</option>
										<option value="1985">1985년</option>
										<option value="1984">1984년</option>
										<option value="1983">1983년</option>
										<option value="1982">1982년</option>
										<option value="1981">1981년</option>
										<option value="1980">1980년</option>
										<option value="1979">1979년</option>
										<option value="1978">1978년</option>
										<option value="1977">1977년</option>
										<option value="1976">1976년</option>
										<option value="1975">1975년</option>
										<option value="1974">1974년</option>
										<option value="1973">1973년</option>
										<option value="1972">1972년</option>
										<option value="1971">1971년</option>
										<option value="1970">1970년</option>
										<option value="1969">1969년</option>
										<option value="1968">1968년</option>
										<option value="1967">1967년</option>
										<option value="1966">1966년</option>
										<option value="1965">1965년</option>
										<option value="1964">1964년</option>
										<option value="1963">1963년</option>
										<option value="1962">1962년</option>
										<option value="1961">1961년</option>
										<option value="1960">1960년</option>
										<option value="1959">1959년</option>
										<option value="1958">1958년</option>
										<option value="1957">1957년</option>
										<option value="1956">1956년</option>
										<option value="1955">1955년</option>
										<option value="1954">1954년</option>
										<option value="1953">1953년</option>
										<option value="1952">1952년</option>
										<option value="1951">1951년</option>
										<option value="1950">1950년</option>
										<option value="1949">1949년</option>
										<option value="1948">1948년</option>
										<option value="1947">1947년</option>
										<option value="1946">1946년</option>
										<option value="1945">1945년</option>
										<option value="1944">1944년</option>
										<option value="1943">1943년</option>
										<option value="1942">1942년</option>
										<option value="1941">1941년</option>
										<option value="1940">1940년</option>
										<option value="1939">1939년</option>
										<option value="1938">1938년</option>
										<option value="1937">1937년</option>
										<option value="1936">1936년</option>
										<option value="1935">1935년</option>
										<option value="1934">1934년</option>
										<option value="1933">1933년</option>
										<option value="1932">1932년</option>
										<option value="1931">1931년</option>
										<option value="1930">1930년</option>
										<option value="1929">1929년</option>
										<option value="1928">1928년</option>
										<option value="1927">1927년</option>
										<option value="1926">1926년</option>
										<option value="1925">1925년</option>
										<option value="1924">1924년</option>
										<option value="1923">1923년</option>
										<option value="1922">1922년</option>
										<option value="1921">1921년</option>
										<option value="1920">1920년</option>
										<option value="1919">1919년</option>
										<option value="1918">1918년</option>
										<option value="1917">1917년</option>
										<option value="1916">1916년</option>
										<option value="1915">1915년</option>
										<option value="1914">1914년</option>
										<option value="1913">1913년</option>
										<option value="1912">1912년</option>
										<option value="1911">1911년</option>
										<option value="1910">1910년</option>
										<option value="1909">1909년</option>
										<option value="1908">1908년</option>
										<option value="1907">1907년</option>
										<option value="1906">1906년</option>
										<option value="1905">1905년</option></select>
								</div>
								<div class="birth_select month">
									<label for="birth_month" class="a11y">2월</label> <select
										id="birth_month" name="birth_month" required="required"><option
											value="">선택</option>
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option></select>
								</div>
								<div class="birth_select day">
									<label for="birth_day" class="a11y">18일</label> <select
										id="birth_day" name="birth_day" required="required"><option
											value="">선택</option>
										<option value="01">1일</option>
										<option value="02">2일</option>
										<option value="03">3일</option>
										<option value="04">4일</option>
										<option value="05">5일</option>
										<option value="06">6일</option>
										<option value="07">7일</option>
										<option value="08">8일</option>
										<option value="09">9일</option>
										<option value="10">10일</option>
										<option value="11">11일</option>
										<option value="12">12일</option>
										<option value="13">13일</option>
										<option value="14">14일</option>
										<option value="15">15일</option>
										<option value="16">16일</option>
										<option value="17">17일</option>
										<option value="18">18일</option>
										<option value="19">19일</option>
										<option value="20">20일</option>
										<option value="21">21일</option>
										<option value="22">22일</option>
										<option value="23">23일</option>
										<option value="24">24일</option>
										<option value="25">25일</option>
										<option value="26">26일</option>
										<option value="27">27일</option>
										<option value="28">28일</option></select>
								</div>
								<div class="birth_select yny">
									<label for="birth_flag" class="a11y">음력/양력</label> <select
										id="birth_flag" name="birth_flag">
										<option selected="selected" value="1">양</option>
										<option value="2">음</option>
									</select>
								</div>
							</div>
							<p class="limit_txt input_warn_text birth_txt" id="birth_txt"></p>
							<p class="select_birth_txt">
								<!-- 회원 가입 완료 후 스타벅스 카드를 등록하시면 INSOMNIA 무료음원 쿠폰이 발행됩니다. -->
							</p>
						</div>

						<div class="renew_input_box addr_chk">
							<strong>주소(필수)</strong> <input type="button"
								class=" inputInfo"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required><br>
							<input type="text" class=" inputInfo" id="postcode"
								placeholder="우편번호" required name="postcode"> <input
								type="text" class=" inputInfo" id="roadAddress"
								placeholder="도로명주소" required name="roadAddress"> <span
								id="guide" style="color: #999; display: none"></span> <input
								type="text" class=" inputInfo" id="detailAddress"
								placeholder="상세주소" required name="detailAddress">
						</div>
						<div class="renew_input_box phone_chk">
							<strong>휴대폰(필수)</strong>

							<div class="choice_cont_phone">
								<input type="text" name="phone1" id="phone1" required="required"
									maxlength="3" class="pho">&nbsp;─&nbsp; <input
									type="text" name="phone2" id="phone2" required="required"
									maxlength="4" class="pho">&nbsp;─&nbsp; <input
									type="text" name="phone3" id="phone3" required="required"
									maxlength="4" class="pho">

								<p class="limit_txt mail_txt" id="mail_txt"></p>
							</div>


							<!-- // 툴팁 -->
							<strong>이메일(필수)</strong>
							<div class="choice_cont_mail">
								<label for="email" class="hid">e-mail</label> <input type="text"
									name="email" id="email" placeholder="E-mail을 입력하세요."
									required="required">

								<p class="limit_txt mail_txt" id="mail_txt"></p>
							</div>

						</div>


					</section>


					<div class="modify_txt2_div">
						<p class="modify_txt2">
							<b>＊ 잘 수정되었는지 다시 한 번 확인해주세요.".</b>
						</p>
					</div>
					<div class="btn_mem_login_div">
						<p class="btn_mem_login">
							<a href="<c:url value='/Insomnia/MyPage.jsp'/>" id="submitATag">수정하기</a>
							<!-- <a href="javascript:void(0);" id="submitATag">가입하기</a> -->
						</p>
					</div>
				</form>
			</fieldset>




			<!-- 여기까지 -->

		</section>
		<!-- /#album -->



		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
	

	<script>
		$(function() {

			$('#submitATag').click(function() {
				var flag = confirm('이대로 수정하시겠습니까?');
			});

			if (this.prop('id') == 'phone3') {
				return;
			}

			$('.pho').keyup(function() {
				var limit = $(this).prop('maxlength');
				if (this.value.length > limit) {
					$(this).next.focus();
				}

			});

		});
	</script>

