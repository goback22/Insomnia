https://www.google.com/recaptcha/admin/create<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
	<link rel="stylesheet" href="<c:url value='/vendor/css/RegisterFormCSS.css'/>"/>
 -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 도로명주소 CDN -->
<script src="<c:url value='/vendor/js/road.js'/>"></script>

<link href="<c:url value='/vendor/css/RegisterTerm-reset.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style_mem.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style_dt.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/RegisterTerm-style_util.css'/>"
	rel="stylesheet">


<!-- 스타벅스 회원가입폼 -->


<!-- 기환이 내용 2019 04 14 -->


<style>
.space_for_nav {
	background-color: black;
	width: 100%;
	height: 80px;
}

.find_insomnia_logo {
	margin-top: 50px;
	margin-left: 24%;
}

/* 임한결 추가 2019 04 14 이메일 인증 버튼 넣기 */

/* 이메일 input태그에 버튼넣기 */
.inner-btn-input {
	border: 1px solid #ddd;
	padding: 1px;
}

.input-email {
	height: 45px;
	border: 1px solid #fff !important;
	max-width: 270px !important;
	width: 270px !important;
}

.input-email:focus {
	border: 1px solid #fff !important;
	outline-offset: none !important;
	outline: none !important;
}

#btnEmailAuthentication {
	margin-left: 50px;
}

.input_phone_num {
	width: 31% !important;
}

/* 가입 버튼 div에서 input submit으로 대체 */
#btnSubmit {
	width: 500px;
	height: 50px;
	margin-top: 20px;
}

.btnSubmit_div {
	width: 100%;
	text-align: center;
}
	
.limit_txt {
	color:red;
	margin-left:20px;
}	

#checkbtn {
	margin-left:10px;
}

#user_nm {
	margin-left:30px;
}

.confirm_txt {
	display:none;
}

.on {
	color: red;
}

.user_gender a.on {
	color: red;
}

</style>

<script>
	
</script>



</head>

