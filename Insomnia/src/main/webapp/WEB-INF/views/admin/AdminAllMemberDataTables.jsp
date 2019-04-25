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
<script src="<c:url value='/vendor/js/admin_index_chart.js'/>"></script>
<!--  -->
<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="<c:url value='/vendor/css/admin_index_chart.css'/>" rel="stylesheet">

<link href="<c:url value='/vendor/css/admin_dataTables.css'/>" rel="stylesheet">

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
								<table id="example" class="display" style="width:100%">
									<thead>
							            <tr>
							                <th>ID</th>
											<th>NAME</th>
											<th>column1</th>
											<th>column2</th>
											<th>JOIN_DATE</th>
							            </tr>
						        	</thead>
						        <tbody>
						        	<c:if test="${empty list }" var="isEmpty">
										<tr>
											<td colspan="4">등록된 게시물이 없어요</td>
										</tr>
									</c:if>
									<c:if test="${!isEmpty }">
										<c:forEach var="item" items="${list}" varStatus="loop">
								            <tr>
								                <td class="text-center viewDetail">${item.id}</td>
												<td class="text-center viewDetail">${item.name}</td>
												<td class="text-center viewDetail">일반1</td>
												<td class="text-center viewDetail">일반2</td>
												<td class="text-center viewDetail">${item.join_date}</td>
								            </tr>
								            
							            </c:forEach>
						            </c:if>
						           </tbody>
								</table>

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
			$('.fold').hide(100);
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
	        pieHole: 0.2
	      };

	      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	      chart.draw(data, options);
	    }
	
	</script>
	<!-- pagination -->
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_pagination.js'/>"></script>
	<script type="text/javascript">
	
	    $('#example').DataTable();
	
	</script>
</body>
</html>