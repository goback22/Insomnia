<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminMainContentMember.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">

</head>
<body>
	<div id="wrapper">
		<!-- top sidebar start -->
		<jsp:include page="/WEB-INF/views/admin/template/Top.jsp" />
		<!-- top sidebar end -->
		<!-- main -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-12">
					<h1>
						main content<small>main 진행중</small>
					</h1>
				</div>
			</div>
			<!--  -->
			<div class="row">
				<div class="col-md-8">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">진행중인 main content</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<!-- table test -->
								<table class="table table-hover" style="border-bottom: 1px #c8c8c8 solid;">
									<tr class="main-simple-member">
										<th class="col-md-1"><input type="checkbox" value="all" />&nbsp;&nbsp;no</th>
										<th class="col-md-1 text-center">B_NAME</th>
										<th class="col-md-2 text-center">BI_PROFILE</th>
										<th class="col-md-2 text-center">BM_TITLE</th>
										<th class="col-md-2 text-center">S_SUBMIT_DATE</th>
										<th class="col-md-2 text-center">GOAL_DEADLINE</th>
									</tr>
									<!-- 1번 예 - 반복 -->
									<tr data-tr_value="1" class="view">
										<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;1</td>
										<td class="text-center viewDetail" style="cursor: pointer;">밴드이름</td>
										<td class="text-center viewDetail">프로필(소개아님)</td>
										<td class="text-center viewDetail">앨범명</td>
										<td class="text-center viewDetail">2019-04-16</td>
										<td class="text-center viewDetail">2019-05-30</td>
									</tr>
									<!-- 위의 detail1 -->
									<tr class="fold" style="background-color: #c8c8c8;">
										<td colspan="6">
											<div class="fold-content">
												<table class="table table-bordered">
													<!-- first floor -->
													<thead>
														<tr>
															<th>B_NAME</th>
															<th>S_CONTENT</th>
															<th>S_GOAL_ACCUMULATION<br/>(누적금액)</th>
															<th>S_GOAL_PRICE<br/>(목표금액)</th>
															<th>S_ALBUM_COVER</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>밴드이름</td>
															<td></td>
															<td class="cur">2900</td>
															<td class="cur">3000</td>
															<td rowspan="3" align="center"><img style="padding:10px;max-width: 100%; max-height: auto;" src="<c:url value='/img/footer-test.png'/>" alt="등록된 이미지가 없습니다"></td>
															
														</tr>
														<!-- second floor -->
														<tr>
															<th>S_ACCOUNT_BANK</th>
															<th>S_ACCOUNT_SERIAL</th>
															<th>R_NAME</th>
															<th>R_PRICE</th>
														</tr>
														<tr>
															<td>우리은행</td>
															<td>123-45-67890</td>
															<td>
																묠니루<br/>아이언맨 수트<br/>캡틴 방패<br/>
															</td>
															<td>
																1000<br/>2000<br/>3000<br/>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<!-- 위의 detail 끝 -->
									<!-- 1번 예 끝- 반복 -->
									
									<!-- 2번 예 - 반복 -->
									<tr data-tr_value="2" class="view">
										<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;2</td>
										<td class="text-center viewDetail" style="cursor: pointer;">밴드이름</td>
										<td class="text-center viewDetail">프로필(소개아님)</td>
										<td class="text-center viewDetail">앨범명</td>
										<td class="text-center viewDetail">2018-10-30</td>
										<td class="text-center viewDetail">2019-05-30</td>
									</tr>
									<!-- 위의 detail1 -->
									<tr class="fold" style="background-color: #c8c8c8;">
										<td colspan="7">
											<div class="fold-content">
												<table class="table table-bordered">
													<!-- first floor -->
													<thead>
														<tr>
															<th>B_NAME</th>
															<th>S_CONTENT</th>
															<th>S_GOAL_ACCUMULATION<br/>(누적금액)</th>
															<th>S_GOAL_PRICE<br/>(목표금액)</th>
															<th>S_ALBUM_COVER</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>밴드이름</td>
															<td></td>
															<td class="cur">12900</td>
															<td class="cur">13000</td>
															<td rowspan="3" align="center"><img style="padding:10px;max-width: 100%; max-height: auto;" src="<c:url value='/img/footer-test.png'/>" alt="등록된 이미지가 없습니다"></td>
															
														</tr>
														<!-- second floor -->
														<tr>
															<th>S_ACCOUNT_BANK</th>
															<th>S_ACCOUNT_SERIAL</th>
															<th>R_NAME</th>
															<th>R_PRICE</th>
														</tr>
														<tr>
															<td>너네은행</td>
															<td>4444444444</td>
															<td>
																K2<br/>K3<br/>K9<br/>
															</td>
															<td>
																1000<br/>2000<br/>3000<br/>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<!-- 위의 detail 끝 -->
									<!-- 2번 예 끝- 반복 -->
								</table>
								<!-- table test end -->
								<div>
									<div class="btn btn-default checkeddelete">삭제</div>
									<div class="btn btn-default">수락</div>
									<div class="btn btn-default">거부</div>
									<div align="center">페이징</div>
								</div>
							</section>
						</div>
					</div>
				</div>

				<!-- 첫번째 끝 -->
				<div class="col-md-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">진행중인 main content chart1</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
							<!-- chart1 -->
								
							<!-- chart1 end -->
							</section>
						</div>
					</div>
				</div>
				<!-- 두번째 끝 -->
				<div class="col-md-4" style="float:right;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">진행중인 main content chart2</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
							
							</section>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- main end -->
	</div>


<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">
	$(".viewDetail").on("click", function() {//[o]
// 		$("td.clk").on("click", function() {//[o]
//		$("view td.clk").on("click", function() {//[o]
// 		$(".view").on("click", function() {
			console.log("click");
			console.log($(this));
			$(this).parent().next(".fold").toggle(400);
// 			$(this).next(".fold").toggle(400);
	});
</script>
<script type="text/javascript">

</script>

</body>
</html>