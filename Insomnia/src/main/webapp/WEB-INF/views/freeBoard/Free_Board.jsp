<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="http://www.superstari.co.kr/design/superstari/inc/15_re/demo-style.css" />
<link rel="stylesheet" type="text/css"
	href="http://www.superstari.co.kr/design/superstari/inc/15_re/search_component.css" />
<link rel="stylesheet" type="text/css"
	href="http://www.superstari.co.kr/design/superstari/inc/15_re/search_default.css" />
<link rel="stylesheet" type="text/css"
	href="http://www.superstari.co.kr/design/superstari/inc/15_re/css2.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Cabin'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="http://www.superstari.co.kr/design/superstari/inc/15_re/normalize.css">
<link rel="stylesheet"
	href="http://www.superstari.co.kr/design/superstari/inc/15_re/cate_test.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="<c:url value='/vendor/css/freeboard.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<c:url value='/vendor/js/PayMoving.js'/>"></script>

<style>
.col-md-3 {
	padding-left: 79px;
}

body {
	background: #000000;
}
 
#example_paginate{
	margin-right: 370px;
}

tr.free_board td{
	text-align: center;
}
table.dataTable th.dt-center, table.dataTable td.dt-center, table.dataTable td.dataTables_empty{
	background: black;
}
</style>

<script>
	$(function() {

		$.extend(true, $.fn.dataTable.defaults, {
			"ordering" : false
		});

		$(document).ready(function() {
			$('#example').DataTable();
		});
			
	});
	
</script>

