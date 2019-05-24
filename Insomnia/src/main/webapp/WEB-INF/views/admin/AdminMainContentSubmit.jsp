<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>
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
										<th>
<!-- 										<input type="checkbox" value="all" /> -->
										&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">성명</th>
<!-- 										<th class="col-md-2 text-center">BM_TITLE</th> -->
										<th class="col-md-2 text-center">누적금액</th>
										<th class="col-md-2 text-center">목표금액</th>
										<th class="col-md-2 text-center">펀딩 시작일</th>
										<th class="col-md-3 text-center">마감일</th>
									</tr>
									<!-- 1번 예 - 반복 -->
									<c:forEach items="${bandSubmit }" var="submitBandList" varStatus="loop">
									<tr class="view">
										<td style="display:none;">${submitBandList.s_no }</td>
										<td>
<!-- 										<input type="checkbox" name="allmember" /> -->
										&nbsp;&nbsp;&nbsp;${loop.index+1+((nowPage-1)*pageSize)}</td>
										<td class="text-center viewDetail" style="cursor: pointer;">${submitBandList.b_name }</td>
<%-- 										<td class="text-center viewDetail">${submitBandList.bm_title}</td> --%>
										<td class="text-center viewDetail cur">${submitBandList.s_goal_accumulation==null?"0":submitBandList.s_goal_accumulation }</td>
										<td class="text-center viewDetail cur">${submitBandList.s_goal_price==null?"0":submitBandList.s_goal_price }</td>
										<td class="text-center viewDetail">${submitBandList.s_submit_date.substring(0,10) }</td>
										<td class="text-center viewDetail">${submitBandList.s_goal_deadline.substring(0,10) }</td>
									</tr>
									<!-- 위의 detail1 -->
									<tr class="fold" style="background-color: #c8c8c8;">
										<td colspan="7">
											<div class="fold-content">
												<table class="table table-bordered">
													<!-- first floor -->
													<thead>
														<tr>
															<th class="col-md-2">밴드 이름</th>
															
															<th class="col-md-2">등록 은행</th>
															<th class="col-md-2">계좌 번호</th>
															<th>앨범 커버</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${submitBandList.b_name }</td>
															
															<td>${submitBandList.s_account_bank }</td>
															<td>${submitBandList.s_account_serial }</td>
															<td rowspan="3" align="center"><img style="padding:10px;max-width: 50%; max-height: auto;" src="<c:url value='/upload/band/cover/${submitBandList.b_album_cover }'/>" alt="등록된 이미지가 없습니다"></td>
														</tr>
														<!--  -->
														<tr>
														<th class="col-md-2 text-center" style="line-height:2em;height:2em;" colspan="3">소개</th>
														</tr>
														
														<tr>
														<td colspan="3">${submitBandList.b_description }</td>
														</tr>
														<!--  -->
														<tr>
															<th>리워드 이름</th>
															<th>리워드 가격</th>
															<th colspan="2">리워드 소개</th>
														</tr>
														<c:forEach items="${bandSubmitReward }" var="bandReward" varStatus="loop">
														<c:if test="${submitBandList.s_no eq bandReward.s_no }" var="isSame">
														<tr>
															<td>${bandReward.r_name }</td>
															<td>${bandReward.r_price } 원</td>
															<td colspan="2">${bandReward.r_description }</td>
														</tr>
														</c:if>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<!-- 위의 detail 끝 -->
									
									</c:forEach>
									<!-- 1번 예 끝- 반복 -->
									
								</table>
								<!-- table test end -->
								<div>
<!-- 									<div class="btn btn-default checkeddelete">삭제</div> -->
<!-- 									<div class="btn btn-default">수락</div> -->
<!-- 									<div class="btn btn-default">거부</div> -->
<%-- 									<jsp:include page="/WEB-INF/views/admin/template/AdminPagination.jsp" /> --%>
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
<!-- 								<div id="band-chart" style="height: 200%;"></div> -->
								<div id="band-chart-2" style="height: 200%;"></div>
							<!-- chart1 end -->
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main end -->
	</div>

<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">

	$(".viewDetail").on("click", function() {//[o]
		$('.fold').hide();
		$(this).parent().next(".fold").show(400);
		
		var click_s_no = $(this).parent().children(0).html();
		console.log(click_s_no);
		var datalength='';
		$.ajax({
			url:"<c:url value='/admin/maincontentchart.ins?s_no="+click_s_no+"'/>",
			dataType:'json',
			success:function(rewardData){
				console.log('datadata:',rewardData);
				datalength=rewardData['data'].length;
				chartData(rewardData)
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로 부터 받은 HTML데이터:',request.responseText);
			}
		});
		
		function chartData(rewardData){
			console.log(datalength);
			var b_names=[];
			var qtys = [];
			var r_names = [];
			for(var i=0;i<datalength;i++){
				b_names[i] = rewardData['data'][i]['b_name'];
				qtys[i] = rewardData['data'][i]['qtys'];
				r_names[i] = rewardData['data'][i]['r_name'];
				console.log(b_names[i]);
				console.log(rewardData['data'][i]['qtys']);
				console.log(rewardData['data'][i]['r_name']);
			}
			
			//band chart
			google.charts.load('current', {packages: ['corechart']});
			google.charts.setOnLoadCallback(drawBandBasic);
			function drawBandBasic(data) {
				console.log(typeof(qtys[0]));
				var data = google.visualization.arrayToDataTable([
					["data", 
						r_names[0]==null?'':r_names[0], 
						r_names[1]==null?'':r_names[1], 
						r_names[2]==null?'':r_names[2],
						r_names[3]==null?'':r_names[3],		
								'', 
						{ role: 'annotation' } ],
					[b_names[0],
						Number(qtys[0]==null?'0':qtys[0]), 
						Number(qtys[1]==null?'0':qtys[1]), 
						Number(qtys[2]==null?'0':qtys[2]),
						Number(qtys[3]==null?'0':qtys[3]),
						0, 
						'']
				]);
				var options = {
					legend: { position: 'top', maxLines: 2 },
					bar: { groupWidth: '20%' },
					maintainAspectRatio: false,
					isStacked: true,
					animation:{
						duration: 750,
						easing: 'linear',
						startup: true
					}
				};
				var chart = new google.visualization.BarChart(document.getElementById('band-chart-2'));
				chart.draw(data, options);
			};
		};
	});
</script>
</body>
</html>