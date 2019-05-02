<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	
	<style>
		.header-magic-line .header-inner {
			background-color: black;
		}
	</style>
	
	<link rel="stylesheet"
	href="<c:url value='/vendor/css/findIdPasswordCSS.css'/>" />

</head>


<body id="home-version-1" class="home-version-1" data-style="default">

	<div id="site">
		<!--=========================-->
		<!--=        Navbar         =-->
		<!--=========================-->
		<jsp:include page="/WEB-INF/template/Nav.jsp"/>
		<br><br><br><br>

		<!-- 여기부터 -->
			
		<div class="account-div">
	
			<div class="page-header">
			
				<div class="title">아이디·비밀번호 찾기</div>
				<div class="tab-list">
					<ul>
						<li class="li-id"><a>아이디 찾기</a></li>
						<li class="li-pwd"><a>비밀번호 찾기</a></li>
					</ul>
				</div>
			</div>
			<div class="page-body">
			
				<!-- 아이디 찾기 -->
				<div class="id-check">
					<p class="idInfo">기억하고 계신 이메일 계정을 입력하세요.<br/> 가입여부를 확인해 드립니다.</p>
					<form class="idForm">
						<div class="findIdDiv">
							<input type="email" name="findId" id="findId" placeholder="이메일 계정">  <!-- 이 값을 result에서 -->
							<em class="idErr">이메일 형식이 올바르지 않습니다.</em>
						</div>
						<a class="findIdBtn">확인</a>
					</form>
				</div>
				<div class="id-result">
					<div class="result-id-info">
						<p class="foundId"></p>
						<p class="joinedId idInfo">회원으로 등록된 계정입니다.<br/> 해당 이메일로 로그인하시고 INSOMNIA를 이용하세요.</p>
						<p class="notJoinedId idInfo">INSOMNIA에 등록되지 않은 계정입니다. 이메일로 <p>
					</div>
					<div class="result-id-btns">
						<a class="goToRegister" href="<c:url value='/register/term.ins'/>">회원가입하기</a>
						<form action="" method="POST" id="loginRetryForm">
							<input type="password" placeholder="비밀번호를 입력하세요."/>
						</form>
						<a class="goToLogin" href="<c:url value='/login.ins'/>">로그인</a>
						<a class="goToCheck" href="">등록한 이메일로 계정 정보 발송하기</a>
					</div>
				</div>
				
				
				<!-- 비밀번호 찾기 -->
				<div class="pass-check">
					<p class="passInfo">가입하셨던 이메일 계정을 입력하시면,<br/>비밀번호를 새로 만들 수 있는 링크를 발송해드립니다.</p>
					<form class="passForm">
						<div class="findPassDiv">
							<input type="email" name="findPass" id="findPass" placeholder="이메일 계정">
							<em class="idErr">이메일 형식이 올바르지 않습니다.</em>
						</div>
						<a class="findPassBtn">링크발송</a>
					</form>
				</div>
				<div class="pass-result">
					<p class="passInfo">등록된 이메일로 링크가 발송되었습니다.<br/>링크를 클릭 후 비밀번호를 다시 설정해 주세요.</p>
				</div>
				
				
			</div>  <!-- page-body -->
			
			
			<!-- 소셜 로그인 모달 -->
			<div class="social-login-div">
				<div class="social-content-div">
					<button class="close-btn" title="닫기"></button>
					<div class="social-content">
						<div class="social-info-title">소셜 계정 로그인 안내</div>
						<div class="social-info">입력하신 이메일은 소셜 계정으로 가입한 계정입니다. 가입때 사용한 소셜 계정으로 로그인해주세요.</div>
					</div>
					<div class="social-btn-div">
						<button class="social-btn">확인</button>
					</div>
				</div>
			</div>
			
			<!-- 비밀번호 링크 모달 -->
			<div class="pass-link-div">
			
			
			</div>
			
		</div>	<!-- accountDiv  -->
			
			<!-- 여기까지 -->
			
			
	<script>
		
		
		$(function(){
			
			////아이디*비번 찾기 전환효과
			$('.li-id').click(function(){
				$('.id-result').css('display', 'none');
				$('.pass-check').css('display', 'none');
				$('.li-pwd').removeClass('active');
				$('.li-id').addClass('active');
				$('.id-check').css('display', 'block');
			});
		
			$('.li-pwd').click(function(){
				$('.id-check').css('display', 'none');
				$('.id-result').css('display', 'none');
				$('.li-id').removeClass('active');
				$('.li-pwd').addClass('active');
				$('.pass-check').css('display', 'block');
			});
			
			
			////아이디 찾기 ajax 컨트롤러
			$('.findIdBtn').click(function(){
				$.ajax({
					url : "<c:url value='/find/findIdAjax.ins'/>",
					type:'post',
					dataType:'text',
					data : $('.idForm').serialize(),
					success:function(data){
						
						var dataArr = data.split("^");
						console.log("dataArr[0]의 값은: " + dataArr[0]);
						$('.foundId').html(dataArr[1]);
						
						if(dataArr[0] == 'memberOk') {
							$('.id-check').css('display', 'none');
							$('.id-result').css('display', 'block');
							$('.joinedId').css('display', 'block');
							$('.notJoinedId').css('display', 'none');
							$('.goToLogin').css('display', 'block');
							$('.goToRegister').css('display', 'none')
							$('.goToCheck').css('display', 'none')
							
						} else  {
							$('.id-check').css('display', 'none');
							$('.id-result').css('display', 'block');
							$('.notJoinedId').css('display', 'block');
							$('.joinedId').css('display', 'none');
							$('.goToRegister').css('display', 'block')
							$('.goToCheck').css('display', 'block')
							$('#loginRetryForm').css('display', 'none');
							$('.goToLogin').css('display', 'none');
							
							
						}
						
					},
					error : function(request, status, error){
						console.log("code:%s, message:%s, error:%s, status:%s", request.status, request.responseText, error, status);
						
					}
				});/////$.ajax()
				
			});
			
			
		})
		
	
	</script>			
			
			


