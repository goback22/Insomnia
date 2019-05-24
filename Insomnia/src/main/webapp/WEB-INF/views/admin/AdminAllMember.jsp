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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<%-- <script src="<c:url value='/vendor/js/admin_index_chart.js'/>"></script> --%>
	<!--  -->
	<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<link href="<c:url value='/vendor/css/admin_index_chart.css'/>" rel="stylesheet">
<%-- 	<link href="<c:url value='/vendor/css/admin_pagemove_test.css'/>" rel="stylesheet"> --%>
	<style>
		.c1{
			-webkit-transform:  translateX(-100%);
		    -webkit-transition-timing-function: linear;
		    transition-duration:1s;
		}
	
	</style>
	<script>
	//jQuery ui의 https://jqueryui.com/effect/참조함
		$(function(){
			console.log(${param.fouc});
			if(${param.fouc}==1){
				$("#page-wrapper").effect('slide',{},1000);
			}
		});
	</script>
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
					<h1>
						회원관리 <small>전체회원</small>
					</h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">회원 전체보기</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th class="col-md-1"><input type="checkbox" value="all" />&nbsp;&nbsp;no</th>
										<th class="col-md-2 text-center">아이디</th>
										<th class="col-md-2 text-center">성명</th>
										<th class="text-center">가입 방법</th>
										<th class="text-center">연락처</th>
										<th class="text-center">가입일</th>
<!-- 										<th class="col-md-2 text-center">해줄까 말까</th> -->
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<c:if test="${empty list }" var="isEmpty">
										<tr>
											<td colspan="4">등록된 게시물이 없어요</td>
										</tr>
									</c:if>
									<c:if test="${not isEmpty }">
										<c:forEach var="item" items="${list}" varStatus="loop">
											<!-- example1 -->
											<tr class="view">												
<%-- 												<td><input type="checkbox" name="allmember" />&nbsp;&nbsp;${totalMembers-(((nowPage-1)*pageSize)+loop.index)}</td> --%>

													<!-- 블락아이디 처리 -->
												<td><input type="checkbox" name="allmember" value="${item.id }"/>&nbsp;&nbsp;${loop.index+1+((nowPage-1)*pageSize)}</td>
												<c:if test="${item.is_blockmember eq 'Y' }" var="isBlock">
			                                       <td class="text-center viewDetail" style="color:red;font-family:cursive;">${item.id}</td>
			                                    </c:if>
			                                    <c:if test="${!isBlock }">
			                                       <td class="text-center viewDetail">${item.id}</td>
			                                    </c:if>
			                                    	<!-- 블락아이디 처리 끝 -->
												<td class="text-center viewDetail">${item.name}</td>
												<td class="text-center viewDetail">${item.login_chain==null?"Insomnia":item.login_chain }</td>
												<td class="text-center viewDetail">${item.phone }</td>
												<td class="text-center viewDetail">${item.join_date}</td>
<!-- 												<td class="text-center"> -->
<!-- 													<div class="btn btn-default apply">수정</div> -->
<!-- 													<div class="btn btn-default deny">삭제</div> -->
<!-- 												</td> -->
											</tr>
											<!-- 위의 detail -->
											<tr class="fold" style="background-color: #c8c8c8;">
												<td colspan="7">
													<div class="fold-content">
														<table class="table table-bordered">
															<!-- first floor -->
															<thead>
																<tr>
																	<th class="col-md-1">성명</th>
																	<th class="col-md-1">비밀번호</th>
																	<th class="col-md-1">생년원일</th>
																	<th class="col-md-1">성별</th>
																	<th class="col-md-2">가입 방법</th>
																	<th class="text-center">프로필 사진</th>
																</tr>
															</thead>
															<tbody>
																
<tr>
																	<td>${item.name}</td>
																	<td>
<%-- 																	${item.password==null?item.login_chain:item.password } --%>
																		<c:if test="${item.password==null }" var="password">
																			Insomnia
																		</c:if>
																		<c:if test="${!password }">
																			${item.password }
																		</c:if>
																	</td>
																	<td>${item.birthDay }</td>
																	<td>${item.gender }</td>
																	<td>
																		<c:if test="${item.login_chain==null }" var="password">
																			Insomnia
																		</c:if>
																		<c:if test="${!password }">
																			${item.login_chain }으로 가입
																		</c:if>
																	</td>
																	<td rowspan="3" class="text-center"><img style="width:50%;"src="${item.profile_img }" alt="등록된 이미지가 없습니다"></td>
																</tr>
															
															<!-- second floor -->
															
																<tr>
																	<th>메일 인증 여부</th>
																	<th>이메일</th>
																	<th>문자 수신</th>
																	<th>이메일 수신</th>
																	<th>자기소개</th>
																</tr>
															
															
																<tr>
																	<td>${item.is_activation }</td>
																	<td>${item.email }</td>
																	<td>${item.sms_recieve!=null?"문자 수신 동의":"문자 수신 거부" }</td>
																	<td>${item.email_recieve!=null?"메일 수신 동의":"메일 수신 거부" }</td>
																	<td>${item.description==null?"등록된 소개가 없습니다":item.description }</td>
																</tr>


															</tbody>
														</table>
													</div>
													<div align="center">
