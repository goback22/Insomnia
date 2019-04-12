<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminIndex.jsp</title>
	<link href="<c:url value='/vendor/css/bootstrap-3.3.2.css'/>" rel="stylesheet"><!-- -3.3.2 -->
	<script src="<c:url value='/vendor/js/jquery-3.3.1.js'/>"></script>
	<script src="<c:url value='/vendor/js/bootstrap.min.js'/>"></script><!-- min -->
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
					<h1>전체보기 <small></small></h1>
				</div>
			</div>
			<!-- 회원관련 -->
			<div class="row">
				<div class="col-md-7">
				<!-- 전체 회원보기 -->
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								회원 전체 보기
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-1 text-center">id</th>
										<th class="col-md-2 text-center">name</th>
										<th class="col-md-2 text-center">email</th>
										<th class="col-md-2 text-center">phone?</th>
										<th class="text-center">회원구분</th>
										<th class="col-md-1 text-center">정보공개</th>
									</tr>
									<!-- DB에서 꺼내기 -->
									<tr>
										<td class="col-md-1 text-center">1</td>
										<th class="col-md-1 text-center">id</th>
										<td class="col-md-2 text-center">김길동</td>
										<td class="text-center">kimkildong@navet.com</td>
										<td class="col-md-2 text-center">010-1234-5678</td>
										<td class="text-center">일반회원</td>
										<td class="col-md-1 text-center">no</td>
									</tr>
									<tr>
										<td class="col-md-1 text-center">2</td>
										<th class="col-md-1 text-center">sejong</th>
										<td class="col-md-2 text-center">세종</td>
										<td class="col-md-3 text-center">sejong@sejong.kr</td>
										<td class="col-md-2 text-center">010-1694-1732</td>
										<td class="text-center">일반회원</td>
										<td class="col-md-1 text-center">no</td>
									</tr>
									<tr>
										<td class="col-md-1 text-center">3</td>
										<th class="col-md-1 text-center">kimozzi</th>
										<td class="col-md-2 text-center">기모찌</td>
										<td class="col-md-3 text-center">kimozzi@naver.kr</td>
										<td class="col-md-2 text-center">010-6969-6969</td>
										<td class="text-center">방구석</td>
										<td class="col-md-1 text-center">no</td>
									</tr>
									<tr>
										<td class="col-md-1 text-center">4</td>
										<th class="col-md-1 text-center">jhonjohn</th>
										<td class="col-md-2 text-center">존레논</td>
										<td class="col-md-3 text-center">jhon@beatles.eu</td>
										<td class="col-md-2 text-center">00700-448-4775</td>
										<td class="text-center">방구석</td>
										<td class="col-md-1 text-center">no</td>
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/allmember.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
					<!-- 전체회원보기 끝 -->
					<!-- 신규회원 보기 -->
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								신규회원 관리
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-1 text-center">id</th>
										<th class="col-md-2 text-center">name</th>
										<th class="col-md-2 text-center">email</th>
										<th class="col-md-2 text-center">phone?</th>
										<th class="text-center">회원구분</th>
										<th class="col-md-1 text-center">정보공개</th>
									</tr>
									<!-- DB에서 꺼내기 -->
									<tr>
										<td class="col-md-1 text-center">1</td>
										<td class="col-md-1 text-center">newbee</td>
										<td class="col-md-2 text-center">김뉴비</td>
										<td class="text-center">newg@navet.com</td>
										<td class="col-md-2 text-center">010-9234-5678</td>
										<td class="text-center">일반회원</td>
										<td class="col-md-1 text-center">no</td>
									</tr>
									<tr>
										<td class="col-md-1 text-center">2</td>
										<td class="col-md-1 text-center">newthing</td>
										<td class="col-md-2 text-center">이신상</td>
										<td class="col-md-3 text-center">sinsangg@sejong.kr</td>
										<td class="col-md-2 text-center">010-8888-8888</td>
										<td class="text-center">방구석</td>
										<td class="col-md-1 text-center">yes</td>
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/newmember.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
					<!-- 신규회원 보기 끝 -->
					
				</div>
				<div class="col-md-5">
					<!-- 방구석회원 -->
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								방구석 회원
							</h3>
						</div>
						<div class="panel-body feed">
							<section class="feed-item">
								<table class="table table-hover">
									<tr>
										<th class="col-md-1 text-center">no</th>
										<th class="col-md-2 text-center">id</th>
										<th class="col-md-2 text-center">name</th>
										<th class="col-md-2 text-center">phone</th>
										<th class="col-md-2 text-center">email</th>
										
										
									</tr>
									<!-- DB에서 꺼내기 -->
									<tr>
										<td class="text-center">1</td>
										<td class="text-center">kimozzi</td>
										<td class="text-center">기모찌</td>
										<td class="text-center">010-6969-6969</td>
										<td class="text-center">kimozzi@naver.kr</td>
										
									</tr>
									<tr>
										<td class="col-md-1 text-center">2</td>
										<td class="col-md-2 text-center">jhonjohn</td>
										<td class="col-md-3 text-center">jhon@beatles.eu</td>
										<td class="col-md-2 text-center">00700-448-47752</td>
										<td class="text-center">방구석</td>
										
									</tr>
									<!-- DB에서 꺼내기 끝 -->
								</table>
								<div class="" style="text-align: right;margin-right: 5px;">
									<a href="<c:url value='/admin/submember.ins'/>">more view</a></div>
							</section>
						</div>
					</div>
					<!-- 방구석 회원 끝 -->
