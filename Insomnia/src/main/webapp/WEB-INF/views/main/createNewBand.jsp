<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- 
<link rel="stylesheet" href="<c:url value='/vendor/css/wz-vendor.css'/>">
<link rel="stylesheet" href="<c:url value='/vendor/css/wz-common.css'/>">
  -->
 
<!-- Noto Sans KR Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">

	<!-- ajaxForm을 사용하기 위한 최신자 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.js"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jquery.migrate/jquery-migrate-3.0.0.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 


<style>


body{
	overflow-x:hidden;
	font-family: 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	letter-spacing: -.02em;
	color: rgba(0,0,0,.84);
	line-height: 1.5em;
	font-size: 15px;
    font-weight: 400;
}

.space_for_nav {
	background-color: black;
	width: 100%;
	height: 84px;
}
.root_div{
	width:100%;
	height:1200px;
}

/* progress ==== 선택화면 보여주기 */
.main_progress{
	text-align:center;
	padding-top:7%;
	width:400%;
	margin-left:0;
	-webkit-transition:margin-left ease-in-out 1.5s;
	transition:margin-left ease-in-out 1.5s;
}
/* first step ==== 카테고리 음악 장르선택 */
.first-step{
	width:50%;
	display:inline-block;
}
.first-step h1{
	font-size:30px;
	font-weight:600;
	line-height:36px;
	color:rgba(0,0,0,.84);
	margin-bottom:7px;
}
.first-step p{
	color:rgba(0,0,0,.54);
	font-size:17px;
	font-weight:400;
	margin-bottom:7px;
}
.select_category{
	margin-top:50px;
	width:450px;
	height:55px;
	padding:16px;
	border:1px solid rgb(230, 234, 237);
}
.select_category option{}

.first-step-btn-div{
	margin-top:50px;
}

.first-step-btn{
	color:white;
	text-align:center;
	font-weight:900;
	font-size:20px;
	margin:auto;
	padding:15px;
	background-color:rgb(0, 204, 163);
	width:450px;
	margin-top:50px;	
}


/* second step ===== 밴드 앨범 커버 선택 */
.second-step{
	width:50%;
	display:inline-block;
}
.second-step h1{
	font-size:30px;
	font-weight:600;
	line-height:36px;
	color:rgba(0,0,0,.84);
	margin-bottom:7px;
}
.second-step p{
	color:rgba(0,0,0,.54);
	font-size:17px;
	font-weight:400;
	margin-bottom:7px;
}
.second-step-btn-div{}
.second-step-btn-back{
	color:white;
	text-align:center;
	font-weight:900;
	font-size:20px;
	margin:auto;
	padding:15px;
	background-color:rgb(0, 204, 163);
	width:80px;
	margin-top:50px;	
	display:inline-block;
}
.second-step-btn-next{
	color:white;
	text-align:center;
	font-weight:900;
	font-size:20px;
	margin:auto;
	padding:15px;
	background-color:rgb(0, 204, 163);
	width:350px;
	margin-left:20px;;	
	display:inline-block;
}
#bandCover{
	max-width:500px;
	max-height:500px;
}

/* select-member-div 회원을 검색해 밴드 멤버로 추가 */
.frm-search-member{
	margin-top:20px;
}

.select-member-div{
	border:1px solid rgb(230, 234, 237);
	width:50%;
	text-align:center;
	margin: auto;
    margin-top: 50px;
}
.profile-wrap{
	display:inline-block;
	margin:25px;
}
.profile-image{
	min-width:100px;
	min-height:100px;
	max-width:100px;
	max-height:100px;
	display:inline-block;
}
.profile-image .image-member{
	widht:100px;
	height:100px;
	border-radius:50%;
	border:1px solid rgb(230, 234, 237);
	display:inline-block;
}
.profile-image .cancel-member{
	position:absolute;
}

/* forth-step 밴드 이름 결정 */
.forth-step-input-div{
	margin-top: 50px;
    width: 100%;
    padding: 16px;
    text-align:center;
}
.band-name-input{
    margin-top: 50px;
    width: 450px;
    height: 55px;
    padding: 16px;
	border: 1px solid rgb(230, 234, 237);
	text-align:center;
	font-weight:600;
	font-size:larger;
}

