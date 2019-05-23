<%@page import="com.kosmo.insomnia.serviceimpl.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminMainContentMember.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_pagination.js'/>"></script>
	<script src="<c:url value='/vendor/js/admin_datatable.js'/>"></script>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_jqbar.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_main_modal.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_datatable.css'/>" rel="stylesheet">
</head>
<body>
<div id="wrapper">
	<!-- top sidebar start -->
	<!-- top sidebar start -->
	<jsp:include page="/WEB-INF/views/admin/template/Top.jsp" />
	<!-- top sidebar end -->
	<!-- main -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-md-12">
				<h1>밴드 목록<small>펀딩 요청 관리</small></h1>
			</div>
		</div>
		<!--  -->
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">밴드일람</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<!-- table test -->
							<table class="table table-hover" style="border-bottom:1px #c8c8c8 solid;">
								<tr>
									<th class="col-md-1"><input type="checkbox" value="all" />&nbsp;&nbsp;no</th>
									<th class="col-md-2 text-center">밴드이름</th>
									<th class="col-md-2 text-center">장르</th>
									<th class="col-md-2 text-center">타이틀</th>
									<th class="col-md-1 text-center">펀딩요청</th>
									<th class="col-md-2 text-center">펀딩시작</th>
									<th class="col-md-1 text-center">펀딩 진행도</th>
									
<!-- 									<th class="col-md-1 text-center">band신청</th> -->
								</tr>
								
								<c:if test="${empty bandlist }" var="isEmpty">
									<tr>
										<td colspan="7">등록된 게시물이 없어요</td>
									</tr>
								</c:if>
								
								<c:if test="${not isEmpty }">
								<c:forEach items="${bandlist }" var="item" varStatus="loop">
									<tr data-tr_value="1" class="view">
										<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;${loop.index+1+((nowPage-1)*pageSize)}</td>
										<td class="text-center viewDetail">${item.b_name }</td>
										<td class="text-center viewDetail">${item.ct_name }</td>
										<td class="text-center viewDetail">${item.bm_title==null?"미등록":item.bm_title }</td>
										<td class="text-center viewDetail">
											<c:forEach items="${bandWaiting }" var="bandWaiting" varStatus="s-loop">
												<c:if test="${bandWaiting.b_no eq item.b_no }" var="isExist">
													${bandWaiting.sw_postdate.substring(0,10) }
												</c:if>
												<input type="hidden" value="${bandWaiting.sw_isaccept }"/>
											</c:forEach>
										</td>
										<td class="text-center viewDetail">
											<c:forEach items="${bandSubmitList }" var="bandSubmitList" varStatus="s-loop">
												<c:if test="${bandSubmitList.b_no eq item.b_no }" var="isExist">
													${bandSubmitList.s_submit_date.substring(0,10) }
												</c:if>
											</c:forEach>
										</td>
										<td class="text-center viewDetail isAccept">
											<c:forEach items="${bandWaiting }" var="bandWaiting" varStatus="s-loop">
												<c:if test="${bandWaiting.b_no eq item.b_no }" var="isExist">
													${bandWaiting.sw_iscomplete=="T"?"진행중":bandWaiting.sw_isaccept=="T"?"수락함":"대기중" }
												</c:if>
<%-- 												<input type="hidden" value="${bandWaiting.sw_isaccept }"/> --%>
											</c:forEach>
											
										</td>
										
<!-- 										<td class="text-center"> -->
<!-- 											<div class="btn btn-default apply">asdasd수락</div> -->
<!-- 										</td> -->
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color: #c8c8c8;">
										<td colspan="7">
											<div class="fold-content">
												<table class="table table-bordered">
													<!-- first floor -->
													<thead>
														<tr>
															<th class="col-md-2">밴드이름</th>
															<th class="col-md-2">소속 멤버</th>
															<th colspan="2">인삿말</th>
															<th class="col-md-3">밴드 커버</th>
														</tr>
													</thead>
													<tbody>
													
														<tr>
															<td>${item.b_name }</td>
															<td>
																<c:forEach items="${bandMember }" var="bandMember" varStatus="loop">
																	<c:if test="${item.b_name==bandMember.b_name }" var="isMember">
																		${bandMember.name=="" or bandMember.name==null?"no member":bandMember.name }<br/>
																	</c:if>
																</c:forEach>
															</td>
															<td colspan="2">${item.b_description }</td>
															<td rowspan="3" align="center">
															<!-- ------------------------------- -->
																<img style="height:30%;"
																src="<c:url value='/upload/band/cover/${item.b_album_cover }'/>" 
																alt="등록된 이미지가 없습니다"> 
																
															<!-- ------------------------------- -->
															</td>
														</tr>
													
														<!-- second floor -->
													
														<c:forEach items="${bandmusiclist }" var="bandMusic" varStatus="loopBM">
															<c:if test="${item.b_no == bandMusic.b_no }" var="isSame">
																<tr>
																	<th>타이틀</th>
																	<th colspan="2">곡 소개</th>
																</tr>
																
																<tr>
																	<td>${bandMusic.bm_name }</td>
																	<td colspan="2">${bandMusic.bm_description }</td>
																</tr>
															</c:if>
															
														</c:forEach>
													
													</tbody>
												</table>
											</div>
											<!-- 신청 여부에 따라 조건 -->
											
											<div class="text-center">
												<c:forEach items="${bandWaiting }" var="bandWaiting" varStatus="s-loop">
													<c:if test="${bandWaiting.b_no eq item.b_no }" var="isExist">
														<c:if test='${bandWaiting.sw_isaccept!="T"}'>
															<div class="btn btn-default apply">수락</div>
															<input type="hidden" value="${item.b_no }"/>
														</c:if>
													</c:if>
													<input type="hidden" value="${bandWaiting.sw_isaccept }"/>
												</c:forEach>
											</div>
										</td>
										
									</tr>
									<!-- 위의 detail 끝 -->
									</c:forEach>
								</c:if>
							</table>
							<!-- table test end -->
