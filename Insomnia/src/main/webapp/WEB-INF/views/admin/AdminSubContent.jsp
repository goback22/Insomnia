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
<style>
	.c {
		btn;
		btn-success;
	}
</style>	
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
				<div class="col-md-8">
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
										<th class="col-md-2 text-center">콘서트 이름</th>
										<th class="col-md-3 text-center">일시</th>
										<th class="col-md-3 text-center">장소</th>
										<th class="text-center">소개</th>
									</tr>
									<!-- DB에서 꺼내서~ each~~...tq -->
									<c:forEach items="${subList }" var="subList" varStatus="loop">
									<!-- subList.bgsco_no -->
									<c:if test="${subList.bgsco_no==1 }" var="bgsco_no_1">
									<tr class="view">
										<td class="text-center">${subList.b_title }</td>
										<td class="text-center">${subList.c_concertdate }</td>
										<td class="text-center">${subList.b_place }</td>
										<td class="text-center">${subList.b_content }</td>
									</tr>
									<!-- 위의 detail -->
									<tr class="fold" style="background-color:#c8c8c8;">
										<td colspan="4">
									       <div class="fold-content">
									         <table class="table table-bordered example">
									         	<!-- first floor -->
									          <thead>
									            <tr>
									            	
													<th class='text-center'><input type="checkbox" value="all"/></th>
													<th>no</th>
													<th class="col-md-1">name</th>
													<th class="col-md-1">ID</th>
													<th class="col-md-3">제목</th>
													<th class="col-md-2">등록일</th>
													<th class="col-md-1">좋아요</th>
													<th class="col-md-1">장르</th>
													<th>apply/deny</th>
									            </tr>
									          </thead>
									          <%-- 				<c:if 없을때 없다고 표시하기1/2> --%>
												<tbody class="submember">
<!-- 												<tr> -->
<!-- 													<td ><input type="checkbox" name="allmember"/>&nbsp;&nbsp;1</td> -->
<!-- 													<td>oin members</td> -->
<!-- 													<td>BGSAPPLY</td> -->
<!-- 													<td>2111</td> -->
<!-- 													<td>aBGSAPPLY</td> -->
<!-- 													<td class="text-center"><div class="btn btn-default apply">수락</div><div class="btn btn-default deny">거부</div></td> -->
<!-- 												</tr> -->
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
									</c:if>
									</c:forEach>	
									<!-- DB에서 꺼내기 끝 -->
									
									
								</table>
							</section>
						</div>
					</div>
				</div>
				<!-- test1 -->
				<div class="col-md-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								방구석 신청 후 수락된 회원 목록
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover apply-table">
									<thead>
										<tr> 
											<th class="col-md-2">성명</th><th class="col-md-4">아이디</th><th>신청 장르</th><th class="col-md-3">등록일</th> 
										</tr>
									</thead>
									<tbody class="subhire_member"></tbody>
								</table>
							</section>
						</div>
					</div>
				</div>
				<!-- test1 end -->
			</div>
			<!--  -->
		</div>
	</div>


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

//세부 정보 table toggle
$(".view").on("click", function(){
	
	console.log("click");
	$(this).next(".fold").toggle(500);
});


$(function(){
	
	$('.fold').show();
	//sub content 신청한 사람 꺼내기
	$.ajax({
		url:"<c:url value='/admin/submember.ins'/>",
		dataType:'json',
		success:function(data){
			//console.log("1");
			firstSubSubmitMembers(data);
		},
		error:function(request,error){
			console.log('상태코드:',request.status);
			console.log('서버로 부터 받은 HTML데이터:',request.responseText);
			console.log('에러:',error);
		}
	});
	//sub content 신청한 사람 꺼내기-성공하면 실행되는 메소드
	function firstSubSubmitMembers(data){
		//console.log(data);
		var tableString;
		var id;
		var ap_no;
		$.each(data,function(index,element){
			id = element["id"];
			ap_no = element["ap_no"];
			tableString += "<tr class='bgsapply'>";
			tableString +=		"<td class='text-center'><input type='checkbox' name='allmember'/></td>";
			tableString +=		"<td class='text-center'></td>";
			tableString +=		"<td class='col-md-1'>"+element["name"]+"</td>";
			tableString +=		"<td class='col-md-1'>"+element["id"]+"</td>";
			tableString +=		"<td class='col-md-3'>"+element["ap_title"]+"</td>";
			tableString +=		"<td class='col-md-2'>"+element['ap_postdate'].substring(0,10)+"</td>";//
			tableString +=		"<td class='col-md-1'>"+element["ap_visit"]+"</td>";
			tableString +=		"<td class='col-md-1'>"+element["ap_genre"]+"</td>";
			tableString +=		"<td class='text-center'>"
			tableString +=			"<div value='"+element["ap_no"]+"' class='btn btn-default apply' onclick='applyButton(this)'>수락</div>&nbsp;"
// 			tableString += 			"<div class='btn btn-default deny' onclick='denyButton()'>거부</div>"
			tableString +=		"</td>";
			tableString += "</tr>";
		});
		$('.submember').html(tableString);
		
		//sub detail view table option
		var t = $('.example').DataTable( {
	        "columnDefs": [ {
	            "searchable": false,
	            "orderable": false,
	            "targets": 0
	        } ],
	        "order": [[ 1, 'asc' ]]
	    } );
	    t.on( 'order.dt search.dt', function () {
	        t.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
	};
	
// 	$('.apply').click(function(){
	//sub hire member list
	$.ajax({
		url:"<c:url value='/admin/submemberApplyMember.ins'/>",
		dataType:'json',
		success:
// 			console.log("apply member list success method");
			subHireList,
		error:function(request,error){
// 			console.log("apply member list fail");
			console.log('상태코드:',request.status);
			console.log('서버로 부터 받은 HTML데이터:',request.responseText);
			
		}
	});//ajax
// 	})//cch click
	
});//function
	
	//sub hire member list-success method
	var subHireList = function(data){
		console.log("data:"+data);
		console.log("????????????????이거임?");	
		var subHireString = "";
		$.each(data,function(index,element){
			console.log("????????????????이건들어오냐");	
			subHireString += "<tr>";
			subHireString += 	"<td>"+element["name"]+"</td>";
			subHireString += 	"<td>"+element["id"]+"</td>";
			subHireString += 	"<td>"+element["ap_genre"]+"</td>";
			subHireString += 	"<td>"+element['ap_postdate'].substring(0,10)+"</td>";//
			subHireString += "</tr>";
		});
		
		//출력
		$('.subhire_member').html(subHireString);
	};//subHireList
	
function applyButton(info){
    var thisap_no = $(info).attr("value");
	console.log(thisap_no);
    $.ajax({
    	url:"<c:url value='/admin/submemberApplySingle.ins?ap_no="+thisap_no+"'/>",
    	//dataType:"json",
    	success:function(){
    		alert("방구석 신청 완료");
    		location.reload();
    	},
    	error:function(request,error){
    		console.log('수락버튼 누르고 에러 나올때');
			console.log('상태코드:',request.status);
			console.log('에러:',error);
		}
    });
};

function denyButton(){
	console.log("deny single button");
	test();
	
};

var test = function(){
	var denyString="";
	denyString = "<tr>";
	denyString +=	"<td>11</td>";
	denyString +=	"<td>22</td>";
	denyString +=	"<td>33</td>";
	denyString += "</tr>";
	$('.deny-test').append(denyString);
};
</script>

</body>
</html>