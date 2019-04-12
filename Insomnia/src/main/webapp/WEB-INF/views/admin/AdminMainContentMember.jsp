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
								<tr>
									<th><input type="checkbox" name="all"/></th>
									<th class="col-md-1">no</th>
									<th class="col-md-1 text-center">id</th>
									<th class="col-md-1 text-center">name</th>
									<th class="col-md-7 text-center">about</th>
									<th class="col-md-2 text-center">해줄까 말까</th>
								</tr>
								<!-- td -->
								<tr>
									<td><input type="checkbox" name="allmember"/></td>
									<td>1</td>
									<td class="text-center"><a style="color:black;">choong1kim</a></td>
									<td class="text-center">김충원</td>
									<td class="text-center"><a style="color:black;">모두가 아는 이름</a></td>
									<td class="text-center"><input type="button" value="수락"/><input type="button" value="거부"/></td>
								</tr>
								
								<tr>
									<td><input type="checkbox" name="allmember"/></td>
									<td>2</td>
									<td class="text-center"><a style="color:black;">sgwanabi</a></td>
									<td class="text-center">김진호</td>
									<td class="text-center">술을 찾는 불편한 이유</td>
									<td class="text-center"><div class="btn btn-default">수락</div><div class="btn btn-default">거부</div></td>
								</tr>
							</table>
							<!-- table test end -->
							<div class="btn btn-default">checked delete</div>
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
							<div id="bar-7"></div>
							<div id="bar-8"></div>
							<div id="bar-9"></div>
							<div id="bar-10"></div>
							
						</div>
						
<!-- 						<div id="personalchart1"></div> -->
					</div>
				</div>
			</div>
			<!-- chart? end -->
			<!-- 첫번째 끝 -->
			
			<!-- 두번째 -->
			
			<div class="col-md-11" name="viewmember">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							사람정보
						</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<table class="table">
								<tr>
									<th>no</th>
									<th>id</th>
									<th>name</th>
									<th>column1</th>
									<th>column2</th>
									<th>column3</th>
									<th>column4</th>
									<th>column5</th>
									<th>column6</th>
									<th>column7</th>
									<th>column8</th>
									<th>column9</th>
									<th>column10</th>
								</tr>
								<tr>
									<td>1</td>
									<td>아이디</td>
									<td>이름</td>
									<td>content1</td>
									<td>content2</td>
									<td>content3</td>
									<td>content4</td>
									<td>content5</td>
									<td>content6</td>
									<td>content7</td>
									<td>content8</td>
									<td>content9</td>
									<td>content10</td>
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



<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>

<script src="<c:url value='/vendor/js/admin_jqbar.js'/>" type="text/javascript"></script>
<script type="text/javascript">
let main1 = "모두가 아는 이름";
	$('#bar-7').jqbar({ label: 'Wal', value: 90, barColor: '#D64747', orientation: 'v' });
	$('#bar-8').jqbar({ label: 'Ohi', barColor: '#FF681F', value: 70, orientation: 'v' });
	$('#bar-9').jqbar({ label: 'Song', barColor: '#ea805c', value: 50, orientation: 'v' });
	$('#bar-10').jqbar({ label: 'Pisho', barColor: '#88bbc8', value: 90, orientation: 'v' });
</script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(".text-center a:eq(1)").click(function() {
	$("div[name=chart]").toggle();
});

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
<script>
//$("div[name=viewmember]").hide();
$(".text-center a:eq(0)").click(function(){
	$("div[name=viewmember]").toggle();
});
</script>
</body>
</html>