<!-- 														<div class="btn btn-success memberViewDetail" onclick="memberView()">상세보기>></div> -->
														<a class="btn btn-success memberViewDetail" href="<c:url value='/admin/memberView.ins?id=${item.id}'/>">상세보기>></a>
													</div>
												</td>
											</tr>
											<!-- 위의 detail 끝 -->
											
										</c:forEach>
									</c:if>
									
									<!-- DB에서 꺼내기 끝 -->
								</table>

								<!-- about checked -->
							<div>
									<div class="btn btn-default checkeddelete">선택 차단</div>
									<div class="btn btn-default checkedUnblock">차단 해제</div>
<!-- 									<div class="btn btn-default">수락</div> -->
<!-- 									<div class="btn btn-default">거부</div> -->
									<!-- 페이징 -->
									<jsp:include page="/WEB-INF/views/admin/template/AdminPagination.jsp" />
<%-- 										 <div class="col-md-12 text-center">${pagingString}</div> --%>
									<!-- 페이징 -->
								</div>
								
								<!-- about checked end -->
								
								<div class="text-center">
									<form class="form-inline" method="post" action="<c:url value='/admin/allmember.ins'/>">
										<div class="form-group">
											<select name="searchColumn" class="form-control">
												<option value="id">아이디</option>
												<option value="name">이름</option>
											</select>
										</div>
										<div class="form-group">
											<input type="text" name="searchWord" class="form-control" />
										</div>
										<button type="submit" class="btn btn-primary">검색</button>
						
									</form>
								</div>

							</section>
						</div>
					</div>
				</div>
				<!-- 위에꺼 옆부분 chart -->
				<c:if test="${searchColumn=='' }" var="isnull">
				<div class="col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								전체회원
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
							<!-- - -->
								<div id="donutchart" style="width: 100%;height:100%;"></div>
							<!-- - -->
							</section>
						</div>
					</div>
				</div>
				</c:if>
				<!-- 옆부분 끝 -->
				
				<div class="col-md-3 blockmemberlist">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								차단 회원 목록
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
							<!-- - -->
								<table class="table table-hover" style="border-bottom:1px solid #c8c8c8;">
									<tr>
										<th class="col-md-6">아이디</th><th class="col-md-6">이름</th>
									</tr>
									
									<c:forEach items="${list}" var="blockmember">
										<c:if test="${blockmember.is_blockmember=='Y' }" var="isBlock">
										<tr>
											<td class="blockmemberid">${blockmember.id }</td>
											<td>${blockmember.name }</td>
										</tr>	
										</c:if>
									</c:forEach>
									
								</table>
							<!-- - -->
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
	<script type="text/javascript">
	var checkedId;
	var checkedIdArray=[];
	var blockId;
	
	
	
	$(':checkbox[name=allmember]').click(function(){
		checkedId = $(this).val();
		if($(this).is(':checked')==true){
			checkedIdArray.push(checkedId);
		}
		else{
			var uncheckedIdIndex = checkedIdArray.indexOf(checkedId);
			console.log("uncheckedIdIndex",uncheckedIdIndex);
			if(uncheckedIdIndex >-1){
				checkedIdArray.splice(uncheckedIdIndex,1);
			}//if
		}//else
		
		blockId = {'id':checkedIdArray};
	});//checkbox[name=allmember]
	
	$('.checkeddelete').click(function(){
		$.ajax({
			url:'<c:url value="/admin/memberBlock.ins"/>',
			data:blockId,
			traditional:true,
			success:function(data){
				alert("블랙리스트로 등록합니다.");
				location.reload();
			},
			error:function(){
				alert('블랙리스트 실패');
			}
		});
	});///chekddelelte
	
	$('.checkedUnblock').click(function(){
		$.ajax({
			url:'<c:url value="/admin/memberUnBlock.ins"/>',
			data:blockId,
			traditional:true,
			success:function(data){
				alert("블랙리스트에서 해제합니다.");
				location.reload();
			},
			error:function(){
				alert('블랙리스트 해제 실패');
			}
		});
	});///checkedUnblock
	
	
		
	
	
		$(".viewDetail").on("click", function() {//[o]
// 		$("td.clk").on("click", function() {//[o]
//		$("view td.clk").on("click", function() {//[o]
// 		$(".view").on("click", function() {
			console.log("click");
			console.log($(this));
			//$('.fold').hide(100);
			$(this).parent().next(".fold").toggle(300);
// 			$(this).next(".fold").toggle(400);
			
		});
	
	
	
		google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ['gender', 'membercount'],
	        ['남자',	(${totalMemberCount}-${femaleMember})],
	        ['여자',	${femaleMember}]
	      ]);

	      var options = {
	    		  pieHole: 0.4,
	    	        'chartArea':{
	    				  'width':'80%',
	    				  'height':'80%'
	    	        },
	    	        legend: { 
	    	        	position: "left", 
	    	        	textStyle: { 
	    	        		fontSize: 14 
	    	        	} 
	    	        }
	      };

	      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	      chart.draw(data, options);
	    }
	
	</script>
	<!-- pagination -->
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_pagination.js'/>"></script>
	
	
	<script>
		function memberView(){
			//console.log("div memberView check");
			//$('#page-wrapper').css('margin-left','-100%');
			$('#page-wrapper').addClass('c1');
				
			
    
		    setTimeout(function(){
		    	location.href="<c:url value='/admin/memberView.ins?id=${item.id}&fouc=0'/>"
		    },1000);
		    
			//location.href="<c:url value='/admin/memberView.ins'/>";
			
		};
		
	</script>
	<script type="text/javascript">
	$(function(){
		if($('.blockmemberid').html()==null){
			$('.blockmemberlist').hide();
		}
	});
	
		
	</script>
</body>
</html>