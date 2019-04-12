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
				<div class="col-md-8">
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
										<th class=""><input type="checkbox" value="all"/></th>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-1 text-center">id</th>
										<th class="col-md-2 text-center">name</th>
										<th class="col-md-2 text-center">email</th>
										<th class="col-md-2 text-center">일반/방구석</th>
										<th class="col-md-2 text-center">phone?</th>
										<th class="col-md-2 text-center">phone?</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<!-- 1.checkbox
										2.아이디?
										3.성명
										4.이메일
										5.연락처
										6.회원구분,등급?
										7.성별
										8.방구석여부?
										삭제버튼 -->
									<tr>
										<td><input type="checkbox" name="allmember"/></td>
										<td class="col-md-1 text-center">1</td>
										<td class="col-md-1 text-center">ddd</td>
										<td class="col-md-2 text-center">김길동</td>
										<td class="text-center">kimkildong@navet.com</td>
										<td class="col-md-2 text-center">일반</td>
										<td class="col-md-2 text-center">010-1234-5678</td>
										<td class="col-md-2 text-center">678</td>
<!-- 										<td class="col-md-1"><input type="button" value="delete"/></td> -->
									</tr>
									<tr>
										<td><input type="checkbox" name="allmember"/></td>
										<td class="col-md-1 text-center">2</td>
										<td class="col-md-1 text-center">aaa</td>
										<td class="col-md-2 text-center">세종</td>
										<td class="col-md-3 text-center">sejong@sejong.kr</td>
										<td class="col-md-2 text-center">방구석</td>
										<td class="col-md-2 text-center">010-5555-5555</td>
										<td class="col-md-2 text-center">55</td>
<!-- 										<td class="col-md-1"><input type="button" value="delete"/></td> -->
									</tr>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>
								
								<!-- about checked -->
<!-- 								<table class="table"> -->
<!-- 									<tr> -->
<!-- 										<td><input type="checkbox" value="all"/>&nbsp;&nbsp;전체선택</td> -->
<!-- 										<td class="col-md-offset-10 col-md-1"><div class="btn btn-default">delete</div></td> -->
<!-- 										<td class="col-md-1"><div class="btn btn-default">another</div></td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
								<!-- about checked end -->
								<div class="btn btn-default">checked delete</div>
								<!-- paging -->
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
								<!-- paging end -->
								
							</section>
						</div>
					</div>
				</div>
				
				<!-- 위에꺼 옆부분 -->
				<div class="col-md-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								회원
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table>
									
								</table>
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

</body>
</html>