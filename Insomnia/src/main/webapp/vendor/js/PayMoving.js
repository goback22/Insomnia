$(function(){
	
	//===================================스테파니쌤=====================================
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($(".ads_aside").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		$(".ads_aside").stop().animate({
			"top" : newPosition
		}, 1000);
		if(pay_Way == 'B' && scrollTop + floatPosition >= 1513){
			$(".ads_aside").stop().animate({
				"top" : 1513+"px"
			},1000)
		}else if(pay_Way == 'D' && scrollTop + floatPosition >= 1073){
			$(".ads_aside").stop().animate({
				"top" : 1073+"px"
			},1000)
		}
	}).scroll();
	//===================================스테파니쌤=====================================

	//===============================새로고침, 뒤로가기=================================
	$(window).bind("pageshow", function (event) {
		if (event.originalEvent.persisted) {
			$(".sub_yes_agree").prop("checked","checked");
			$("#pay_agree").prop("checked","");
			console.log("1번");
		}else {
			$(".sub_no_agree").prop("checked","checked");
			$("#pay_agree").prop("checked","");
			console.log("2번");
			
		}
	});
	//===============================새로고침, 뒤로가기=================================
	
	//=============================방구석기타리스트 BUY==============================

	$(document).on("click",".aa",function(){
		$("input[name=bgs1_qty]").val($("#qtyqty").val());
		$("input[name=bgs1_price").val($("#bgs_price").text().replace(/[^\d]+/g, ''));
		
		$("#bgs_sub_item_list").submit();
	});
	
	
	//===============================================================================
		
	//============================= 결제창 들어가기 전 +,- ==========================
	var number_of_items = $("#qtyqty").val();
	var price;
	var isOne = false;
	$(document).on("click","#plus_ordered",function(){
		console.log("플라스");
		number_of_items++;
		$("#qtyqty").val(number_of_items);
		if(!isOne){
			price = Number($("#bgs_price").text().replace(/[^\d]+/g, ''));
			isOne = true;
		}
		var str_price = String(price*number_of_items).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		$("#bgs_price").text(str_price);
		
	})
	
	$("#minus_ordered").click(function(){
		console.log("마이나스");
		number_of_items--;
		if(number_of_items<=0){
			alert("한 개 이상의 수량을 선택하세요.");
			return;
		}
		$("#qtyqty").val(number_of_items);
		var str_price = String(price*number_of_items).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		$("#bgs_price").text(str_price);
		
	})
	
//===============================================================================
	
// ======= 주문자 정보(정보와 같음 클릭 시) -> 예매정보로 정보 이동 ============
	$(document).on("click","#same",function(){
		if($(this).get(0).checked){
			$("#receiver").val($("#sender").val());
			$("#emergency21").val($("#emergency11").val());
			$("#emergency22").val($("#emergency12").val());
			$("#emergency23").val($("#emergency13").val());
			$("input[name=subPay_Email1]").val($("#email_1").val())
			var email_2 = $(".choose_email_1 option:selected").val();
			$(".choose_email_2 option:selected").prop("selected",false);
			$(".choose_email_2 option:eq(email_2)").prop("selected",true);
			//$(".choose_email_2 option").val(email_2).attr("selected","selected");
			
		}else{
			$("#receiver").val("");
			$("#emergency21").val("");
			$("#emergency22").val("");
			$("#emergency23").val("");
			$("input[name=subPay_Email1]").val("");
			$(".choose_email_2 option:selected").prop("selected",false);
			$(".choose_email_2 option:eq(0)").prop("selected",true);
		}
	});
//===============================================================================

//=========================== 결제 수단 이벤트 처리 =============================
	/*console.log($(".pay-method input[name='radio_paymethod']").val());*/
	
	var pay_Way = "B";
	$("input[name='subPay_orderWay']").click(function(){
		pay_Way = $(this).val();
		
		$(".payment-info").each(function(){
			$(this).css("display","none");
		});
		$("#payinfo_"+pay_Way).css("display","block");
		
		switch(pay_Way){
		//======== 무통장 입금 ========
		case 'B':
			$("#evidence").css("display","");
	        $(".no_BankBook").css("display","");
	        $(".add_Info").css("display","");
	        $(".tbl-add_Info").css("display","");
			break;
		//======== 무통장 입금 ========
		
		//======== 신용카드 ========
		case 'C':
			$("#evidence").css("display","none");
	        $(".no_BankBook").css("display","none");
	        $(".add_Info").css("display","none");
	        $(".tbl-add_Info").css("display","none");
			break;
		//======== 신용카드 ========
		
		//======== 휴대폰 결제 ========
		default :
			$("#evidence").css("display","none");
	        $(".no_BankBook").css("display","none");
	        $(".add_Info").css("display","none");
	        $(".tbl-add_Info").css("display","none");
		//======== 휴대폰 결제 ========
		}
	});	
	
	$("input[name='evidencecheck']").click(function(){
		console.log($(this).val());
		var check = $(this).val();
		if(check == 'N'){
			$("#evidence_cashbill_data").css("display","none");
		}else{
			$("#evidence_cashbill_data").css("display","");
		}
	});
	
//===============================================================================
	var full_email1;
	var full_email2 = "naver.com";
	var full_email;
//============================ 이메일 이벤트 처리 ===============================
	$(document).on("change",".choose_email_2",function(){
		console.log($(this).val());
		console.log($(".choose_email_2 option").length);
		console.log($(".choose_email_1").attr("selected","selected").val());
		full_email1 = $("input[name=subPay_Email1]").val()+"@";
		if($(this).val() == $(".choose_email_2 option").length-1){
			$("#email_self").css("display","");
			full_email2 = $("input[name=subPay_Email_Self]").val();
			console.log('zdzsd');
		}else{
			$("#email_self").css("display","none");
			if($(this).val() == 0){
				full_email2="naver.com";
			}else if($(this).val() == 1){
				full_email2="daum.net";
			}else if($(this).val() == 2){
				full_email2="nate.com";
			}else{
				full_email2="goggle.com";
			}
			
		}
		full_email = full_email1+full_email2;
		console.log("풀 이메일 : "+full_email)
	});
//===============================================================================	
	
//==================================우편 번호 ===================================
	$("#sample4_execDaumPostcode").click(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
            }
        }).open();
	});
