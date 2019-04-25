<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminIndex.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet"><!-- -3.3.2 -->
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script><!-- min -->
<%-- 	<script src="<c:url value='/vendor/js/admin_index_chart.js'/>"></script> --%>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<link href="<c:url value='/vendor/css/admin_index_chart.css'/>" rel="stylesheet">
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	
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
					<h1>전체보기 <small></small></h1>
				</div>
			</div>
			
			<!-- chart -->
			<!-- canvasjs.com -->
			<div class="row">
				<div class="col-sm-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								전체회원(도넛형 남,여)
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
							<!-- - -->
								<div id="donutchart" style="width: 100%;height:100%;"></div>
              				<!-- - -->
							</section>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
							신규 가입회원(선or 막대,날짜)a
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<div id="chart_div" style="width: 100%; height: 100%;"></div>
							</section>
						</div>
					</div>
				</div>
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
				<div class="col-sm-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								sub진행 or band진행 or 방문자수
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								 <div id="cntr"> 
						            The number of visitors is : 
						            <span>0</span>
						        </div>
								<script> 
						            function counter_fn(){
						                var counter = $('#cntr span').text(); // geting value from span
						                var count = 0;
						                count = parseInt(counter.value);//
						                count = count+1;
						                counter.innerHTML = parseInt(count);
						           }
						           window.onload = counter_fn;  
						      	</script>
							</section>
						</div>
					</div>
				</div>
			</div>
			<!-- chart end -->
			
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-6">
				<!-- 전체 회원보기 -->
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								회원 전체 보기
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">ID</th>
										<th class="col-md-2 text-center">NAME</th>
										<th class="text-center">column1</th>
										<th class="text-center">column2</th>
										<th class="text-center">JOIN_DATE</th>
									</tr>
									<!-- DB에서 꺼내기 -->
									<c:if test="${empty allMemberList }" var="isEmpty">
										<tr>
											<td colspan="5">등록된 게시물이 없어요</td>
										</tr>
									</c:if>
									<c:if test="${not isEmpty }">
										<c:forEach var="item" items="${allMemberList}" varStatus="loop">
											<tr>
												<td class="text-center viewDetail">${item.id}</td>
												<td class="text-center viewDetail">${item.name}</td>
												<td class="text-center viewDetail">일반1</td>
												<td class="text-center viewDetail">일반2</td>
												<td class="text-center viewDetail">${item.join_date}</td>
											</tr>
										</c:forEach>
									</c:if>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/allmember.ins'/>">more view</a></div>
							</section>
						</div>
						
					</div>
				</div>
					<!-- 전체회원보기 끝 -->
					<!-- 신규회원 보기 -->
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								신규회원 관리
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-2 text-center">ID</th>
										<th class="col-md-2 text-center">NAME</th>
										<th class="text-center">column1</th>
										<th class="text-center">column2</th>
										<th class="text-center">JOIN_DATE</th>
									</tr>
									<!-- DB에서 꺼내기 -->
									<c:if test="${empty newMemberList }" var="isEmpty">
										<tr>
											<td colspan="6" align="center">등록된 게시물이 없어요</td>
										</tr>
									</c:if>
										
									<c:if test="${!isEmpty }">
										<c:forEach items="${newMemberList }" var="item" varStatus="loop">
											<tr class="view">
												<td class="text-center">${item.id }</td>
												<td class="text-center">${item.name }</td>
												<td class="text-center">일반1</td>
												<td class="text-center">일반2</td>
												<td class="text-center">${item.join_date }</td>
											</tr>
										</c:forEach>
									</c:if>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/newmember.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
				</div>
				<!-- 신규회원 보기 끝 -->
				<!-- band member list -->
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								band list
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="text-center">no</th>
										<th class="col-md-1 text-center">BAND.b_name</th>
										<th class="text-center">BAND.bm_title</th>
										<th class="text-center">BANDMUSIC.bm_name</th>
										<th class="col-md-1 text-center">BAND.b_liked</th>
									</tr>
									<!-- DB에서 꺼내기 -->
									<tr>
										<td class="text-center">1</td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
									</tr>
									<tr>
										<td class="text-center">2</td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/maincontentmember.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
					<!-- band member list -->
				</div>
				
				<!-- band submit -->
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								진행중인 밴드목록
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="text-center">no</th>
										<th class="col-md-1 text-center">BAND.b_name</th>
										<th class="col-md-1 text-center">BAND.bm_title</th>
										<th class="text-center">BANDSUBMIT.s_submit_date</th>
										<th class="text-center">BANDSUBMIT.s_goal_deadline</th>
										
									</tr>
									<!-- DB에서 꺼내기 -->
									<tr>
										<td class="text-center">1</td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										
									</tr>
									<tr>
										<td class="text-center">2</td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/maincontentsubmit.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
					<!-- band member list -->
				</div>
				<!--  -->
			</div>
			<!-- 회원관련 끝 -->
			<!-- main content -->
			<div class="row">
				<div class="col-lg-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								main content관련-앨범 만들어주는 컨텐츠
							</h3>
						</div>
						<div class="panel-body">
							<h3>앨범 만들어주고픈 회원?</h3>
							<!-- table -->
							<table class="table table-hover">
								<tr>
									<th>no</th>
									<th>ID</th>
									<th>name</th>
									<th>앨범이름</th>
									<th>e mail</th>
									<th>column1</th>
									<th>column2</th>
									<th>column3</th>
									<th>column4</th>
								</tr>
								<!--  -->
								<tr>
									<td>1</td>
									<td>gerilong</td>
									<td>게리롱</td>
									<td>funny powder</td>
									<td>gerilong@naver.com</td>
									<td>column1</td>
									<td>column2</td>
									<td>column3</td>
									<td>column4</td>
								</tr>
								<tr>
									<td>no</td>
									<td>hoorilong</td>
									<td>name</td>
									<td>phone</td>
									<td>e mail</td>
									<td>column1</td>
									<td>column2</td>
									<td>column3</td>
									<td>column4</td>
								</tr>
								
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
								</tr>
							</table>
							<!-- table end -->
							<div class="" style="text-align: right;margin-right: 30px;">
								<a href="<c:url value='/admin/maincontent.ins'/>">more view</a></div>
						</div>
					</div>
				</div>
			</div>
			<!-- main content end -->
			<!-- sub content -->
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								sub content관련-아티스트 모으고 공연장 섭외해서 공연기획
							</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th class="col-md-1">no</th>
									<th class="col-md-2 text-center">아이디</th>
									<th class="col-md-2 text-center">이름</th>
									<th class="col-md-1 text-center">이메일</th>
									<th class="text-center">is방구석</th>
									<th class="text-center">column</th>
									<th class="col-md-1 text-center">yes or no</th>
								</tr>
								
								<tr>
									<td class="">1</td>
									<td class="text-center">queen</td>
									<td class="text-center">후레디멐유리</td>
									<td class="text-center">queen@naver.com</td>
									<td class="text-center">방구석</td>
									<td class="text-center">content1</td>
									<td class="text-center">yes or no</td>
								</tr>
								<tr>
									<td class="">2</td>
									<td class="text-center">redmarx</td>
									<td class="text-center">마르크스</td>
									<td class="text-center">redmarx@han.net</td>
									<td class="text-center">일반</td>
									<td class="text-center">text-center</td>
									<td class="text-center">yes or no</td>
								</tr>
							</table>
							<div class="" style="text-align: right;margin-right: 5px;">
								<a href="<c:url value='/admin/subcontent.ins'/>">more view</a></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								sub content관련-아티스트 목록(신청한사람?)
							</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th class="col-md-1 text-center">no</th>
									<th class="col-md-2 text-center">ID</th>
									<th class="col-md-2 text-center">성명</th>
									<th class="col-md-1 text-center">Email</th>
									<th class="col-md-1 text-center"></th>
									<th class="text-center">제목</th>
									<th class="col-md-1 text-center">수락여부</th>
								</tr>
								
								<tr>
									<td class="">1</td>
									<td class="text-center">mamison</td>
									<td class="text-center">마미손</td>
									<td class="text-center">hand@naver.com</td>
									<td class="text-center"></td>
									<td class="">제목?</td>
									<td class="text-center">yes or no</td>
								</tr>
								<tr>
									<td class="">2</td>
									<td class="text-center">do</td>
									<td class="text-center">이현도</td>
									<td class="text-center">do@hanmail.net</td>
									<td class="text-center"></td>
									<td class="">제에목?</td>
									<td class="text-center">yes or no</td>
								</tr>
							</table>
							<div class="" style="text-align: right;margin-right: 5px;">
								<a href="#">more view</a></div>
						</div>
					</div>
				</div>
			</div>
			<!-- sub content end -->
			
			<!-- 결제관련 -->
			<div class="row">
				<div class="col-lg-7">
					<div class="panel panel-primary">	
						<div class="panel-heading">
							<h3 class="panel-title">
								결제 진행 목록?결제 완료된 회원?
							</h3>
						</div>
						<div class="panel-body">
							<h1>아직</h1>
						</div>
					</div>
				</div>
				
				<div class="col-lg-5">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								표 팔고 있는 공연 목록
							</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th class="col-md-1">no</th>
									<th class="col-md-3 text-center">공연이름</th>
									<th class="col-md-2 text-center">공연날짜</th>
									<th class="col-md-2 text-center">총좌석수</th>
									<th class="text-center">장소</th>
								</tr>
								
								<tr>
									<td class="col-md-1">1</td>
									<td class="col-md-3 text-center">여놀자</td>
									<td class="col-md-2 text-center">2019-04-07</td>
									<td class="col-md-2 text-center">400</td>
									<td class="text-center">강변북로</td>
								</tr>
								<tr>
									<td class="col-md-1">2</td>
									<td class="col-md-3 text-center">기타들고모여</td>
									<td class="col-md-2 text-center">2019-04-09</td>
									<td class="col-md-2 text-center">500</td>
									<td class="text-center">아르코예술극장</td>
								</tr>
								<tr>
									<td class="col-md-1">3</td>
									<td class="col-md-3 text-center">드림콘서트</td>
									<td class="col-md-2 text-center">2019-04-01</td>
									<td class="col-md-2 text-center">1500</td>
									<td class="text-center">드림랜드 마당</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 결제관련 끝 -->
		</div>
	</div>
	
