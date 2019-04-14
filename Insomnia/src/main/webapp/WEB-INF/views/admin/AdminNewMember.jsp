<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminNewMember.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet"><!-- -3.3.2 -->
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script><!-- min -->
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	
	
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
					<h1>회원관리 <small>신규회원</small></h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">
								회원 전체보기
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox" style="border-bottom: 1px #c8c8c8 solid;">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all"/>&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">id</th>
										<th class="col-md-2 text-center">name</th>
										<th class="text-center">column1</th>
										<th class="text-center">column2</th>
										<th class="text-center">column3</th>
										<th class="col-md-2 text-center">해줄까 말까</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									
									<tr class="view">
										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td>
										<td class="text-center">choong1kim@naver.com</td>
										<td class="text-center">김원빈</td>
										<td class="text-center">일반1</td>
										<td class="text-center">일반2</td>
										<td class="text-center">일반3</td>
										<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
									</tr>
									<!-- 위의 detail -->
									<tr class="fold">
										<td colspan="6">
								        <div class="fold-content">
								          <table class="table table-bordered">
								            <thead>
								              <tr>
								                <th>name</th><th>Customer no</th><th>Customer name</th><th>Insurance no</th><th>Strategy</th><th>Start</th><th>Current</th><th>Diff</th>
								              </tr>
								            </thead>
								            <tbody>
								              <tr>
								                <td>김원빈</td>
								                <td>13245</td>
								                <td>John Doe</td>
								                <td>064578</td>
								                <td>A, 100%</td>
								                <td>20000</td>
								                <td>33000</td>
								                <td class="cur">13000</td>
								              </tr>
								            </tbody>
								          </table>          
								        </div>
								      </td>
									</tr>
									<!-- 위의 detail 끝 -->
									<!-- DB에서 꺼내기 끝 -->
								</table>
							</section>
							
							
							<div>
								<div class="btn btn-default checkeddelete">삭제</div>
								<div class="btn btn-default">수락</div>
								<div class="btn btn-default">거부</div>
								<div align="center">페이징a</div>
							</div>
							
						</div>
						
					</div>
				</div>
			</div>
			<!-- 회원관련 끝 -->
			
			
			
			
		</div>
	</div>
	
<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">
$(".view").on("click", function(){
	console.log("click");
	$(this).next(".fold").toggle();
});
</script>
</body>
</html>