//===============================================================================
	
//========================== 주문리스트 - 수량 변경 이벤트 ======================
	//초기값 저장용] 추후엔 ${}로 값 받아와서 저장]
	//동적으로 생성시 사용]
	var is_One = false;
	var order_price;
	
	//가격 얻어오기용 수량 변수]
	var item_count = $(".item_Count").val();
	
	//수량에 따른 값 증가 - db저장용
	var order_price_save = $("#op_total_price").text();
	
	//콤마 찍기 - 출력용
	var order_price_print;
	
	//전체 값 저장용]
	var all_price_save = 0;
	
	var isComma = true;
	
	//============================= 플러스 =============================
	$(this).on("click",".btn_plus",function(){
		isComma = false;
		//var item_count = $(".item_Count_"+값).text();
		item_count = $(".item_Count").val();
		
		
		//초기 price(콤마 풀기)
		if(!is_One){
			order_price = Number($("#price_concert").text().replace(/[^\d]+/g, '')) / item_count;
			is_One = true;
		}
	    
		item_count++;
		
		order_price_save = order_price * item_count;
		
		order_price_print = String(order_price_save).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	
		$(this).prev().val(item_count);
		$("#price_concert").text(order_price_print)
		
		// 전체 금액 출력]
		$("#op_total_price").text(order_price_print);
		
	});
	
	//============================= 마이너스 =============================
	$(this).on("click",".btn_minus",function(){
		isComma = false;
		item_count = $(".item_Count").val();
		
		//초기 price(콤마 풀기)
		if(!is_One){
			order_price = Number($("#price_concert").text().replace(/[^\d]+/g, '')) / item_count;
			is_One = true;
		}
	    
		item_count--;
		if(item_count <= 0){
			alert("한개 이상의 수량을 선택하세요.");
			item_count = 1;
			return;
		}
		
		order_price_save = order_price * item_count;
		
		order_price_print = String(order_price_save).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	
		$(this).prev().prev().val(item_count);
		$("#price_concert").text(order_price_print)
		
		// 전체 금액 출력]
		$("#op_total_price").text(order_price_print);
	});
	
	
