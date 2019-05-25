<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminNewMember.jsp</title>
<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet"><!-- -3.3.2 -->
<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script><!-- min -->
<!--  -->
<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="<c:url value='/vendor/css/admin_index_chart.css'/>" rel="stylesheet">

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
						회원관리 <small>신규회원</small>
					</h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">회원 전체보기</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox"
									style="border-bottom: 1px #c8c8c8 solid;">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all" />&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">아이디</th>
										<th class="col-md-2 text-center">성명</th>
										<th class="text-center">로그인 방법</th>
										<th class="text-center">연락처</th>
										<th class="text-center">가입일</th>
<!-- 										<th class="col-md-2 text-center">해줄까 말까</th> -->
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<!-- example1 -->
									<c:if test="${empty list }" var="isEmpty">
										<tr>
											<td colspan="6" align="center">가입한 회원이 없..어...없...없습니...없습니다..흑흑</td>
										</tr>
									</c:if>
										
									<c:if test="${!isEmpty }">
										<c:forEach items="${list }" var="item" varStatus="loop">
									<tr class="view">
										<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;${loop.index+1+((nowPage-1)*pageSize)}</td>
										<td class="text-center">${item.id }</td>
										<td class="text-center">${item.name }</td>
										<td class="text-center">${item.login_chain==null?"홈페이지 가입":item.login_chain }</td>
										<td class="text-center">${item.phone}</td>
										<td class="text-center">${item.join_date }</td>
<!-- 										<td class="text-center"> -->
<!-- 											<div class="btn btn-default apply">수락</div> -->
<!-- 											<div class="btn btn-default deny">거부</div> -->
<!-- 										</td> -->
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color: #c8c8c8;">
										<td colspan="6">
											<div class="fold-content">
												<table class="table table-bordered">
													<!-- first floor -->
													
<thead>
														<tr>
															<th>성명</th>
															<th>비밀번호</th>
															<th>생년월일</th>
															<th>로그인 방법</th>
															<th>프로필 사진</th>
															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${item.name }</td>
															<td>
																<c:if test="${item.password==null }" var="password">
																	${item.login_chain }으로 가입
																</c:if>
																<c:if test="${!password }">
																	${item.password }
																</c:if>
															</td>
															<td>${item.birthDay }</td>
															<td>
																<c:if test="${item.login_chain==null }" var="password">
																	Insomnia
																</c:if>
																<c:if test="${!password }">
																	${item.login_chain }으로 가입
																</c:if>
															</td>
															<td rowspan="3"><img style="height:40%;" src="${item.profile_img }" alt="등록된 이미지가 없습니다"></td>
														</tr>
														<tr><th>문자수신</th>
															<th>이메일수신</th>
															<th colspan="2">소개글</th>
														</tr>
														<tr>
															<td>${item.sms_recieve==null?"문자 수신 거부":"수신 승락" }</td>
															<td>${item.email_recieve==null?"이메일 수신 거부":"수신 승락" }</td>
															<td colspan="2">${item.description==null?"등록된 소개가 없습니다":item.description }</td>
														</tr>
													</tbody>

												</table>
											</div>
										</td>
									</tr>
										</c:forEach>
									</c:if>
									<!-- 위의 detail 끝 -->
									<!-- DB에서 꺼내기 끝 -->
								</table>
							</section>


							<div>
								<div class="btn btn-default checkeddelete">삭제</div>
								<div class="btn btn-default">수락</div>
								<div class="btn btn-default">거부</div>
								<jsp:include page="/WEB-INF/views/admin/template/AdminPagination.jsp" />
							</div>

						</div>

					</div>
				</div>
				<div class="col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
							신규 가입회원(선or 막대,날짜)
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<div id="chart_div" style="width: 100%; height: 100%;"></div>
							</section>
						</div>
					</div>
				</div>
			</div>
			<!-- 회원관련 끝 -->




		</div>
	</div>

	<!-- checked about checkbox -->
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
	<script type="text/javascript">
		$(".view").on("click", function() {
			console.log("click");
			$(this).next(".fold").toggle(300);
		});
		
		//date
		var today = new Date();
		var dd = today.getDate();
		var dd2ago = today.getDate()-2;
		var mm = today.getMonth()+1; //January is 0
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		}
		if(dd2ago<10) {
			dd2ago='0'+dd2ago
		}
// 		if(mm<10) {
// 		    mm='0'+mm
// 		}
		var twodaysAgo = mm+'월'+dd2ago+"일";
		today = yyyy+'-'+mm+'-'+dd;
		//new member chart
// 		var twoDayMember=${twodayagoMember};
// 		var yesterDayMember=${yesterdayMember};
// 		var todayMember=${todayMember};

	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['Date', '신규회원'	],
	          [twodaysAgo,  ${twodayagoMember}		],
	          ['yesterday',  ${yesterdayMember}		],
	          ['today',  ${todayMember}	]
	         
	        ]);
	        var options = {
	       	          curveType: 'function',
	       	          legend: 'none',
	    			  lineWidth: 3,
	    			  width:'100%',
	    			  height:300
	    			  
	       	          
	       	        };

	        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
	        chart.draw(data,options);
	      };
	</script>
</body>
</html>