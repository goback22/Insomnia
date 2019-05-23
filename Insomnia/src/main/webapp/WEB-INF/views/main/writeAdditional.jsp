<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Noto Sans KR Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- 달력 -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
body {
	overflow-x: hidden;
	font-family: 'Noto Sans KR', sans-serif;
	-webkit-font-smoothing: antialiased;
	letter-spacing: -.02em;
	color: rgba(0, 0, 0, .84);
	line-height: 1.5em;
	font-size: 15px;
	font-weight: 400;
}

.space_for_nav {
	background-color: black;
	width: 100%;
	height: 96px;
}

.root_div {
	width: 100%;
	height: 1200px;
}

/* progress ==== 선택화면 보여주기 */
.main_progress {
	text-align: center;
	padding-top: 7%;
	width: 200%;
	margin-left: 0;
	-webkit-transition: margin-left ease-in-out 1.5s;
	transition: margin-left ease-in-out 1.5s;
}
/* first step ==== 카테고리 음악 장르선택 */
.first-step {
	width: 50%;
	display: inline-block;
}

.first-step h1 {
	font-size: 30px;
	font-weight: 600;
	line-height: 36px;
	color: rgba(0, 0, 0, .84);
	margin-bottom: 7px;
}

.first-step p {
	color: rgba(0, 0, 0, .54);
	font-size: 17px;
	font-weight: 400;
	margin-bottom: 7px;
}

.s_account_bank {
	margin-top: 50px;
	width: 450px;
	height: 55px;
	padding: 16px;
	border: 1px solid rgb(230, 234, 237);
}

#s_account_serial {
	margin-top: 50px;
	width: 450px;
	height: 55px;
	padding: 16px;
	border: 1px solid rgb(230, 234, 237);
}

#s_goal_price {
	margin-top: 50px;
	width: 450px;
	height: 55px;
	padding: 16px;
	border: 1px solid rgb(230, 234, 237);
}

#s_goal_accumulation {
	margin-top: 50px;
	width: 450px;
	height: 55px;
	padding: 16px;
	border: 1px solid rgb(230, 234, 237);
}

#s_goal_deadline {
	margin-top: 50px;
	width: 450px;
	height: 55px;
	padding: 16px;
	border: 1px solid rgb(230, 234, 237);
}

.first-step-btn-div {
	margin-top: 50px;
}

.first-step-btn {
	color: white;
	text-align: center;
	font-weight: 900;
	font-size: 20px;
	margin: auto;
	padding: 15px;
	background-color: rgb(0, 204, 163);
	width: 450px;
	margin-top: 50px;
}

/* second step ===== 밴드 앨범 커버 선택 */
.second-step {
	width: 50%;
	display: inline-block;
}

.second-step h1 {
	font-size: 30px;
	font-weight: 600;
	line-height: 36px;
	color: rgba(0, 0, 0, .84);
	margin-bottom: 7px;
}

.second-step p {
	color: rgba(0, 0, 0, .54);
	font-size: 17px;
	font-weight: 400;
	margin-bottom: 7px;
}

.second-step-btn-back {
	color: white;
	text-align: center;
	font-weight: 900;
	font-size: 20px;
	margin: auto;
	padding: 15px;
	background-color: rgb(0, 204, 163);
	width: 80px;
	margin-top: 50px;
	display: inline-block;
}

.second-step-btn-next {
	color: white;
	text-align: center;
	font-weight: 900;
	font-size: 20px;
	margin: auto;
	padding: 15px;
	background-color: rgb(0, 204, 163);
	width: 350px;
	margin-left: 20px;;
	display: inline-block;
}

#bandCover {
	max-width: 500px;
	max-height: 500px;
}

/* select-member-div 회원을 검색해 밴드 멤버로 추가 */
.frm-search-member {
	margin-top: 20px;
}

.select-member-div {
	border: 1px solid rgb(230, 234, 237);
	width: 50%;
	text-align: center;
	margin: auto;
	margin-top: 50px;
}

.profile-wrap {
	display: inline-block;
	margin: 25px;
}

.profile-image {
	min-width: 100px;
	min-height: 100px;
	max-width: 100px;
	max-height: 100px;
	display: inline-block;
}

.profile-image .image-member {
	widht: 100px;
	height: 100px;
	border-radius: 50%;
	border: 1px solid rgb(230, 234, 237);
	display: inline-block;
}

.profile-image .cancel-member {
	position: absolute;
}

/* forth-step 밴드 이름 결정 */
.forth-step-input-div {
	margin-top: 50px;
	width: 100%;
	padding: 16px;
	text-align: center;
}

.band-name-input {
	margin-top: 50px;
	width: 450px;
	height: 55px;
	padding: 16px;
	border: 1px solid rgb(230, 234, 237);
	text-align: center;
	font-weight: 600;
	font-size: larger;
}
</style>
</head>
<script>
function getNumber(obj){
    
    var num01;
    var num02;
    num01 = obj.value;
    num02 = num01.replace(/\D/g,""); //숫자가 아닌것을 제거, 
                                     //즉 [0-9]를 제외한 문자 제거; /[^0-9]/g 와 같은 표현
    num01 = setComma(num02); //콤마 찍기
    obj.value =  num01;

}
function setComma(n) {
    var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
    n += '';                          // 숫자를 문자열로 변환         
    while (reg.test(n)) {
       n = n.replace(reg, '$1' + ',' + '$2');
    }         
    return n;
}
</script>