//===============================================================================

//============================주문 리스트 동적으로 생성==========================
	var count = 0;
	$(".add_order_list_count").click(function(){
	if($(".add_trTag tr").length == 0){
		$(".add_trTag").append(
				"<tr class='orderlist_checkNrelease_delete'>"+
					"<td>"+
						"<div class='tb-center'>"+
							"<div class='thumb'>"+
								"<input type='checkbox' class='order_list_checked' checked='checked'>"+
								"<img src='http://cdn3-aka.makeshop.co.kr/shopimages/superstari/0420110000743.jpg' width='40'>"+
							"</div>"+
						"</div>"+
					"</td>"+
					"<td>"+
						"<div class='tb-left'>"+
							"<a href='/shop/shopdetail.html?branduid=139881'>수납&amp;공간활용 진공 압축팩 </a>"+
						"</div>"+
					"</td>"+
					"<td>"+
						"<div class='tb-center'>"+
							"<input type='text' class='item_Count_"+count+"' value='1' style='width: 25px; text-align: right;'> 개"+
							"<input type='button' class='btn btn-info btn_plus' value='+'>"+
							"<input type='button' class='btn btn-info btn_minus' value='-''>"+
						"</div>"+
					"</td>"+
					"<td>"+
						"<div class='tb-right tb-bold tb-center div_money_"+count+"'><span>2,900</span>원</div>"+
					"</td>"+
					"<td>"+
						"<div class='tb-center'>없음</div>"+
					"</td>"+
				"</tr>"
					)
	}else{
		$(".add_trTag tr:last-child").after(
	"<tr class='orderlist_checkNrelease_delete'>"+
		"<td>"+
			"<div class='tb-center'>"+
				"<div class='thumb'>"+
					"<input type='checkbox' class='order_list_checked' checked='checked'>"+
					"<img src='http://cdn3-aka.makeshop.co.kr/shopimages/superstari/0420110000743.jpg' width='40'>"+
				"</div>"+
			"</div>"+
		"</td>"+
		"<td>"+
			"<div class='tb-left'>"+
				"<a href='/shop/shopdetail.html?branduid=139881'>수납&amp;공간활용 진공 압축팩 </a>"+
			"</div>"+
		"</td>"+
		"<td>"+
			"<div class='tb-center'>"+
				"<input type='text' class='item_Count_"+count+"' value='1' style='width: 25px; text-align: right;'> 개"+
				"<input type='button' class='btn btn-info btn_plus' value='+'>"+
				"<input type='button' class='btn btn-info btn_minus' value='-'>"+
			"</div>"+
		"</td>"+
		"<td>"+
			"<div class='tb-right tb-bold tb-center div_money_"+count+"'><span>2,900</span>원</div>"+
		"</td>"+
		"<td>"+
			"<div class='tb-center'>없음</div>"+
		"</td>"+
	"</tr>"
		)
	}
	count++;
	});
//===============================================================================
	
	
//==================== 주문 리스트 - 전체선택, 삭제, 전체해제 ===================
	//====== 전체 선택 =======
	$(document).on("click",".btn_all_check",function(){
		$(".order_list_checked").prop("checked",true);
		$(".add_trTag tr").addClass("orderlist_checkNrelease_delete");
	});
	
	//====== 삭제 ======
	$(document).on("click",".order_list_checked",function(){
		if($(this).is(":checked")){
			console.log("체크됨");
			//$(this).parents("tr").addClass("abcdefg");
			$(this).closest("tr").addClass("orderlist_checkNrelease_delete");
		}else{
			console.log("체크안됨");
			$(this).closest("tr").removeClass("orderlist_checkNrelease_delete");
		}
	});
	
	$(".btn_delete").click(function(){
		$(".orderlist_checkNrelease_delete").hide();
	});
	
	//====== 전체 해제 ======
	$(document).on("click",".btn_all_release",function(){
		$(".order_list_checked").prop("checked",false);
		$(".add_trTag tr").removeClass("orderlist_checkNrelease_delete");
	});
	
