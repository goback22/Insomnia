<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/ProjectCSS/LoginCSS.css'/>" rel="stylesheet"/>
<title>Wadiz.jsp</title>
</head>
<body>

	<div class="div-form-login">
		<h2 class="text-title">로그인</h2>
		<form name="form-login" id="form-login" class="form-login">
			<div class="field">
				<div class="input-login">
					<input type="email" id="userName" name="userName" class="input-text" placeholder="이메일 아이디">
				</div>
				<em id="emailError" class="error-text">이메일 형식이
					올바르지 않습니다.</em>
			</div>
			<div class="field">
				<div class="input-login">
					<input type="password" id="password" name="password" class="input-text" maxlength="17" placeholder="비밀번호(영문, 숫자, 특수문자 포함 8자 이상)">
				</div>
				<p id="loginError" class="error-text">와디즈에 등록되지 않은
					아이디거나, 아이디 또는 비밀번호가 회원정보와 일치하지 않습니다.</p>
			</div>
			<!-- 
			<div class="recaptcha">
				<p id="recaptchaMessage" class="error-text">
					잘못된 아이디 또는 비밀번호로 여러번 로그인 시도하였습니다. <br>계정 보안 조치를 위해 아래 사항을 체크하신
					뒤 다시 진행하세요.
				</p>
				<p id="recaptchaComplete" class="complete-text">
					<span>계정 보안 조치가 완료되었습니다!</span>협조해주셔서 감사합니다. 로그인을 다시 시도하세요
				</p>
				<div class="g-recaptcha"
					data-sitekey="6Lcr70MUAAAAAHfmxpaHaXPDlgLIwiS6gRO5YCcB"
					data-size="600" id="recaptcha" data-callback="recaptchaComplete"
					style="display: none;">
					<div style="width: 304px; height: 78px;">
						<div>
							<iframe
								src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6Lcr70MUAAAAAHfmxpaHaXPDlgLIwiS6gRO5YCcB&amp;co=aHR0cHM6Ly93d3cud2FkaXoua3I6NDQz&amp;hl=ko&amp;v=v1552285980763&amp;size=normal&amp;cb=p8g2z520abgp"
								width="304" height="78" role="presentation"
								name="a-dh950kauq7sc" frameborder="0" scrolling="no"
								sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox"></iframe>
						</div>
						<textarea id="g-recaptcha-response" name="g-recaptcha-response"
							class="g-recaptcha-response"
							style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
					</div>
				</div>
			</div> -->
			<div class="login-action">
				<label id="saveIdLabel" class="save"> 
					<input id="saveUserId" type="checkbox" title="아이디 저장"> <span id="txtSaveId" class="wz text caption2">아이디 저장</span>
				</label>
				<p class="forgot"><a class="wz text" href="<c:url value='' />">아이디∙비밀번호 찾기<i class="icon chevron-right"></i></a></p>
			</div>
			<button type="button" id="btnLogin" class="button-login">로그인</button>
		</form>
		<div class="separator">
			<span>또는</span>
		</div>
		<div class="social-login">
			<button type="button" id="facebookLoginBtn" class="facebook">
				<i class="icon facebook"></i>페이스북으로 로그인
			</button>
			<button type="button" id="kakaoLoginBtn">
				<i class="icon kakao"></i>카카오
			</button>
			<button type="button" id="naverLoginBtn">
				<i class="icon naver"></i>네이버
			</button>
			<button type="button" id="googleLoginBtn">
				<i class="icon google color"></i>구글
			</button>
			<button type="button" onclick="pageLoginByTwitter()">
				<i class="icon twitter"></i>트위터
			</button>
		</div>
		<div class="bottom-message">
			<p>아직 계정이 없나요?&nbsp;&nbsp;<a href="<c:url value='' />" data-return-url="">회원가입</a></p>
		</div>
	</div>

</body>
</html>