</style>

</head>
<body>



<div class="root_div">

	<!-- ==============body 시작 -->
	<!-- ============== navBar 시작 -->
	<jsp:include page="/WEB-INF/template/Nav.jsp" />
	<div class="space_for_nav"></div>
	<!-- ============== navBar END -->
	
	
	<div class="main_progress row">
		<div class="first-step col-sm-3">
			<h1>어떤 장르의 밴드를 등록하시겠어요?</h1>
			<p>등록하는 밴드에 가장 유사한 카테고리를 선택하세요</p>
			
			<div class="div_select_category">
	          <select class="select_category" name="select_category">
	              <option value="" selected disabled>카테고리 선택하기</option>
	              <option value="1">포크·팝</option>
	              <option value="2">재즈·클래식</option>
	              <option value="3">힙합</option>
	              <option value="4">댄스·일렉트로닉</option>
	              <option value="5">락·메탈</option>
	              <option value="6">국악</option>
	          </select>
	        </div><!-- select div -->
	        
	        <div class="first-step-btn-div">
				<div id="first-next" class="first-step-btn">다음 : 밴드 커버 선택</div>
			</div>	        
		</div><!-- first-step -->
		
		<div class="second-step col-sm-3">
			<h1>밴드 앨범커버를 등록해 주세요</h1>
			<p>밴드 커버는 펀딩 시작 전 언제든지 바꿀 수 있습니다.</p>
			<br/>
			<a href="javascript:void(0)" data-toggle="modal" data-target="#modal-upload-cover"><img id="bandCover" src="<c:url value='/resource/img/upload_cover.png'/>"></a>
			
			<div class="second-step-btn-div">
				<div id="second-back" class="second-step-btn-back">뒤로</div>
				<div id="second-next" class="second-step-btn-next">다음 : 밴드 멤버 선택</div>
			</div>	       
			
			<!-- -------------modal upload cover-------------- -->
			
			 <div id="modal-upload-cover" class="modal fade">
	         <div class="modal-dialog">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <!-- 모달 닫기:data-dismiss="modal" -->
	                  <img class="find_insomnia_logo" src="../resource/img/insomnia-logo.png" style="margin-left:86px;"/>
	               </div>
	                
	               <div class="modal-body">
	               <br/>
	                 <p style="font-size:25px; text-align:center;">앨범 커버</p>
	               <br/>
	               <form name="frm_cover" id="frm_cover" method="post" accept="image/*" action="<c:url value='/band/uploadCover.ins'/>" enctype="multipart/form-data">
	                  	<input type="file" id="upload_cover" name="upload_cover">
	               </form>
	                  <br/><br/>
	                  <p style="color:gray;">
	                     ※ 가로세로가 동일한 이미지로 설정해 주세요.
	                  </p>
	               </div>
	               <div class="modal-footer">
	               	  <button class="btn btn-info" id="setBandCover" data-dismiss="modal">확인</button>
	                  <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
	               </div>
	               
	            </div>
	         </div>
	      </div>
			
			<!-- -------------modal upload cover-------------- -->
		</div><!-- second-step END -->
		
		
		<!-- third-step -->
		<div class="second-step col-sm-3" style="text-align:center;">
			<h1>밴드 멤버를 등록하세요</h1>
			<p>Insomnia에 가입된 회원만 밴드로 등록 가능합니다.</p>
			
			
			<div class="select-member-div">
				<div class="profile-wrap">
					<div class="profile-image">
						<img class="image-member" src="<c:url value='/upload/member/profile/default_profile_img.jpg'/>">
					</div>
					<div class="profile-id" id="memberNameSelf">${sessionScope.id}</div>
				</div>
			</div>
			
			<!-- 회원 검색하는 form --> 
			<form class="frm-search-member" id="frm_search_member" method="post" action="javascript:searchMember();">
				아이디 검색 &nbsp;&nbsp;<input id="input-search-member" type="text">
				<input type="hidden" id="btn-search-member">
			</form>
			
	        <div class="second-step-btn-div">
				<div id="third-back" class="second-step-btn-back">뒤로</div>
				<div id="third-next" class="second-step-btn-next">다음 : 밴드 이름 입력</div>
			</div>	 	        
		</div><!-- third-step END -->
		
		
	
			<!-- forth step 밴드 이름 등록 -->
			<div class="first-step col-sm-3">
			<h1>밴드 이름을 등록하세요</h1>
			<p>밴드를 등록하고 펀딩에 도전하세요!</p>
			
			<div class="forth-step-input-div">
				<input class="band-name-input" type="text">
			</div>
	        
	        <div class="second-step-btn-div">
				<div id="forth-back" class="second-step-btn-back">뒤로</div>
				<div id="band-complete" class="second-step-btn-next">밴드 결성!</div>
			</div>	 	  
		</div><!-- forth step 밴드 이름 등록 끝 -->
		
	</div><!-- main_progress -->
