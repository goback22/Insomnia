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
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<%-- <script src="<c:url value='/vendor/js/admin_index_chart.js'/>"></script> --%>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<link href="<c:url value='/vendor/css/admin_index_chart.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_pagemove_test.css'/>" rel="stylesheet">
	
	
	<style>
		.c1{
			-webkit-transform:  translateX(-100%);
		    -webkit-transition-timing-function: linear;
		    transition-duration:1s;
		}
	
	</style>
	<script>
	//jQuery ui의 https://jqueryui.com/effect/참조함
		$(function(){
			console.log(${param.fouc});
			if(${param.fouc}==1){
				$("#page-wrapper").effect('slide',{},1000);
			}
			
			
		});
	</script>
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
				<div class="col-md-9">
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
										<th class="text-center">band member?</th>
										<th class="text-center">sub gerne?</th>
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
<%-- 												<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;${totalMembers-(((nowPage-1)*pageSize)+loop.index)}</td> --%>
												<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;${loop.index+1+((nowPage-1)*pageSize)}</td>
												
												<td class="text-center viewDetail">${item.id}</td>
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
																	<th class="col-md-1">NAME</th>
																	<th class="col-md-1">PASSWORD</th>
																	<th class="col-md-1">BIRTHDAY</th>
																	<th class="col-md-1">GENDER</th>
																	<th class="col-md-2">LOGIN_CHAIN</th>
																	<th class="text-center">PROFILE_IMAGE</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>${item.name}</td>
																	<td>${item.password }</td>
																	<td>${item.birthDay }</td>
																	<td>${item.gender }</td>
																	<td>${item.login_chain==null?"홈페이지 통해서 로그인":item.login_chain }</td>
																	<td rowspan="3" class="text-center"><img style="width:50%;"src="<c:url value='/img/unnamed.jpg'/>" alt="등록된 이미지가 없습니다"></td>
																</tr>
															
															<!-- second floor -->
															
																<tr>
																	<th>IS_ACTIVATION</th>
																	<th>EMAIL</th>
																	<th>SMS_RECIEVE</th>
																	<th>EMAIL_RECIEVE</th>
																	<th>DESCRIPTION</th>
																</tr>
															
															
																<tr>
																	<td>${item.is_activation }</td>
																	<td>${item.email }</td>
																	<td>${item.sms_recieve!=null?"문자 수신 동의":"문자 수신 거부" }</td>
																	<td>${item.email_recieve!=null?"메일 수신 동의":"메일 수신 거부" }</td>
																	<td>${item.description==null?"등록된 소개가 없습니다":item.description }</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div align="center">
<!-- 														<div class="btn btn-success memberViewDetail" onclick="memberView()">상세보기>></div> -->
														<a class="btn btn-success memberViewDetail" href="<c:url value='/admin/memberView.ins?id=${item.id}'/>">상세보기>></a>
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
										 <jsp:include page="/WEB-INF/views/admin/template/AdminPagination.jsp" />
<%-- 										 <div class="col-md-12 text-center">${pagingString}</div> --%>
									<!-- 페이징 -->
								</div>
								
								<!-- about checked end -->



							</section>
						</div>
					</div>
				</div>
				<!-- 위에꺼 옆부분 -->
				<div class="col-md-3">
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
				<!-- 옆부분 끝 -->
			</div>
			<!-- 회원관련 끝 -->




		</div>
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
			//$('.fold').hide(100);
			$(this).parent().next(".fold").toggle(300);
// 			$(this).next(".fold").toggle(400);
			
		});
	
	
	
		google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ['gender', 'membercount'],
	        ['남자',	(${totalMemberCount}-${femaleMember})],
	        ['여자',	${femaleMember}]
	      ]);

	      var options = {
	    		  pieHole: 0.4,
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
	    }
	
	</script>
	<!-- pagination -->
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_pagination.js'/>"></script>
	
	
	<script>
		function memberView(){
			//console.log("div memberView check");
			//$('#page-wrapper').css('margin-left','-100%');
			$('#page-wrapper').addClass('c1');
				
			
    
		    setTimeout(function(){
		    	location.href="<c:url value='/admin/memberView.ins?id=${item.id}&fouc=0'/>"
		    },1000);
		    
			//location.href="<c:url value='/admin/memberView.ins'/>";
			
		};
		
	</script>
	
</body>
</html>