//===============================================================================

//================================ 정보 동의 ====================================
	var agree = "N";
	$("input[name=new_privacy_agree]").click(function(){
		agree = $(this).val();
	});
	
//===============================================================================

$("#asmr").hover(function(){
	$("#asmr").css("backgroundColor","#ececec");
	$("#asmr").css("color","black");
},function(){
	$("#asmr").css("backgroundColor","black");
	$("#asmr").css("color","white");
})

$("#asmr2").hover(function(){
	$("#asmr2").css("backgroundColor","black");
	$("#asmr2").css("color","white");
},function(){
	$("#asmr2").css("backgroundColor","#ececec");
	$("#asmr2").css("color","black");
})
	
//================================ 유효성 검사 ==================================
//결제 완료 변수]
var isComplete = false;
$(document).on("click",".btn_order_ok",function(){
	//1. 주문리스트 제품]
	if(pay_Way == 'B'){ // 체크한거가 무통장 일 때
		if($(".thumb input[type=checkbox]").prop("checked") == false){
			alert("하나 이상의 제품을 선택하세요!");
			$(".order_list_checked").focus();
			return;
		}
		//2. 예매 정보] - 이름
		else if($("#receiver").val() == ""){
			alert("이름을 입력하세요!");
			$("#receiver").focus();
			return;
		}
		//3. 예매 정보] - 이메일
		else if($("#email_2").val() == ""){
			alert("이메일을 입력하세요!");
			$("#email_2").focus();
			return;
		}
		//4. 예매 정보] - 연락처
		else if($("#emergency21").val() == "" || $("#emergency22").val() == "" || $("#emergency23").val() == ""){
			alert("연락처를 입력하세요!");
			$("#emergency21").focus();
			return;
		}
		//5. 무통장 환불 예금주]
		else if($("input[name=subPay_Refund_Name]").val() == ""){
			alert("환불 받을 예금주를 입력하세요!");
			$("input[name=subPay_Refund_Name]").focus();
			return;
		}
		//6. 무통장 환불 은행명]
		else if($("input[name=subPay_Refund_BankName]").val() == ""){
			alert("환불 받을 은행명을 입력하세요!");
			$("input[name=subPay_Refund_BankName]").focus();
			return;
		}
		//7. 무통장 환불 계좌번호]
		else if($("input[name=subPay_Refund_BankAccount]").val() == ""){
			alert("환불받을 계좌를 입력하세요!");
			$("input[name=subPay_Refund_BankAccount]").focus();
			return;
		}
		//8. 무통장 환불 계좌번호 (-)입력 시]
		else if($("input[name=subPay_Refund_BankAccount]").val().indexOf("-") != -1){
			alert("하이픈(-)를 제외한 계좌번호를 입력하세요!");
			$("input[name=subPay_Refund_BankAccount]").focus();
			return;
		}
		//편의를 위한 else if]
		else if($("input[name=subPay_Refund_BankAccount]").val() == ""){
			return;
		}
		//9. 입금 계좌 선택]
		else if($(".MK_pay_add_choice option:eq(0)").prop("selected") == true){
			alert("입금 할 계좌를 선택하세요.")
			return;
		}
		else if(agree == 'N'){
			alert("정보수집에 동의해주세요.");
			return;
		}else if($("#pay_agree").prop("checked") == ""){
			alert("구매 진행에 동의해주세요.");
			return;
		}
		isComplete = true;
	}
	// =============================== 휴대폰 결제 ===============================
	else if(pay_Way=="D"){// 체크한거가 그외 일 때
		if($(".thumb input[type=checkbox]").prop("checked") == false){
			alert("하나 이상의 제품을 선택하세요!");
			$(".order_list_checked").focus();
			return;
		}
		//2. 예매 정보] - 이름
		else if($("#receiver").val() == ""){
			alert("이름을 입력하세요!");
			$("#receiver").focus();
			return;
		}
		//3. 예매 정보] - 이메일
		else if($("#email_2").val() == ""){
			alert("이메일을 입력하세요!");
			$("#email_2").focus();
			return;
		}
		//4. 예매 정보] - 연락처
		else if($("#emergency21").val() == "" || $("#emergency22").val() == "" || $("#emergency23").val() == ""){
			alert("연락처를 입력하세요!");
			$("#emergency21").focus();
			return;
		}
		else if(agree == 'N'){
			alert("정보수집에 동의해주세요.");
			return;
		}else if($("#pay_agree").prop("checked") == ""){
			alert("구매 진행에 동의해주세요.");
			return;
		}
		$.ajax({
			url: "/insomnia/Pay/PayInsert.ins",
			dataType : 'json',
			data : $('#order_form').serialize(),
			success : function(data){
				successPay(data["p_no"]);
				
			},
			error: function(data){
				console.log("에러다아아아 : "+data);
			}
			
		})
		
	}///////
	// =============================== 휴대폰 결제 ===============================
	console.log("버튼 클릭 후 isComplete"+isComplete);
	if(isComma){
		order_price_save = order_price_save.replace(/[^\d]+/g, '');
	}
	$("input[name=subPay_Final_payment_amount]").val(order_price_save);
	$("input[name=subPay_Item_Qty]").val(item_count);
	if(isComplete){
		$("#order_form").submit();
	}
});