<!-- 							<div> -->
<!-- 								<div class="btn btn-default checkeddelete">삭제</div> -->
								<jsp:include page="/WEB-INF/views/admin/template/AdminPagination.jsp" />
<!-- 							</div> -->
						</section>
						<div class="text-center">
							<form class="form-inline" method="post" action="<c:url value='/admin/maincontentmember.ins'/>">
								<div class="form-group">
									<select name="searchColumn" class="form-control">
										<option value="b_name">밴드이름</option>
										<option value="ct_name">장르</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="searchWord" class="form-control" />
								</div>
								<button type="submit" class="btn btn-primary">검색</button>
				
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 첫번째 끝 -->
			<!-- 두번째 시작 -->
			<div class="col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">펀딩 진행중인 목록</h3>
					</div>
					<div class="panel-body feed">
						<div class="data-tables datatable-dark">
							<table class="table table-hover" id="dataTable3" style="border-bottom:1px #c8c8c8 solid;">
							
								<thead>
									<tr>
										<th class="col-md-5 text-center">밴드 이름</th>
										<th class="col-md-4 text-center">목표 금액</th>
										<th class="text-center">목표 기한</th>
									</tr>
								</thead>
							
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 두번째 끝 -->
			<div class="col-md-4" style="float:right;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">펀딩 신청 밴드 목록</h3>
					</div>
					<div class="panel-body feed">
						<section class="feed-item">
							<table class="table table-hover" id="dataTable4" style="border-bottom:1px #c8c8c8 solid;">
								<thead>
									<tr>
										<th class="col-md-5 text-center">밴드 이름</th>
										<th class="col-md-4 text-center">신청 장르</th>
										<th class="text-center">신청날짜</th>
									</tr>
								</thead>
								<tbody class="bandSubmitWaiting">
									
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</div>
		</div>		
	</div>
	<!-- main end -->
</div>

<script type="text/javascript">

$(document).ready(function() {
    $('#dataTable3').DataTable({
     ajax: { 
       type : "POST",
       url : "<c:url value='/admin/bandSubmit.ins'/>",
       dataType : "json",
       /*success:function(data){
        console.log(data);
     },*/    
        error:function(request,error){
     console.log('상태코드:',request.status);
     console.log('서버로부터 받은 HTML데이타 :',request.responseText);
     console.log('에러:',error);               
     }      
     },
     
        columns: [
        	 { "data": "b_name" },
       	  { "data": "s_goal_price" },
       	  { "data": "s_goal_deadline" }]
       });
   });//document.ready
   
   
$(function(){
	$('.apply').click(function(){
		console.log("11111111111");
		//text가져오기
		var applyText = $(this).parent().parent().parent().prev().children('.isAccept').text();
		console.log(applyText.trim());
// 		applyText.parent().html('수락함');
		$(this).parent().parent().parent().prev().children('.isAccept').text("수락함");
		//update 관련
		var applyValue = $(this).next().val();
		console.log(applyValue);
		
		var btn = $(this).parent();
		console.log("1111",btn);
		
		$.ajax({
			//update
			url:"<c:url value='/admin/bandIsacceptApply.ins?b_no="+applyValue+"'/>",
// 			dataType:'json',
			success:function(data){
				console.log("success");
				console.log("2222",btn);
				btn.css("display","none");//ok
				console.log(applyText.trim());
				
// 				location.reload();
				
// 				if(applyText.trim()=='진행중' || applyText.trim()=='수락함'){
// 					$(this).addClass('btn btn-success');
// 					location.reload();
// 				}
			},
			error:function(request,error){
				if(applyText.trim()=='수락함'){
					alert('이미 수락한 밴드입니다');
				}
				else if(applyText.trim()=='대기중'){
					console.log($(this).val());
					alert('대기중인 밴드입니다');
					//location.reload();
				}
				else{
					alert("이미 진행중인 밴드입니다");
				}
				
			}
		})
 	});
	
	$('#dataTable4').DataTable({
	     ajax: {
	       type : "POST",
	       url:"<c:url value='/admin/bandSubmitWaiting.ins'/>",
	       dataType : "json",
	       /*success:function(data){
	        console.log(data);
	     },*/    
	        error:function(request,error){
	     console.log('상태코드:',request.status);
	     console.log('서버로부터 받은 HTML데이타 :',request.responseText);
	     console.log('에러:',error);               
	     }      
	     },
	     
	        columns: [
	        	 { "data": "b_name" },
	       	  { "data": "ct_name" },
	       	  { "data": "sw_postdate" }]
	       });
	   });
	
	
</script>

<!-- checked about checkbox -->
<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
<script type="text/javascript">
	$(".viewDetail").on("click", function() {//[o]
			console.log("click");
			$(this).parent().next(".fold").toggle(400);
	});
</script>

<script src="<c:url value='/vendor/js/admin_main_modal.js'/>" type="text/javascript"></script>


<
</body>
</html>