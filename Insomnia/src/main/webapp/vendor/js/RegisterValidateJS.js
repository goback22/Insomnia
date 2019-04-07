$(function(){
	
	$.validator.setDefaults({submitHandler:function(form){

		alert('제출하시겠습니까?');
		form.submit();
	}});

	$('#frm').validate({
		rules:{
			user_id:{required:true,minlength:3,maxlength:5},
			user_pwd:{required:true,minlength:5},
			user_pwd_chk:{required:true,minlength:5,equalTo:"#user_pwd"},
			user_nm:{required:true,minlength: 2},
			gender:'required',
			birth_year:'required',
			birth_month:'required',
			birth_day:'required',
			birth_year:'required',
			birth_flag:'required',
			postcode:'required',
			roadAddress:'required',
			detailAddress:'required',
			phone:'required',
			email:'required'
			
		},
		messages:{
			user_id:{required:'아이디을 입력하세요',minlength:'아이디은 최소 3자이상 입력',maxlength:'비번은 최대 5자이하'},
			user_pwd:{required:'비밀번호를 입력하세요',minlength:'비번은 최소 5자이상 입력'},
			user_pwd_chk:{required:"비밀번호를 입력하세요",minlength:'비번확인은 최소 5자이상 입력',equalTo:"비번이 일치하지 않아요"},
			user_nm:{required:"이름을 입력하세요"},
			gender:{required:"성별을 선택하세요"},
			birth_year:{required:"생년월일을 선택 하세요"},
			/* birth_month:{required:"파일을 첨부 하세요"},
			birth_day:{required:"자기소개를 입력 하세요"},
			birth_flag:{required:"자기소개를 입력 하세요"},
			birth_day:{required:"자기소개를 입력 하세요"}, */
			postcode:{required:"우편번호를 입력하세요"},
			roadAddress:{required:"주소를 입력하세요"},
			detailAddress:{required:"상세주소를 입력하세요"},
			phone:{required:"휴대폰 번호를 입력하세요"},
			email:{required:"E-mail을 입력하세요"}
		}
	});
	
	$('#submitATag').click(function(){
		if($('#frm').valid()){
			$('#frm').submit();
		}
		
	});
	
})