var successPay = function(data){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp11329087');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		// pg : 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자
		pg : 'danal',
		pay_method : 'phone',
		//merchant_uid : 가맹점에서 생성/관리하는 고유 주문번호
		merchant_uid : 'merchant_' + data,
		/*
		 merchant_uid에 경우
		 https://docs.iamport.kr/implementation/payment
		 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		 참고하세요.
		 나중에 포스팅 해볼게요.
		 */
		//결제창에서 보여질 이름
		name : $(".subpay_title_content").val(),
		//결제할 금액
		amount : order_price_save, 
		//구매정보
		buyer_email : full_email,
		buyer_name : $("#receiver").val(),
		buyer_tel : $("input[name=subPay_Phone1]").val() +"-"+ $("input[name=subPay_Phone2]").val() +"-"+ $("input[name=subPay_Phone3]").val(),
		m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	/*
	 모바일 결제시,
	 결제가 끝나고 랜딩되는 URL을 지정
	 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	 */
	}, function(rsp) {
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
//			msg += '고유ID : ' + rsp.imp_uid;
//			msg += '상점 거래ID : ' + rsp.merchant_uid;
//			msg += '결제 금액 : ' + rsp.paid_amount;
//			msg += '카드 승인번호 : ' + rsp.apply_num;
			isComplete = true;
		} else {
			var msg = '결제에 실패하였습니다.';
//			msg += '에러내용 : ' + rsp.error_msg;
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
			$("#order_form").submit();
		}
	});
}
	
	
//===============================================================================
	
	
//================================== 결제 방법 ==================================
//	$(document).on("click","#btn_order_ok",function() {
//		if(pay_Way == "C"){
//			var IMP = window.IMP; // 생략가능
//			IMP.init('imp11329087');
//			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
//			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
//			IMP.request_pay({
//				// pg : 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자
//				pg : 'payco', // version 1.1.0부터 지원.
//				/*
//				 'kakao':카카오페이,
//				 'html5_inicis':이니시스(웹표준결제)
//				 'nice':나이스페이
//				 'jtnet':제이티넷
//				 'uplus':LG유플러스
//				 'danal':다날
//				 'payco':페이코
//				 'syrup':시럽페이
//				 'paypal':페이팔
//				 */
//				
//				//pay_method : 결제수단
//				pay_method : 'card',
//				/*
//				 'samsung':삼성페이,
//				 'card':신용카드,
//				 'trans':실시간계좌이체,
//				 'vbank':가상계좌,
//				 'phone':휴대폰소액결제
//				 */
//				
//				//escrow : 에스크로 결제여부(default : false)
//				//escrow : 'true';
//			
//				//merchant_uid : 가맹점에서 생성/관리하는 고유 주문번호
//				merchant_uid : 'merchant_' + new Date().getTime(),
//				/*
//				 merchant_uid에 경우
//				 https://docs.iamport.kr/implementation/payment
//				 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
//				 참고하세요.
//				 나중에 포스팅 해볼게요.
//				 */
//				//결제창에서 보여질 이름
//				name : $(".tb-left:eq(0)").text(),
//				//name : $(".tb-left:eq(0)").text(),
//				//결제할 금액
//				amount : 1000, 
//				//구매정보
//				buyer_email : 'iamport@siot.do',
//				buyer_name : '구매자이름',
//				buyer_tel : '010-1234-5678',
//				buyer_addr : '서울특별시 강남구 삼성동',
//				buyer_postcode : '123-456',
//				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
//			/*
//			 모바일 결제시,
//			 결제가 끝나고 랜딩되는 URL을 지정
//			 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
//			 */
//			}, function(rsp) {
//				console.log(rsp);
//				if (rsp.success) {
//					var msg = '결제가 완료되었습니다.';
//					msg += '고유ID : ' + rsp.imp_uid;
//					msg += '상점 거래ID : ' + rsp.merchant_uid;
//					msg += '결제 금액 : ' + rsp.paid_amount;
//					msg += '카드 승인번호 : ' + rsp.apply_num;
//				} else {
//					var msg = '결제에 실패하였습니다.';
//					msg += '에러내용 : ' + rsp.error_msg;
//					//location.href = "/insomnia/Pay/PayComplete.ins";
//				}
//				alert(msg);
//			});
//		}
//		//휴대폰 결제 시]
//		else if(pay_Way=="D"){
//			var IMP = window.IMP; // 생략가능
//			IMP.init('imp11329087');
//			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
//			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
//			IMP.request_pay({
//				// pg : 하나의 아임포트계정으로 여러 PG를 사용할 때 구분자
//				pg : 'uplus', 
//				pay_method : 'phone',			
//				//merchant_uid : 가맹점에서 생성/관리하는 고유 주문번호
//				merchant_uid : 'merchant_' + new Date().getTime(),
//				/*
//				 merchant_uid에 경우
//				 https://docs.iamport.kr/implementation/payment
//				 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
//				 참고하세요.
//				 나중에 포스팅 해볼게요.
//				 */
//				//결제창에서 보여질 이름
//				name : $(".tb-left:eq(0)").text(),
//				//name : $(".tb-left:eq(0)").text(),
//				//결제할 금액
//				amount : 100, 
//				//구매정보
//				buyer_email : 'iamport@siot.do',
//				buyer_name : '구매자이름',
//				buyer_tel : '010-1234-5678',
//				buyer_addr : '서울특별시 강남구 삼성동',
//				buyer_postcode : '123-456',
//				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
//			/*
//			 모바일 결제시,
//			 결제가 끝나고 랜딩되는 URL을 지정
//			 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
//			 */
//			}, function(rsp) {
//				console.log(rsp);
//				if (rsp.success) {
//					var msg = '결제가 완료되었습니다.';
//					msg += '고유ID : ' + rsp.imp_uid;
//					msg += '상점 거래ID : ' + rsp.merchant_uid;
//					msg += '결제 금액 : ' + rsp.paid_amount;
//					msg += '카드 승인번호 : ' + rsp.apply_num;
//				} else {
//					var msg = '결제에 실패하였습니다.';
//					msg += '에러내용 : ' + rsp.error_msg;
//					//location.href = "/insomnia/Pay/PayComplete.ins";
//				}
//				alert(msg);
//			});
//		}
//	});
//===============================================================================
	
	
});