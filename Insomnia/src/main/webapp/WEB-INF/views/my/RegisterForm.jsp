<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" href="<c:url value='/vendor/css/RegisterFormCSS.css'/>"/>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  <!-- 도로명주소 CDN -->
	<script src="<c:url value='/vendor/js/road.js'/>"></script>
	
	
	
<style>
body {
<<<<<<< HEAD
	/* background-color: black; */
	background-image: url("<c:url value='/Insomnia/src/main/webapp/img/RegisterBackground.jpg'/>");
=======
	background: url('../resource/img/background.jpg');
>>>>>>> branch 'master' of https://github.com/goback22/Insomnia.git
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
							<img class="find_mem_sally" src="../resource/img/약관_편집_폼.jpg"/>
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
							<a class="male on">남</a> 
							<a class="female">여</a> 
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
									<option value="">연도</option>
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
								<label for="birth_month" class="a11y">2월</label> 
								<select id="birth_month" name="birth_month" required="required">
								<option value="">월</option>
									<option value="01">1월</option><option value="02">2월</option><option value="03">3월</option>
									<option value="04">4월</option><option value="05">5월</option><option value="06">6월</option>
									<option value="07">7월</option><option value="08">8월</option><option value="09">9월</option>
									<option value="10">10월</option><option value="11">11월</option><option value="12">12월</option></select>
							</div>
							<div class="birth_select day">
								<label for="birth_day" class="a11y">18일</label> 
								<select id="birth_day" name="birth_day" required="required">
								<option value="">일</option>
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
						<p class="limit_txt birth_txt" id="birth_txt">생년월일을 선택해주세요.</p>
					</div>
					<!-- 주소 입력 -->
					<div class="renew_input_box addr_chk">
						<strong>주소(필수)</strong> 
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목">
					</div>
					<p class="limit_txt addr_txt" id="birth_txt">주소를 입력해주세요.</p>
					
					
					
					
					<!-- 여기부터 -->
					
					<!-- 여기까지 -->
					
					
					
					<!-- 휴대폰 번호 입력 -->
					<div class="renew_input_box phone_chk">
						<strong>휴대폰 번호(필수)</strong>
							
						<input type="text" value="010" id="phone3" readonly="readonly"/> -
						<input type="text" name="phone1" id="phone1" required/> -
						<input type="text" name="phone2" id="phone2" required/>
						
						<p class="limit_txt phone_txt" id="phone_txt">휴대폰 번호를 입력해주세요.</p>
					</div>	
					<!-- 이메일 입력 -->
					<div class="renew_input_box email_chk">
						<strong>이메일(필수)</strong>
						
							<label for="email" class="hid">e-mail</label> 
							<input type="text" name="email" id="email" placeholder="E-mail을 입력하세요." required="required">
							<select id="portal">
								<option value="naver">@naver.com</option>
								<option value="daum">@daum.com</option>
								<option value="nate">@nate.com</option>
								<option value="google">@google.com</option>
							</select>
							<p class="limit_txt email_txt" id="email_txt">이메일을 입력해주세요.</p>
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
				console.log($(this));
				console.log($(this)[0]);
				validateKeyup($(this)[0]);
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

					if($(this).html() == '남') {
						$('#gender').prop('value', 'M');
						$('.female').removeClass('on');
					} else {
						$('#gender').prop('value', 'F');
						$('.male').removeClass('on');
					}
					
					$(this).addClass('on');
					
			});
		
	})/////////제이쿼리 진입점
	
	
	///입력값 검증 메서드
	function validateForm(which) {
		
		//플래그 변수 선언
		var flag = 0;
		
		//정규식 변수 선언
		var regID = /^[^a-z]|[^a-z0-9]+|^([a-z]+|[0-9]+)$/i;
		var regPWD = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		//폼 입력값 얻기
		var idValue = $('#user_id').val();
		var pwdValue = $('#user_pwd').val();
		var pwdChkValue = $('#user_pwd_chk').val();
		
		//[검증 시작]   
		
		//1]아이디 검증
		if(idValue.length < 8 || idValue.length > 16) {	
			$('#id_chk_txt').html('아이디는 8자 이상, 10자 이하여야 합니다.');
			$('#id_chk_txt').css('display', 'block');
			
		} else if(idValue.match(regID) == null) {
			$('#id_chk_txt').html('아이디는 영문으로 시작하여야 하며, 영문/숫자의 조합으로 만들어야 합니다. 특수문자는?');
			$('#id_chk_txt').css('display', 'block');
				
		} else if(idValue.match(regID) != null) {
			$('#id_chk_txt').html('');
			$('#id_chk_txt').css('display', 'none');
			flag++; //플래그 = 1	
		}
		
		//2]비밀번호 검증
		
		if(pwdValue.length == 0) {
			
			$('#user_pwd_txt').html('비밀번호를 입력해주세요.');
			$('#user_pwd_txt').css('display', 'block');
			
		} else if(pwdValue.match(regPWD) == null) {
			$('#user_pwd_txt').html('비밀번호는 숫자/영문/특수문자 포함 8자에서 16자 사이로 입력해주세요.');
			$('#user_pwd_txt').css('display', 'block');
			
		} else {
			$('#user_pwd_txt').html('');
			$('#user_pwd_txt').css('display', 'none');
			flag++; //플래그 = 2
		}
		
		
		//3]비밀번호 동일성 검증
		if(pwdChkValue.length == 0) {
			$('#user_pwd_chk_txt').html('비밀번호를 확인해주세요.');
			$('#user_pwd_chk_txt').css('display', 'block');
			
		} else if(pwdChkValue != pwdValue) {
			$('#user_pwd_chk_txt').html('비밀번호가 일치하지 않습니다.');
			$('#user_pwd_chk_txt').css('color', 'red');
			$('#user_pwd_chk_txt').css('display', 'block');
			
		} else if(pwdChkValue == pwdValue) {
			$('#user_pwd_chk_txt').html('비밀번호가 일치합니다.');
			$('#user_pwd_chk_txt').css('color', 'green');
			$('#user_pwd_chk_txt').css('display', 'block');
			flag++; //플래그 = 3
		}
			
		
		//4]생년월일 검증
		
		if($('#birth_year option:selected').val() == '' || $('#birth_month option:selected').val() == '' || $('#birth_day option:selected').val() == '' || $('#birth_flag option:selected').val() == '' ) {
			$('#birth_txt').html('생년월일을 선택해주세요.');
			$('#birth_txt').css('display', 'block');
			
		} else {
			$('#birth_txt').html('');
			$('#birth_txt').css('display', 'none');
			flag++; //플래그 = 4
		}
		
		//5]성별 검증
		if($('#gender').val() == '') {
			$('#gender_txt').html('성별을 선택해주세요.');
			$('#gender_txt').css('display', 'block');
			
		} else {
			$('#gender_txt').html('성별을 선택해주세요.');
			$('#gender_txt').css('display', 'block');
			flag++; //플래그 = 5
		}
		
		//6]휴대전화 검증
		if($('#phone1').val() == '' || $('#phone2').val() == '') {
			$('#phone_txt').html('휴대전화를 입력해주세요.');
			$('#phone_txt').css('display', 'block');
			
		} else if($('#phone1, #phone2').val().length < 3 || $('#phone1, #phone2').val().length > 4) {
			$('#phone_txt').html('알맞은 번호형식이 아닙니다.');
			$('#phone_txt').css('display', 'block');
			
		} else {
			$('#phone_txt').html('');
			$('#phone_txt').css('display', 'none');
			flag++; //플래그 = 6
		}
		
		//7]주소 검증
		
		
		//8]이메일 검증
		if($('#email').val() == '') {
			$('#email_txt').html('이메일을 입력해주세요.');
			$('#phone_txt').css('display', 'block');
		} else {
			$('#email_txt').html('');
			$('#phone_txt').css('display', 'none');
		}
		
		
		if(flag == 6) 
			return true;
		else 

			return false;
		
	}////validateFormd
	
	function validateKeyup(which) {
		
		//정규식 변수 선언
		var regID = /^[^a-z]|[^a-z0-9]+|^([a-z]+|[0-9]+)$/i;
		var regPWD = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		//폼 입력값 얻기
		var idValue = $('#user_id').val();
		var pwdValue = $('#user_pwd').val();
		var pwdChkValue = $('#user_pwd_chk').val();
	
		
		if(which == $('#user_id')[0]) {
			
			//1]아이디 검증
			if(idValue.length < 8 || idValue.length > 16) {	
				$('#id_chk_txt').html('아이디는 8자 이상, 10자 이하여야 합니다.');
				$('#id_chk_txt').css('display', 'block');
				
			} else if(idValue.match(regID) == null) {
				$('#id_chk_txt').html('아이디는 영문으로 시작하여야 하며, 영문/숫자의 조합으로 만들어야 합니다. 특수문자는?');
				$('#id_chk_txt').css('display', 'block');
					
			} else if(idValue.match(regID) != null) {
				$('#id_chk_txt').html('');
				$('#id_chk_txt').css('display', 'none');
			}
			
		} else if(which == $('#user_pwd')[0]) {
			
			if(pwdValue.length == 0) {
				
				$('#user_pwd_txt').html('비밀번호를 입력해주세요.');
				$('#user_pwd_txt').css('display', 'block');
				
			} else if(pwdValue.match(regPWD) == null) {
				$('#user_pwd_txt').html('비밀번호는 숫자/영문/특수문자 포함 8자에서 16자 사이로 입력해주세요.');
				$('#user_pwd_txt').css('display', 'block');
				
			} else {
				$('#user_pwd_txt').html('');
				$('#user_pwd_txt').css('display', 'none');
				flag++; //플래그 = 2
			}
			
		} else if(which == $('#user_pwd_chk')[0]) {
			
			//3]비밀번호 동일성 검증
			if(pwdChkValue.length == 0) {
				$('#user_pwd_chk_txt').html('비밀번호를 확인해주세요.');
				$('#user_pwd_chk_txt').css('display', 'block');
				
			} else if(pwdChkValue != pwdValue) {
				$('#user_pwd_chk_txt').html('비밀번호가 일치하지 않습니다.');
				$('#user_pwd_chk_txt').css('color', 'red');
				$('#user_pwd_chk_txt').css('display', 'block');
				
			} else if(pwdChkValue == pwdValue) {
				$('#user_pwd_chk_txt').html('비밀번호가 일치합니다.');
				$('#user_pwd_chk_txt').css('color', 'green');
				$('#user_pwd_chk_txt').css('display', 'block');
			}
			
		} else if(which == $('select').not('#portal')[0]) {
			
			console.log('4');
			
		} else if(which == $('#gender')[0]) {
			
			console.log('5');
			
		} else if(which == $('#email')[0]) {
			
			if($('#email').val() == '') {
				$('#email_txt').html('이메일을 입력해주세요.');
				$('#phone_txt').css('display', 'block');
			} else {
				$('#email_txt').html('');
				$('#phone_txt').css('display', 'none');
			}
			
		} else if(which == $('#phone1') || which == $('#phone2')) {
			
			if($('#phone1').val() == '' || $('#phone2').val() == '') {
				$('#phone_txt').html('휴대전화를 입력해주세요.');
				$('#phone_txt').css('display', 'block');
				
			} else if($('#phone1, #phone2').val().length < 3 || $('#phone1, #phone2').val().length > 4) {
				$('#phone_txt').html('알맞은 번호형식이 아닙니다.');
				$('#phone_txt').css('display', 'block');
				
			} else {
				$('#phone_txt').html('');
				$('#phone_txt').css('display', 'none');
			}
			
		}
		
		
	}
		
		
	
	</script>
		
		
		<!--=========================-->
		<!--=        footer         =-->
		<!--=========================-->
		