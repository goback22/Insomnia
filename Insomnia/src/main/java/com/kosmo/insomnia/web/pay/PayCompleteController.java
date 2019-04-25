package com.kosmo.insomnia.web.pay;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.service.BGSPayService;
import com.kosmo.insomnia.util.login.MailHandler;

@Controller
public class PayCompleteController {
	
	@Resource(name="bGSPayService")
	private BGSPayService bGSPayService;
	
	//이메일 보내기 위한 Inject]
	@Inject
	private JavaMailSender mailSender;
		
	//현재(주문)시간 구하기]
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
	//콤마찍기]
	DecimalFormat df = new DecimalFormat("#,##0");

	
	//결제 완료페이지]
	@RequestMapping(value="/Pay/PayComplete.ins",method = RequestMethod.POST)
	public String payComplete(@RequestParam Map map,Model model,HttpSession session) throws Exception {
		//주문자 정보 - 이름]
		model.addAttribute("sender_name", map.get("sender_name"));
		
		//주문리스트 - 제품]
		System.out.println(map.get("subPay_Title").toString());
		model.addAttribute("subPay_Title", map.get("subPay_Title").toString());
		System.out.println(map.get("subPay_Content").toString());
		model.addAttribute("subPay_Content", map.get("subPay_Content").toString());
		
		//최종 결제 금액]
		System.out.println("최종 금액 : "+map.get("subPay_Final_payment_amount").toString());
		model.addAttribute("subPay_Final_payment_amount", map.get("subPay_Final_payment_amount").toString());
		
		//제품 수량]
		System.out.println("수량 : "+map.get("subPay_Item_Qty"));
		model.addAttribute("subPay_Item_Qty", map.get("subPay_Item_Qty"));
		
		//판매가]
		int a = Integer.parseInt(map.get("subPay_Final_payment_amount").toString());
		int b = Integer.parseInt(map.get("subPay_Item_Qty").toString());
		int c = a / b;
		
		//1] 결제방법 - 무통장입금]
		if(map.get("subPay_orderWay").toString().equals("B")) {
			System.out.println("====== 무통장 입금 ======");
			//결제 방식]
			model.addAttribute("subPay_orderWay", "무통장 입금");
			
			//주문자 정보 및 무통장 입금자명]
			System.out.println(map.get("subPay_Name"));
			model.addAttribute("subPay_Name", map.get("subPay_Name").toString());
			
			String send_Email = "";
			//이메일 앞자리]
			System.out.println(map.get("subPay_Email1"));
			send_Email+=map.get("subPay_Email1").toString().trim()+"@";
			model.addAttribute("subPay_Email1", map.get("subPay_Email1").toString());
			//이메일 @ 이후]
			String subpay_Email = map.get("subPay_Email2").toString().trim();
			System.out.println("선택한거 : "+subpay_Email);
			if(subpay_Email.equals("0")) {
				System.out.println("0번째");
				model.addAttribute("subPay_Email2", "naver.com");
				send_Email+="naver.com";
			}else if(subpay_Email.equals("1")) {
				System.out.println("1번째");
				model.addAttribute("subPay_Email2", "daum.net");
				send_Email+="daum.net";
			}else if(subpay_Email.equals("2")) {
				System.out.println("2번째");
				model.addAttribute("subPay_Email2", "nate.com");
				send_Email+="nate.com";
			}else if(subpay_Email.equals("3")){
				System.out.println("3번째");
				model.addAttribute("subPay_Email2", "google.com");
				send_Email+="google.com";
			}else {
				System.out.println("직접입력");
				model.addAttribute("subPay_Email2", map.get("subPay_Email_Self").toString());
				send_Email+=map.get("subPay_Email_Self").toString().trim();
			}
			System.out.println("보내는 이메일 : "+send_Email);
			
			//핸드폰 번호 (xxx-) x자리
			System.out.println(map.get("subPay_Phone1"));
			model.addAttribute("subPay_Phone1", map.get("subPay_Phone1").toString());
			
			//핸드폰 번호 (010-xxxx) x자리	
			System.out.println(map.get("subPay_Phone2"));
			model.addAttribute("subPay_Phone2", map.get("subPay_Phone2").toString());
			
			//핸드폰 번호 (010-1234-xxxx) x자리
			System.out.println(map.get("subPay_Phone3"));
			model.addAttribute("subPay_Phone3", map.get("subPay_Phone3").toString());
			
			String phone_Number = 
					map.get("subPay_Phone1").toString().trim()+"-"
					+map.get("subPay_Phone2").toString().trim()+"-"
					+map.get("subPay_Phone3").toString().trim();
			
			String order_Message = "";
			//주문메시지]
			if(!map.get("subPay_Message").equals("")) {
				System.out.println(map.get("subPay_Message"));
				model.addAttribute("subPay_Message", map.get("subPay_Message").toString());
				order_Message = map.get("subPay_Message").toString();
			}else {
				System.out.println("메시지 미 입력");
				model.addAttribute("subPay_Message", "주문 메시지 미 입력");
				order_Message = "주문 메시지 미 입력";
			}
			
			String no_Bank_Name="";
			//무통장 입금자명]
			if(map.get("subPay_Bank_Name").equals("")) {
				System.out.println("주문자 명과 무통장 입금자 명이 같음");
				model.addAttribute("subPay_Bank_Name", map.get("subPay_Name").toString());
				no_Bank_Name = map.get("subPay_Name").toString();
			}else {
				System.out.println("주문자 명과 무통장 입금자 명이 다름");
				model.addAttribute("subPay_Bank_Name", map.get("subPay_Bank_Name").toString());
				no_Bank_Name = map.get("subPay_Bank_Name").toString();
			}
			
			//무통장 환불 예금주]
			System.out.println(map.get("subPay_Refund_Name"));
			model.addAttribute("subPay_Refund_Name", map.get("subPay_Refund_Name").toString());
			
			//무통장 환불 은행명]
			System.out.println(map.get("subPay_Refund_BankName"));
			model.addAttribute("subPay_Refund_BankName", map.get("subPay_Refund_BankName").toString());
			
			//무통장 환불 계좌]
			System.out.println(map.get("subPay_Refund_BankAccount"));
			model.addAttribute("subPay_Refund_BankAccount", map.get("subPay_Refund_BankAccount").toString());
			
			StringBuffer message = new StringBuffer();
			message.append("<div>\r\n" + 
					"	<table style=\"border: 1px solid #bbc0c4;\" width=\"700\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n" + 
					"		<tbody>\r\n" + 
					"			<tr>\r\n" + 
					"				<td style=\"padding: 24px 14px 0;\">\r\n" + 
					"					<table width=\"670\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"						<tbody>\r\n" + 
					"							<!-- 상단메인배너 -->\r\n" + 
					"							<tr>\r\n" + 
					"								<td>\r\n" + 
					"									<img src=\"http://m-img.cafe24.com/images/template/admin/kr/img_visual_customer_3.jpg\" alt=\"\">\r\n" + 
					"								</td>\r\n" + 
					"							</tr>\r\n" + 
					"							<!-- //상단메인배너 -->\r\n" + 
					"							<!-- 인사말 -->\r\n" + 
					"							<tr>\r\n" + 
					"								<td style=\"padding: 50px 0 0 10px; font-size: 12px; font-family: Gulim; color: #393939; line-height: 19px;\">\r\n" + 
					"									<p>\r\n" + 
					"										안녕하세요. <strong>(주)Insomnia</strong> 입니다.<br/> \r\n" + 
					"										저희 사이트를 이용해주셔서 진심으로 감사드립니다.\r\n" + 
					"									</p>\r\n" + 
					"									<p style=\"margin-top: 13px;\">\r\n" + 
					"										<strong>"+map.get("sender_name")+"</strong> \r\n" + 
					"										고객님께서 저희 사이트에서 주문하신 내역입니다.\r\n" + 
					"									</p>\r\n" + 
					"								</td>\r\n" + 
					"							</tr>\r\n" + 
					"							<!-- //인사말 -->\r\n" + 
					"							<tr>\r\n" + 
					"								<td>\r\n" + 
					"									<!-- 컨텐츠 -->\r\n" + 
					"									<table\r\n" + 
					"										style=\"font-size: 12px; font-family: Gulim; color: #393939; line-height: 19px;\"\r\n" + 
					"										width=\"670\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"										<tbody>\r\n" + 
					"											<tr>\r\n" + 
					"												<td style=\"padding: 23px 0 0;\">\r\n" + 
					"													<p style=\"margin: 0 0 25px 10px\">\r\n" + 
					"														고객님께서는 <strong>"+date.format(today)+"</strong> 에 \r\n" + 
					"														<strong>(주)Insomnia</strong>에서 아래와 같은 상품을 주문하셨고,<br> \r\n" + 
					"														<strong>"+df.format(Integer.parseInt(map.get("subPay_Final_payment_amount").toString()))+"원 무통장 입금</strong> 결제방법으로 선택하셨습니다.\r\n" + 
					"													</p>\r\n" + 
					"													<table class=\"tableColor\" style=\"font-size: 12px; font-family: Gulim; line-height: 15px; border-top: 1px solid #d5d5d5;\"\r\n" + 
					"														width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<thead>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; \r\n" + 
					"																border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d;\" width=\"33%\">\r\n" + 
					"																	주문자\r\n" + 
					"																</th>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; \r\n" + 
					"																border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #80878d;\" width=\"33%\">\r\n" + 
					"																	결제번호\r\n" + 
					"																</th>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; \r\n" + 
					"																border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #80878d;\" width=\"34%\">\r\n" + 
					"																	주문일자\r\n" + 
					"																</th>\r\n" + 
					"															</tr>\r\n" + 
					"														</thead>\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"center\">"+send_Email+"("+map.get("sender_name")+")</td>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"center\">=====결제번호=====</td>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"center\">"+date.format(today)+"</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"												</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<tr>\r\n" + 
					"												<td height=\"40\">&nbsp;</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<!-- 컨텐츠 공통 여백 -->\r\n" + 
					"											<!-- 주문 상품 정보 -->\r\n" + 
					"											<tr>\r\n" + 
					"												<td>\r\n" + 
					"													<table style=\"margin: 0 0 20px;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<td width=\"19\" valign=\"middle\">\r\n" + 
					"																	<img src=\"http://m-img.cafe24.com/images/template/admin/kr/ico_title.gif\" alt=\"\">\r\n" + 
					"																</td>\r\n" + 
					"																<td valign=\"middle\">\r\n" + 
					"																	<strong style=\"font-size: 13px; font-family: Gulim; color: #1c1c1c;\">주문 상품 정보</strong>\r\n" + 
					"																</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"\r\n" + 
					"													<table class=\"tableColor\" style=\"font-size: 12px; font-family: Gulim; line-height: 15px; border-top: 1px solid #d5d5d5;\"\r\n" + 
					"														width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<thead>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; border-bottom: 1px solid #d5d5d5; \r\n" + 
					"																border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d;\"\r\n" + 
					"																	width=\"50%\">\r\n" + 
					"																	상품명\r\n" + 
					"																</th>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; border-bottom: 1px solid #d5d5d5; \r\n" + 
					"																border-right: 1px solid #d5d5d5; color: #80878d;\" width=\"10%\">\r\n" + 
					"																	수량\r\n" + 
					"																</th>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; border-bottom: 1px solid #d5d5d5; \r\n" + 
					"																border-right: 1px solid #d5d5d5; color: #80878d;\" width=\"20%\">\r\n" + 
					"																	판매가\r\n" + 
					"																</th>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"col\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; border-bottom: 1px solid #d5d5d5; \r\n" + 
					"																border-right: 1px solid #d5d5d5; color: #80878d;\" width=\"20%\">\r\n" + 
					"																	상품구매금액\r\n" + 
					"																</th>\r\n" + 
					"															</tr>\r\n" + 
					"														</thead>\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"left\">"+map.get("subPay_Title").toString()+" "+map.get("subPay_Content").toString()+"</td>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"center\">"+map.get("subPay_Item_Qty")+"</td>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"center\">"+df.format(c)+"원</td>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	valign=\"middle\" align=\"center\">"+df.format(Integer.parseInt(map.get("subPay_Final_payment_amount").toString()))+"원</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"\r\n" + 
					"												</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<!-- //주문 상품 정보 -->\r\n" + 
					"											<tr>\r\n" + 
					"												<td height=\"40\">&nbsp;</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<!-- 컨텐츠 공통 여백 -->\r\n" + 
					"											<tr>\r\n" + 
					"												<!-- 결제 정보 -->\r\n" + 
					"												<td>\r\n" + 
					"													<table style=\"margin: 0 0 20px;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<td width=\"19\" valign=\"middle\">\r\n" + 
					"																	<img src=\"http://m-img.cafe24.com/images/template/admin/kr/ico_title.gif\" alt=\"\">\r\n" + 
					"																</td>\r\n" + 
					"																<td valign=\"middle\">\r\n" + 
					"																	<strong style=\"font-size: 13px; font-family: Gulim; color: #1c1c1c;\">결제 정보</strong>\r\n" + 
					"																</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"\r\n" + 
					"													<table class=\"tableColor\" style=\"font-size: 12px; font-family: Gulim; line-height: 15px; border-top: 1px solid #d5d5d5;\"\r\n" + 
					"															width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; \r\n" + 
					"																	border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	총 결제금액\r\n" + 
					"																</th>\r\n" + 
					"																<td style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"28%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	<strong>"+df.format(Integer.parseInt(map.get("subPay_Final_payment_amount").toString()))+" 원</strong>\r\n" + 
					"																</td>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #80878d;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">결제수단</th>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"width: 179px; padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"28%\" valign=\"middle\" align=\"left\">무통장 입금</td>\r\n" + 
					"															</tr>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; \r\n" + 
					"																	border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	쿠폰할인\r\n" + 
					"																</th>\r\n" + 
					"																<td style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"28%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	<strong>=====쿠폰할인==== 원</strong>\r\n" + 
					"																</td>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding: 13px 10px 10px; font-weight: normal; background-color: #f5f6f5; \r\n" + 
					"																	border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #80878d;\" width=\"22%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	지급 예정 적립 포인트\r\n" + 
					"																</th>\r\n" + 
					"																<td style=\"width: 179px; padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"28%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	=====적립 포인트=====원\r\n" + 
					"																</td>\r\n" + 
					"															</tr>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"padding:13px 10px 10px; background-color:#f5f6f5; border-bottom:1px solid #d5d5d5; \r\n" + 
					"																	border-right:1px solid #d5d5d5; border-left:1px solid #d5d5d5; font-weight:normal; color:#80878d;\" width=\"22%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	사용 포인트\r\n" + 
					"																</th>\r\n" + 
					"																<td colspan=\"3\" style=\"padding:13px 10px 10px; border-bottom:1px solid #d5d5d5; border-right:1px solid #d5d5d5; color:#393939;\" \r\n" + 
					"																	width=\"\" valign=\"middle\" align=\"left\">=====사용 포인트=====원\r\n" + 
					"																</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"\r\n" + 
					"												</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<tr></tr>\r\n" + 
					"											<tr>\r\n" + 
					"												<td height=\"30\">&nbsp;</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<tr>\r\n" + 
					"												<td>\r\n" + 
					"													<p style=\"margin-top: 0; margin-left: 10px;\">\r\n" + 
					"														무통장 입금 결제를 신청하신 경우 상기 결제 금액을 아래의 해당 입금 계좌로 입금해주시기 바랍니다.<br>\r\n" + 
					"														<span style=\"\">\r\n" + 
					"															무통장 입금 주문시 입력하신 입금자명<strong>("+no_Bank_Name+")</strong>과 실제 입금하신 분의 성함이 동일해야 합니다.<br>\r\n" + 
					"														</span> \r\n" + 
					"														<strong>신한은행 : 110394023184 \r\n" + 
					"														<span style=\"\">[예금주: (주)Insomnia]</span>\r\n" + 
					"														</strong><br> 입금이 확인된 이후에 주문상품의 배송이 이루어집니다.\r\n" + 
					"													</p>\r\n" + 
					"													<p style=\"margin: 13px 0 0 10px; font-size: 11px;\">\r\n" + 
					"														<img src=\"http://m-img.cafe24.com/images/template/admin/jp/ico_dot.gif\" alt=\"\">\r\n" + 
					"														문자 및 메일로 티켓을 보내드립니다.<br>\r\n" + 
					"													</p>\r\n" + 
					"												</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<!-- //결제 정보 -->\r\n" + 
					"											<tr>\r\n" + 
					"												<td height=\"40\">&nbsp;</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<!-- 컨텐츠 공통 여백 -->\r\n" + 
					"											<tr>\r\n" + 
					"												<!-- 티켓 예매 정보 -->\r\n" + 
					"												<td>\r\n" + 
					"													<table style=\"margin: 0 0 20px;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<td width=\"19\" valign=\"middle\">\r\n" + 
					"																	<img src=\"http://m-img.cafe24.com/images/template/admin/kr/ico_title.gif\" alt=\"\">\r\n" + 
					"																</td>\r\n" + 
					"																<td valign=\"middle\">\r\n" + 
					"																	<strong style=\"font-size: 13px; font-family: Gulim; color: #1c1c1c;\">\r\n" + 
					"																		티켓 예매 정보\r\n" + 
					"																	</strong>\r\n" + 
					"																</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"													<table class=\"tableColor\"\r\n" + 
					"														style=\"font-size: 12px; font-family: Gulim; line-height: 15px; border-top: 1px solid #d5d5d5;\"\r\n" + 
					"														width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n" + 
					"														<tbody>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; font-weight: normal; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d; background-color: #f5f6f5;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">받으시는분</th>\r\n" + 
					"																<td colspan=\"3\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"78%\" valign=\"middle\" align=\"left\">"+map.get("subPay_Name").toString()+"</td>\r\n" + 
					"															</tr>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; font-weight: normal; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d; background-color: #f5f6f5;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">이메일</th>\r\n" + 
					"																<td colspan=\"3\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"78%\" valign=\"middle\" align=\"left\">\r\n" + 
					"																	"+send_Email+"\r\n" + 
					"																</td>\r\n" + 
					"															</tr>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; font-weight: normal; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d; background-color: #f5f6f5;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">일반전화</th>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"28%\" valign=\"middle\" align=\"left\">--</td>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; font-weight: normal; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #80878d; background-color: #f5f6f5;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">휴대전화</th>\r\n" + 
					"																<td\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"28%\" valign=\"middle\" align=\"left\">"+phone_Number+"</td>\r\n" + 
					"															</tr>\r\n" + 
					"															<tr>\r\n" + 
					"																<th colspan=\"1\" rowspan=\"1\" scope=\"row\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; font-weight: normal; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; border-left: 1px solid #d5d5d5; color: #80878d; background-color: #f5f6f5;\"\r\n" + 
					"																	width=\"22%\" valign=\"middle\" align=\"left\">배송메세지</th>\r\n" + 
					"																<td colspan=\"3\"\r\n" + 
					"																	style=\"padding: 13px 10px 10px; border-bottom: 1px solid #d5d5d5; border-right: 1px solid #d5d5d5; color: #393939;\"\r\n" + 
					"																	width=\"78%\" valign=\"middle\" align=\"left\">"+order_Message+"</td>\r\n" + 
					"															</tr>\r\n" + 
					"														</tbody>\r\n" + 
					"													</table>\r\n" + 
					"												</td>\r\n" + 
					"											</tr>\r\n" + 
					"											<!-- //배송지 정보 -->\r\n" + 
					"										</tbody>\r\n" + 
					"									</table> <!-- //컨텐츠 -->\r\n" + 
					"								</td>\r\n" + 
					"							</tr>\r\n" + 
					"							<!-- 맺음말 -->\r\n" + 
					"							<tr>\r\n" + 
					"								<td\r\n" + 
					"									style=\"padding: 30px 0 60px 10px; font-size: 12px; font-family: Gulim; color: #393939; line-height: 19px;\">\r\n" + 
					"									<p>\r\n" + 
					"										주문내역에 착오가 있거나, 주문내역을 변경하실 경우, 그외 기타 문의사항이 있으시면<br> \r\n" + 
					"										저희 사이트 고객 서비스 센터로 연락 주십시오.\r\n" + 
					"									</p>\r\n" + 
					"									<p style=\"margin-top: 13px;\">\r\n" + 
					"										다시 한번 저희 사이트을 이용해주신 <strong>"+map.get("sender_name").toString()+"</strong> 고객님께 진심으로 감사드립니다.\r\n" + 
					"									</p>\r\n" + 
					"								</td>\r\n" + 
					"							</tr>\r\n" + 
					"							<!-- //맺음말 -->\r\n" + 
					"						</tbody>\r\n" + 
					"					</table>\r\n" + 
					"				</td>\r\n" + 
					"			</tr>\r\n" + 
					"			<!-- 회사소개 -->\r\n" + 
					"			<tr>\r\n" + 
					"				<td\r\n" + 
					"					style=\"padding: 24px 34px; font-family: Gulim; font-size: 12px; line-height: 18px; background-color: #cacdd4; color: #fff;\">\r\n" + 
					"					<p style=\"\">\r\n" + 
					"						Tel : <strong>010-2004-3942</strong><br/>\r\n" + 
					"						서울특별시 금천구 가산디지털2로 123 월드메르디앙2차 301호<br> \r\n" + 
					"						대표이사 : 임한결 | 개인정보보호책임자 : Insomnia\r\n" + 
					"					</p>\r\n" + 
					"					<p>\r\n" + 
					"						Copyright(c) 인섬니아 all rights reserved. \r\n" + 
					"						<a href=\"http://www.insomnia.com\" target=\"_blank\" style=\"color: #fff; text-decoration: none;\" rel=\"noreferrer noopener\">\r\n" + 
					"							http://www.insomnia.com\r\n" + 
					"						</a>\r\n" + 
					"					</p>\r\n" + 
					"				</td>\r\n" + 
					"			</tr>\r\n" + 
					"			<!-- //회사소개 -->\r\n" + 
					"		</tbody>\r\n" + 
					"	</table>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"</div>");
			
			try {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("[insomnia]"+map.get("sender_name")+"님 주문 내역을 알려드립니다."); //메일 제목은 생략이 가능하다]
				/*
				 * sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				 * .append("<a href='http://localhost:8080/insomnia/emailConfirm.ins?user_email="
				 * ).append(map.get("id").toString()) .append("&key=") .append(key)
				 * .append("' target='_blenk'>이메일 인증 확인</a>").toString());
				 */
				sendMail.setText(message.toString());//메일 내용]
				sendMail.setFrom("insmonia@insumnia.com", "인섬니아 관리자");//보내는 사람 이메일]
				sendMail.setTo(send_Email.toString());//받는사람 이메일]
				sendMail.send();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Map record = new HashMap();
			//P_NO -> 결제번호]
			record.put("id",session.getAttribute("id")); // 주문자 아이디]
			record.put("qty",map.get("subPay_Item_Qty")); // 주문 수량]
			//pagydate -> 주문 날짜]
			record.put("bank_name", no_Bank_Name); // 무통장 입금자 명]
			record.put("phone", phone_Number); // 핸드폰 번호]
			record.put("email", send_Email); // 이메일]
			record.put("non_bankbook","Y"); // 무통장 여부]
			record.put("non_bankbook_complete", "N"); // 무통장 시 입금 여부]
			record.put("non_bankbook_bank_name", map.get("subPay_Refund_BankName")); // 무통장 환불받을 은행명]
			record.put("non_bankbook_account_serial", map.get("subPay_Refund_BankAccount")); // 무통장 환불 받을 계좌번호]
			//CT_NO -> 콘서트 시간정보번호]
			bGSPayService.insert(record);
			
			return "/Pay/SubPayComplete_1.tiles";
		}
		System.out.println("====== 무통장 입금 외======");
		return "/Pay/SubPayComplete_2.tiles";
	}/////payComplete()
}
