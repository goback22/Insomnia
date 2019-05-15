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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.min.js"></script>	
	
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
			
				<div class="col-sm-3" style="height:270px;">	
				<!-- 
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								전체회원(남성 여성)
							</h3>
						</div>
						<div class="panel-body feed" style="height:230px;">
							<section class="feed-item">
								<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.min.js"></script>
								<canvas id="canvas"></canvas>
							</section>
						</div>
					</div>
				-->
				
					<div class="info">
						<ul style="list-style-type: none; width:100%; display:inline-flex; padding:0; height:270px;">	
							<li class="info-left" style="background-color:rgb(35, 189, 229); color:white; width:270px;">
							<!-- 내용 들어갈 부분 -->
								<ul class="adminInfo" style="list-style-type:none; color:white;">
									<li style="font-weight:1000; font-size:70px; margin-bottom:-10px;">${totalPeople}</li>
									<li style="font-weight:600; font-size:23px;">Supporters</li>
									<li style="font-weight:1000; font-size:70px; margin-bottom:-10px;">${visitor}</li>
									<li style="font-weight:600; font-size:23px;">Visitors</li>
								</ul>
							</li>
							<li class="info-right" style="background-color:rgb(31, 164, 206); color:white; width:120px; text-align:center;">
								<img src="<c:url value='/resource/img/admin_setting.png'/>" style="margin-top:100px;" onclick="javascript:showVisitor();">
							</li>
						</ul>
					</div>
				</div><!-- col - sm - 3 -->
				 
				 <!--  -->
				<div class="col-sm-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								test
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								 <div id="fourdonutchart" style="height: 100%;"></div>
							</section>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="col-sm-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
							신규 가입회원(오늘 어제 그제)
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
										<th class="text-center">LoginChain</th>
										<th class="text-center">Phone</th>
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
												<td class="text-center viewDetail">${item.login_chain }</td>
												<td class="text-center viewDetail">${item.phone }</td>
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
										<th class="text-center">LoginChain</th>
										<th class="text-center">Phone</th>
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
												<td class="text-center">${item.login_chain }</td>
												<td class="text-center">${item.phone }</td>
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
				
				
			</div>
			<!-- 회원관련 끝 -->
			<div class="row">
			<!-- band member list -->
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								등록된 밴드 현황
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-3 text-center">밴드이름</th>
										<th class="text-center">타이틀</th>
										<th class="text-center">인삿말</th>
										<th class="col-md-1 text-center">좋아요</th>
									</tr>
									<!-- DB에서 꺼내기 -->
									
										<c:forEach items="${bandList }" var="item" varStatus="loop">
											<tr class="view">
												<td class="text-center">${item.b_name }</td>
												<td class="text-center">${item.bm_title }</td>
												<td class="text-center">${item.b_description }</td>
												<td class="text-center">${item.b_liked }</td>
											</tr>
										</c:forEach>
									
									
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/maincontentmember.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
					
				</div>
				<!-- band member list -->
				<!-- band submit -->
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								펀딩 진행중인 밴드 목록
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-3 text-center">밴드명</th>
										<th class="col-md-3 text-center">타이틀</th>
										<th class="col-md-2 text-center">등록 일자</th>
										<th class="col-md-2 text-center">펀딩 기한</th>
										
									</tr>
									<!-- DB에서 꺼내기 -->
									<!--  foreach 시작 -->
									<c:forEach items="${bandSubmitList }" var="bandSubmitList" varStatus="bsStatus">
									<c:if test="${bsStatus.index <=4 }">
										<tr>
											<td class="text-center">${bandSubmitList.b_no }</td>
											<td class="text-center">${bandSubmitList.b_name }</td>
											<td class="text-center">${bandSubmitList.bm_name }</td>
											<td class="text-center">${bandSubmitList.s_submit_date }</td>
											<td class="text-center">${bandSubmitList.s_goal_deadline }</td>		
										</tr>
									</c:if>
									</c:forEach>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/maincontentsubmit.ins'/>">more view</a></div>
							</section>
						</div>
						
						
					</div>
				</div>
				<!-- band submit list -->
			</div>	
			<!-- main band end -->
			
			
			
			
			<!-- 결제관련 -->
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">	
						<div class="panel-heading">
							<h3 class="panel-title">
								메인 결제한 최근 5명 정보
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-3 text-center">서포터</th>
										<th class="col-md-3 text-center">상품</th>
										<th class="col-md-2 text-center">가격</th>
										<th class="col-md-2 text-center">구매일자</th>
										
									</tr>
									<!-- DB에서 꺼내기 -->
									<!--  foreach 시작 -->
									<c:forEach items="${mainFundingList }" var="mainFundingList" varStatus="mfStatus">
									<c:if test="${mfStatus.index <=4 }">
										<tr>
											<td class="text-center">${mainFundingList.sp_no }</td>
											<td class="text-center">${mainFundingList.name }</td>
											<td class="text-center">${mainFundingList.r_name }</td>
											<td class="text-center">${mainFundingList.sumPrice}</td>
											<td class="text-center">${mainFundingList.sp_date }</td>		
										</tr>
									</c:if>
									</c:forEach>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/paymain.ins'/>">more view</a></div>
							</section>
						</div>
						
					</div>
				</div>
			
			
			
				<div class="col-lg-6">
					<div class="panel panel-primary">	
						<div class="panel-heading">
							<h3 class="panel-title">
								서브 결제한 최근 5명 정보
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-3 text-center">콘서트</th>
										<th class="col-md-3 text-center">예매자</th>
										<th class="col-md-2 text-center">가격</th>
										<th class="col-md-2 text-center">입금 여부</th>
										
									</tr>
									<!-- DB에서 꺼내기 -->
									<!--  foreach 시작 -->
									<c:forEach items="${subPayList }" var="subPayList" varStatus="spStatus">
									<c:if test="${spStatus.index <=4 }">
										<tr>
											<td class="text-center">${subPayList.p_no }</td>
											<td class="text-center">${subPayList.b_title}</td>
											<td class="text-center">${subPayList.name}</td>
											<td class="text-center">${subPayList.sumPrice}</td>
											<td class="text-center">${subPayList.non_bankbook_complete}</td>		
										</tr>
									</c:if>
									</c:forEach>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/paysub.ins'/>">more view</a></div>
							</section>
						</div>
						
					</div>
				</div>
			</div>
			<!-- 결제관련 끝 -->
		</div>
	</div>
	
