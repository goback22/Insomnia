<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" href="<c:url value='/vendor/css/RegisterFormCSS.css'/>"/>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  <!-- 도로명주소 CDN -->
	<script src="<c:url value='/vendor/js/road.js'/>"></script>
	
	
	
<style>
body {
	background-color: black;
}
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

		<fieldset>
			<legend class="hid">회원가입폼</legend>

			<div class="find_mem_ttl_div">
				<strong class="find_mem_ttl">회원가입</strong>
			</div>
			
			<form id="frm" method="POST" action="<c:url value='/register/complete.ins'/>">
			<!-- 섹션1: 아이디, 비번, 비번확인 -->
				<section class="renew_joinform_v2">
					<!-- 머릿말 -->
					<div class="find_mem_sally">
							<img class="find_mem_sally" src="<c:url value='/Insomnia/ProjectImg/약관_편집_폼.jpg'/>"/>
					</div>
					<p class="find_form_txt">회원정보를 입력해 주세요.</p>
					
					<!-- 아이디 입력 -->
					<div class="renew_input_box id_chk">
						<label for="user_id" class="hid">아이디</label>
						<input type="text" name="user_id" id="user_id" placeholder="아이디" maxlength="13" required>
						<p class="limit_txt id_chk_txt" id="id_chk_txt">아이디 에러메세지</p>
					</div>
					<!-- 비번 입력 -->
					<div class="renew_input_box pw_chk">
						<label for="user_pwd" class="hid">비밀번호</label> 
						<input id="user_pwd" name="user_pwd" type="password" maxlength="20" placeholder="비밀번호" autocomplete="off" required>
						<p class="limit_txt user_pwd_txt" id="user_pwd_txt">비번 에러메세지</p>
					</div>
					<!-- 비번 확인 -->
					<div class="renew_input_box pw_chk bd_none">
						<label for="user_pwd_chk" class="hid">비밀번호확인</label> 
						<input type="password" id="user_pwd_chk" name="user_pwd_chk" placeholder="비밀번호 확인" maxlength="20" autocomplete="off" required>
						<p class="limit_txt user_pwd_chk_txt" id="user_pwd_chk_txt">비번확인 에러메세지</p>
					</div>
				</section>
				<!-- 섹션2: 이름, 생년월일, 주소 -->
				<section class="renew_joinform_v2">
					<div class="renew_input_box gender_chk">
						<!-- 이름입력 -->
						<strong>이름(필수)</strong>
						<p class="nofix_name">서기환</p>
						<input type="hidden" id="user_nm" name="user_nm" value="서기환" required="required">
						<!-- 성별입력 -->
						<div class="user_gender">
							<a class="male on" href="javascript:void(0);">남</a> 
							<a class="female " href="javascript:void(0);">여</a> 
							<input type="hidden" id="gender" name="gender" value="">
						</div>
					</div>
					<!-- 생년월일 입력 -->
					<div class="renew_input_box birth_chk">
						<strong>생년월일(필수)</strong>
						<div class="select_birth_box">
							<div class="birth_select year">
								<label for="birth_year" class="a11y">1994년</label> 
								<select id="birth_year" name="birth_year" required="required">
									<option value="">선택</option>
									<option value="2005">2005년</option><option value="2004">2004년</option><option value="2003">2003년</option>
									<option value="2002">2002년</option><option value="2001">2001년</option><option value="2000">2000년</option>
									<option value="1999">1999년</option><option value="1998">1998년</option><option value="1997">1997년</option>
									<option value="1996">1996년</option><option value="1995">1995년</option><option value="1994">1994년</option>
									<option value="1993">1993년</option><option value="1992">1992년</option><option value="1991">1991년</option>
									<option value="1990">1990년</option><option value="1989">1989년</option><option value="1988">1988년</option>
									<option value="1987">1987년</option><option value="1986">1986년</option><option value="1985">1985년</option>
									<option value="1984">1984년</option><option value="1983">1983년</option><option value="1982">1982년</option>
									<option value="1981">1981년</option><option value="1980">1980년</option><option value="1979">1979년</option>
									<option value="1978">1978년</option><option value="1977">1977년</option><option value="1976">1976년</option>
									<option value="1975">1975년</option><option value="1974">1974년</option><option value="1973">1973년</option>
									<option value="1972">1972년</option><option value="1971">1971년</option><option value="1970">1970년</option>
									<option value="1969">1969년</option><option value="1968">1968년</option><option value="1967">1967년</option>
									<option value="1966">1966년</option><option value="1965">1965년</option><option value="1964">1964년</option>
									<option value="1963">1963년</option><option value="1962">1962년</option><option value="1961">1961년</option>
									<option value="1960">1960년</option><option value="1959">1959년</option><option value="1958">1958년</option>
									<option value="1957">1957년</option><option value="1956">1956년</option><option value="1955">1955년</option>
									<option value="1954">1954년</option><option value="1953">1953년</option><option value="1952">1952년</option>
									<option value="1951">1951년</option><option value="1950">1950년</option>
									</select>
							</div>
							<div class="birth_select month">
								<label for="birth_month" class="a11y">2월</label> <select
									id="birth_month" name="birth_month" required="required"><option
										value="">선택</option>
									<option value="01">1월</option><option value="02">2월</option><option value="03">3월</option>
									<option value="04">4월</option><option value="05">5월</option><option value="06">6월</option>
									<option value="07">7월</option><option value="08">8월</option><option value="09">9월</option>
									<option value="10">10월</option><option value="11">11월</option><option value="12">12월</option></select>
							</div>
							<div class="birth_select day">
								<label for="birth_day" class="a11y">18일</label> <select
									id="birth_day" name="birth_day" required="required"><option
										value="">선택</option>
									<option value="01">1일</option><option value="02">2일</option><option value="03">3일</option>
									<option value="04">4일</option><option value="05">5일</option><option value="06">6일</option>
									<option value="07">7일</option><option value="08">8일</option><option value="09">9일</option>
									<option value="10">10일</option><option value="11">11일</option><option value="12">12일</option>
									<option value="13">13일</option><option value="14">14일</option><option value="15">15일</option>
									<option value="16">16일</option><option value="17">17일</option><option value="18">18일</option>
									<option value="19">19일</option><option value="20">20일</option><option value="21">21일</option>
									<option value="22">22일</option><option value="23">23일</option><option value="24">24일</option>
									<option value="25">25일</option><option value="26">26일</option><option value="27">27일</option>
									<option value="28">28일</option></select>
							</div>
							<div class="birth_select yny">
								<label for="birth_flag" class="a11y">음력/양력</label> 
								<select id="birth_flag" name="birth_flag">
									<option selected="selected" value="1">양</option>
									<option value="2">음</option>
								</select>
							</div>
						</div>
						<p class="limit_txt input_warn_text birth_txt" id="birth_txt">생년월일을 선택해주세요.</p>
					</div>
					<!-- 주소 입력 -->
					<div class="renew_input_box addr_chk">
						<strong>주소(필수)</strong> 
						<input type="button" class="form-control inputInfo" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required><br>
						<input type="text" class="inputInfo" id="postcode" placeholder="우편번호" required name="postcode"> 
						<input type="text" class="form-control inputInfo" id="roadAddress" placeholder="도로명주소" required name="roadAddress"> 
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" class="form-control inputInfo" id="detailAddress" placeholder="상세주소" required name="detailAddress">
					</div>
					<p class="limit_txt input_warn_text addr_txt" id="birth_txt">주소를 입력해주세요.</p>
					
					<!-- 휴대폰 번호 입력 -->
					<div class="renew_input_box phone_chk">
						<strong>휴대폰 번호(필수)</strong>
							
						<input type="text" disabled value="010"/>
						<input type="text" name="phone1" id="phone1" required/> -
						<input type="text" name="phone2" id="phone2" required/>
						
						<p class="limit_txt phone_txt" id="phone_txt">휴대폰 번호를 입력해주세요.</p>
					</div>	
					<!-- 이메일 입력 -->
					<div class="choice_cont_mail">
						<label for="email" class="hid">e-mail</label> 
						<input type="text" name="email" id="email" placeholder="E-mail을 입력하세요." required="required">
						<p class="limit_txt mail_txt" id="mail_txt">이메일을 입력해주세요.</p>
					</div>
				</section>

				<!-- 가입 전 안내문구 -->
				<div class="modify_txt2_div">
					<p class="modify_txt2"><b>＊ 선택항목은 입력하지 않거나 동의하지 않아도 회원 가입이 가능합니다.</b></p>
				</div>
				<!-- 로그인버튼 -->
				<div class="btn_mem_login_div">
					<p class="btn_mem_login"><a id="btnSubmit">가입하기</a></p> 
				</div>
			</form>
		</fieldset>

		<!-- 여기까지 -->
			
		</section>
		

	<script>
	
	$(function(){
		
			///1] 키 입력시 검증 메서드 호출
			$('input').bind('keyup', function(){
				validateForm();
			});
			
			//2] 폼의 submit 이벤트와 검증 메서드 바인딩
			$('#frm').bind('submit', function(){
				return validateForm();
			})
			
			//3] '가입하기' 클릭시  폼을 submit 시킴
			$('#btnSubmit').click(function(){
				$('#frm').submit();
			})
			
			//4] 성별 선택시 효과주기
			$('.male, .female').click(function(){
				
				/* $(this).css('color', 'white'); */
				$(this).addClass('on');
			})
		
	})/////////제이쿼리 진입점
	
	
	///입력값 검증 메서드
	function validateForm() {
		
		//플래그 변수 선언
		var flag = 0;
		
		//정규식 변수 선언
		var regID = /^[^a-z]|[^a-z0-9]+|^([a-z]+|[0-9]+)$/i;
		var regPWD = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		//폼 입력값 얻기
		var idValue = $('#user_id').val();
		var pwdValue = $('#user_pwd').val();
		var pwdChkValue = $('#user_pwd_chk').val();
		
		//[검증 시작]    //flag를 다시 마이너스 시켜야 하나. 아냐. 플래그는 매번 0으로 초기화되고, 서브밋 할 때만 필요한 거니까. 최종 가입 버튼 눌렀을 때만 한꺼번에
		//확인하면 돼
		
		//1]아이디 검증
		if(idValue.length < 8 || idValue.length > 16) {	
			$('#id_chk_txt').html('아이디는 8자 이상, 10자 이하여야 합니다.');
			$('#id_chk_txt').css('display', 'block');
			$('#user_id').focus();
		} else if(idValue.match(regID) == null) {
			$('#id_chk_txt').html('아이디는 영문으로 시작하여야 하며, 영문/숫자의 조합으로 만들어야 합니다. 특수문자는?');
			$('#id_chk_txt').css('display', 'block');
			$('#user_id').focus();
		} else if(idValue.match(regID) != null) {
			$('#id_chk_txt').html('');
			$('#id_chk_txt').css('display', 'none');
			flag++; //플래그 = 1	
		}
		
		//2]비밀번호 검증
		if(pwdValue.match(regPWD)) {
			$('#user_pwd_txt').html('비밀번호는 숫자/영문/특수문자 포함 8자에서 16자 사이로 입력해주세요.');
			$('#user_pwd_txt').css('display', 'block');
			$('#user_pwd').focus();
		} else {
			$('#user_pwd_txt').html('');
			$('#user_pwd_txt').css('display', 'none');
			flag++; //플래그 = 2
		}
		
		
		//3]비밀번호 동일성 검증
		if(pwdChkValue.length == 0) {
			$('#user_pwd_chk_txt').html('');
			$('#user_pwd_chk_txt').css('display', 'none');
			$('#user_pwd_chk').focus();
		} else if(pwdChkValue != pwdValue) {
			$('#user_pwd_chk_txt').html('비밀번호가 일치하지 않습니다.');
			$('#user_pwd_chk_txt').css('color', 'red');
			$('#user_pwd_chk_txt').css('display', 'block');
			$('#user_pwd_chk').focus();
		} else if(pwdChkValue == pwdValue) {
			$('#user_pwd_chk_txt').html('비밀번호가 일치합니다.');
			$('#user_pwd_chk_txt').css('color', 'green');
			$('#user_pwd_chk_txt').css('display', 'block');
			flag++; //플래그 = 3
		}
			
		
		//4]생년월일 검증
		
		console.log($('select').val());
		
		if($('select').val == '') {
			$('#birth_txt').html('생년월일을 선택해주세요.');
			$('#birth_txt').css('display', 'block');
		} else {
			$('#birth_txt').html('');
			$('#birth_txt').css('display', 'none');
			flag++; //플래그 = 4
		}
		
		//5]성별 검증
		if($('#gender').val == '') {
			$('#gender_txt').html('성별을 선택해주세요.');
			$('#gender_txt').css('display', 'block');
			$('.user_gender').focus();
		} else {
			$('#gender_txt').html('성별을 선택해주세요.');
			$('#gender_txt').css('display', 'block');
			flag++; //플래그 = 5
		}
		
		//6]휴대전화 검증
		if($('#phone1').val() == '' || $('#phone2').val() == '') {
			$('#phone_txt').html('휴대전화를 입력해주세요.');
			$('#phone_txt').css('display', 'block');
			$('#phone1').focus();
		} else if( $('#phone1, #phone2').val().length < 3 || $('#phone1, #phone2').val().length > 4) {
			$('#phone_txt').html('알맞은 번호형식이 아닙니다.');
			$('#phone_txt').css('display', 'block');
			$('#phone1').focus();
		} else {
			$('#phone_txt').html('');
			$('#phone_txt').css('display', 'none');
			flag++; //플래그 = 6
		}
		
		
		if(flag == 6) 
			return true;
		else 

			return false;
		
		
		
	}////validateFormd
	var a, b;
		
		
	
	</script>
		
		
		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		