</head>
<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<jsp:include page="/WEB-INF/template/Nav.jsp" />
		<br /> <br /> <br /> <br />
		<div class="page-body">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6" style="margin-bottom: 70px;">
					<div class="col-md-12">
						<div class="section-title style-four" id="ad">
							<h2>F R E E&nbsp;&nbsp;&nbsp;B O A R D</h2>
						</div>
					</div>
					<div class="col-md-12">
						<table id="example" class="dataTable" style="width: 100%; background: black; color: white;">
							<thead>
								<tr>
									<th style="width: 117px; text-align: center;">번호</th>
									<th style="width: 500px; text-align: center;">제목</th>
									<th style="width: 153px; text-align: center;">작성자</th>
									<th style="width: 190px; text-align: center;">날짜</th>
									<th style="width: 65px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<c:if test="${list.id eq 'admin' }" var="isadmin">
										<tr class="free_board" style="color: aqua; background: dimgray;">
											<td>${list.no}</td>
											<td><a class="list_tltle" href="<c:url value='/freeBoard/Free_Board_One.ins?no=${list.no }'/>" style="color: aqua; font-size: 16px;">${list.title }</a></td>
											<td>${list.name }</td>
											<td>${list.postdate }</td>
											<td>${list.views } </td>
										</tr>
									</c:if>
									<c:if test="${not isadmin }">
										<tr class="free_board" style="color: white; background: black;">
											<td>${list.no}</td>
											<td><a class="list_tltle" href="<c:url value='/freeBoard/Free_Board_One.ins?no=${list.no }'/>" style="color: white; font-size: 16px;">${list.title }</a></td>
											<td>${list.name }</td>
											<td>${list.postdate }</td>
											<td>${list.views } </td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="<c:url value='/freeBoard/Free_Board_Write.ins'/>">
						<input type="button" id="free_write" class="btn btn-info" style="margin-top: -42px; position: absolute; margin-left: 846px;"  value="글쓰기">
					</a>
					<div class="ads_aside">
						<a href="https://studysearch.co.kr/ayl/ggmm2?gclid=Cj0KCQjwnpXmBRDUARIsAEo71tTeFBcMZcBqXDxNOKi3MP9X45XQ2bkt49OVcKFYWmqOI6UCK0aKw58aAnujEALw_wcB" data-original-click-url="https://www.googleadservices.com/pagead/aclk?sa=L&amp;ai=C_zVlEp_GXOiBAZj5rQT97YjgB6vg459W-pWQm6sIxZzN1LAQEAEgiv_CKGCbg-mEnCmgAYa4sbgDyAECqQJUv32iYaUNPqgDAcgDyQSqBPMBT9C9-iCe8Giy4pz7YqO1ExGj9iK8VRqWh-3HgqT3AfT4Qivncsl4xcGlegqjMicjMtzv_FnYuA-OTz1ZpM_Qm1epOE6Ocv5xdumR0IkLD3Vd5g4BMmqI68WSUgi884VLfy1mzqa08milasnQDUTh2VPyj6NP99QkxV5rZkk91P2W7j0sBSrskltGtBSYgOtiEPF1RWo0IVHtgdHYfW0Jycg7PL9IHthMHYhJfz6A1ELqZIhz6ZINsaKODbgalrIMUEn9YSyLxvuCTCHQ5snkPFk4fzIYG4ZEl6NMu8CnBNp_wpw3KawpOpLfZGogrmL1a0nakAYBoAYCgAfix85HiAcBkAcCqAeOzhuoB9XJG6gH4NMbqAe6BqgH2csbqAfPzBuoB6a-G9gHAdIIBggAEAIYCrEJP61ueB1ROOSACgHYEww&amp;ae=1&amp;num=1&amp;cid=CAMSeQClSFh3B1_oIy5-HMEMTPZpPxE7V8Zff9QeoQAz23pZHyzu9cn7YJxhqjnL3t62WV-cdhx7lTvY5rw64KDy2v1LeFKe0GXO1lYzdbkFAIzN-qtW4oGc8r1hTwF4ZXu6DgtwEZuhJo3yewNLY0ppthpW-6QcwSQS21Y&amp;sig=AOD64_2lCu-CWrTDqJ9hp7y-ip_PgpjMFg&amp;client=ca-pub-9184491641313822&amp;adurl=https://studysearch.co.kr/ayl/ggmm2%3Fgclid%3DCj0KCQjwnpXmBRDUARIsAEo71tTeFBcMZcBqXDxNOKi3MP9X45XQ2bkt49OVcKFYWmqOI6UCK0aKw58aAnujEALw_wcB">
							<img src="https://i.ytimg.com/vi/DK91zpCnFOs/maxresdefault.jpg" border="0" alt="" class="img_ad" style="margin-top: 46px; height: 200px; width: 1000px;">
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="ads_aside">
						<a href="https://studysearch.co.kr/ayl/ggmm2?gclid=Cj0KCQjwnpXmBRDUARIsAEo71tTeFBcMZcBqXDxNOKi3MP9X45XQ2bkt49OVcKFYWmqOI6UCK0aKw58aAnujEALw_wcB" data-original-click-url="https://www.googleadservices.com/pagead/aclk?sa=L&amp;ai=C_zVlEp_GXOiBAZj5rQT97YjgB6vg459W-pWQm6sIxZzN1LAQEAEgiv_CKGCbg-mEnCmgAYa4sbgDyAECqQJUv32iYaUNPqgDAcgDyQSqBPMBT9C9-iCe8Giy4pz7YqO1ExGj9iK8VRqWh-3HgqT3AfT4Qivncsl4xcGlegqjMicjMtzv_FnYuA-OTz1ZpM_Qm1epOE6Ocv5xdumR0IkLD3Vd5g4BMmqI68WSUgi884VLfy1mzqa08milasnQDUTh2VPyj6NP99QkxV5rZkk91P2W7j0sBSrskltGtBSYgOtiEPF1RWo0IVHtgdHYfW0Jycg7PL9IHthMHYhJfz6A1ELqZIhz6ZINsaKODbgalrIMUEn9YSyLxvuCTCHQ5snkPFk4fzIYG4ZEl6NMu8CnBNp_wpw3KawpOpLfZGogrmL1a0nakAYBoAYCgAfix85HiAcBkAcCqAeOzhuoB9XJG6gH4NMbqAe6BqgH2csbqAfPzBuoB6a-G9gHAdIIBggAEAIYCrEJP61ueB1ROOSACgHYEww&amp;ae=1&amp;num=1&amp;cid=CAMSeQClSFh3B1_oIy5-HMEMTPZpPxE7V8Zff9QeoQAz23pZHyzu9cn7YJxhqjnL3t62WV-cdhx7lTvY5rw64KDy2v1LeFKe0GXO1lYzdbkFAIzN-qtW4oGc8r1hTwF4ZXu6DgtwEZuhJo3yewNLY0ppthpW-6QcwSQS21Y&amp;sig=AOD64_2lCu-CWrTDqJ9hp7y-ip_PgpjMFg&amp;client=ca-pub-9184491641313822&amp;adurl=https://studysearch.co.kr/ayl/ggmm2%3Fgclid%3DCj0KCQjwnpXmBRDUARIsAEo71tTeFBcMZcBqXDxNOKi3MP9X45XQ2bkt49OVcKFYWmqOI6UCK0aKw58aAnujEALw_wcB">
							<img style="margin-top: 130px;" src="https://tpc.googlesyndication.com/simgad/904511498948388870?sqp=4sqPyQQrQikqJwhfEAEdAAC0QiABKAEwCTgDQPCTCUgAUAFYAWBfcAJ4AcUBLbKdPg&amp;rs=AOga4qleeKK2sSlVeVNOE1kKQ0YviuNkSA" border="0" width="160" alt="" class="img_ad">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>