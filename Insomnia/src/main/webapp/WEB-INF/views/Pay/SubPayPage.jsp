<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/my/isMember.jsp" %>

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

<!-- SubPay 동작을 위한 .js -->
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>
<script src="<c:url value='/vendor/js/SubPay_Validation.js'/>"></script>

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
	.subpay_title_content{
		width: 500px;
		background-color: white;
		border: none;
		pointer-events: none;
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
							<form name="form1" id="order_form" action="<c:url value='/Pay/PayComplete.ins'/>" method="post">
								
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
												<tr class='orderlist_checkNrelease_delete'>
													<td>
														<div class='tb-center'>
															<div class='thumb'>
																<input type='checkbox' class='order_list_checked' checked='checked'>
																<img src='<c:url value="/img/guita.png"/>' width='40'>
															</div>
														</div>
													</td>
													<td>
														<div class='tb-left'>
															<!-- 나중에 이것들은 링크 달면됨. -->
															<input type="hidden" name="subPay_Title" value="${param.bgs1_title }">
															<input type="hidden" name="subPay_Content" value="${param.bgs1_content }">
															<a href="#">
																<input type="text" class="subpay_title_content" value="${param.bgs1_title }" disabled="disabled" style="border: none;">
																<br/>
																<input type="text" class="subpay_title_content" value="${param.bgs1_content }" disabled="disabled" style="width: 500px; border: none;">
															</a>  
														</div>
													</td>
													<td>
														<div class='tb-center'>
															<input disabled="disabled" type='text' class='item_Count' value='${param.bgs1_qty }' style='width: 25px; text-align: right;background-color: #fff;'> 개
															<input type='button' class='btn btn-info btn_plus' value='+'>
															<input type='button' class='btn btn-info btn_minus' value='-''>
														</div>
														<input type="hidden" name="subPay_Item_Qty" value="${param.bgs1_qty }">
													</td>
													<td>
														<div class='tb-right tb-bold tb-center'><span id="price_concert"></span>원</div>
														<script>
															$("#price_concert").text(String(${param.bgs1_price}).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
														</script>
													</td>
													<td>
														<div class='tb-center'>없음</div>
													</td>
												</tr>
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
													<td>
														<input type="text" name="sender_name" form="order_form" id="sender" class="MS_input_txt" value="${name }">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<div class="txt-l">이메일</div>
													</th>
													<td>
														<input type="text" name="email" form="order_form" id="email_1" value="${email_first }" class="MS_input_txt" maxlength="10" size="4" disabled="disabled"
														style="background-color: white;">
														@
														<select name="email_change" class="choose_email_1" disabled="disabled">
															<c:if test="${email_second eq 'naver.com'}">
																<option value="0" selected="selected">naver.com</option>
																<option value="1">daum.net</option>
																<option value="2">nate.com</option>
																<option value="3">google.com</option>
															</c:if>
															<c:if test="${email_second eq 'daum.net'}">
																<option value="0">naver.com</option>
																<option value="1" selected="selected">daum.net</option>
																<option value="2">nate.com</option>
																<option value="3">google.com</option>
															</c:if>
															<c:if test="${email_second eq 'nate.com'}">
																<option value="0">naver.com</option>
																<option value="1">daum.net</option>
																<option value="2" selected="selected">nate.com</option>
																<option value="3">google.com</option>
															</c:if>
															<c:if test="${email_second eq 'google.com'}">
																<option value="0">naver.com</option>
																<option value="1">daum.net</option>
																<option value="2">nate.com</option>
																<option value="3" selected="selected">google.com</option>
															</c:if>
														</select>
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">연락처</div></th>
													<td>
														<input type="text" name="emergency11" form="order_form" id="emergency11" size="4" maxlength="4" class="MS_input_txt w60" value="010">
														 - <input type="text" name="emergency12" form="order_form" id="emergency12" size="4" maxlength="4" class="MS_input_txt w60" value="${phone_first }">
														 - <input type="text" name="emergency13" form="order_form" id="emergency13" size="4" maxlength="4" class="MS_input_txt w60" value="${phone_second }">
													 </td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->

									<h3>
										예매 정보 
										<label> 
										<input type="checkbox" name="same" form="order_form" id="same"> 
											    위 위 정보와 같음
										</label>
									</h3>
									<div class="tbl-order">
										<table>
											<caption>예매 정보 입력</caption>
											<colgroup>
												<col style="width: 130px">
												<col>
												<col style="width: 100px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">
														<div class="txt-l">이름</div>
													</th>
													<td colspan="3">
														<input type="text" name="subPay_Name" form="order_form" id="receiver" class="MS_input_txt" value="">
													</td>
												</tr>
												
												<tr>
													<th scope="row">
														<div class="txt-l">이메일</div>
													</th>
													<td>
														<input type="text" name="subPay_Email1" form="order_form" value="" class="MS_input_txt" maxlength="10" size="4">
														@
														<input type="text" name="subPay_Email_Self" form="order_form" id="email_self" value="" class="MS_input_txt" maxlength="10" size="4" style="display: none;">
														<select name="subPay_Email2" class="choose_email_2">
															<option value="0" selected="selected">naver.com</option>
															<option value="1">daum.net</option>
															<option value="2">nate.com</option>
															<option value="3">google.com</option>
															<option value="4">직접 입력</option>
														</select>
													</td>
												</tr>
												
												<tr>
													<th scope="row">
														<div class="txt-l">연락처</div>
													</th>
													<td>
														<input type="text" name="subPay_Phone1" form="order_form" id="emergency21" size="4" maxlength="4" value="" class="MS_input_txt w60"> 
														- 
														<input type="text" name="subPay_Phone2" form="order_form" id="emergency22" size="4" maxlength="4" class="MS_input_txt w60" value="">
														- 
														<input type="text" name="subPay_Phone3" form="order_form" id="emergency23" size="4" maxlength="4" class="MS_input_txt w60" value="">
													</td>
												</tr>
												
												<tr>
													<th scope="row">
														<div class="txt-l">
															주문 메세지<br><span>(100자내외)</span>
														</div></th>
													<td colspan="3">
														<textarea name="subPay_Message" form="order_form" id="message" cols="50" rows="5" class="MS_textarea"></textarea>
													</td>
												</tr>
												
												<tr class="no_BankBook">
													<th scope="row">
														<div class="txt-l">무통장 입금자명</div>
													</th>
													<td colspan="3">
														<input type="text" name="subPay_Bank_Name" form="order_form" class="MS_input_txt" size="10" maxlength="10"> 
														<span class="MS_bankname_message"> (주문자와 같을경우 생략 가능)</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- .tbl-order -->

									<h3 class="add_Info">추가정보</h3>
									<div class="tbl-order tbl-add_Info">
										<table>
											<caption>추가정보</caption>
											<colgroup>
												<col style="width: 130px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">
														<div class="txt-l">무통장 환불 예금주</div>
													</th>
													<td>
														<input type="text" name="subPay_Refund_Name"form="order_form" class="MS_input_txt" size="" maxlength="">
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">무통장 환불 은행명</div></th>
													<td>
														<input type="text" name="subPay_Refund_BankName" form="order_form" class="MS_input_txt" size="" maxlength="">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<div class="txt-l">무통장 환불 계좌</div>
													</th>
													<td>
													<input type="text" name="subPay_Refund_BankAccount" form="order_form" class="MS_input_txt" placeholder="(-) 제외 계좌번호 입력."><br>
													( 계좌번호 미기재 또는 오류시 기재한 계좌로 환불처리 )<br></td>
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
															<input type="radio" class="chk-rdo" name="subPay_orderWay" value="B" checked="checked">
																무통장입금 <em><span class="op-bank-dc-price fc-red"></span></em>
																<select name="pay_data" class="w280 MK_bank_select_list MK_pay_add_choice" style="font-size: 11px; letter-spacing: 0;">
																	<option value="">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
																	<option value="신한 110-394-023184 (예금주:(주)Insomnia)">
																		신한 110-394-023184 (예금주:(주)Insomnia)
																	</option>
																</select>
															</li>
															<li>
															<input type="radio" class="chk-rdo" name="subPay_orderWay" value="C"> 
																신용카드 <em><span class="op-card-dc-price fc-red"></span></em>
															</li>
															<li>
																<input type="radio" class="chk-rdo" name="subPay_orderWay" value="D"> 
																휴대폰 결제 
																<em><span class="op-hp-dc-price fc-red"></span></em>
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
																			<select style="font-size: 12px;" name="evidence_banktype" class="bank-type">
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
																	<label>
																		<input type="radio" name="new_privacy_agree" value="Y"> 
																		정보수집에 동의합니다.
																	</label> 
																	<label>
																		<input type="radio" name="new_privacy_agree" value="N" checked="checked">
																		동의하지 않습니다.
																	</label>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row"><div class="txt-l">주문동의</div></th>
													<td>
													<label class="label"> 
														<input type="checkbox" id="pay_agree" name="pay_agree" form="order_form"> 
														상기 결제정보를 확인하였으며, 구매진행에 동의합니다.
													</label>
													</td>
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
													<td>
														<strong class="price"><em>
															<span id="block_unit_dollar" style="display:none;">$</span>
															<span id="op_total_price"></span></em> 
															<script> 
																$("#op_total_price").text(String(${param.bgs1_price}).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')); 
															</script> 
															<span id="block_unit_won">원</span>
														</strong> &nbsp;
														<input type="hidden" name="subPay_Final_payment_amount" value="">
													</td>
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
	