<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminMainPay.jsp</title>
<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet">
<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script>
<!--  -->
<link href="<c:url value='/vendor/css/admin_adminmaincss.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/admin_allmember_accordian.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/admin_jqbar.css'/>" rel="stylesheet">

<!-- 아임포트 -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
						결제관련 <small>main결제</small>
					</h1>
				</div>
			</div>
			<!-- 결제 -->
			<div class="row">
				<div class="col-md-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">main 결제</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover" id="membercheckbox">
									<tr>
										<th class="col-md-1">번호</th>
										<th class="col-md-2 text-center">밴드이름</th>
										<th class="col-md-1 text-center">참여 인원</th>
										<th class="col-md-2 text-center">펀딩 총액</th>
										<th class="col-md-2 text-center">목표 금액</th>
										<th class="col-md-2 text-center">종료 기한</th>
										<th class="col-md-1 text-center">완료</th>
										<!-- 삭제 버튼을 위한 한줄 -->
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<!-- example1 -->
									<c:forEach var="map" items="${selectSafepayList}" varStatus="loop">
										<c:if test="${map['B_NAME'] ne 'Supporters'}">
											<tr class="view views">
												<td>${loop.index+1}</td>
												<td class="text-center viewDetail">${map["B_NAME"] }</td>
												<td class="text-center viewDetail people">${map["fundCountpeople"] }</td>
												<td class="text-center viewDetail cur">${map["S_GOAL_ACCUMULATION"] }</td>
												<td class="text-center viewDetail">${map["S_GOAL_PRICE"] }원</td>
												<td class="text-center viewDetail">${map["S_GOAL_DEADLINE"] }</td>
												<c:if test="${map['isPaying'] == 'F' }">
													<td class="text-center viewDetail"><button class="btn btn-default" id="${map['S_NO'] }" onclick="javascript:complete(this)">펀딩 완료!</button></td>
												</c:if>
												<c:if test="${map['isPaying'] == 'T' }">
													<td class="text-center viewDetail">완료된 펀딩</td>
												</c:if>
											</tr>
											
											<tr class="fold" style="background-color: #c8c8c8;">
												<td colspan="6">
													<div class="panel panel-primary">
														<div class="panel-heading">
															<h3 class="panel-title" style="text-algin: center">상세보기</h3>
														</div>
														<div class="fold-content" id="div${map['S_NO']}">
															<!-- 들어갈 내용 -->
														</div>
													</div>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</section>
						</div>
					</div>
				</div>

				<!-- chart -->
				<div class="col-md-3 thischart">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title" id="bandName">진행중인 band name</h3>
						</div>
						<div class="bars" align="center">
							<!-- 							<div id="sub_chart" style="height: 100%;"></div> -->
							<div id="bar-1">
							
							</div>

						</div>
					</div>
				</div>
				<!-- chart end -->
			</div>

		</div>
	</div>

	<!-- checked about checkbox -->
	<script type="text/javascript" src="<c:url value='/vendor/js/admin_allchecked.js'/>"></script>
	<script type="text/javascript">
		$(".viewDetail").on("click", function() {//[o]
			$('#bar-1').html(''); //html초기화
			$(".fold").hide();
			$(this).parent().next(".fold").toggle(400);
			$('.thischart').show(400);
			//total chart
			let bandName = $(this).parent().children().eq(1).html();
			let goal_price = $(this).parent().children().eq(4).html().replace(/,/gi,'').replace('원','');
			let goal_accumulation = $(this).parent().children().eq(3).html().replace(/,/g,"").replace('원','');
// 			console.log(goal_price, "   ", goal_accumulation )
			$('#bandName').html(bandName);
			
			if (goal_accumulation != 0 || goal_accumulation != null)
				if(goal_accumulation / goal_price * 100 < 100){
					$('#bar-1').jqbar({
						label : bandName,
						value : parseInt(goal_accumulation / goal_price * 100),
						barColor : '#D64747',
						orientation : 'v'
					});
				}
				else{
					$('#bar-1').jqbar({
						label : bandName,
						value : parseInt((goal_accumulation / goal_price * 100) % 100),
						barColor : '#D64747',
						orientation : 'v'
					});
						let k = parseInt(goal_accumulation / goal_price);
					for(let index = 0; index < k;  index++){
						$('#bar-1').children().eq(index+1).before($('#bar-1').children().eq(1).clone());
						$('#bar-1').children().eq(index+1).children().prop("style","height: 200px; top:0px; width: 10px; background-color: rgb(214, 71, 71);");
						$('#bar-1').children().eq(index+1).prop("style","height: 200px; width: 10px;margin-right:10px;")
					}
// 					.attr().prop("style", "")
// 					.chidren().prop("style", "height: 200px; top: 0px; width: 10px; background-color: rgb(214, 71, 71)")

// 					console.log("/100:",parseInt(goal_accumulation / goal_price));
// 					console.log("asdasdasd" + $('#bar-1').children().eq(1).clone().wrapAll('<div/>').parent().html());
// 					console.log("%100:" , (goal_accumulation / goal_price * 100) % 100);
				}
		});
	</script>
	<script src="<c:url value='/vendor/js/admin_jqbar.js'/>" type="text/javascript"></script>
	<script type="text/javascript">
		
	</script>
	<%-- <script src="<c:url value='/vendor/js/admin_chart_test.js'/>" type="text/javascript"></script> --%>

	<script type="text/javascript">
		let elthis;
		$(function() {
			
			$(".views").one("click", function() {
				showDetailPay($(this).children(0).html());
				elthis = $(this);	
				
// 				console.log("$this:" + elthis.next().children().children().children(1).next().html());

			});
		});
		function showDetailPay(div) {
			$.ajax({
						url : "<c:url value='/admin/selectBandSafepayDetail.ins'/>", // 클라이언트가 요청을 보낼 서버의 URL 주소
						data : {
							S_NO : div
						}, // HTTP 요청과 함께 서버로 보낼 데이터
						type : "GET", // HTTP 요청 방식(GET, POST)
						dataType : "text" // 서버에서 보내줄 데이터의 타입
					})
					// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
					.done(
					function(data) {
// 						console.log(data);
						var tableString = '';
						if (data.length > 2) {
							tableString += "<table class='table table-hover'>";
							tableString += "<tr class='view views'> ";
							tableString += "<th class='col-md-1 text-center'>리워드 번호</th> ";
							tableString += "<th class='col-md-1 text-center'>구매자</th> ";
							tableString += "<th class='col-md-1 text-center'>소개</th> ";
							tableString += "<th class='col-md-1 text-center'>리워드 이름</th> ";
							tableString += "<th class='col-md-1 text-center'>가격</th> ";
							tableString += "<th class='col-md-1 text-center'>수량</th> ";
							tableString += "<th class='col-md-1 text-center'>펀딩 날짜</th> ";
							tableString += "<th class='col-md-1 text-center'>후원금</th> ";
							tableString += "</tr> ";
							$.each(JSON.parse(data),
							function(index, element) {
							//index = element["ap_no"];
// 							var SP_REWARD_QTY = element["SP_REWARD_QTY"];
// 							var R_DESCRIPTION = element["R_DESCRIPTION"];
// 							var SP_DATE = element["SP_DATE"];
// 							var R_NAME = element["R_NAME"];
// 							var R_PRICE = element["R_PRICE"];
// 							var R_NO = element["R_NO"];
// 							var ID = element["ID"];
// 							var SP_SUPPORT = element["SP_SUPPORT"];
							tableString += "<tr style='text-align:center;'>";
							tableString += "<td class='col-md-1'>"
									+ element["R_NO"]
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ element["NAME"] + "(" 
									+ element["ID"] + ")"
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ "<p class = 'ellip'>"
									+ element["R_DESCRIPTION"]
									+ "</p>"
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ element["R_NAME"]
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ element["R_PRICE"]
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ element["SP_REWARD_QTY"]
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ element["SP_DATE"]
									+ "</td>";
							tableString += "<td class='col-md-1'>"
									+ element["SP_SUPPORT"]
									+ "</td>";
							tableString += "</tr>";
						});
						} else {
							tableString += "<table class='table table-hover'>";
							tableString += "<tr class='view views'> ";
							tableString += "<th class='col-md-12 text-center'>결제 내역이 없습니다.</th> ";
							tableString += "</tr>";
							tableString += "</table>";
						}
						tableString += "</table> ";
						$('#div' + String(div)).append(tableString);
						//여기에 추가함
						var childCount = elthis.next().children().children().children(1).next().children().children().children().length;
						var len = 40;
// 						console.log("childCount:" + childCount);
						for(var i =0; i <childCount; i++){
							var p = elthis.next().children().children().children(1).next().children().children().children().eq(i+1).children().eq(2).children().get(0);
							if (p) {
								var trunc = p.innerHTML;
							 	if (trunc.length > len) {
							    trunc = trunc.substring(0, len);
// 							    console.log("trunc" + trunc);
							    trunc = trunc.replace(/\w+$/, '');
							    trunc += '<a href="#" ' +
							      'onclick="this.parentNode.innerHTML=' +
							      'unescape(\''+escape(p.innerHTML)+'\');return false;">' +
							      '...<\/a>';
							    p.innerHTML = trunc;
							  	}
							}
						}
					})
			// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				$("#text").html("오류가 발생했습니다.<br>")
				.append("오류명: " + errorThrown + "<br>")
				.append("상태: " + status);})
			// HTTP 요청이 성공하거나 실패하는 것에 상관없이 언제나 always() 메소드가 실행됨.
			.always(function(xhr, status) {
				$("#text").html("요청이 완료되었습니다!");
			});
		};
		
		
		
		
		//////////2019 05 13 임한결 추가 /// admin에서 최종 결제진행
		//1. admin에서 버튼 추가해서 버튼 누르면 accumulation이 밴드가 등록한 계좌로 넘어감
		//2. 해당 밴드에게 펀딩 성공 email을 보냄
		function complete(obj){
		   //1. complete 결제
		   var s_no = $(obj).attr("id");
		   var s_noJson = {'s_no':s_no};
		   //Pay테이블에 insert
		   
		   ///////////////////////////결제에 필요한 정보를 가져오는 ajax
		      $.ajax({
		      url:'<c:url value="/Pay/getDataForPayComplete.ins"/>',
		      data:s_noJson,
		      dataType:"json",
		      type:'post',
		      success:function(data){
		         successPay(data);
		      },
		      error:function(error, request){}
		   });//ajax
		   /////////////////////////////////////////////// 결제창 띄우기

		   ////////////////////////////////////////////////////////

		   
		   //2. 해당밴드에게 펀딩 성공 email을 보냄
		   $.ajax({
		      url:'<c:url value="/Pay/sendEmailComplete.ins"/>',
		      data:s_noJson,
		      dataType:'text',
		      type:'post',
		      success:function(data){},
		      error:function(error, request){
		         console.log("상태코드 : " , request.status);
		         console.log("서버로부터 받은 HTML데이터 : ", request.responseText);
		         console.log("에러", error);}
		   });//ajax
		}//// 결제 관련창을 호출하는 ajax함수


		var successPay = function(info){
		   var IMP = window.IMP; // 생략가능
		   IMP.init('imp72281032');
		   IMP.request_pay({
		      merchant_uid : 'merchant_' + info["uid"],
		      name : info['b_name'],
		      amount : info['s_goal_accumulation'],
		      buyer_tel : info['tel'],
		      m_redirect_url : '<c:url value="/Pay/MainPayComplete.ins"/>'
		   }, function(rsp) {
		      console.log(rsp);
		      if (rsp.success) {
		         var msg = '결제가 완료되었습니다.';
		         isComplete = true;
		      } else {
		         var msg = '결제에 실패하였습니다.';
		         isComplete = false;
		         $.ajax({
		            url: "/insomnia/Pay/PayCancle.ins",
		            success:function(){
		               console.log("성공");
		            },
		            error:function(){
		               console.log("실패");
		            }
		         })
		         isComplete = false;
		      }
		      alert(msg);
		      if(isComplete){
		         var s_no = info['s_no'];
		         var p_uid_no = info['p_uid_no'];
		         var completeJson = {'s_no':s_no, 'p_uid_no':p_uid_no};
		         //pay 테이블에 추가 마무리
		         $.ajax({
		            url:'<c:url value="/Pay/InsertPayComplete.ins"/>',
		            data:completeJson,
		            dataType:'text',
		            type:'post',
		            success:function(data){
		               alert('pay테이블 입력 성공');
		               location.reload();
		            },
		            error:function(error, request){
		               alert('pay테이블 입력 실패');
		               console.log("상태코드 : " + request.status);
		               console.log("서버로부터 받은 HTML데이터 : " + request.responseText);
		               console.log("에러 : " + error)
		            }
		         });
		      }
		   });
		}//success function
		/////////////////////////////////// 임한결 추가 끝 //////////
	</script>
	
	
</body>
</html>