<body>
	<div class="root_div">
		<!-- ==============body 시작 -->
		<!-- ============== navBar 시작 -->
		<jsp:include page="/WEB-INF/template/Nav.jsp" />
		<div class="space_for_nav"></div>
		<!-- ============== navBar END -->

		<div class="main_progress row">
			<div class="first-step col-sm-6">
				<h1>귀하의 은행과 계좌 정보를 입력해주세요.</h1>
				<!--<p>등록하는 밴드에 가장 유사한 카테고리를 선택하세요</p> -->

				<!-- 은행 -->
				<div class="div_select_category">
					<span style="font-size: 1.1em">은행</span> <select
						class="s_account_bank" id="s_account_bank" name="s_account_bank"
						style="margin-left: 50px">
						<option value="" selected disabled>은행 선택하기</option>
						<option value="1">농협은행</option>
						<option value="2">신한은행</option>
						<option value="3">우리은행</option>
						<option value="4">기업은행</option>
						<option value="5">KEB하나은행</option>
						<option value="6">카카오뱅크</option>
						<option value="7">국민은행</option>
					</select>
				</div>
				<!-- select div -->

				<!-- 계좌번호 -->
				<div class="div_select_category">
					<span style="font-size: 1.1em">계좌 번호&nbsp;&nbsp;&nbsp;</span> <input
						type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="s_account_serial" name="s_account_serial"
						placeholder="계좌 입력(하이푼 제외)" />
				</div>

				<div class="first-step-btn-div">
					<div id="first-next" class="first-step-btn">다음 : 금액 및 마감일 선택</div>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</div>
			</div>
			<!-- first-step -->

			<div class="second-step col-sm-6">
				<h1>목표 금액과 마감 일을 선택해주세요</h1>

				<!-- 목표금액 -->
				<div>
					<span style="font-size: 1.1em">목표 금액&nbsp;&nbsp;&nbsp;</span> <input
						type="text" id="s_goal_price" onchange="getNumber(this);" onkeyup="getNumber(this);" name="s_goal_price"
						placeholder="목표금액 입력" />
					<span>원</span>
				</div>
				
				<!-- 마감시간 -->
				<div>
					<span style="font-size: 1.1em">마감일&nbsp;&nbsp;&nbsp;</span> <input
						type="text" id="s_goal_deadline" name="s_goal_deadline" 
						placeholder="마감시간 선택" />
				</div>

				<!-- 버튼 -->
			<div class="second-step-btn-div">
				<div id="second-back" class="second-step-btn-back">뒤로</div>
				<div id="second-next" class="second-step-btn-next">정보 입력 완료</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>	       
			<!-- second-step END -->

		</div>
		
	</div><!-- main_progress -->
	
		<!-- 파라미터를 위한 hidden div -->
		<div class="b_no" hidden="hidden">${param.b_no }</div>
		<div class="sw_no" id="sw_no" hidden="hidden">${param.sw_no}</div>
	
	</div><!-- root_div -->
	

	<script>
		console.log("version 61");

		var coverName = ""; //사진을 등록하기 위해 이미지파일의 이름을 저장해둔 변수
		var index = 0; //id값을 구분하기 위해 붙여놓은 인덱스(시퀀스)

		$(function() {
			
			$.ajaxSetup({
				type : 'post'
			});
			
			$("#s_goal_deadline").datepicker();
			
			$("#first-next").on("click", function() {
				console.log("#first-next call");
				$(".main_progress").css("margin-left", "-100%");
			});//$(.first-next).onCLick

			$("#second-back").on("click", function() {
				$(".main_progress").css("margin-left", "0");
			});//$(second-step-btn-back).onClick

			/////////////////////////////////////////////////////////// 밴드 입력폼 validate 이후 info페이지로 이동 START
			$("#second-next").on("click", function() {
				if (validate()) { //밴드 폼을 모두 입력했을경우 // true이므로
					var s_account_bank = $("#s_account_bank").val();
					var s_account_serial = $("#s_account_serial").val();
					var s_goal_price = $("#s_goal_price").val();
					var s_goal_deadline = $("#s_goal_deadline").val();
					var b_no = $(".b_no").text();
					var sw_no  = $("#sw_no").text();
					
					var json = {
						's_account_bank' : s_account_bank,
						's_account_serial' : s_account_serial,
						's_goal_price' : s_goal_price,
						's_goal_deadline' : s_goal_deadline,
						'b_no' : b_no,
						'sw_no' : sw_no
					};
					
					$.ajax({
						url: '<c:url value="/bandsubmit/writeAdditionalComplete.ins"/>',
						data : json,
						dataType : 'text',
						success:function(data){
							showCompleteMsg(data);
						},
						error:function(error, request){
							console.log('에러 메세지 : '+ error);
							alert("error");
						}
					});//ajax
					//location.href = "<c:url value='/band/bandInfo.ins'/>";
				}//true

				else {
					console.log("validate 실패");
				}
			});//$(second-step-btn-next).onClick

		

		});//jqury function
		
		var validate = function() {
			console.log("fn validate");
			if($("#s_account_bank").val() == null){
				alert("은행을 선택해주세요.");
				return false;
			}
			else if ($("#s_account_serial").val() == "")  {
				alert("계좌 번호를 입력하세요.");
				return false;
			}
			else if ($("#s_goal_price").val() == "")  {
				alert("목표 금액을 입력하세요.");
				return false;
			}
			else if ($("#s_goal_deadline").val() == "")  {
				alert("마감일을 선택하세요.");
				return false;
			}
			
			return true;
		};//function validate()
		
		function showCompleteMsg(data){
			if(data == "T"){
				alert("펀딩 성공!");
				location.href="<c:url value='/band/bandInfo.ins'/>";
			}else{
				alert("펀딩 실패 ㅠㅠ");
			}
		};//showCompleteMsg
/////////////////////////////////////////////////////////// 밴드 입력폼 validate 이후 info페이지로 이동 END

	</script>