<!-- 					<div class="panel panel-primary"> -->
<!-- 						<div class="panel-heading"> -->
<!-- 							<h3 class="panel-title"> -->
<!-- 								<i class="fa fa-bar-chart-o"></i>chart(옮길까 생각중) -->
<!-- 							</h3> -->
<!-- 						</div> -->
<!-- 						<div class="panel-body"> -->
<!-- 							<div id="chart_div" style="width: 100%; height: 500px;border: 1px solid red;"></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<!-- 회원관련 끝 -->
			<!-- main content -->
			<div class="row">
				<div class="col-lg-9">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								main content관련-앨범 만들어주는 컨텐츠
							</h3>
						</div>
						<div class="panel-body">
							<h3>앨범 만들어주고픈 회원?</h3>
							<!-- table -->
							<table class="table table-hover">
								<tr>
									<th>no</th>
									<th>ID</th>
									<th>name</th>
									<th>앨범이름</th>
									<th>e mail</th>
									<th>column1</th>
									<th>column2</th>
									<th>column3</th>
									<th>column4</th>
								</tr>
								<!--  -->
								<tr>
									<td>1</td>
									<td>gerilong</td>
									<td>게리롱</td>
									<td>funny powder</td>
									<td>gerilong@naver.com</td>
									<td>column1</td>
									<td>column2</td>
									<td>column3</td>
									<td>column4</td>
								</tr>
								<tr>
									<td>no</td>
									<td>hoorilong</td>
									<td>name</td>
									<td>phone</td>
									<td>e mail</td>
									<td>column1</td>
									<td>column2</td>
									<td>column3</td>
									<td>column4</td>
								</tr>
								
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
								</tr>
							</table>
							<!-- table end -->
							<div class="" style="text-align: right;margin-right: 60px;">
								<a href="<c:url value='/admin/maincontent.ins'/>">more view</a></div>
						</div>
					</div>
				</div>
			</div>
			<!-- main content end -->
			<!-- sub content -->
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								sub content관련-아티스트 모으고 공연장 섭외해서 공연기획
							</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th class="col-md-1">no</th>
									<th class="col-md-2 text-center">아이디</th>
									<th class="col-md-2 text-center">이름</th>
									<th class="col-md-1 text-center">이메일</th>
									<th class="text-center">is방구석</th>
									<th class="text-center">column</th>
									<th class="col-md-1 text-center">yes or no</th>
								</tr>
								
								<tr>
									<td class="">1</td>
									<td class="text-center">queen</td>
									<td class="text-center">후레디멐유리</td>
									<td class="text-center">queen@naver.com</td>
									<td class="text-center">방구석</td>
									<td class="text-center">content1</td>
									<td class="text-center">yes or no</td>
								</tr>
								<tr>
									<td class="">2</td>
									<td class="text-center">redmarx</td>
									<td class="text-center">마르크스</td>
									<td class="text-center">redmarx@han.net</td>
									<td class="text-center">일반</td>
									<td class="text-center">text-center</td>
									<td class="text-center">yes or no</td>
								</tr>
							</table>
							<div class="" style="text-align: right;margin-right: 5px;">
								<a href="#">more view</a></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								sub content관련-아티스트 목록(신청한사람?)
							</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th class="col-md-1 text-center">no</th>
									<th class="col-md-2 text-center">ID</th>
									<th class="col-md-2 text-center">성명</th>
									<th class="col-md-1 text-center">Email</th>
									<th class="col-md-1 text-center"></th>
									<th class="text-center">제목</th>
									<th class="col-md-1 text-center">수락여부</th>
								</tr>
								
								<tr>
									<td class="">1</td>
									<td class="text-center">mamison</td>
									<td class="text-center">마미손</td>
									<td class="text-center">hand@naver.com</td>
									<td class="text-center"></td>
									<td class="">제목?</td>
									<td class="text-center">yes or no</td>
								</tr>
								<tr>
									<td class="">2</td>
									<td class="text-center">do</td>
									<td class="text-center">이현도</td>
									<td class="text-center">do@hanmail.net</td>
									<td class="text-center"></td>
									<td class="">제에목?</td>
									<td class="text-center">yes or no</td>
								</tr>
							</table>
							<div class="" style="text-align: right;margin-right: 5px;">
								<a href="#">more view</a></div>
						</div>
					</div>
				</div>
				
				
				<!-- chart -->
