<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="http://www.superstari.co.kr/design/superstari/inc/15_re/demo-style.css" />
<link rel="stylesheet" type="text/css" href="http://www.superstari.co.kr/design/superstari/inc/15_re/search_component.css" />
<link rel="stylesheet" type="text/css" href="http://www.superstari.co.kr/design/superstari/inc/15_re/search_default.css" />
<link rel="stylesheet" type="text/css" href="http://www.superstari.co.kr/design/superstari/inc/15_re/css2.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Cabin' rel='stylesheet' type='text/css'>  
<link rel="stylesheet" href="http://www.superstari.co.kr/design/superstari/inc/15_re/normalize.css">
<link rel="stylesheet" href="http://www.superstari.co.kr/design/superstari/inc/15_re/cate_test.css">
<link rel="stylesheet" href="<c:url value='/vendor/css/PayCSS_1.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/PayCSS_2.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/vendor/css/PayCSS_3.css'/>" type="text/css">
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ============= 아임포트 ============== -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	
	#order h3{
		padding-bottom: 20px;
		position: relative;
		margin-top: 40px;
		color: #f75;
		font-family: 'malgun gothic';
		font-size: 30px;
		font-weight: bold;
		letter-spacing: -2px;
	}

	.cch{
		position:absolute;
		width:703px;
		height: 750px;
		border: 3px lightgray solid;
		top : 100px;
		left:  600px;
		z-index: -100;
	}
</style>
</head>
<body id="home-version-1" class="home-version-1" data-style="default">
<div class="cch" >
</div>


	<div id="site">
		<jsp:include page="/WEB-INF/template/Nav.jsp" />
		<br /> <br /> <br />
		
			<div id="contentWrapper">
				<div id="contentWrap">
					<div id="content">
						<div id="order">
							<div class="page-body">
									<fieldset>
									<!-- #order h3 -> text-align: center; -->
										<h3 style="text-align: center;margin-top: 50px;">주문이 성공적으로 완료되었습니다!</h3>
										<div class="row">
											<div class="col-md-3"></div>
												<div class="col-md-6 tbl-order tbl-ordered">
													<table>
														<tbody>
															<tr>
																<th scope="row">
																	<div class="txt-l">결제번호</div>
																</th>
																<td colspan="3">
																	결제번호(123124124-12314-124124)
																</td>
															</tr>
															<tr>
																<th scope="row">
																	<div class="txt-l">상품명</div>
																</th>
																<td colspan="3">
																<img src="<c:url value='/img/ticket.png'/>" alt="티켓이미지" style="width: 5%">
																	<strong>[방구석 기타리스트1]</strong><br/>
																	└ 방구석에서 기타만 치고있는 사람들을 위한 상품입니다.
																</td>
															</tr>
															<tr>
																<th scope="row">
																	<div class="txt-l">수량</div>
																</th>
																<td colspan="3">
																	1개
																</td>
															</tr>
															
															<tr class="no_BankBook">
																<th scope="row">
																	<div class="txt-l">결제방식</div>
																</th>
																<td colspan="3">
																	무통장
																</td>
															</tr>
															
															<tr class="no_BankBook">
																<th scope="row">
																	<div class="txt-l">무통장 입금자명</div>
																</th>
																<td colspan="3">
																	이상근
																</td>
															</tr>
															
															<tr class="no_BankBook">
																<th scope="row">
																	<div class="txt-l">무통장 환불계좌</div>
																</th>
																<td colspan="3">
																	농협 15123134
																</td>
															</tr>
															
															<tr>
																<th scope="row">
																	<div class="txt-l">
																		주문메세지
																	</div></th>
																<td colspan="3">
																	<textarea style="width: 70%;">꼭 받고싶습니다.</textarea>
																</td>
															</tr>
															
															<tr>
																<th scope="row">
																	<div class="txt-l">총 결제금액</div>
																</th>
																<td colspan="3">
																	<strong>20,000원</strong>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
											<div class="col-md-3"></div>
										</div>
										<!-- .tbl-order -->
	
									</fieldset>
							</div>
							<!-- .page-body -->
						</div>
						<!-- #order -->
					</div>
					<!-- #content -->
				</div>
				<!-- #contentWrap -->
			</div>
			
			<div class="super_bottom_bot" style="padding-left: 10px;">
				<p>
					<strong>무통장 입금계좌</strong> : <span style="color: red;">신한은행 110-111-222233</span><small> (주)Insomnia</small>
				</p>
				<br/>
				<p>
	        		고객님의 소중한 주문정보를 <strong>n_e_k_o3@naver.com</strong>로 발송해 드렸습니다.
	        	</p>
	        	<br/>
	        	<p>
	        		<strong>(주)Insomnia</strong>를 이용해 주셔서 감사합니다.
	        	</p>
	        	<div style="margin-bottom: 20px;">
		        	<button class="btn btn-info" style="font-size: 20px;">장바구니</button>
		        	<button class="btn btn-success" style="margin: 10px;font-size: 20px;">목록으로</button>
	        	</div>
	       	</div>
       	


	</div>
	