<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<div class="space_for_nav"></div>
		<jsp:include page="/WEB-INF/template/Nav.jsp" />


		<!--===========================-->
		<!--=        	About         =-->
		<!--===========================-->

		<section id="album">

			<!-- 여기부터 -->

			<fieldset>
				<legend class="hid">소셜회원 추가정보 입력</legend>

				<div class="find_mem_ttl_div">
					<strong class="find_mem_ttl">추가정보 입력</strong><br/>
				</div>
				<!-- <c:url value='/register/complete.ins'/> -->
				<form id="frm" method="post" action="<c:url value='/registerSocial/update.ins'/>">
					<!-- 섹션1: 아이디, 비번, 비번확인 -->
					<section class="renew_joinform_v2">
						<!-- 머릿말 -->
						<img class="find_insomnia_logo"
							src="../resource/img/insomnia-logo.png" />
						<p class="find_form_txt">${record.login_chain} 제휴회원</p>

						<!-- 이메일 입력 -->
						<div class="renew_input_box email_chk">
							<strong>이메일(필수)</strong>
							<div class="inner-btn-input">
								<label for="email" class="hid">e-mail</label>
								<input class="input-email" type="text" name="email" id="email" placeholder="E-mail을 입력하세요." required="required" value="${emailFront}"> 
								<select	id="portal" name="portal">  <!-- 없으면 직접 입력 처리-컨트롤러에서 아예 '직접입력'으로 저장하고 여기도 추가하자. -->
									<option value="naver.com">naver.com</option>
									<option value="daum.com">daum.net</option>
									<option value="daum.com">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="google.com">google.com</option>
									<option value="직접입력">직접입력</option>
								</select>
								<button type="button" class="btn btn-success" id="checkbtn">중복확인</button>  <!-- 입력되면 비활성화 -->
								<p class="limit_txt email_txt" id="email_txt">이메일을 입력해주세요.</p>
								<p class="limit_txt portal_txt" id="portal_txt">도메인을 선택해주세요.</p>
								<p class="confirm_txt">소셜계정을 통해 이메일이 확인되었습니다.</p>
								
								<div id="checkMsg"></div>
							</div>
							<!-- 버튼이 들어간 input태그  -->


						</div>

						<!-- 비번 입력 -->
						<div class="renew_input_box pw_chk">
							<label for="user_pwd" class="hid">비밀번호</label>
							<input id="user_pwd" name="user_pwd" type="password" maxlength="20" placeholder="소셜 계정이 확인되었습니다." autocomplete="off" disabled>
							<p class="limit_txt user_pwd_txt" id="user_pwd_txt">비번 에러메세지</p>
						</div>
						<!-- 비번 확인 -->
						<div class="renew_input_box pw_chk bd_none">
							<label for="user_pwd_chk" class="hid">비밀번호확인</label>
							<input type="password" id="user_pwd_chk" name="user_pwd_chk" placeholder="소셜계정이 확인되었습니다." maxlength="20" autocomplete="off" disabled>
							<p class="limit_txt user_pwd_chk_txt" id="user_pwd_chk_txt">비번확인
								에러메세지</p>
						</div>
					</section>
					<!-- 섹션2: 이름, 생년월일, 주소 -->
					<section class="renew_joinform_v2">
						<div class="renew_input_box gender_chk">
							<!-- 이름입력 -->
							<strong>이름(필수)</strong>
							<input type="text" id="user_nm" name="user_nm" required="required" value="${recordMap.name}" disabled>
							<!-- 성별입력 -->
							<div class="user_gender">
								<a class="male">남</a> <a class="female">여</a> 
								<input type="hidden" id="gender" name="gender" value="">  <!-- input에 따른 a효과도 -->
							</div>
							<p class="limit_txt gender_txt" id="gender_txt">생년월일을 선택해주세요.</p>
						</div>
						<!-- 생년월일 입력 -->
						<div class="renew_input_box birth_chk">
							<strong>생년월일(필수)</strong>
							<div class="select_birth_box">
								<div class="birth_select year">
									<label for="birth_year" class="a11y">1994년</label>
									<select id="birth_year" name="birth_year" required="required">
										<option value="">연도</option>
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
									</select>
								</div>
								<div class="birth_select month">
									<label for="birth_month" class="a11y">2월</label>
									<select id="birth_month" name="birth_month" required="required">
										<option value="">월</option>
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
										<option value="12">12월</option>
									</select>
								</div>
								<div class="birth_select day">
									<label for="birth_day" class="a11y">18일</label>
									<select id="birth_day" name="birth_day" required="required">
										<option value="">일</option>
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
										<option value="28">28일</option>
									</select>
								</div>
								<div class="birth_select yny">
									<label for="birth_flag" class="a11y">음력/양력</label> <select
										id="birth_flag" name="birth_flag">
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
							<input name="zip_code" type="text" id="sample4_postcode" placeholder="우편번호" >
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<input name="roadAddress" type="text" id="sample4_roadAddress" placeholder="도로명주소">
							<input name="jibunAddress" type="text" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide" style="color: #999; display: none"></span>
							<input name="detailAddress"	type="text" id="sample4_detailAddress" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							<p class="limit_txt addr_txt" id="birth_txt">주소를 입력해주세요.</p>
						</div>
						


						<!-- 휴대폰 번호 입력 -->
						<div class="renew_input_box phone_chk">
							<strong>휴대폰 번호(필수)</strong> 
							<input class="input_phone_num"	type="text" value="010" id="phone3" readonly="readonly" /> -
							<input	class="input_phone_num" type="text" name="phone1" id="phone1" required /> - 
							<input class="input_phone_num" type="text" name="phone2" id="phone2" required />
							<p class="limit_txt phone_txt" id="phone_txt">휴대폰 번호를 입력해주세요.</p>
						</div>
					</section>

					<!-- 가입 전 안내문구 삭제 : 선택항목이 존재하지 않음 -->
					<!-- 
				<div class="modify_txt2_div">
					<p class="modify_txt2"><b>＊ 선택항목은 입력하지 않거나 동의하지 않아도 회원 가입이 가능합니다.</b></p>
				</div>
				 -->

					<!-- 마케팅 정보 수신동의 히든타입으로 넘기기 -->
					<input type="hidden" name="advertise" value="${advertise}">

					<!-- 로그인버튼 -->
					<div class="btnSubmit_div">
						<input id="btnSubmit" class="btn btn-success" type="button" value="추가정보 입력하기"/>
					</div>
					<h1>${$authmsg}</h1>
					<!-- 
				<div class="btn_mem_login_div">
					<p class="btn_mem_login"><a id="btnSubmit">가입하기</a></p> 
				</div>
				 -->
				</form>
			</fieldset>

			<!-- 여기까지 -->

		</section>
	</div>
	<!-- site다이브 끝 -->
	
	<!-- 컨트롤러 값 받기 위한 hidden div -->
	<div style="display:none">
		<p class="birthYear_temp">${birthYear}</p>
		<p class="birthMonth_temp">${birthMonth}</p>
		<p class="birthDay_temp">${birthDay}</p>
		<p class="emailBack">${emailBack}</p>
		<p class="gender_temp">${gender}</p>
	</div>


	<script>
	
		$(function(){
			$('.male').removeClass('on');  //자동으로 남성에 붙는 성별체크 없애기?
		
		})
	
	</script>

	<script>

		$(function() {
			

			
			///아이디 중복검사
			$('#checkbtn').on('click',function() {
				if($('#email').val() != '') {
						$.ajax({
							type : 'POST',
							url : '/insomnia/checkSignup.ins',
							data : {
								"id" : $('#email').val() + "@" + $('#portal').val()
							},
							success : function(data) {
								if ($.trim(data) == 0) {
									$('#email_txt').css('display', 'none');
									$('#checkMsg').html(
											'<p style="color:blue">이메일이 사용가능합니다.</p>');
									
								} else {
									$('#email_txt').css('display', 'none');
									$('#checkMsg').html(
											'<p style="color:red">이메일이 중복됩니다. 다른 이메일을 입력하세요.</p>');
								}
							}
						}); //end ajax    
				} else {
					$('#checkMsg').html(
					'<p style="color:red; margin-top:2px;">이메일은 필수 입력사항입니다.</p>');
				}	
						
			}); //end on    

			

			///1] 키 입력시 검증 메서드 호출
			$('input').bind('keyup', function() {
				validateKeyup($(this)[0]);
			});

			//2] 폼의 submit 이벤트와 검증 메서드 바인딩
			$('#frm').bind('submit', function() {
				console.log(validateForm());
				return validateForm();
			})

			//3] '가입하기' 클릭시  폼을 submit 시킴
			$('#btnSubmit').click(function() {
				$('#frm').submit();
			})

			//4] 성별 선택시 효과주기
			//   성별 선택시 hidden input에 val값 설정
			$('.male, .female').click(function() {

				if ($(this).html() == '남') {
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
			var flag = 1;

			//정규식 변수 선언
			//var regID = /^[^a-z]|[^a-z0-9]+|^([a-z]+|[0-9]+)$/i;
			var regPWD = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

			//폼 입력값 얻기
			var idValue = $('#email').val();
			var pwdValue = $('#user_pwd').val();
			var pwdChkValue = $('#user_pwd_chk').val();

			//[검증 시작]   

			//1]아이디 검증 - 아이디를 이메일로 대체
			
			if(idValue.length == 0) {	
				$('#email_txt').html('유효한 이메일 주소를 입력해주시기 바랍니다.');
				$('#email_txt').css('display', 'block');
				console.log("아이디오류1");
				
			} else if($('portal').val == '') {
				$('#email_txt').html('도메인을 선택해주시기 바랍니다.');
				$('#email_txt').css('display', 'block');
				console.log("아이디오류1");
				
			} else {
				$('#email_txt').html('');
				$('#email_txt').css('display', 'none');
				console.log(flag + '아이디 유효성 확인');
				flag++;  //2
			}
			 
			
			//4]생년월일 검증

			if ($('#birth_year option:selected').val() == ''
					|| $('#birth_month option:selected').val() == ''
					|| $('#birth_day option:selected').val() == ''
					|| $('#birth_flag option:selected').val() == '') {
				$('#birth_txt').html('생년월일을 선택해주세요.');
				$('#birth_txt').css('display', 'block');

			} else {
				$('#birth_txt').html('');
				$('#birth_txt').css('display', 'none');
				flag++; //플래그 = 3
				console.log(flag + "생년월일 유효성 확인");  //3
			}

			//5]성별 검증
			if ($('#gender').val() == '') {
				$('#gender_txt').html('성별을 선택해주세요.');
				$('#gender_txt').css('display', 'block');

			} else {
				$('#gender_txt').html('성별을 선택해주세요.');
				$('#gender_txt').css('display', 'none');
				flag++; //플래그 = 4
				console.log(flag + "성별 유효성 확인");  //4
			}

			//6]휴대전화 검증
			if ($('#phone1').val() == '' || $('#phone2').val() == '') {
				$('#phone_txt').html('휴대폰 번호를 입력해주세요.');
				$('#phone_txt').css('display', 'block');
				console.log("번호오류1");

			} else if ($('#phone1, #phone2').val().length < 3
					|| $('#phone1, #phone2').val().length > 4) {
				$('#phone_txt').html('알맞은 번호형식이 아닙니다.');
				$('#phone_txt').css('display', 'block');
				console.log("번호오류2");

			} else {
				$('#phone_txt').html('');
				$('#phone_txt').css('display', 'none');
				flag++; //플래그 = 5
				console.log(flag + "번호 유효성 확인");  //5
			}

			//7]주소 검증
			
			if($('#sample4_postcode').val() == '') {
				
				$('.addr_txt').css('display', 'block')
				
			} else {
				$('.addr_txt').css('display', 'none')
				flag++;  //플래그 = 6
				console.log(flag + "주소 유효성 확인")  //6
			}
			

			if (flag == 6)
				return true;
			else
				return false;

		}////validateFormd

		function validateKeyup(which) {

			var flag = 1;

			//정규식 변수 선언
			var regID = /^[^a-z]|[^a-z0-9]+|^([a-z]+|[0-9]+)$/i;
			var regPWD = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

			//폼 입력값 얻기
			var idValue = $('#email').val();
			var pwdValue = $('#user_pwd').val();
			var pwdChkValue = $('#user_pwd_chk').val();

			if (which == $('#email')) {

				if((idValue.length < 8) || (idValue.length > 16)) {	
					$('#email_txt').html('아이디는 8자 이상, 10자 이하여야 합니다.');
					$('#email_txt').css('display', 'block');
					
				} else if(idValue.match(regID) == null) {
					$('#email_txt').html('아이디는 영문으로 시작하여야 하며, 영문/숫자의 조합으로 만들어야 합니다. 특수문자는?');
					$('#email_txt').css('display', 'block');
						
				} else if(idValue.match(regID) != null) {
					$('#email_txt').html('');
					$('#email_txt').css('display', 'none');
				}
				 

			} else if (which == $('select').not('#portal')[0]) {
				
				if($('#portal option:selected').val() == '') {
					$('#portal_txt').html('도메인을 선택해주세요.');
					$('#portal_txt').css('display', 'block');
				} else {
					$('#portal_txt').html('');
					$('#portal_txt').css('display', 'none');
				}

				
			} else if(which == $('#birth_year')[0] || which == $('#birth_month')[0] || which == $('#birth_day')[0] || which == $('#birth_flag')[0]) { 
			
				if($('#birth_year option:selected').val() == ''
					|| $('#birth_month option:selected').val() == ''
					|| $('#birth_day option:selected').val() == ''
					|| $('#birth_flag option:selected').val() == '') {
				$('#birth_txt').html('생년월일을 선택해주세요.');
				$('#birth_txt').css('display', 'block');

				} else {
					$('#birth_txt').html('');
					$('#birth_txt').css('display', 'none');

				}
			
			
			} else if (which == $('#gender')[0]) {
				
				if($('#gender').val() == '') {
					$('.gender_txt').html('성별을 선택해주세요.');
					$('.gender_txt').css('display', 'block')
					
				} else {
					$('.gender_txt').html("");
					$('.gender_txt').css('display', 'none')	
				}
				
			} else if (which == $('#phone1') || which == $('#phone2')) {

				if ($('#phone1').val() == '' || $('#phone2').val() == '') {
					$('#phone_txt').html('휴대전화를 입력해주세요.');
					$('#phone_txt').css('display', 'block');

				} else if ($('#phone1, #phone2').val().length < 3
						|| $('#phone1, #phone2').val().length > 4) {
					$('#phone_txt').html('알맞은 번호형식이 아닙니다.');
					$('#phone_txt').css('display', 'block');

				} else {
					$('#phone_txt').html('');
					$('#phone_txt').css('display', 'none');
				}

			} else if (which == $('#sample4_postcode')[0]) {

				if($('#sample4_postcode').val() == '') {
					$('.addr_txt').html('주소찾기 버튼을 눌러 주소를 입력하세요.');
					$('.addr_txt').css('display', 'block')
					
				} else {
					$('.addr_txt').html("");
					$('.addr_txt').css('display', 'none')
					
				}

			}

		}
	</script>
	<!-- 소셜 유저의 추가 정보 입력시 기존 정보 fix -->
	<script>
	
		$(function(){
			
			var birthYear_temp = $('.birthYear_temp').html();
			var birthMonth_temp = $('.birthMonth_temp').html();
			var birthDay_temp = $('.birthDay_temp').html();
			var emailBack = $('.emailBack').html();
			var gender_temp = $('.gender_temp').html();
			
			//$('#birth_year option[value='+birthYear_temp+']').prop('selected', true);  //readonly로
			$('#birth_year option[value!='+birthYear_temp+']').remove();
			//$('#birth_year').prop('readonly', "readonly");  //readonly로
			$('#birth_year').trigger("change");
			
			//$('#birth_month option[value='+birthMonth_temp+']').prop('selected', true);  //readonly로
			$('#birth_month option[value!='+birthMonth_temp+']').remove();
			//$('#birth_month').prop('readonly', "readonly");  //readonly로
			$('#birth_month').trigger("change");
			
			//$('#birth_day option[value='+birthDay_temp+']').prop('selected', true);  //readonly로
			$('#birth_day option[value!='+birthDay_temp+']').remove();
			//$('#birth_day').prop("readonly", "readonly");  //readonly로
			$('#birth_day').trigger("change");
			
			if(birthYear_temp.length != 0) {
				$('#birth_flag').prop("readonly", "readonly");
				$('#birth_flag').trigger("change");
			}
			
			$('#portal option[value='+emailBack+']').prop('selected', true);
			$('#portal').trigger("change");
			
			$('#gender').prop('value', gender_temp);
			$('#gender').trigger('change');
			
			
			
			if($('#gender').prop('value') == 'M') {
				$('.female').removeClass('on');
				$('.male').addClass('on');
			} else {
				$('.female').removeClass('on');
				$('.male').addClass('on');
			}
			
		})
		
	</script>
	
	<script>
		$(function(){
			
			console.log('길이길이: ' + $('#email').prop('value').length);
			if($('#email').prop('value').length != 0) {
				
				$('.confirm_txt').css('display', 'block');
			}
			
		})
	
	</script>


	<!--=========================-->
	<!--=        footer         =-->
	<!--=========================-->