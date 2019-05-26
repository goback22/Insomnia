<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 아임포트 자바스크립트는 jQuery 기반으로 개발되었습니다 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" ></script>

<script>
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp11329087'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	/* 중략 */

	//onclick, onload 등 원하는 이벤트에 호출합니다
	IMP.request_pay({
 	    pg : 'kakaopay', // version 1.1.0부터 지원.
 	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:${title}',
	    amount : ${money},
 	    buyer_email : '${email}',
 	    buyer_name : '${name}',
	    buyer_tel : '${phone}',
	    app_scheme : 'iamportapp',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        location.href = "kakaopayscheme://kakaopayhost?title='${title}'&email='${email}'&name='${name}'&phone='${phone}'&money='${money}'&message='${message}'&paymethod='${paymethod}}'";
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
});
</script>

</head>