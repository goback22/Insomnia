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
				<h1>main content<small>main 신청 정보</small></h1>
			</div>
		</div>
		<!--  -->
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							신청정보
						</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<!-- table test -->
							<table class="table">
								<tr class="main-simple-member">
									<th><input type="checkbox" name="all"/></th>
									<th class="col-md-1">no</th>
									<th class="col-md-1 text-center">id</th>
									<th class="col-md-1 text-center">name</th>
									<th class="col-md-6 text-center">b_name</th>
									<th class="col-md-1 text-center">진행</th>
									<th class="col-md-2 text-center">해줄까 말까</th>
								</tr>
								<!-- td -->
								<tr data-tr_value="1">
									<td><input type="checkbox" name="allmember" value="1"/></td>
									<td class="main-content-no">1</td>
									<td class="text-center more-detail" style="cursor:pointer;">choong1kim@naver.com</td>
									<td class="text-center">김충원</td>
									<td class="text-center">버튼 테트스1</td>
									<th class="text-center">진행중</th>
									<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
								</tr>
								
<!-- 								<tr data-tr_value="2"> -->
<!-- 									<td><input type="checkbox" name="allmember" value="2"/></td> -->
<!-- 									<td class="main-content-no">2</td> -->
<!-- 									<td class="text-center"><a style="color:black;">sgwanabi</a></td> -->
<!-- 									<td class="text-center">김진호</td> -->
<!-- 									<td class="text-center">테스트2</td> -->
<!-- 									<th class="text-center">진행중</th> -->
<!-- 									<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr data-tr_value="3"> -->
<!-- 									<td><input type="checkbox" name="allmember" value="3"/></td> -->
<!-- 									<td class="main-content-no">3</td> -->
<!-- 									<td class="text-center"><a style="color:black;">sgwanabii</a></td> -->
<!-- 									<td class="text-center">김진</td> -->
<!-- 									<td class="text-center">술을</td> -->
<!-- 									<th class="text-center">심사중</th> -->
<!-- 									<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr data-tr_value="4"> -->
<!-- 									<td><input type="checkbox" name="allmember" value="4"/></td> -->
<!-- 									<td>4</td> -->
<!-- 									<td class="text-center"><a style="color:black;">sgwanabii</a></td> -->
<!-- 									<td class="text-center">김호</td> -->
<!-- 									<td class="text-center">불편한 이유</td> -->
<!-- 									<th class="text-center">심사중</th> -->
<!-- 									<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr data-tr_value="5"> -->
<!-- 									<td><input type="checkbox" name="allmember" value="5"/></td> -->
<!-- 									<td>5</td> -->
<!-- 									<td class="text-center"><a style="color:black;">sgwsanabi</a></td> -->
<!-- 									<td class="text-center">진호</td> -->
<!-- 									<td class="text-center">찾는 불편한 이유</td> -->
<!-- 									<th class="text-center">진행중</th> -->
<!-- 									<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
<!-- 								</tr> -->
<!-- 								<tr data-tr_value="6"> -->
<!-- 									<td><input type="checkbox" name="allmember" value="6"/></td> -->
<!-- 									<td>6</td> -->
<!-- 									<td class="text-center"><a style="color:black;">sgwagdnabi</a></td> -->
<!-- 									<td class="text-center">김진호</td> -->
<!-- 									<td class="text-center">술을 이유</td> -->
<!-- 									<th class="text-center">진행중</th> -->
<!-- 									<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
<!-- 								</tr> -->
							</table>
							<!-- table test end -->
							<div>
								<div class="btn btn-default checkeddelete">삭제</div>
								<div class="btn btn-default">수락</div>
								<div class="btn btn-default">거부</div>
								<div align="center">페이징a</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			<!-- chart? -->
			<div class="col-md-4" name="chart">
				<div class="panel panel-primary"> 
					<div class="panel-heading">
						<h3 class="panel-title">
							chart(옮길까 생각중)
						</h3>
					</div>
					
						<div class="bars">
							<div id="bar-1"></div>
							<div id="bar-2"></div>
							<div id="bar-3"></div>
							<div id="bar-4"></div>
						</div>
						
<!-- 						<div id="personalchart1"></div> -->
					
				</div>
			</div>
			<!-- chart? end -->
			<!-- 첫번째 끝 -->
			
			<!-- 두번째 -->

			<div class="col-md-11 main-detail-member-1">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							main content 상세정보
						</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<table class="table">
								<tr>
									<th class="text-center">id</th>
									<th class="text-center">name</th>
									<th class="text-center">b_name</th>
									<th class="text-center">bm-title</th>
									<th class="text-center">b_description</th>
									<th class="text-center">진행여부</th>
									<th class="text-center">bandimage</th>
								</tr>
								<tr>
									<td class="text-center">choong1kim@naver.com</td>
									<td class="text-center">이름</td>
									<td class="text-center">밴드이름없음</td>
									<td class="text-center">타이틀 제목?</td>
									<td>게리롱후리롱 유쥬라잌 커휘 베이비</td>
									<td class="text-center">진행중</td>
									<td class="text-center" rowspan="4"><img src="<c:url value='/img/unnamed.jpg'/>" alt="band image" style="height:200px;"></td>
								</tr>
								<tr>
									<th colspan="4" class="text-center">b_description</th>
									<th class="text-center">시작기간</th>
									<th class="text-center">모집기간</th>
								</tr>
								<tr>
									<td colspan="4" class="text-center">게리롱후리롱 유쥬라잌 커휘 베이비</td>
									<td class="text-center">2019년04월30일</td>
									<td class="text-center">2019년05월30일</td>
								</tr>
								<tr>
									<th class="text-center">b_description</th>
									<th class="text-center">시작기간</th>
									<th class="text-center">모집기간</th>
									<th class="text-center">b_description</th>
									<th class="text-center">시작기간</th>
									<th class="text-center">모집기간</th>
								</tr>
								<tr>
									<td class="text-center">게리롱후리롱 유쥬라잌 커휘 베이비</td>
									<td class="text-center">2019년04월30일</td>
									<td class="text-center">2019년05월30일</td>
									<td class="text-center">게리롱후리롱 유쥬라잌 커휘 베이비</td>
									<td class="text-center">2019년04월30일</td>
									<td class="text-center">2019년05월30일</td>
								</tr>
							</table>
						</section>
					</div>
				</div>
				
				
				
			</div>
			<!-- 두번째 끝 -->
			
		</div>		
	</div>
	<!-- main end -->
</div>

<script type="text/javascript">
$('.main-detail-member-1').hide();

$('.more-detail').click(function(){
	let detailValue= $(this).prev().html();
	console.log('more detail');
	console.log(detailValue);
	$('.main-detail-member-1').toggle(500);
		
	
		
});
</script>

<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>

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

</body>
</html>