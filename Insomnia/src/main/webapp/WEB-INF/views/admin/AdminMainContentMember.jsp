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
	
	
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_jqbar.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_main_modal.css'/>" rel="stylesheet">
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
				<h1>main content<small>main content member</small></h1>
			</div>
		</div>
		<!--  -->
		<div class="row">
			<div class="col-md-11">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">band member</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<!-- table test -->
							<table class="table table-hover" style="border-bottom:1px #c8c8c8 solid;">
								<tr>
									<th class="col-md-1"><input type="checkbox" value="all" />&nbsp;&nbsp;no</th>
									<th class="col-md-1 text-center">B_NAME</th>
									<th class="col-md-2 text-center">column1</th>
									<th class="col-md-3 text-center">BM_TITLE</th>
									<th class="col-md-1 text-center">column1</th>
									<th class="col-md-1 text-center">b-LIKED</th>
									<th class="col-md-1 text-center">main신청여부</th>
								</tr>
								
								<c:if test="${empty bandlist }" var="isEmpty">
									<tr>
										<td colspan="7">등록된 게시물이 없어요</td>
									</tr>
								</c:if>
								<c:if test="${not isEmpty }">
								<c:forEach items="${bandlist }" var="item" varStatus="loop">
									<tr data-tr_value="1" class="view">
										<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;1</td>
										<td class="text-center viewDetail" style="cursor:pointer;">${item.b_name }</td>
										<td class="text-center viewDetail">column1</td>
										<td class="text-center viewDetail">${item.bm_title }</td>
										<td class="text-center viewDetail">column1</td>
										<td class="text-center viewDetail">${item.b_liked }</td>
										<td class="text-center">미신청</td>
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color: #c8c8c8;">
										<td colspan="7">
											<div class="fold-content">
												<table class="table table-bordered">
													<!-- first floor -->
													<thead>
														<tr>
															<th>B_NAME</th>
															<th>BANDMEMBER</th>
															<th colspan="4">B_DESCRIPTION</th>
															<th>BI_IMAGE</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${item.b_name }</td>
															<td>BAND.NO<br/>BANDMAMBER.NO,ID<br/>MEMBERS.ID join<br/></td>
															<td colspan="4">${item.b_description }</td>
															<td rowspan="10" align="center">
															<!-- ------------------------------- -->
																<img style="height:30%;" 
																src="<c:url value='/img/unnamed.jpg'/>" 
																alt="등록된 이미지가 없습니다"> 
																
															<!-- ------------------------------- -->
															</td>
														</tr>
													
														<!-- second floor -->
													
														<c:forEach items="${bandmusiclist }" var="bandMusic" varStatus="loopBM">
															<c:if test="${item.b_no == bandMusic.b_no }" var="isSame">
															<tr>
																<th>BM_NAME</th>
																<th colspan="2">BM_DESCRIPTION</th>
															</tr>
															<tr>
																<td>${bandMusic.bm_name }</td>
																<td colspan="2">${bandMusic.bm_description }</td>
															</tr>
															
															</c:if>
														</c:forEach>
													
													</tbody>
												</table>
											</div>
											<!-- 신청 여부에 따라 조건 -->
											<div align="center">
												<div class="btn btn-default apply">수락</div>
												<div class="btn btn-default deny">거부</div>
											</div>
										</td>
										
									</tr>
									
									<!-- 위의 detail 끝 -->
									</c:forEach>
								</c:if>
								
							</table>
							
							<!-- table test end -->
							<div>
								<div class="btn btn-default checkeddelete">삭제</div>
								
							</div>
						</section>
					</div>
				</div>
			</div>
			<!-- 첫번째 끝 -->
			
			
			<!-- 오른쪽 시작 -->
			
<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="panel panel-primary"> -->
<!-- 						<div class="panel-heading"> -->
<!-- 							<h3 class="panel-title">band image</h3> -->
<!-- 						</div> -->
<!-- 						<div class="panel-body feed"> -->
<!-- 							<section class="feed-item"> -->
								
<!-- 							</section> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
			<!-- 오른쪽 끝 -->
			<!-- chart -->
<!-- 			<div class="col-md-4" name="chart"> -->
<!-- 				<div class="panel panel-primary">  -->
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title"> -->
<!-- 							진행중인 chart -->
<!-- 						</h3> -->
<!-- 					</div> -->
<!-- 					<div class="bars"> -->
<!-- 						<div id="bar-1"></div> -->
<!-- 						<div id="bar-2"></div> -->
<!-- 						<div id="bar-3"></div> -->
<!-- 						<div id="bar-4"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- chart? end -->
			
			
			
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
<script src="<c:url value='/vendor/js/admin_jqbar.js'/>" type="text/javascript"></script>
<script type="text/javascript">
//total chart
let showAllOne = "모두가 아는 이름";
	let firstContent = 90;
let showAllTwo = $('.main-content-no').next().next().html();
	let secondContent = 80;
let showAllThree = "main3";
	let thirdContent = 60;
let showAllFour = "maint4";
	let fourthContent = 70;
	$('#bar-1').jqbar({ label: showAllOne, value: firstContent, barColor: '#D64747', orientation: 'v' });
	$('#bar-2').jqbar({ label: showAllTwo, barColor: '#FF681F', value: secondContent, orientation: 'v' });
	$('#bar-3').jqbar({ label: showAllThree, barColor: '#ea805c', value: thirdContent, orientation: 'v' });
	$('#bar-4').jqbar({ label: showAllFour, barColor: '#88bbc8', value: fourthContent, orientation: 'v' });
</script>

<script src="<c:url value='/vendor/js/admin_main_modal.js'/>" type="text/javascript"></script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
//personal chart
let protitle = '모두가 아는 이름';

google.charts.load('current', {
	'packages' : [ 'bar' ]
});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = google.visualization.arrayToDataTable([
			[ 'title', 'goal', 'total', 'male', 'female' ],
			[ protitle, 100, 80, 40, 20 ], ]);
	var options = {
		chart : {
			title : protitle,
			subtitle : protitle,
		}
	};
	var chart = new google.charts.Bar(document
			.getElementById('personalchart'));
	chart.draw(data, google.charts.Bar.convertOptions(options));
}


</script>
<script type="text/javascript">
$('.deny').click(function(){
	console.log("거부버튼");
	//$(this).closest('tr').css("display","none");
	if($(this).is($('.deny'))){
		$(this).removeClass().addClass("btn btn-danger denied").html("거부됨");
		$(this).prev().remove();
	}
	else{
		$(this).removeClass().addClass("btn btn-default deny").html("거절");
		
	}
	
});
var page = 'http://www.naver.com'
$('.apply').click(function(){
	console.log("수락버튼");
	//$(this).closest('tr').css("display","none");
//	$(this).removeClass().addClass("btn btn-success allpied").html("수락됨");
	$(this).removeClass().addClass("btn btn-success allpied").html("").append('<a href="fsdfdf?no=${no}" style="color:white;">수락</a>');
	$(this).next().remove();
});
</script>
</body>
</html>