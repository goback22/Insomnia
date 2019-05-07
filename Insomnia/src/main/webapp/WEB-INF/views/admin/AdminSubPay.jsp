<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminSubPay.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_jqbar.css'/>" rel="stylesheet">
</head>
<body>

<div id="wrapper">
		<!-- top sidebar start -->
		<jsp:include page="/WEB-INF/views/admin/template/Top.jsp" />
		<!-- top sidebar end -->
		<!-- main -->
	
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>결제관련 <small>sub결제</small></h1>
				</div>
			</div>
			<!-- 결제 -->
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								sub 결제
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all"/>&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">BGSCONCERT.b_title</th>
										<th class="text-center">BGSCONCERT.b_place</th>
										<th class="text-center">CONCERTTIMES.c_concertdate</th>
										<th class="col-md-1 text-center">CONCERTTIMES.c_price</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<!-- example1 -->
									<tr class="view">
										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td>
										<td class="text-center viewDetail">방구석 타이틀</td>
										<td class="text-center viewDetail">방구석 장소</td>
										<td class="text-center viewDetail">공연날짜</td>
										<td class="text-center viewDetail cur">티켓 가격</td>
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color:#c8c8c8;">
										<td colspan="6">
									       <div class="fold-content">
									         <table class="table table-bordered">
									         	<!-- first floor -->
									         	
												<thead>
													<tr>
														<th>MEMBERS.id</th>
														<th>BGSPAY.qty</th>
														<th>BGSPAY.paydate</th>
														<th>BGSPAY.bank_name</th>
														<th>NON_BANKBOOK</th>
														<th>NON_BANKBOOK</th>
													</tr>
												</thead>
												<tbody>
										            <tr>
														<td>abc@naver.com</td>
														<td>r_name content</td>
														<td class="cur">1000</td>
														<td></td>
														<td></td>
														<td><div class="btn btn-success">상세보기</div></td>
										            </tr>
										         	<tr>
										                <td>def@daum.net</td>
										                <td>r_name content</td>
										                <td class="cur">2000</td>
										                <td></td>
										                <td></td>
										                <td><div class="btn btn-success">상세보기</div></td>
													</tr>
									            </tbody>
									          </table>          
									        </div>
									      </td>
										</tr>
										<!-- 위의 detail 끝 -->
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<!-- 페이징 -->
								
								<!-- 페이징 -->
							</section>
						</div>
					</div>
				</div>
				
				<!-- chart -->
				
				<!-- chart end -->
			</div>
			<!--  -->
			
			
			
			
		</div>
	</div>

<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">
$(".viewDetail").on("click", function() {//[o]
		$(this).parent().next(".fold").toggle(400);
		$('.thischart').toggle(400);
});
</script>


</body>
</html>