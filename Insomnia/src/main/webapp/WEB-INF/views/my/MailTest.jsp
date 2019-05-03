<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="max-width: 595px; margin: 0 auto">
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			style="max-width: 595px; width: 100%; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif; background-color: #fff; -webkit-text-size-adjust: 100%; text-align: left">
			<!-- Header -->
			<tbody>
				<tr>
					<td height="30"></td>
				</tr>
				<tr>
					<td style="padding-right: 27px; padding-left: 21px">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td style="" width="61"><img
										src="<c:url value='/img/logo_5.png'/>"
										alt="Insomnia" width="61"></td>
									<td style="padding-left: 5px"><img
										src="http://static.naver.com/common/ems/nid_dm/nid_201412.gif"
										alt="회원정보" width="42"></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
				<tr>
					<td
						style="padding-right: 27px; padding-left: 18px; line-height: 34px; font-size: 29px; color: #424240; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
						새로운 비밀번호를<br>
					<span style="color: #1ec800">설정하시겠습니까?</span>
					</td>
				</tr>
				<tr>
					<td height="22"></td>
				</tr>
				<tr>
					<td height="1" style="background-color: #e5e5e5;"></td>
				</tr>
				<!-- //Header -->
				<tr>
					<td
						style="padding-top: 24px; padding-right: 27px; padding-bottom: 32px; padding-left: 20px">
						<table align="left" border="0" cellpadding="0" cellspacing="0"
							width="100%"
							style="font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
							<tbody>
								<tr>
									<td height="6"></td>
								</tr>
								<tr style="display: none;">
									<td
										style="padding: 9px 15px 10px; background-color: #f4f4f4; font-size: 14px; color: #000; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
										이 메일은 아띠(rlgh****)의 비상 연락처에 등록된 메일 주소로 발송되었습니다. 본인의 네이버 계정이
										아니라면 <a href="#" target="_blank"
										style="color: #009e25; text-decoration: underline"
										rel="noreferrer noopener"><span style="color: #009E25">여기에서
												수정</span></a>하세요. 해당 페이지는 <strong>별도의 로그인을 요구하지 않습니다. 또한 주소창에
											[NAVER Corp.]와 자물쇠 마크</strong>가 있으니 꼭 확인하세요.
									</td>
								</tr>
								<tr style="display: none;">
									<td height="24"></td>
								</tr>
								<tr>
									<td
										style="font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
										회원님의 아이디 <span style="color: #009E25">map.get("Id").toString()</span>이(가) <strong>로
											비밀번호 요청이 수신되었습니다.</strong><br> 아래의 로그인이 회원님의 활동이 맞는지 확인해주세요.<br>
										회원님의 활동이 아니라면, 관리자에게 문의해 주시기 바랍니다.
									</td>
								</tr>
								<tr>
									<td height="24"></td>
								</tr>
								<tr>
									<td
										style="font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
										<table cellpadding="0" cellspacing="0"
											style="width: 100%; margin: 0; padding: 0">
											<tbody>
												<tr>
													<td height="23"
														style="font-weight: bold; color: #000; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
														로그인 정보</td>
												</tr>
												<tr>
													<td height="2" style="background: #424240"></td>
												</tr>
												<tr>
													<td height="20"></td>
												</tr>
												<tr>
													<td>
														<table cellpadding="0" cellspacing="0"
															style="width: 100%; margin: 0; padding: 0">
															<tbody>
																<tr>
																	<td width="110"
																		style="padding-bottom: 5px; color: #696969; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
																		시간</td>
																	<td
																		style="padding-bottom: 5px; color: #000; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
																		currentStr</td>
																</tr>
																<tr>
																	<td width="110"
																		style="padding-bottom: 5px; color: #696969; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
																		위치</td>
																	<td
																		style="padding-bottom: 5px;; color: #000; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
																		대한민국 (211.251.220.133)</td>
																</tr>
																<tr>
																	<td width="110"
																		style="padding-bottom: 5px; color: #696969; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
																		기기</td>
																	<td
																		style="padding-bottom: 5px;; color: #000; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
																		웹브라우저</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td height="20"></td>
												</tr>
												<tr>
													<td height="1" style="background: #d5d5d5"></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td height="24"></td>
								</tr>
								<tr>
									<td
										style="font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
										<strong>회원님이 비밀번호를 요청하셨나요?<br> 새로운 비밀번호를 설정하시려면
											[비밀번호 설정]을 눌러주세요.
									</strong>
									</td>
								</tr>
								<tr>
									<td
										style="height: 34px; font-size: 14px; color: #696969; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
										<a
										href="https://nid.naver.com/user2/help/loginEnv.nhn?m=no&amp;s=EUBSGGfWaUXpxR-dPoB56kL32pavvkMm7QwxuKNdlWcyObIauS9xeMaIUKX7EQCY&amp;t=1555733540405&amp;lang=ko_KR&amp;tp=mail"
										style="display: inline-block; padding: 10px 10px 10px; margin-top: 10px; background-color: #08a600; color: #fff; text-align: center; text-decoration: none;"
										target="_blank" rel="noreferrer noopener">비밀번호 설정</a> <a
										href="https://nid.naver.com/user2/help/loginEnv.nhn?m=yes&amp;s=EUBSGGfWaUXpxR-dPoB56kL32pavvkMm7QwxuKNdlWcyObIauS9xeMaIUKX7EQCY&amp;t=1555733540405&amp;lang=ko_KR&amp;tp=mail"
										style="display: inline-block; padding: 10px 60px 10px; margin-top: 10px; background-color: #8e8e8e; color: #fff; text-align: center; text-decoration: none;"
										target="_blank" rel="noreferrer noopener">제가 아닙니다</a>
									</td>
								</tr>
								<tr>
									<td height="24"></td>
								</tr>
								<tr>
									<td
										style="font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;">
										보다 자세한 내용은 아이디 도용에 대한 <a href="http://naver.me/GsdVn7dq"
										target="_blank"
										style="text-decoration: underline; color: #009e25"
										rel="noreferrer noopener">도움말</a>을 확인 해주시기 바랍니다.<br> 더욱
										편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<!-- footer -->
				<tr>
					<td
						style="padding-top: 26px; padding-left: 21px; padding-right: 21px; padding-bottom: 13px; background: #f9f9f9; font-size: 12px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif; color: #696969; line-height: 17px">
						본 메일은 발신전용 입니다. INSOMNIA 서비스관련 궁금하신 사항은 INSOMNIA <a
						href="https://help.naver.com/support/alias/membership/p.membership/p.membership_26.naver"
						style="color: #696969; font-weight: bold; text-decoration: underline"
						rel="noreferrer noopener" target="_blank">고객센터</a>에서 확인해주세요.
					</td>
				</tr>
				<tr>
					<td
						style="padding-left: 21px; padding-right: 21px; padding-bottom: 57px; background: #f9f9f9; font-size: 12px; font-family: Helvetica; color: #696969; line-height: 17px">
						Copyright ⓒ <strong>INSOMNIA</strong> Corp. All Rights Reserved.
					</td>
				</tr>
				<!-- //footer -->
			</tbody>
		</table>
	</div>




</body>
</html>