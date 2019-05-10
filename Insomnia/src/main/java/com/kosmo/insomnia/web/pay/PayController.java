package com.kosmo.insomnia.web.pay;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.util.login.MailHandler;

@Controller
public class PayController {
	
	//결제페이지[서브]로 이동]
	@RequestMapping(value="/Pay/PayPage.ins")
	public String payPage(@RequestParam Map map,Map view,HttpSession session) throws Exception{
		view.put("name", session.getAttribute("login_user_name"));
		view.put("email", session.getAttribute("id"));
		view.put("phone_num", session.getAttribute("login_user_phoneNb"));
		
		StringTokenizer st = new StringTokenizer(view.get("email").toString(), "@");
		view.put("email_first",st.nextToken());
		view.put("email_second", st.nextToken());
		
		view.put("phone_first", view.get("phone_num").toString().substring(2,6));
		view.put("phone_second", view.get("phone_num").toString().substring(6));	
			
		return "/Pay/SubPayPage.tiles";
	}///payPage()

}/////class