<!-- 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
<script type="text/javascript">
$(function(){
	//total member	
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawAllMemberChart);
    function drawAllMemberChart() {
      var data = google.visualization.arrayToDataTable([
        ['gender', 'membercount'],
        ['남자',	(${totalMemberCount}-${femaleMember})],
        ['여자',	${femaleMember}]
      ]);

      var options = {
        pieHole: 0.2,
        'chartArea':{
			  'width':'80%',
			  'height':'80%'
        },
        legend: { 
        	position: "left", 
        	textStyle: { 
        		fontSize: 14 
        	} 
        }
        
      };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
      
    };
	    
//new member chart
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
		var twodaysAgo = mm+'월'+dd2ago+"일";
		today = yyyy+'-'+mm+'-'+dd;

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
			  'chartArea':{
				  'width':'80%',
				  'height':'80%'
			  },
			  'hAxis':{
				  'textStyle':{
					  'fontSize':12
				  }
			  },
			  'vAxis':{
				  'textStyle':{
					  'fontSize':12
				  }
			  }
			  
   	          
   	        };

		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
		chart.draw(data,options);
      };
//band chart
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBandBasic);
	function drawBandBasic() {
		var firstBand = '1st';
		var secondBand = '2nd';
		var thirdBand = '3rd';
		var data = google.visualization.arrayToDataTable([
		        ['bandReward', 'reward1', 'reward2', 'reward3', 'reward4',
		          { role: 'annotation' } ],
		        [firstBand, 10, 24, 20, 32, ''],
		        [secondBand, 16, 22, 23, 20, ''],
		        [thirdBand, 28, 19, 29, 20, '']
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