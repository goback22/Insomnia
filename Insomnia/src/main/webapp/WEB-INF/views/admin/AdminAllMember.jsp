<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminAllMember.jsp</title>
<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>"
	rel="stylesheet">
<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
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
				<div class="col-lg-12">
					<h1>
						회원관리 <small>전체회원</small>
					</h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">회원 전체보기</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all" />&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">ID</th>
										<th class="col-md-2 text-center">NAME</th>
										<th class="text-center">column1</th>
										<th class="text-center">column2</th>
										<th class="text-center">JOIN_DATE</th>
<!-- 										<th class="col-md-2 text-center">해줄까 말까</th> -->
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<c:if test="${empty list }" var="isEmpty">
										<tr>
											<td colspan="4">등록된 게시물이 없어요</td>
										</tr>
									</c:if>
									<c:if test="${not isEmpty }">
										<c:forEach var="item" items="${list}" varStatus="loop">
											<!-- example1 -->
											<tr class="view">
												<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;1</td>
												<td class="text-center viewDetail">${item.id}<b class="caret"></b></td>
												<td class="text-center viewDetail">${item.name}</td>
												<td class="text-center viewDetail">일반1</td>
												<td class="text-center viewDetail">일반2</td>
												<td class="text-center viewDetail">${item.join_date}</td>
<!-- 												<td class="text-center"> -->
<!-- 													<div class="btn btn-default apply">수정</div> -->
<!-- 													<div class="btn btn-default deny">삭제</div> -->
<!-- 												</td> -->
											</tr>
											<!-- 위의 detail -->
											<tr class="fold" style="background-color: #c8c8c8;">
												<td colspan="7">
													<div class="fold-content">
														<table class="table table-bordered">
															<!-- first floor -->
															<thead>
																<tr>
																	<th>NAME</th>
																	<th>PASSWORD</th>
																	<th>BIRTHDAY</th>
																	<th>LOGIN_CHAIN</th>
																	<th>SMS_RECIEVE</th>
																	<th>EMAIL_RECIEVE</th>
																	<th>PROFILE_IMAGE</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>${item.name}</td>
																	<td>${item.password }</td>
																	<td>${item.birthDay }</td>
																	<td>${item.login_chain }</td>
																	<td>${item.sms_recieve }</td>
																	<td>${item.email_recieve }</td>
																	<td rowspan="3"><img src="" alt="등록된 이미지가 없습니다"></td>
																</tr>
															</tbody>
															<!-- second floor -->
															<thead>
																<tr>
																	<th>미정</th>
																	<th>미정</th>
																	<th>미정</th>
																	<th colspan="3">DESCRIPTION</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>미정</td>
																	<td>미정</td>
																	<td>미정</td>
																	<td colspan="3">${item.description==null?"등록된 소개가 없습니다":item.description }</td>
																</tr>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
											<!-- 위의 detail 끝 -->
										</c:forEach>
									</c:if>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>

								<!-- about checked -->
								<div>
									<div class="btn btn-default checkeddelete">삭제</div>
									<div class="btn btn-default">수락</div>
									<div class="btn btn-default">거부</div>
									<!-- 페이징 -->
									<div class="text-center">
										<ul class="pagination">
											<li><a href="#" aria-label="Previous"> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#" aria-label="Next"> <span
													aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</div>
									<!-- 페이징 -->
								</div>
								<!-- about checked end -->



							</section>
						</div>
					</div>
				</div>

				<!-- 위에꺼 옆부분 -->

				<!-- 옆부분 끝 -->
			</div>
			<!-- 회원관련 끝 -->




		</div>
	</div>

	<!-- checked about checkbox -->
	<script type="text/javascript"
		src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
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
</body>
</html>