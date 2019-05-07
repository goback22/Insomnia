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
	<script src="<c:url value='/vendor/js/admin_datatable.js'/>"></script>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_datatable.css'/>" rel="stylesheet">
	
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
				<div class="col-md-9">
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
										<th class="col-md-2 text-center">BGSCONCERT.b_title</th>
										<th class="text-center">BGSCONCERT.b_content</th>
										<th class="col-md-2 text-center">BGSCONCERT.b_place</th>
										<th class="col-md-2 text-center">CONCERTTIMES.c_concertdate</th>
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<tr class="view">
										<td class="text-center">방구석 제목</td>
										<td class="text-center">방구석 내용</td>
										<td class="text-center">방구석 장소</td>
										<td class="text-center">방구석 날짜</td>
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color:#c8c8c8;">
										<td colspan="4">
									       <div class="fold-content">
									         <table class="table table-bordered example">
									         	<!-- first floor -->
									          <thead>
									            <tr>
													<th><input type="checkbox" value="all"/>&nbsp;&nbsp;no</th>
													<th class="col-md-1">MEMBERS.id</th>
													<th class="col-md-2">BGSAPPLY.ap_title</th>
													<th>BGSAPPLY.ap_content</th>
													<th class="col-md-1">BGSAPPLY.ap_postdate</th>
													<th class="col-md-1">BGSAPPLY.ap_genre</th>
													<th class="col-md-2">apply/deny</th>
									            </tr>
									          </thead>
									          <%-- 				<c:if 없을때 없다고 표시하기1/2> --%>
									          
									          
									          
									        <tbody>
												<tr>
													<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td>
													<td>oin members</td>
													<td>BGSAPPLY</td>
													<td>BGSAPPLY</td>
													<td>2111</td>
													<td>aBGSAPPLY</td>
													<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;2</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2018</td>
												<td>zBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												<tr>
												<td><input type="checkbox" name="allmember"/>&nbsp;&nbsp;3</td>
												<td>join members</td>
												<td>BGSAPPLY</td>
												<td>BGSAPPLY</td>
												<td>2019</td>
												<td>hBGSAPPLY</td>
												<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td>
												</tr>
												
												</tbody>
									          </table>          
									        </div>
									        <div>
												<div class="btn btn-default checkeddelete">삭제</div>
												<div class="btn btn-default checkedapply">수락</div>
												<div class="btn btn-default checkeddeny">거부</div>
											</div>
									      </td>
									    </tr>
										<!-- 위의 detail 끝 -->
									<!-- DB에서 꺼내기 끝 -->
								</table>
							</section>
						</div>
					</div>
				</div>
				<!-- test1 -->
<%-- 				<c:if 없을때 없다고 표시하기2/2> --%>
				<div class="col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								apply test1
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover apply-table">
									<tr>
										<th>id</th><th>genre</th><th>etc</th>
									</tr>
								</table>
							</section>
						</div>
					</div>
				</div>
				
				<!-- test1 end -->
				
				<!-- test2 -->
				<c:if test="${true }" var="trexist">
				<div class="col-md-3" style="float:right;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								apply test2
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover deny-table">
									<tr>
										<th>id</th><th>gernr</th><th>etc</th>
									</tr>
								</table>
							</section>
						</div>
					</div>
				</div>
				</c:if>
				<!-- test2 end -->
				
				
			</div>
			<!--  -->
			
		</div>
		
	</div>
<script>


//수락,거부 버튼
$('.apply').click(function(){
	//console.log("apply single");
	$(this).closest('tr').remove();
	var applytable = "<tr>"
		applytable += 	"<td>id</td>"
		applytable +=	"<td>genre</td>"
		applytable +=	"<td>apply single button</td>"
		applytable +="</tr>"
	$('.apply-table').append(applytable);
});
$('.deny').click(function(){
	$(this).closest('tr').remove();
	var denytable = "<tr>"
		denytable += 	"<td>id</td>"
		denytable +=	"<td>genre</td>"
		denytable +=	"<td>deny single button</td>"
		denytable +="</tr>"
	$('.deny-table').append(denytable);
});

</script>

<!-- checked about checkbox -->
<script>
//checkbox
let memberLength = $(':checkbox[name=allmember]').length;
$(':checkbox:first').click(function(){
	if($(this).is(':checked')){			
		$(':checkbox[name=allmember]').prop('checked',true);
		
	}
	else{
		$(':checkbox[name=allmember]').prop('checked',false);
	}
});
$(':checkbox[name=allmember]').click(function(i){
	if($(':checkbox[name=allmember]:checked').length == memberLength ){
		$(':checkbox:first').prop('checked',true);
	}
	else{
		$(':checkbox:first').prop('checked',false);
	}
});

//선택삭제-1
$(':checkbox[name=allmember]').click(function(){
	if($(this).is(':checked')){
		$(this).addClass('readytodelete');
		console.log("checked");
	}
	else{
		$(this).removeClass('readytodelete');
		console.log("unchecked");
	}
});

$('.checkeddelete').click(function(){
	console.log('delete button');
	if($(':checkbox:first').is(':checked')){
		$(':checkbox:first').prop('checked',false);
	}
	else{
		$('.readytodelete').closest('tr').remove();
	}
});
//선택 수락

//선택 거부

//toggle
$(".view").on("click", function(){
	console.log("click");
	$(this).next(".fold").toggle(500);
});
</script>
<script type="text/javascript">
	
	
</script>


<script>
//sub detail view table
$(document).ready(function() {
    $('.example').DataTable();
} );
</script>
</body>
</html>