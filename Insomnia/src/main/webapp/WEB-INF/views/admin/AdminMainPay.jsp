<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminMainPay.jsp</title>
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
					<h1>결제관련 <small>main결제</small></h1>
				</div>
			</div>
			<!-- 결제 -->
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								main 결제
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all"/>&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">BAND.b_name</th>
										<th class="col-md-2 text-center">PAY.p_total_people</th>
										<th class="col-md-2 text-center">PAY.P_TOTAL_ACCUMULATAION</th>
										<th class="col-md-2 text-center">PAY.P_COMPLETE_DATE</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<!-- example1 -->
									<tr class="view">
										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td>
										<td class="text-center viewDetail">밴드이름</td>
										<td class="text-center viewDetail people">결제한 사람 수150</td>
										<td class="text-center viewDetail cur">모인돈 15000</td>
										<td class="text-center viewDetail">2019-05-30</td>
										
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
														<th>REWARD.R_NAME</th>
														<th>REWARD.R_PRICE</th>
														<th></th>
														<th></th>
														<th></th>
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
										
									<!-- example2 -->
									<tr class="view">
										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;2</td>
										<td class="text-center mainname">진행중인 main band2</td>
										<td class="text-center">김원빈</td>
										<td class="text-center">일반1</td>
										<td class="text-center">일반2</td>
										
									</tr>
									<!-- 위의 detail -->
									<tr class="fold">
										<td colspan="6" style="background-color:#c8c8c8;">
									       <div class="fold-content">
									         <table class="table table-bordered">
									         	<!-- first floor -->
									          <thead>
									            <tr>
									              <th>id</th>
									              <th>r_name</th>
									              <th>r_price</th>
									              <th></th>
									              <th>bank</th>
									              <th>bank</th>
									            </tr>
									          </thead>
									          <tbody>
									            <tr>
									              <td>xyz@naver.com</td>
									              <td>r_name content</td>
									              <td class="cur">1000</td>
									              <td></td>
									              <td>우리은행</td>
									              <td>999-45-67890</td>
									            </tr>
									         	<tr>
									                <td>qwerty@daum.net</td>
									                <td>r_name content</td>
									                <td class="cur">2000</td>
									                <td></td>
									                <td>신한은행</td>
									                <td>111-65-4321</td>
									              </tr>
									            </tbody>
									          </table>          
									        </div>
									      </td>
										</tr>
										<!-- 위의 detail 끝 -->
										
									<!-- DB에서 꺼내기 끝 -->
								</table>
								
								<!-- about checked -->
								<div align="center">
									<!-- 페이징 -->
									paging area
									<!-- 페이징 -->
								</div>
								<!-- about checked end -->
								
								
								
							</section>
						</div>
					</div>
				</div>
				
				<!-- chart -->
				<div class="col-md-3 thischart">
					<div class="panel panel-primary"> 
						<div class="panel-heading">
							<h3 class="panel-title">
								진행중인 band name
							</h3>
						</div>
						<div class="bars" align="center">
<!-- 							<div id="sub_chart" style="height: 100%;"></div> -->
							<div id="bar-1"></div>
							
						</div>
					</div>
				</div>
				<!-- chart end -->
			</div>
			<!--  -->
			<div class="col-sm-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							band진행(보류중)
						</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<div id="sub_chart" style="height: 100%;"></div>
						</section>
					</div>
				</div>
			</div>
			
			
			
		</div>
	</div>

<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">
$('.thischart').hide();

$(".viewDetail").on("click", function() {//[o]
		$(this).parent().next(".fold").toggle(400);
		$('.thischart').toggle(400);
});
</script>
<script src="<c:url value='/vendor/js/admin_jqbar.js'/>" type="text/javascript"></script>
<script type="text/javascript">

//total chart
let showAllOne = "진행중인 band name";
	let firstContent = 90;
	$('#bar-1').jqbar({ label:showAllOne, value: firstContent, barColor: '#D64747', orientation: 'v' });
</script>
<%-- <script src="<c:url value='/vendor/js/admin_chart_test.js'/>" type="text/javascript"></script> --%>

<script type="text/javascript">
//band chart
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBandBasic);
function drawBandBasic() {
	var firstBand = '1st';
	var data = google.visualization.arrayToDataTable([
	        ['bandReward', 'reward1', 'reward2', 'reward3', 'reward4',
	          { role: 'annotation' } ],
	        [firstBand, 10, 24, 20, 32, '']
	      ]);
	      var suboptions = {
	        width: 350,
	        legend: { position: 'top', maxLines: 2 },
	        bar: { groupWidth: '60%' },
	        maintainAspectRatio: false,
	        isStacked: true
	      };
	      var chart = new google.visualization.BarChart(document.getElementById('sub_chart'));
	      chart.draw(data, suboptions);
	    };
});
</script>
</body>
</html>