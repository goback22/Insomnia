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

</head>
<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<jsp:include page="/WEB-INF/template/Nav.jsp" />
		<br /> <br /> <br /> <br />
		<div id="contentWrapper">
			<div id="contentWrap">
				<div id="content">
					<div id="order">
						<div class="page-body">
							<form name="form1" id="order_form" action="/shop/orderin.html" method="post">
								<fieldset>
									<h3>주문완료 페이지</h3>
									<div class="tbl-order">
										<table>
											<caption>주문완료 정보 입력</caption>
											<colgroup>
												<col style="width: 130px">
												<col>
												<col style="width: 100px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><div class="txt-l">이름</div></th>
													<td colspan="3"><input type="text" name="receiver"
														form="order_form" id="receiver" class="MS_input_txt"
														value=""></td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">연락처 1</div></th>
													<td><input type="text" name="emergency21"
														form="order_form" id="emergency21" size="4" maxlength="4"
														value="" class="MS_input_txt w60"> - <input
														type="text" name="emergency22" form="order_form"
														id="emergency22" size="4" maxlength="4"
														class="MS_input_txt w60" value=""> - <input
														type="text" name="emergency23" form="order_form"
														id="emergency23" size="4" maxlength="4"
														class="MS_input_txt w60" value=""></td>
												</tr>
												<tr>
													<th scope="row">
														<div class="txt-l">주소</div>
													</th>
													<td colspan="3">
<!-- 													<input name="post1" id="post_number" readonly=""> -->
<!-- 														<input type="button" id="post_number_api" value="우편번호" > -->
<!-- 														<div class="mt-10"> -->
<!-- 															<input type="text" name="address1" form="order_form" id="address1" size="50" class="MS_input_txt w240" readonly="" placeholder="주소">  -->
<!-- 															<input type="hidden" name="old_address" form="order_form" id="old_address" value="">  -->
<!-- 															<input type="hidden" name="old_home_address" form="order_form" id="old_home_address" value="">  -->
<!-- 															<input type="hidden" name="old_offi_address" form="order_form" id="old_offi_address" value="">  -->
<!-- 															<input type="text" name="address2" form="order_form" id="address2" size="50" class="MS_input_txt w240" placeholder="상세주소"> -->
<!-- 														</div> -->
															<input type="text" id="sample4_postcode" placeholder="우편번호" readonly="">
															<input type="button" class="d_btn" id="sample4_execDaumPostcode" value="우편번호 찾기"><br>
															<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly="">
															<input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly="">
															<span id="guide" style="color:#999;display:none"></span>
															<br/>
															<input type="text" id="sample4_detailAddress" placeholder="상세주소">
															<input type="text" id="sample4_extraAddress" placeholder="참고항목" readonly="">
													</td>
												</tr>
												
												<tr>
													<th scope="row">
														<div class="txt-l">
															주문메세지<br> <span>(100자내외)</span>
														</div></th>
													<td colspan="3">
														<textarea name="message" form="order_form" id="message" cols="50" rows="5" class="MS_textarea"></textarea>
													</td>
												</tr>
												
												<tr class="no_BankBook">
													<th scope="row">
														<div class="txt-l">무통장 입금자명</div>
													</th>
													<td colspan="3">
														<input type="text" name="bankname" form="order_form" class="MS_input_txt" size="10" maxlength="40"> 
														<span class="MS_bankname_message"> (주문자와 같을경우 생략 가능)</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->

								</fieldset>
							</form>
						</div>
						<!-- .page-body -->
					</div>
					<!-- #order -->
				</div>
				<!-- #content -->
			</div>
			<!-- #contentWrap -->
		</div>
		
		<div class="super_bottom_bot">
        	<span>
	        	<img src="http://superstari.cdn.smart-img.com/15_re/bottom/f_Copyright.png" style="width:13px; height:13px; vertical-align: middle;"> 
	        	이 콘텐츠는 콘텐츠 산업 진흥법에 따라 최초 제작일로부터 5년간 보호됩니다.
        	</span>
       	</div>


	</div>
	