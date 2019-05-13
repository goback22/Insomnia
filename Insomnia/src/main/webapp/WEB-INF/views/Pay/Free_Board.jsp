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
</style>

<script>
	$(function() {

		$.extend(true, $.fn.dataTable.defaults, {
			"ordering" : false
		});

		$(document).ready(function() {
			$('#example').DataTable();
		});
	})
</script>

</head>
<body id="home-version-1" class="home-version-1" data-style="default">
	<div id="site">
		<jsp:include page="/WEB-INF/template/Nav.jsp" />
		<br /> <br /> <br /> <br />
		<div class="page-body">
			<div class="row">
				<div class="col-md-3"></div>
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
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								<tr class="free_board" style="color: white; background: black; border-bottom: 1px solid red;">
									<td>1</td>
									<td>제목1</td>
									<td>작성자1</td>
									<td>2019-05-10</td>
									<td>1</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>
					<button class="btn btn-info" style="float: right; margin-top: -42px; margin-right: 15px;">글쓰기</button>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>