</div><!-- root_div -->

<script>
	console.log("version 77");
	
	var coverName = ""; //사진을 등록하기 위해 이미지파일의 이름을 저장해둔 변수
	var index = 0; //id값을 구분하기 위해 붙여놓은 인덱스(시퀀스)
	var bandMembers = $('.profile-id').text() + ' '; //등록할 밴드 멤버를 가지고있을 변수
	
	
	$(function(){
		
		
		
		$("#first-next").on("click", function(){
			$(".main_progress").css("margin-left", "-100%");
		});//$(.first-next).onCLick
		
		$("#second-back").on("click", function(){
			$(".main_progress").css("margin-left", "0");
		});//$(second-step-btn-back).onClick
		$("#second-next").on("click", function(){
			$(".main_progress").css("margin-left", "-200%");
		});//$(second-step-btn-next).onClick
		
		$("#third-back").on("click", function(){
			$(".main_progress").css("margin-left", "-100%");
		});//$(second-step-btn-back).onClick
		$("#third-next").on("click", function(){
			console.log(bandMembers);
			$(".main_progress").css("margin-left", "-300%");
		});//$(second-step-btn-back).onClick
		
		$("#forth-back").on("click", function(){
			$(".main_progress").css("margin-left", "-200%");
		});
		
		/////////////////////////////////////////////////////////// 밴드 입력폼 validate 이후 info페이지로 이동 START
		$("#band-complete").on("click",function(){
			if(validate()){ //밴드 폼을 모두 입력했을경우
				//폼객체를 만들어서 submit시킴
				var select_category = $('.select_category').val();
				var band_name = $('.band-name-input').val()
				var params = {select_category, coverName, bandMembers, band_name};
				
				var form = document.createElement('form');
				form.setAttribute('method', 'post');
				form.setAttribute('action', '<c:url value="/band/bandInfo.ins"/>');
				for(var key in params){
					var hiddenField = document.createElement('input');
					hiddenField.setAttribute('type', 'hidden');
					hiddenField.setAttribute('name', key);
					hiddenField.setAttribute("value", params[key]);
					form.appendChild(hiddenField);
				}//for
			document.body.appendChild(form);
			form.submit();
			}//if
			else{
				console.log("validate 실패");}
		});//$(second-step-btn-next).onClick
		
		var validate = function(){
			console.log("fn validate");
			if($(".select_category").val() == null){
				alert("장르를 선택해주세요.");
				return false;
			}
			else if(coverName == "" || coverName.length == 0){
				alert("밴드 커버 이미지를 설정해 주세요.")
				return false;
			}
			else if($(".band-name-input").val() == "" || $(".band-name-input").val().length == 0){
				alert("밴드 이름을 결정하세요.");
				return false;
			}
			
			//밴드이름 중복 확인
			var bandName =  $('.band-name-input').val();
			if(isExistBand(bandName)=="T"){
				alert('중복된 밴드 이름입니다.');
				return false;
			}//이미 존재하는 밴드이름
			
			return true;
		};//function validate()
		/////////////////////////////////////////////////////////// 밴드 입력폼 validate 이후 info페이지로 이동 END
		
		
		
		$.ajaxSetup({type:'post'});
		
		$("#setBandCover").on("click", function(){
			var uploadOk = confirm('이미지를 앨범 커버로 등록하시겠습니까?');
			if(uploadOk){
					$("#frm_cover").ajaxForm({
						url:'<c:url value="/band/uploadCover.ins"/>',
						enctype: 'multipart/form-data',
						dataType:'text',
						success:function(data){
							coverName = data;
							var path ="<c:url value='/upload/band/cover/"+data+"'/>";
							$("#bandCover").attr("src",path);
						},//success
						error : function(request,error){
							console.log('상태코드:',request.status);
							console.log('서버로부터 받은 HTML데이타 :',request.responseText);
							console.log('에러:',error);}
					});//frm_cover.ajaxForm
					
					$("#frm_cover").submit();
			}//if uploadOk
		});//$("#setBandCover").on("click")
		
		
			
		
	});//window.onload();
	
	
	
	function isExistBand(bandName){
		var jsonBandName = {'bandName' : bandName};
		var flag = "T"; // 밴드 중복이름 체크용 플래그
		
		$.ajax({
			url : '<c:url value="/band/isExistBand.ins"/>',
			async:false,
			data : jsonBandName,
			dataType : 'text',
			success:function(data){
				if(data == "T"){
					flag = "T";
				}
				else {
					flag = "F";}
			},
			error: function(request, error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타 :',request.responseText);
				console.log('에러:',error);}
		});///$.ajax
		
		return flag;
	};///fn isExistBand
	
	
	function searchMember(){
		var inputVal = $("#input-search-member").val();
		var inputData = {"searchId" : inputVal};
		var resultMembers = '';
		
		$.ajax({
			url:'<c:url value="/band/searchMember.ins"/>',
			data: inputData,
			dataType:'json',
			success:function(data){
				loadMember(data);
			},
			error : function(request, error){
				$("#input-search-member").val('찾는 멤버가 없습니다.');
				console.log("상태코드 : " , request.status);
				console.log("서버로부터 받은 HTML데이터 : " , request.reponseText);
				console.log("에러", error)
			}//error
		});//ajax
		
		//$("#frm-search-member").submit();
	};//searchMember
	
	
	
	function loadMember(data){
		
		console.log(data);
		var searchMemberFlag = true;
		var currentString = $('.select-member-div').html();
		var resultString = '';
		$.each(data, function(idx, element){
			//찾는 멤버가 이미 등록된 경우
			var id = element['id'];
			$('.profile-id').each(function(){
				if($(this).text() == id){
					searchMemberFlag = false;
					return;
				}//있으면
			});///.profile-id function
			if(searchMemberFlag == false) //이미 등록한 멤버라면
				return;
			
			//현재 등록된 멤버들을 넘겨줄 bandMembers설정
			bandMembers += element['id'] + ' ';
			
			resultString += '<div id="'+index+'" class="profile-wrap '+index+'"><div class="profile-image">';
			resultString += '<img class="cancel-member '+index+'" src="/insomnia/resource/img/cancel-gray.png" id="'+index+'" onclick="javascript:deleteMember(this)">';
			resultString += '<img class="image-member" src="/insomnia/upload/member/profile/'+element['profile']+'">';
			resultString += '</div><div class="profile-id" id="memberName_'+index+'">'+element['id']+'</div></div>';
			index++;

		});
		$('.select-member-div').html(currentString + resultString);

		//input내용 없애자
		if(searchMemberFlag == false)
			$("#input-search-member").val("이미 등록된 멤버");
		else 
			$("#input-search-member").val("");
		
	}//loadMemeber fn
	
	

	
	
	
	function deleteMember(imgObj){
		console.log(imgObj);
		var currentIndex = $(imgObj).attr("id");
		console.log(currentIndex);
		
		//현재 등록된 멤버들을 넘겨줄 bandMembers설정
		var currentId = $('#memberName_' + currentIndex).text();
		bandMembers = bandMembers.replace(currentId, '');
		$("div[id='"+currentIndex+"']").remove();
	};//deleteMember fn (img Obj)
	
	
</script>