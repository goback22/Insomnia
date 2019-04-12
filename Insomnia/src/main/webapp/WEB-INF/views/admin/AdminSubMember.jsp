<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminSubMember.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	
	
	
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
					<h1>회원관리 <small>방구석 회원</small></h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">
								방구석 회원
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th><input type="checkbox" value="all"/></th>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-2 text-center">name</th>
										<th class="col-md-2 text-center">email</th>
										<th class="col-md-2 text-center">phone?</th>
										<th class="text-center">kind?(persol/company)</th>
										<th class="col-md-1 text-center">성별</th>
										<th class="col-md-1 text-center">남친유무</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<tr>
										<th><input type="checkbox" name="allmember"/></th>
										<td class="col-md-1 text-center">1</td>
										<td class="col-md-2 text-center">김길동</td>
										<td class="text-center">kimkildong@navet.com</td>
										<td class="col-md-2 text-center">010-1234-5678</td>
										<td class="text-center">개인회원?</td>
										<th class="col-md-1 text-center">남</th>
										<th class="col-md-1 text-center">x</th>
										<th class="col-md-1"><input type="button" value="delete"/></th>
									</tr>
									<tr>
										<th><input type="checkbox" name="allmember"/></th>
										<td class="col-md-1 text-center">2</td>
										<td class="col-md-2 text-center">세종문화회관</td>
										<td class="col-md-3 text-center">sejong@sejong.kr</td>
										<td class="col-md-2 text-center">010-5555-5555</td>
										<td class="text-center">공연장제공회원?</td>
										<th class="col-md-1 text-center">-</th>
										<th class="col-md-1 text-center">x</th>
										<th class="col-md-1"><input type="button" value="delete"/></th>
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
							</section>
							
							
							<div class="btn btn-default">checked delete</div>
							
						</div>
						
					</div>
				</div>
			</div>
			<!-- 회원관련 끝 -->
			
			
			
			
		</div>
	</div>
	
<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>

</body>
</html>