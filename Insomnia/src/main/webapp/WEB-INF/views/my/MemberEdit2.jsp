<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<c:url value='/vendor/css/MemberEditCSS2.css'/>" />
<style>

.header-magic-line .header-inner {
	background-color: black;
}

</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/vendor/js/road.js'/>"></script>


</head>

<body id="home-version-1" class="home-version-1" data-style="default">

	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>
		<br><br><br><br>

			<!-- 여기부터 -->

			<div class="allWrap">
				
				<%-- <h2 class="welcomeText">${record.name}님의 기본 정보를 설정하세요</h2> --%>
				<form class="editForm" method="POST" action="">
					<!-- <p class="title2">이메일 변경</p>
					<input type="email" name="editEmail" id="editEmail" placeholder="수정할 이메일을 입력하세요."> -->
					<p class="title2">비밀번호 변경</p>
					<input type="password" name="editPassword" id="editPassword" placeholder=" 수정할 비밀번호를 입력하세요.">
					<input type="password" name="confirmPassword" id="confirmPassword" placeholder=" 수정할 비밀번호를 확인하세요.">
					<p class="title2">인증수단 변경</p>
					<input type="text" name="editEmail" id="editEmail" value="${editRecord.email}" placeholder="수정할 이메일을 입력하세요.">
					<div id="editEmailBtn">변경</div>
					<input type="text" name="editPhone" id="editPhone" value="${editRecord.phone}" placeholder="수정할 번호를 입력하세요.">
					<div id="editAuthBtn">인증하기</div>
					<p class="title2 addrTitle">주소 변경</p>
					<!-- <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="addrBtn"><br/> -->
					<div onclick="sample4_execDaumPostcode()" class="addrBtn">우편번호 찾기</div><br/>
					<input type="text" id="sample4_postcode" placeholder="우편번호" class="addr1" value="${editRecord.zip_code}">
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="addr2" value="${road}">
				<!-- 	<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="addr3"> -->
					<span id="guide" style="color:#999;display:none" class="addr4"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="addr5" value="${detail}">
					<p class="title1">마케팅 정보 설정</p>
					<div class="marketingDiv">
						<input type="checkbox" name="setMarketing_Email" id="setMarketingEmail">이메일
						<input type="checkbox" name="setMarketing_SMS" id="setMarketingSMS">SMS
					</div>
					
					
					<em class="helpInfo">앱 푸시 설정은 사용중인 모바일 앱에서 할 수 있습니다.</em>
					<div id="editSubmitBtn">확인</div>
				</form>
			
			
			</div>




			<!-- 여기까지 -->

		
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