<!-- 				<div class="col-lg-5"> -->
<!-- 					<div class="panel panel-primary"> -->
<!-- 						<div class="panel-heading"> -->
<!-- 							<h3 class="panel-title"> -->
<!-- 								<i class="fa fa-magnet"></i>sub 관련 모금액? -->
<!-- 							</h3> -->
<!-- 						</div> -->
<!-- 						<div id="sub_chart"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- chart end -->
			</div>
			<!-- sub content end -->
			
			<!-- 결제관련 -->
			<div class="row">
				<div class="col-lg-7">
					<div class="panel panel-primary">	
						<div class="panel-heading">
							<h3 class="panel-title">
								결제 진행 목록?결제 완료된 회원?
							</h3>
						</div>
						<div class="panel-body">
							<h1>아직</h1>
						</div>
					</div>
				</div>
				
				<div class="col-lg-5">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								표 팔고 있는 공연 목록
							</h3>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th class="col-md-1">no</th>
									<th class="col-md-3 text-center">공연이름</th>
									<th class="col-md-2 text-center">공연날짜</th>
									<th class="col-md-2 text-center">총좌석수</th>
									<th class="text-center">장소</th>
								</tr>
								
								<tr>
									<td class="col-md-1">1</td>
									<td class="col-md-3 text-center">여놀자</td>
									<td class="col-md-2 text-center">2019-04-07</td>
									<td class="col-md-2 text-center">400</td>
									<td class="text-center">강변북로</td>
								</tr>
								<tr>
									<td class="col-md-1">2</td>
									<td class="col-md-3 text-center">기타들고모여</td>
									<td class="col-md-2 text-center">2019-04-09</td>
									<td class="col-md-2 text-center">500</td>
									<td class="text-center">아르코예술극장</td>
								</tr>
								<tr>
									<td class="col-md-1">3</td>
									<td class="col-md-3 text-center">드림콘서트</td>
									<td class="col-md-2 text-center">2019-04-01</td>
									<td class="col-md-2 text-center">1500</td>
									<td class="text-center">드림랜드 마당</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 결제관련 끝 -->
		</div>
	</div>
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', '개인회원?', 'column2'	],
          ['Jan',	100,		40		],
          ['Feb',	117,		46		],
          ['Mar',	66,			112		],
          ['Apr',	103,      	54		],
          ['May',	50,			100		]
        ]);

        var options = {
          title: '음...',
          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      
      //sub chart
      google.charts.setOnLoadCallback(drawBasic);

		function drawBasic() {
		
		      var data = google.visualization.arrayToDataTable([
		        ['공연제목', '%'],
		        ['홍대 놀자', 75],
		        ['강변가요제', 44],
		        ['전국 음악 자랑', 52],
		        ['두유노김치', 67]
		       
		      ]);
		
		      var options = {
		        title: '방구석 기타리스트 공연 자금',
		        chartArea: {width: '60%'},
		        hAxis: {
		          title: '수금량',
		          minValue: 0
		        },
		        vAxis: {
		          title: '공연명'
		        }
		      };
		
		      var chart = new google.visualization.BarChart(document.getElementById('sub_chart'));
		
		      chart.draw(data, options);
		    }
    </script>
	
</body>
</html>