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
	.col-md-3{
		padding-left: 79px;
	}
</style>
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
								<input type="hidden" name="ok" value="N"> 
								<input type="hidden" name="paymethod" value="B"> 
								<input type="hidden" name="paydata1" value=""> 
								<input type="hidden" name="paydata2" value=""> 
								<input type="hidden" name="address" value="" id="address"> 
								<input type="hidden" name="etcaddress" value=""> 
								<input type="hidden" name="virresno1" value=""> 
								<input type="hidden" name="virresno2" value=""> 
								<input type="hidden" name="resno" value=""> 
								<input type="hidden" name="msecure_key" value="LDoo/UZhSMRdSr9Qw/S1sg=="> 
								<input type="hidden" name="add_msecure_key" value=""> 
								<input type="hidden" name="id_info" value="" id="id_info"> 
								<input type="hidden" name="id_name" value="" id="id_name"> 
								<input type="hidden" name="sslid" value="superstari"> 
								<input type="hidden" name="sslip" value="www.superstari.co.kr">
								<input type="hidden" name="tempid" value="36ae504279011882970532cf37a8321f"> 
								<input type="hidden" name="id" value="" id="id"> 
								<input type="hidden" name="use_freedeli_coupon" value="N"> 
								<input type="hidden" name="banktown_id" value=""> 
								<input type="hidden" name="card_brand" value="수납&amp;공간활용 진공 압축팩">
								<input type="hidden" name="banktownprice" value="5400">
								<input type="hidden" name="cardprice" value="5400"> 
								<input type="hidden" name="cur_reserve" value=""> 
								<input type="hidden" name="reserveonlyprice" value=""> 
								<input type="hidden" name="ktprice" value="2900" origin-data-value="2900"> 
								<input type="hidden" name="kt_id" value=""> 
								<input type="hidden" name="deli_product_price" value="2500"> 
								<input type="hidden" name="bankonly" value="N"> 
								<input type="hidden" name="quickdelihour" value=""> 
								<input type="hidden" name="quickdelimethod" value=""> 
								<input type="hidden" name="quickdelipricetype" value="C"> 
								<input type="hidden" name="shoplang" value=""> 
								<input type="hidden" name="pay_path" value="PC"> 
								<input type="hidden" name="tm1post1" value="" id="tm1post1"> 
								<input type="hidden" name="tm1post2" value="" id="tm1post2"> 
								<input type="hidden" name="tm1address1" value="" id="tm1address1">
								<input type="hidden" name="tm1address2" value="" id="tm1address2"> 
								<input type="hidden" name="tm2post1" value="" id="tm2post1"> 
								<input type="hidden" name="tm2post2" value="" id="tm2post2"> 
								<input type="hidden" name="tm2address1" value="" id="tm2address1">
								<input type="hidden" name="tm2address2" value="" id="tm2address2"> 
								<input type="hidden" name="deli_reserve" value=""> 
								<input type="hidden" name="deli_emoney" value=""> 
								<input type="hidden" name="order_deli_price" value="2500"> 
								<input type="hidden" name="discount_use_not_reserve" value="0">
								<input type="hidden" name="mobile_type" value="DA">
								<!--핸드폰 결제 타입  (DA : 다날, MO : 모빌리언스)-->
								<input type="hidden" name="group_deli_type" id="group_deli_type" value="">
								<!--회원등급 배송료처리-->
								<input type="hidden" name="mk_ems_type" id="mk_ems_type" value="">
								<!--해외 배송료처리-->
								<input type="hidden" name="simplepay_type" id="simplepay_type" value="">
								<!-- 간편결제 -->
								<input type="hidden" name="order_paytype" id="order_paytype" value="PAY">
								<!-- 스마트주문서(주문서리뉴얼) 결제팝업 버전 -->
								<input type="hidden" name="add_deli_price" id="add_deli_price" value="0">
								<!-- 스마트주문서(주문서리뉴얼) 추가배송비 -->

								<input type="hidden" name="tba_name" id="tba_name">
								<!-- 증빙신청 세금계산서 신청자명 -->
								<input type="hidden" name="tba_phone" id="tba_phone">
								<!-- 증빙신청 세금계산서 휴대전화 번호 -->
								<input type="hidden" name="tba_email" id="tba_email">
								<!-- 증빙신청 세금계산서 이메일 -->
								<input type="hidden" name="tba_company_num" id="tba_company_num">
								<!-- 증빙신청 세금계산서 사업자번호 -->
								<input type="hidden" name="tba_company_name" id="tba_company_name">
								<!-- 증빙신청 세금계산서 (상호)법인명 -->
								<input type="hidden" name="tba_company_owner" id="tba_company_owner">
								<!-- 증빙신청 세금계산서 대표자명 -->
								<input type="hidden" name="tba_company_post" id="tba_company_post">
								<!-- 증빙신청 세금계산서 우편번호 -->
								<input type="hidden" name="tba_company_addr" id="tba_company_addr">
								<!-- 증빙신청 세금계산서 주소 -->
								<input type="hidden" name="tba_company_addr2" id="tba_company_addr2">
								<!-- 증빙신청 세금계산서 상세주소 -->
								<input type="hidden" name="tba_company_biz" id="tba_company_biz">
								<!-- 증빙신청 세금계산서 업태 -->
								<input type="hidden" name="tba_company_item" id="tba_company_item">
								<!-- 증빙신청 세금계산서 업종 -->
								<input type="hidden" name="is_evidence_serchaddress" id="is_evidence_serchaddress">
								<!-- 증빙신청 세금계산서 우편번호 클릭여부 -->
								<input type="hidden" name="evidence_data" id="evidence_data" value="cashbill"> 
								<input type="hidden" name="use_tax" id="use_tax" value=""> 
								<input type="hidden" name="pvd_deli_price" id="pvd_deli_price" value="0">
								<!-- 공급자 배송비 (추가배송비 포함)-->

								<input type="hidden" id="usereserve" name="usereserve" value="0">
								<input type="hidden" name="type" value="guest"> 
								<input type="hidden" name="year" value="2019"> 
								<input type="hidden" name="mon" value="04"> 
								<input type="hidden" name="day" value="09"> 
								<input type="hidden" name="hope_deli_s_date" value=""> 
								<input type="hidden" name="hope_deli_e_date" value=""> 
								<input type="hidden" name="hope_deli_day2_setting" value="3649">
								<input type="hidden" name="hopedate_start_year" value="2019">
								<input type="hidden" name="hopedate_start_month" value="04">
								<input type="hidden" name="hopedate_start_day" value="09">
								<input type="hidden" id="hopedate_except_month" value="">
								<input type="hidden" id="hopedate_except_day" value="">
								<input type="hidden" id="hopedate_except_holiday" value="">
								<input type="hidden" name="useemoney" value=""> 
								<input type="hidden" name="emergency" value=""> 
								<input type="hidden" name="emergency2" value=""> 
								<input type="hidden" name="emergency3" value=""> 
								<input type="hidden" name="tempemergency21" value="" id="tempemergency21"> 
								<input type="hidden" name="tempemergency22" value="" id="tempemergency22"> 
								<input type="hidden" name="tempemergency23" value="" id="tempemergency23"> 
								<input type="hidden" name="member_before_pay" id="member_before_agree" value="Y">
								

								<!-- ============================================================================================================== -->
								<!-- ==================================================.tbl-order================================================== -->
								<!-- ============================================================================================================== -->
								<fieldset>
								<div class="row">
									<div class="col-md-9"></div>
									<div class="col-md-3">
										<a data-clk="top.ann" href="https://search.naver.com/search.naver?sm=top_ros&amp;fbm=1&amp;ie=utf8&amp;query=%EC%84%B8%EC%9B%94%ED%98%B8+%ED%9D%AC%EC%83%9D%EC%9E%90+5%EC%A3%BC%EA%B8%B0">
											<img style="position: absolute;" src="https://s.pstatic.net/static/www/mobile/edit/2019/0321/mobile_162311687752.png" width="235" height="45" alt="4·16 세월호 참사" title="4·16 세월호 참사">
										</a>
									</div>
								</div>
									<legend>주문리스트</legend>
									<h3>주문리스트</h3>
									<input type="button" value="추가" class="add_order_list_count">
									<div class="tbl-order">
										<table>
											<caption>주문리스트</caption>
											<colgroup>
												<col style="width: 50px">
												<col style="width: 200px">
												<col style="width: 80px">
												<col style="width: 80px">
												<col style="width: 50px">
											</colgroup>
											<thead>
												<tr>
													<th scope="col"></th>
													<th scope="col">제품</th>
													<th scope="col">수량</th>
													<th scope="col">가격</th>
													<th scope="col">적립</th>
												</tr>
											</thead>
											<tbody class="add_trTag">
												
											</tbody>
										</table>
									</div>
									<div class="row">
										<div class="col-sm-9"></div>
										<div class="order_list_choice col-sm-3">
											<input type="button" class ="btn btn-info btn_all_check" value="전체선택">
											<input type="button" class ="btn btn-info btn_delete" value="삭제">
											<input type="button" class ="btn btn-info btn_all_release" value="전체해제">
										</div>
									</div>
									<!-- ============================================================================================================== -->
									<!-- ==================================================.tbl-order================================================== -->
									<!-- ============================================================================================================== -->

									<h3>주문자정보</h3>
									<div class="tbl-order">
										<table>
											<caption>주문자정보</caption>
											<colgroup>
												<col style="width: 130px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><div class="txt-l">이름</div></th>
													<td><input type="text" name="sender" form="order_form"
														id="sender" class="MS_input_txt" value=""></td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">이메일</div></th>
													<td>
														<input type="text" name="email" form="order_form" id="email" value="" class="MS_input_txt" maxlength="10" size="4">
														@
														<input type="text" name="email" form="order_form" id="email_self" value="" class="MS_input_txt" maxlength="10" size="4" style="display: none;">
														<select name="email_change" class="choose_email">
																<option value="0" selected="selected">naver.com</option>
																<option value="1">daum.net</option>
																<option value="2">nate.com</option>
																<option value="3" id="self_write">직접 입력</option>
														</select>
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">연락처</div></th>
													<td>
														<input type="text" name="emergency11" form="order_form" id="emergency11" size="4" maxlength="4" class="MS_input_txt w60" value="">
														 - <input type="text" name="emergency12" form="order_form" id="emergency12" size="4" maxlength="4" class="MS_input_txt w60" value="">
														 - <input type="text" name="emergency13" form="order_form" id="emergency13" size="4" maxlength="4" class="MS_input_txt w60" value="">
													 </td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->

									<h3>
										배송 정보 
										<label> 
										<input type="checkbox" name="same" form="order_form" id="same" onclick="copydata()"> 
											위 정보와 같음
										</label>
									</h3>
									<div class="tbl-order">
										<table>
											<caption>배송 정보 입력</caption>
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

									<h3>추가정보</h3>
									<div class="tbl-order">
										<table>
											<caption>추가정보</caption>
											<colgroup>
												<col style="width: 130px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><div class="txt-l">무통장 환불 예금주</div></th>
													<td><input type="text" name="order_add_info[1]"
														form="order_form" class="MS_input_txt" size=""
														maxlength=""></td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">무통장 환불 은행명</div></th>
													<td><input type="text" name="order_add_info[2]"
														form="order_form" class="MS_input_txt" size=""
														maxlength=""></td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">무통장 환불 계좌</div></th>
													<td><input type="text" name="order_add_info[3]"
														form="order_form" class="MS_input_txt" size=""
														maxlength=""><br>( 계좌번호 미기재 또는 오류시 기재한 계좌로
														환불처리 )<br></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->


									<h3>결제 정보</h3>
									<div class="tbl-order">
										<table>
											<caption>결제 정보</caption>
											<colgroup>
												<col style="width: 110px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><div class="txt-l">결제방법</div></th>
													<td>
														<ul class="pay-method">
															<li>
															<input type="radio" class="chk-rdo" name="radio_paymethod" value="B" checked="checked">
																무통장입금 <em><span class="op-bank-dc-price fc-red"></span></em>
																<select name="pay_data" class="w280 MK_bank_select_list MK_pay_add_choice">
																	<option value="">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
																	<option value="신한 110-394-023184 (예금주:(주)Insomnia)">
																		신한 110-394-023184 (예금주:(주)Insomnia)
																	</option>
																</select>
															</li>
															<li>
																<input type="radio" class="chk-rdo" name="radio_paymethod" value="PAYCO"> 
																페이코(PAYCO) <em><span class="op-card-dc-price fc-red"></span></em>
															</li>
															<li>
															<input type="radio" class="chk-rdo" name="radio_paymethod" value="C"> 
																신용카드 <em><span class="op-card-dc-price fc-red"></span></em>
															</li>
															<li>
																<input type="radio" class="chk-rdo" name="radio_paymethod" value="D"> 
																휴대폰 결제 
																<em><span class="op-hp-dc-price fc-red"></span></em>
															</li>
															<li>
																<input type="radio" class="chk-rdo" name="radio_paymethod" value="KAKAOPAY">
																카카오페이(KAKAOPAY) <em><span class="op-card-dc-price fc-red"></span></em>
															</li>
														</ul>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->

									<!-- 증빙신청 태그 추가 시 임의로 태그를 제거하게 되면 결제 등 정상 동작이 불가할 수 있습니다 !!! -->
									<div id="evidence" style="">
										<div class="tbl-order"
											style="margin-top: 0px; border-top: 0px;">
											<table>
												<caption>증빙 신청</caption>
												<colgroup>
													<col style="width: 110px">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">
														<div class="txt-l">증빙 신청</div></th>
														<td style="padding-left: 18px;">
														<input type="radio" name="evidencecheck" form="order_form" onclick="" value="N" checked=""> 신청안함 
														<input type="radio" name="evidencecheck" form="order_form" onclick="" value="cashbill" checked="checked"> 현금영수증

															<div style="padding-top: 5px;">
																<div id="evidence_data">
																	<script type="text/javascript" src="/js/check.js"></script>
																	<div id="evidence_cashbill_data">
																		<span id="cashbilltype"> 
																			<select name="evidence_banktype" class="bank-type" onchange="togglecashbilltype(this.value)">
																					<option value="0" selected="">핸드폰 번호</option>
																					<option value="1">국세청 현금영수증 카드</option>
																					<option value="2">사업자 번호</option>
																			</select>
																		</span> 
																		<span id="evidence_cashbill_tel"> <input
																			type="text" name="mobilephone" size="5" maxlength="3"
																			class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['mobilephone'][0], this.form['mobilephone'][1], 3);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="mobilephone" size="5" maxlength="4"
																			class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['mobilephone'][1], this.form['mobilephone'][2], 4);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="mobilephone" size="5" maxlength="4"
																			class="MS_input_txt txt-input w60"
																			onkeypress="InpuOnlyPhone(this)">&nbsp;<span
																			style="display: none;"><input type="checkbox"
																				name="reset">초기화</span></span> <span
																			id="evidence_cashbill_card" style="display: none">
																			<input type="text" name="tax_card_number" size="5"
																			maxlength="4" class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['tax_card_number'][0], this.form['tax_card_number'][1], 4);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="tax_card_number" size="5"
																			maxlength="4" class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['tax_card_number'][1], this.form['tax_card_number'][2], 4);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="tax_card_number" size="5"
																			maxlength="4" class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['tax_card_number'][2], this.form['tax_card_number'][3], 4);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="tax_card_number" size="6"
																			maxlength="6" class="MS_input_txt txt-input w60"
																			onkeypress="InpuOnlyPhone(this)">
																		</span> <span id="evidence_cashbill_company"
																			style="display: none"> <input type="text"
																			name="crn" size="4" maxlength="3"
																			class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['crn'][0], this.form['crn'][1], 3);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="crn" size="3" maxlength="2"
																			class="MS_input_txt txt-input w60"
																			onkeyup="nextfocus(this.form['crn'][1], this.form['crn'][2], 2);"
																			onkeypress="InpuOnlyPhone(this)"> - <input
																			type="text" name="crn" size="6" maxlength="5"
																			class="MS_input_txt txt-input w60"> <span
																			class="company-name">업체명 : <input type="text"
																				name="crname" size="16" maxlength="20"
																				class="MS_input_txt txt-input w60"></span>
																		</span>
																	</div>
																	<div id="evidence_taxbill_data" style="display: none;">
																		<table class="tbl-taxbill">
																			<colgroup>
																				<col style="width: 19%">
																				<col style="width: *">
																			</colgroup>
																			<tbody>
																				<tr>
																					<th><div>신청자명</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>휴대폰번호</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>이메일</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>사업자번호</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>상호(법인명)</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>대표자명</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>사업장주소</div></th>
																					<td>
																						<div>
																							<a href="" class="btn-white">우편번호</a><br> <br>
																						</div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>업태</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																				<tr>
																					<th><div>종목</div></th>
																					<td>
																						<div></div>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
															</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									
									<!-- ============ 결제 정보 변경 시 마다 출력되는 div시작 ======= -->	
									<div class="lst-order">
									
										<!-- ====== 무통장 입금 선택 ====== -->
										<ul id="payinfo_B" class="payment-info" style="display: block;">
											<li>
												· 선택된 입금계좌로 <font color="blue">인터넷 뱅킹, 은행 방문</font> 등을 통해 입금해 주세요. 
												<input type="hidden" name="link_value">
												<input type="hidden" name="link_value" value="http://banking.nonghyup.com/">
												<input type="hidden" name="link_value" value="https://www.kebhana.com/"> 
												<input type="hidden" name="link_value" value="http://www.mybank.co.kr/"> 
												<input type="hidden" name="link_value" value="https://www.kbstar.com/"> 
												<input type="hidden" name="link_value" value="http://www.wooribank.com/">
											</li>
											<li>· 반드시 입금 기한 내에 정확한 결제금액을 입금해 주세요.</li>
											<li>· 입금 기한이 지나면 주문은 자동취소됩니다.</li>
										</ul>
										<!-- ====== 무통장 입금 선택 ====== -->
										
										<!-- ====== 페이코 선택 ====== -->
										<ul id="payinfo_PAYCO" class="payment-info" style="display: none">
											<li style="color: #3b3b3b;">
											1) PAYCO 결제리워드 : <font color="red">1.2%</font>
												적립, 등급별 라운지 혜택 제공<br>&nbsp;&nbsp;&nbsp;
												<a href="https://event.payco.com/event/payco/payreward.nhn" target="_blank" style="color: #00b0f0;">[결제리워드 자세히보기]</a>&nbsp;&nbsp;&nbsp;</li>
											<li style="color: #3b3b3b;">
											2) PAYCO 포인트(유상)로 결제 시 <font color="red">2%</font>적립(익월 25일 적립)&nbsp;&nbsp;&nbsp;</li>
											<li>휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.</li>
										</ul>
										<!-- ====== 페이코 선택 ====== -->
										
										<!-- ====== 신용카드 선택 ====== -->
										<ul id="payinfo_C" class="payment-info" style="display: none">
											<li>· 안심클릭 및 인터넷안전결제(IPS)서비스로 
												<font color="blue">
													128bit SSL
												</font>로 암호화된 결제 창이 새로 뜹니다.
											</li>
											<li>
												· 결제후, 카드명세서에 [
												<font color="red">KCP.CO.KR</font>
												]로 표시되며, 카드 정보는 상점에 남지 않습니다.
											</li>
										</ul>
										<!-- ====== 신용카드 선택 ====== -->
										
										<!-- ====== 휴대폰 결제 선택 ====== -->
										<ul id="payinfo_D" class="payment-info" style="display: none">
											<li>· 결제정보가 상점에 남지 않으며, 보안 적용된 결제창이 새로 뜹니다.</li>
											<li>· 결제후, 핸드폰 요금청구서에 '소액결제'로 표시됩니다.</li>
											<li>· <font color="red">결제후, 결제건의 취소는 해당 달에만 가능합니다.</font></li>
										</ul>
										<!-- ====== 휴대폰 결제 선택 ====== -->
										
										<!-- ====== 카카오페이 선택 ====== -->
										<ul id="payinfo_KAKAOPAY" class="payment-info"
											style="display: none">
											<li>· 카카오톡에서 신용/체크카드 연결하고, 결제도 지문으로 쉽고 편리하게 이용하세요!</li>
											<li>· 본인명의 스마트폰에서 본인명의 카드 등록 후 사용 가능</li>
											<li>· (카드등록 : 카카오톡 &gt; 더보기 &gt; 카카오페이 &gt; 카드)</li>
											<li>· 이용가능 카드사 : 모든 국내 신용/체크카드</li>
											<li>
											· 카드 결제 시, 결제금액 200만원 이상일 경우 ARS추가 인증이 필요합니다. 
											카카오머니 결제시는 추가인증 없음</li>
										</ul>
										<!-- ====== 카카오페이 선택 ====== -->
									</div>
									<!-- ============ 결제 정보 변경 시 마다 출력되는 div끝 ======= -->

									<h3>주문자 동의</h3>
									<div class="tbl-order">
										<table>
											<caption>주문자 동의</caption>
											<colgroup>
												<col style="width: 130px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><div class="txt-l">약관동의</div></th>
													<td>
														<div class="new-privercy-contract">
															<p>개인정보 수집·이용</p>
															<div class="privercy-contract">
																<table class="tbl" summary="목적, 항목, 보유기간">
																	<caption>개인정보 수집/이용</caption>
																	<colgroup>
																		<col width="*">
																		<col width="30%">
																		<col width="20%">
																	</colgroup>
																	<thead>
																		<tr>
																			<th scope="col">목적</th>
																			<th scope="col">항목</th>
																			<th scope="col">보유기간</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td class="purpose"><div class="txt-l">서비스
																					제공에 따른 요금정산, 콘텐츠 제공, 구매 및 요금결제, 물품배송, 금융거래 본인 인증 및
																					금융서비스</div></td>
																			<td class="items"><div class="txt-l">주문자
																					정보(이름, 연락처), 받는분 정보(이름, 연락처, 주소)</div></td>
																			<td class="holding"><div class="txt-l">목적
																					달성 후 5일까지(관계법률로 인해 필요 시, 일정기간 보존)</div></td>
																		</tr>
																		<tr>
																			<td class="purpose8"><div class="txt-l">비회원
																					주문 서비스 이용</div></td>
																			<td class="items8"><div class="txt-l">입금자
																					성명, 환불계좌정보, 이메일</div></td>
																			<td class="holding8"><div class="txt-l">목적
																					달성 후 5일까지(관계법률로 인해 필요 시, 일정기간 보존)</div></td>
																		</tr>
																	</tbody>
																</table>
																<div style="margin-top: 5px;">* 동의하셔야 서비스를 이용하실 수
																	있습니다.</div>
																<div class="privercy-agree">
																	<label><input type="radio"
																		name="new_privacy_agree" value="Y"> 정보수집에
																		동의합니다.</label> <label><input type="radio"
																		name="new_privacy_agree" value="N" checked="">
																		동의하지 않습니다.</label>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">주문동의</div></th>
													<td><label class="label"> <input
															type="checkbox" id="pay_agree" name="pay_agree"
															form="order_form"> 상기 결제정보를 확인하였으며, 구매진행에 동의합니다.
													</label></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->

									<div class="tbl-order tot-order">
										<table>
											<caption></caption>
											<colgroup>
												<col style="width: 100px">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th>최종 결제금액</th>
													<td><strong class="price"><em><span
																id="block_unit_dollar" style="display: none">$</span> <span
																id="op_total_price">5,400</span></em> <span
															id="block_unit_won">원</span></strong> &nbsp;</td>
												</tr>

											</thead>
										</table>
									</div>
									<!-- .tbl-pay -->

									<div id="paybutton">
										<input type="button" id="btn_order_ok" class="btn btn-success btn_FontSize" style="margin-right: 5px;" value="주문하기"/>
										<a href="javascript:order_cancel('cancel')">
											<button id="btn_order_cancle" class="btn btn-default btn_FontSize" style="margin-left: 5px">주문취소</button>
										</a>
									</div>
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
	