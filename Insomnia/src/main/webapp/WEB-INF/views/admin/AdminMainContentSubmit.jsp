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
										<th class="col-md-2 text-center">B_NAME</th>
										<th class="col-md-2 text-center">BM_TITLE</th>
										<th class="col-md-2 text-center">S_GOAL_ACCUMULATION<br/>(누적금액)</th>
										<th class="col-md-2 text-center">S_GOAL_PRICE<br/>(목표금액)</th>
										<th class="col-md-2 text-center">S_SUBMIT_DATE</th>
										<th class="col-md-2 text-center">GOAL_DEADLINE</th>
									</tr>
									<!-- 1번 예 - 반복 -->
									<c:forEach items="${bandSubmit }" var="submitBandList" varStatus="loop">
									<tr class="view">
										<td style="display:none;">${submitBandList.s_no }</td>
										<td>
<!-- 										<input type="checkbox" name="allmember" /> -->
										&nbsp;&nbsp;&nbsp;${loop.index+1+((nowPage-1)*pageSize)}</td>
										<td class="text-center viewDetail" style="cursor: pointer;">${submitBandList.b_name }</td>
										<td class="text-center viewDetail">${submitBandList.bm_title}</td>
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
															<th class="col-md-2">소갯말</th>
															<th class="col-md-2">등록 은행</th>
															<th class="col-md-1">계좌 번호</th>
															<th>앨범 커버</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${submitBandList.b_name }</td>
															<td>${submitBandList.b_description }</td>
															<td>${submitBandList.s_account_bank }</td>
															<td>${submitBandList.s_account_serial }</td>
															<td rowspan="3" align="center"><img style="padding:10px;max-width: 70%; max-height: auto;" src="<c:url value='/upload/band/cover/${submitBandList.b_album_cover }'/>" alt="등록된 이미지가 없습니다"></td>
														</tr>
														<!-- second floor -->
														<tr>
															<th>리워드 이름</th>
															<th>리워드 가격</th>
															<th colspan="2">소개</th>
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
				<!-- 두번째 끝 -->
				<div class="col-md-4" style="float:right;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">진행중인 main content chart2</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<div id="band-chart-2" style="height: 200%;"></div>
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
		$(this).parent().next(".fold").toggle(400);
		
		var click_s_no = $(this).parent().children(0).html();
		console.log(click_s_no);
		
		$.ajax({
			url:"<c:url value='/admin/maincontentchart.ins?s_no="+click_s_no+"'/>",
			dataType:'json',
			success:function(data){
				console.log('datadata:',data);
				if(data.length != 0){
					chartData(data);
				}
				else{
					hideChart();
				}
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로 부터 받은 HTML데이터:',request.responseText);
			}
		});
		
		var hideChart = function(){
			$('#band-chart-2').css('display','none');
		};
		
		function chartData(data){
			$('#band-chart-2').css('display','block');
			var b_name = data[0]['b_name'];
			var qtys=[];
			var rewardName=[];
			
			for(var i=0;i<data.length-1;i++){
				qtys[i]=Number(data[i]['sp_reward_qty']);
				if(data[i]['r_no']==data[i+1]['r_no']){
					qtys[i]=qtys[i]+Number(data[i+1]['sp_reward_qty']);
					rewardName[i]=data[i+1]['r_name'];
				}
				else{
					qtys[i]=Number(data[i+1]['sp_reward_qty']);
					rewardName[i]=data[i+1]['r_name'];
				}
			}
			
			for(var j=0;j<data.length;j++){
				if(!rewardName[j]){
					rewardName[j]='';
				}
			}
			
			//band chart
			google.charts.load('current', {packages: ['corechart']});
			google.charts.setOnLoadCallback(drawBandBasic);
			
			
			var chartHeight = 350;
			function drawBandBasic(data) {
				var data = google.visualization.arrayToDataTable([
					['bandReward', rewardName[0]==null?'':rewardName[0], 
								rewardName[1]==null?'':rewardName[1], 
								rewardName[2]==null?'':rewardName[2],
								rewardName[3]==null?'':rewardName[3],
								'',
						{ role: 'annotation' } ],
					[b_name, qtys[0]==null?0:qtys[0], 
							qtys[1]==null?0:qtys[1], 
							qtys[2]==null?0:qtys[2],
							qtys[3]==null?0:qtys[3],
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