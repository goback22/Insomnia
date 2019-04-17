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
<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>"
	rel="stylesheet">
<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
<!--  -->
<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>"
	rel="stylesheet">
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
						main content<small>main 신청 관련</small>
					</h1>
				</div>
			</div>
			<!--  -->
			<div class="row">
				<div class="col-md-10">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">신청정보</h3>
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
									<!-- td -->
									<tr data-tr_value="1" class="view">
										<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;1</td>
										<td class="text-center more-detail" style="cursor: pointer;">밴드이름</td>
										<td class="text-center">프로필(소개아님)</td>
										<td class="text-center">앨범명</td>
										<td class="text-center">2019-04-16</td>
										<td class="text-center">2019-05-30</td>
									</tr>
									<!-- 위의 detail -->
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
															<td rowspan="3" align="center"><img style="height:30%;" src="<c:url value='/img/footer-test.png'/>" alt="등록된 이미지가 없습니다"></td>
														</tr>
														<!-- second floor -->
														<tr>
															<th>S_ACCOUNT_BANK</th>
															<th>S_ACCOUNT_SERIAL</th>
															<th>R_NAME</th>
															<th>R_PRICE</th>
															<th></th>
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
															<td></td>
														</tr>
													</tbody>

												</table>
												<div align="center">
													<div class="btn btn-default apply">수락</div>
													<div class="btn btn-default deny">거부</div>
												</div>
											</div>
										</td>
									</tr>
									<!-- 위의 detail 끝 -->
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



			</div>
		</div>
		<!-- main end -->
	</div>


	<!-- checked about checkbox -->
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
	<script type="text/javascript">
		$(".view").children().eq(1).on("click", function() {
			//console.log("click");
			$(this).parent().next(".fold").toggle(400);
		});
	</script>


</body>
</html>