<!-- 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
<script type="text/javascript"></script>
<script>
$(function(){
	//member chart
	/*
	var ctx = document.getElementById("canvas");
	var data = {
	    datasets: [{
	        data: [
	        	Math.round((${totalMemberCount}-${femaleMember})/${totalMemberCount}*100), 
	        	Math.round(${femaleMember}/${totalMemberCount}*100)
	        ],
	        backgroundColor: [
	            "#333EDA",
	            "#DE083D"
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: [
	        "남성회원 : "+(${totalMemberCount}-${femaleMember})+" 명",
	        "여성회원 : "+${femaleMember}+" 명"
	    ]
	};
	var pieChart = new Chart(ctx, {
	    type: 'pie',
	    data: data,
	    options: {
	        tooltips: {
	            callbacks: {
	                label: function(tooltipItems, data) {
	                    return data.labels[tooltipItems.index] + 
	                    " : " + 
	                    data.datasets[tooltipItems.datasetIndex].data[tooltipItems.index] +
	                    ' %';
	                }
	            }
	        }
	    },
	    'chartArea':{
			  'width':'100%',
			  'height':'100%'
		  }
	});
	*/
	    
//new member chart
		//그제
		var nowDate = new Date();
		var twoagoDate = nowDate.getTime() - (2*24*60*60*1000);
		nowDate.setTime(twoagoDate);
		var twoagoMonth = nowDate.getMonth()+1;
		var twoagoDay = nowDate.getDate();
		if(twoagoMonth < 10){
			twoagoMonth = "0"+twoagoMonth;
		}
		if(twoagoDay < 10){
			twoagoDay = "0"+twoagoDay;
		}		
		var resultDate = twoagoMonth+"월 "+twoagoDay+"일";
		
		google.charts.load("current", {packages:["annotationchart"]});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
	    	var data = google.visualization.arrayToDataTable([
	          ['Date', '신규회원'	],
	          [resultDate,  ${twodayagoMember}		],
	          ['yesterday',  ${yesterdayMember}		],
	          ['today',  ${todayMember}	]
	        ]);
	    	var options = {
	    	  displayAnnotations: true,
	    	  legend: 'none',
			  lineWidth: 3,
			  'chartArea':{
				  'width':'80%',
				  'height':'80%'
			  },
			  'hAxis':{
				  'textStyle':{
					  'fontSize':14
				  }
			  },
			  'vAxis':{
				  'textStyle':{
					  'fontSize':14
				  },
			  minValue: 0,
			  },
			  animation:{
	            duration: 1000,
	            startup: true
	          }
			  
   	          
   	        };

		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
		chart.draw(data,options);
      };
//band chart
	var divlength = $('#sub_chart').width();
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
		        width: divlength,
		        legend: { position: 'top', maxLines: 2 },
		        bar: { groupWidth: '60%' },
		        maintainAspectRatio: false,
		        isStacked: true,
			  animation:{
		            duration: 1000,
		            easing: 'linear',
		            startup: true
		          }
		      };
		      var chart = new google.visualization.BarChart(document.getElementById('sub_chart'));

		      chart.draw(data, suboptions);
		    };
 	
});
//4th chart

	var male = ${totalMemberCount}-${femaleMember};
	var female = ${femaleMember};
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'members'],
          ['남성:'+male+' 명',${totalMemberCount}-${femaleMember}],
          ['여성:'+female+' 명',${femaleMember}]
        ]);

        var options = {
          pieHole: 0.4,
        'chartArea':{
			  'width':'80%',
			  'height':'80%'
        },
        legend:{
        	position:'left',
        	textStyle: { 
        		fontSize: 15
        	}
        }
        };

        var chart = new google.visualization.PieChart(document.getElementById('fourdonutchart'));
        chart.draw(data, options);
      }
      
      
      
      
      /////////////////////////////// 2019 05 15 추가 설정 버튼 눌러서 visitor표시
      function showVisitor(){
    	  
      }////showVisitor
      
      
      
      
      
      
</script>
	
</body>
</html>