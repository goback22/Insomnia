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
					<h1>회원관리 <small>전체회원</small></h1>
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
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all"/>&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">id</th>
										<th class="col-md-2 text-center">name</th>
										<th class="text-center">column1</th>
										<th class="text-center">column2</th>
										<th class="text-center">join_date(가입일)</th>
										<th class="col-md-2 text-center">해줄까 말까</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<!-- example1 -->
									<tr class="view">
										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td>
										<td class="text-center">choong1kim@naver.com</td>
										<td class="text-center">김원빈</td>
										<td class="text-center">일반1</td>
										<td class="text-center">일반2</td>
										<td class="text-center">date</td>
										<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color:#c8c8c8;">
										<td colspan="6">
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
									            </tr>
									          </thead>
									          <tbody>
									            <tr>
									              <td>김원빈</td>
									              <td>010-1234-5678</td>
									              <td>1981년 09월 03일</td>
									              <td>yes</td>
									              <td>yes</td>
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
									                <td><img src="<c:url value='/img/unnamed.jpg'/>" style="height:200px;"></td>
									              </tr>
									            </tbody>
									          </table>          
									        </div>
									      </td>
										</tr>
										<!-- 위의 detail 끝 -->
										<!-- example2 -->
									<tr class="view">
										<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;2</td>
										<td class="text-center">example2@naver.com</td>
										<td class="text-center">원빈</td>
										<td class="text-center">일반1</td>
										<td class="text-center">일반2</td>
										<td class="text-center">방구석</td>
										<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
									</tr>
									<!-- example2의 detail -->
									<tr class="fold">
										<td colspan="6">
								        <div class="fold-content">
								          <table class="table table-bordered">
								            <thead>
								              <tr>
								                <th>name</th><th>Customer</th><th>Customer name</th><th>Insurance no</th><th>Strategy</th><th>Start</th><th>Current</th><th>Diff</th>
								              </tr>
								            </thead>
								            <tbody>
								              <tr>
								                <td>원빈</td>
								                <td>133245</td>
								                <td>won bean</td>
								                <td>010108</td>
								                <td>abcde</td>
								                <td>coffee is</td>
								                <td>top</td>
								                <td class="cur">4</td>
								              </tr>
								            </tbody>
								          </table>          
								        </div>
								      </td>
									</tr>
									<!-- example2의 detail 끝 -->
									<!-- DB에서 꺼내기 끝 -->
								</table>
								
								<!-- about checked -->
								<div>
									<div class="btn btn-default checkeddelete">삭제</div>
									<div class="btn btn-default">수락</div>
									<div class="btn btn-default">거부</div>
									<!-- 페이징 -->
									<div class="text-center">
										<ul class="pagination">
										    <li>
										      <a href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
										    <li><a href="#">1</a></li>
										    <li><a href="#">2</a></li>
										    <li><a href="#">3</a></li>
										    <li><a href="#">4</a></li>
										    <li><a href="#">5</a></li>
										    <li>
										      <a href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
										</ul>
									</div>
									<!-- 페이징 -->
								</div>
								<!-- about checked end -->
								
								
								
							</section>
						</div>
					</div>
				</div>
				
				<!-- 위에꺼 옆부분 -->
				
				<!-- 옆부분 끝 -->
			</div>
			<!-- 회원관련 끝 -->
			
			
			
			
		</div>
	</div>
	
<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">
$(".view").on("click", function(){
	console.log("click");
	$(this).next(".fold").toggle(500);
});
</script>
</body>
</html>