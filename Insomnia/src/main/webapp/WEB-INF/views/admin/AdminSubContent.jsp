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
					<h1>sub content <small>sub content 공연 관련</small></h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">
								sub content 공연 전체보기
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th><input type="checkbox" value="all"/></th>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-2 text-center">공연이름</th>
										<th class="col-md-2 text-center">공연날짜/시간</th>
										<th class="col-md-2 text-center">공연장소</th>
										<th class="text-center">kind?(persol/company)</th>
										<th class="col-md-1 text-center">성별</th>
										<th class="col-md-1 text-center">신청</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<tr data-tr_value="1">
										<td><input type="checkbox" name="allmember" value="1"/></td>
										<td class="col-md-1 text-center">1</td>
										<td class="col-md-2 text-center subcontentname" style="border: 1px red solid;">공연이름</td>
										<td class="col-md-2 text-center">공연날짜/시간</td>
										<td class="col-md-2 text-center">공연장소</td>
										<td class="text-center">kind?(persol/company)</td>
										<td class="col-md-1 text-center">성별</td>
										<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
									
										
									</tr>
<!-- -------------------------------------------------------------------------------- -->
<tbody class="about-subcontent">
									<tr style="background-color: #c8c8c8;">
										<td colspan="8" style="border: 1px solid green;"></td>
<!-- 										<td style="border: 1px green solid;"></td> -->
<!-- 										<td style="border: 1px green solid;"></td> -->
<!-- 										<td style="border: 1px green solid;"></td> -->
<!-- 										<td style="border: 1px green solid;"></td> -->
<!-- 										<td style="border: 1px green solid;"></td> -->
<!-- 										<td style="border: 1px green solid;"></td> -->
<!-- 										<td style="border: 1px green solid;"></td> -->
									</tr>
									<tr style="background-color: #c8c8c8;">
										<td colspan="2" style="border: 1px solid green;"></td>
<!-- 										<td style="border: 1px green solid;"></td> -->
										<td style="border: 1px green solid;">공연이름</td>
										<td style="border: 1px green solid;">미친 하드코딩</td>
										<td style="border: 1px green solid;">몸이 고생</td>
										<td style="border: 1px green solid;">미친..</td>
										<td style="border: 1px green solid;">놈</td>
										<td style="border: 1px green solid;"></td>
									</tr>
									<tr style="background-color: #c8c8c8;">
										<td colspan="2" style="border: 1px solid green;"></td>
<!-- 										<td style="border: 1px green solid;"></td> -->
										<td style="border: 1px solid green;">이름</td>
										<td style="border: 1px green solid;">김개똥</td>
										<td style="border: 1px green solid;">장소</td>
										<td style="border: 1px green solid;">앞마당 뒤뜰</td>
										<td style="border: 1px green solid;">여기까지</td>
										<td style="border: 1px green solid;"></td>
									</tr>
									<tr style="background-color: #c8c8c8;">
										<td colspan="2" style="border: 1px solid green;"></td>
<!-- 										<td style="border: 1px green solid;"></td> -->
										<td style="border: 1px solid green;">이름</td>
										<td style="border: 1px green solid;">김개똥</td>
										<td style="border: 1px green solid;">장소</td>
										<td style="border: 1px green solid;">앞마당 뒤뜰</td>
										<td style="border: 1px green solid;">여기까지</td>
										<td style="border: 1px green solid;"></td>
									</tr>
									<tr style="background-color: #c8c8c8;">
										<td colspan="8" style="border: 1px solid green;"></td>
									</tr>
</tbody>									
<!-- -------------------------------------------------------------------------------- -->	 
									<tr data-tr_value="2">
										<td><input type="checkbox" name="allmember" value="2"/></td>
										<td class="col-md-1 text-center">no</td>
										<td class="col-md-2 text-center">공연이름</td>
										<td class="col-md-2 text-center">공연날짜/시간</td>
										<td class="col-md-2 text-center">공연장소</td>
										<td class="text-center">kind?(persol/company)</td>
										<td class="col-md-1 text-center">성별</td>
										<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div>
								<div class="btn btn-default checkeddelete">삭제</div>
									<div class="btn btn-default">수락</div>
									<div class="btn btn-default">거부</div>
									<div align="center">페이징</div>
								</div>
							</section>
							
							
							
							
						</div>
						
					</div>
				</div>
			</div>
			<!-- 회원관련 끝 -->
			
			
			
			
		</div>
	</div>
	
<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script>
$(".about-subcontent").hide();
$('.subcontentname').click(function(){
	console.log('subcontentname');
	$(".about-subcontent").toggle();
	     
	
	
});

</script>
</body>
</html>