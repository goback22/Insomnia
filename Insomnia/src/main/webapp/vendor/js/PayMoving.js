$(function(){
	
// ======= 주문자 정보(정보와 같음 클릭 시) -> 배송정보로 정보 이동 ============
	$("#same").click(function(){
		if($(this).get(0).checked){
			$("#receiver").val($("#sender").val());
			$("#emergency21").val($("#emergency11").val());
			$("#emergency22").val($("#emergency12").val());
			$("#emergency23").val($("#emergency13").val());
			
		}else{
			$("#receiver").val("");
			$("#emergency21").val("");
			$("#emergency22").val("");
			$("#emergency23").val("");
		}
	});
//===============================================================================

//=========================== 결제 수단 이벤트 처리 =============================
	/*console.log($(".pay-method input[name='radio_paymethod']").val());*/
	
	var pay_Way;
	$("input[name='radio_paymethod']").click(function(){
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
			break;
		//======== 무통장 입금 ========
			
		//======== PAYCO ========
		case 'PAYCO':
			$("#evidence").css("display","none");
	        $(".no_BankBook").css("display","none");
			break;
		//======== PAYCO ========
		
		//======== 신용카드 ========
		case 'C':
			$("#evidence").css("display","none");
	        $(".no_BankBook").css("display","none");
			break;
		//======== 신용카드 ========
		
		//======== 휴대폰 결제 ========
		case 'D':
			$("#evidence").css("display","none");
	        $(".no_BankBook").css("display","none");
			break;
		//======== 휴대폰 결제 ========
			
		//======== 카카오 페이 ========
		default :
			$("#evidence").css("display","none");
        	$(".no_BankBook").css("display","none");
		//======== 카카오 페이 ========
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
	
//============================ 이메일 이벤트 처리 ===============================
	$(".choose_email").change(function(){
		console.log($(this).val());
		console.log($(".choose_email option").length);
		if($(this).val() == $(".choose_email option").length-1){
			$("#email_self").css("display","");
		}else{
			$("#email_self").css("display","none");
		}
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
	$(this).on("click",".btn_plus",function(){
		//var item_count = $(".item_Count_"+값).text();
		var item_count = $(this).prev().val();
		var div_money = $(this).closest("div").next().attr("class");
		console.log(div_money);
		
		item_count++;
		$(this).prev().val(item_count);
	});
	
	$(this).on("click",".btn_minus",function(){
		//var item_count = $(".item_Count_"+값).text();
		var item_count = $(this).prev().prev().val();
		if(item_count != 0)
			item_count--;
		$(this).prev().prev().val(item_count);
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
						"<div class='tb-right tb-bold tb-center_ div_money_"+count+"'>2,900원</div>"+
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
				"<input type='button' class='btn btn-info btn_minus' value='-''>"+
			"</div>"+
		"</td>"+
		"<td>"+
			"<div class='tb-right tb-bold tb-center_"+count+"'>2,900원</div>"+
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
	var options = { percent: 50 };
	$(".btn_all_check").click(function(){
		$(".order_list_checked").prop("checked",true);
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
	$(".btn_all_release").click(function(){
		$(".order_list_checked").prop("checked",false);
	});
	
//===============================================================================
	
});