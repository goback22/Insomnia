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
<!-- 										<th class="col-md-1"><input type="checkbox" value="all"/>&nbsp;&nbsp;no</th> -->
										<th class="col-md-1 text-center">BGSCONCERT.bsgco_no</th>
										<th class="col-md-2 text-center">BGSCONCERT.b_title</th>
										<th class="text-center">BGSCONCERT.b_content</th>
										<th class="col-md-2 text-center">BGSCONCERT.b_place</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<tr class="view">
<!-- 										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td> -->
										<td>1</td>
										<td class="text-center">방구석 제목</td>
										<td class="text-center">방구석 내용</td>
										<td class="text-center">방구석 장소</td>
<!-- 										<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color:#c8c8c8;">
										<td colspan="7">
									       <div class="fold-content">
									         <table class="table table-bordered">
									         	<!-- first floor -->
									          <thead>
									            <tr>
									              <th>name</th>
									              <th>phone</th>
									              <th>birthday</th>
									              
									              <th>SMS_recieve</th>
									              <th>Email_recieve</th>
									              <th></th>
									              <th></th>
									              <th></th>
									            </tr>
									          </thead>
									          <tbody>
									            <tr>
									              <td>김원빈</td>
									              <td>010-1234-5678</td>
									              <td>1981년 09월 03일</td>
									             
									              <td>yes</td>
									              <td>yes</td>
									              <td></td>
									              <td></td>
									              <td class="cur"></td>
									            </tr>
									          </tbody>
									            <!-- second floor -->
									            <thead>
									              <tr>
													<th>b_name</th>
													<th>b_descripition</th>
													<th>b_title</th>
													<th>b_liked</th>
													<th>bi_profile</th>
									              </tr>
									            </thead>
									            <tbody>
									              <tr>
									                <td>한소인</td>
									                <td>저희 밴드는...</td>
									                <td>TT</td>
									                <td><a href="http://www.naver.com">www.naver.com</a></td>
									                <td><img src="<c:url value='/img/preloader.gif'/>" style="height:200px;"></td>
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
								<div class="btn btn-default checkedapply">수락</div>
								<div class="btn btn-default checkdeny">거부</div>
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