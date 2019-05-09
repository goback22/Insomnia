<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = request.getParameter("id");
	//System.out.println("넘어오는 id:"+id);
	
	String fouc = "1";
	request.setAttribute("fouc", fouc);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminMainMemberView.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
<%-- 	<link href="<c:url value='/vendor/css/admin_member_view.css'/>" rel="stylesheet"> --%>
<%-- 	<script src="<c:url value='/vendor/js/admin_member_view.js'/>"></script> --%>
	<style>
		.c2{
			-webkit-transform:  translateX(100%);
 		    -webkit-transition-timing-function: linear;
		    transition-duration:1s;
		}
	
	</style>
	<script>
	//jQuery ui의 https://jqueryui.com/effect/참조함
		$(function(){
			$("#page-wrapper").effect('slide',{direction: "right"},1000);
		});
	</script>
</head>
<body>
	<div id="wrapper">
		<!-- top sidebar start -->
		<jsp:include page="/WEB-INF/views/admin/template/Top.jsp" />
		<!-- top sidebar end -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>
						회원관리 <small><%=id %>의 상세정보</small>
					</h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title"><%=id %>의 상세정보</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<!-- inner -->
								<div class="row" style="margin:0 auto;">
									<div class="col-md-4">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">${memberView.id }의 더 상세한 정보</h3>
											</div>
											<div class="panel-body feed">
												<table class="table">
													<tr>
														<th class="col-md-4">MEMBERS.phone</th>
														<th class="col-md-4">MEMBERS.bank_name</th>
														<th class="col-md-4">MEMBERS.bank_serial</th>
														
													</tr>
													<tr>	
														<td>${memberView.phone }</td>
														<td>${memberView.bank_name==null?"등록된 은행이 없습니다":memberView.bank_name }</td>
														<td>${memberView.bank_serial==null?"등록된 계좌가 없습니다":memberView.bank_serial }</td>
													</tr>
													<tr>
														<th colspan="2">MEMBERS.shipping_address</th>
														<th>3333333</th>
													</tr>
													<tr>	
														<td colspan="2">${memberView.shipping_address==null?"등록된 주소가 없습니다":memberView.shipping_address }</td>
														<td>3333333</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
									<div class="col-md-8">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title"><%=id %>의 거래정보(SAFEPAY_date로)</h3>
											</div>
											<div class="panel-body feed">
												<table class="table table-hover">
													<tr>
														<th>SAFEPAY.sp_no</th>
														<th>SAFEPAY.sp_date</th>
														<th>SAFEPAY.sp_recipient</th>
														<th>SAFEPAY.sp_depositor</th>
														<th>SAFEPAY.shipping_address</th>
														<th>SAFEPAY.sp_phone</th>
													</tr>
													
													<c:forEach items="${memberViewPay }" var="memberPay" varStatus="loop">
													<tr>
														<td class="viewDetail">${memberPay.sp_no }</td>
														<td class="viewDetail">${memberPay.sp_date }</td>
														<td class="viewDetail">${memberPay.sp_recipient }</td>
														<td class="viewDetail">${memberPay.sp_depositor }</td>
														<td class="viewDetail">${memberPay.shipping_address }</td>
														<td class="viewDetail">${memberpay.sp_phone }</td>
													</tr>
													<!-- 위의 detail -->
													<tr class="fold" style="background-color: #c8c8c8;">
														<td colspan="7">
															<div class="fold-content">
																<table class="table table-bordered">
																	<!-- first floor -->
																	
																		<tr>
																			<th class="col-md-1">REWARD.r_name</th>
																			<th class="col-md-1">REWARD.r_price</th>
																			<th class="col-md-1">SAFEPAY.sp_reward_qty</th>
																			<th class="col-md-1">reward total price</th>
																			<th class="col-md-1">SAFEPAY.sp_bank_name</th>
																			<th class="col-md-2">SAFEPAY.sp_account_serial</th>
																			
																		</tr>
																	
																		<tr>
																			<td>${memberPay.r_name }</td>
																			<td>${memberPay.r_price }</td>
																			<td>${memberPay.sp_reward_qty }</td>
																			<td class="cur">${memberPay.r_price * memberPay.sp_reward_qty }</td>
																			<td>${memberPay.sp_bank_name }</td>
																			<td>${memberPay.sp_account_serial }</td>
																			
																		</tr>
																	
																</table>
															</div>
														</td>
													</tr>
													</c:forEach>
													
													<!-- 위의 detail 끝 -->
												</table>
											</div>
										</div>
									</div>
								</div>
								<div align="center">
<!-- 									<div class="btn btn-success" onclick="memberList()"> 돌아가기 </div> -->
									<a class="btn btn-success" href="<c:url value='/admin/allmember.ins?fouc=1'/>">돌아가기</a>
								</div>
								<!--  -->
								<div class="grid-button">
								    <span class="grid open"></span>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script>
		var memberList = function(){
			$('#page-wrapper').addClass('c2');
			
			setTimeout(function(){
				//history.back();
				location.href="<c:url value='/admin/allmember.ins?fouc=1'/>"
		    },1000);
			
		};
		
		$(".viewDetail").on("click", function() {//[o]
			//$('.fold').hide(100);
			$(this).parent().next(".fold").toggle(300);
		});
		
	</script>
	
</body>
</html>