<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminMainMemberView.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	
	
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_member_view.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/admin_member_view.js'/>"></script>
	
	
</head>
<body>
	<div id="wrapper">
		<!-- top sidebar start -->
		<jsp:include page="/WEB-INF/views/admin/template/Top.jsp" />
		<!-- top sidebar end -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>
						회원관리 <small>누구누구의 상세정보</small>
					</h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">누구누구 상세정보</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<!-- inner -->
								<div class="row" style="margin:0 auto;">
									<div class="col-md-4" style="border:1px solid red;">
										<table class="table">
											<tr>
												<th>
													11111111111112111111111111
												</th>
												
											</tr>
											<tr>	
												<td>
													333333333333333333
												</td>
											</tr>
											<tr>
												<th>
													11111111111112111111111111
												</th>
												
											</tr>
											<tr>	
												<td>
													333333333333333333
												</td>
											</tr>
										</table>
									</div>
									<div class="col-md-3" style="border:1px solid green;">
										<table class="table text-center">
											<tr>
												<th>
												MEMBERS.id
												</th>
												
											</tr>
											<tr>	
												<td>
													<img src="<c:url value='/img/guita.png'/>" alt="등록된 이미지가 없습니다">
												</td>
											</tr>
										</table>
									</div>
									<div class="col-md-4" style="border:1px solid blue;">
										<table class="table">
											<tr>
												<th>
													333333333333333
												</th>
												
											</tr>
											<tr>	
												<td>
													33333333333333333333
												</td>
											</tr>
											<tr>
												<th>
													333333333333333
												</th>
												
											</tr>
											<tr>	
												<td>
													33333
												</td>
											</tr>
										</table>
									</div>
								</div>
								
								<!--  -->
								<div class="grid-button">
								    <span class="grid open"></span>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
</body>
</html>