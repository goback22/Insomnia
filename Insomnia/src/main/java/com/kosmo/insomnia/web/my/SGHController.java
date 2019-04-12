package com.kosmo.insomnia.web.my;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class SGHController {
	
	@RequestMapping("/register/term.ins")
	public String registerTerm() throws Exception {
		
		return "my/RegisterTerm.tiles";
	}
	
	@RequestMapping("/register/form.ins")
	public String registerForm() throws Exception {
		
		return "my/RegisterForm.tiles";
	}
	
	@RequestMapping("/register/complete.ins")
	public String registerComplete() throws Exception {
		
		return "my/RegisterComplete.tiles";
	}
	
	@RequestMapping("/menu/mypage.ins")
	public String mypage() throws Exception {
		
		return "my/MyPage.tiles";
	}
	
	@RequestMapping("/menu/mypage/edit.ins")
	public String mypage_edit() throws Exception {
		
		return "my/MemberEdit.tiles";
	}
	
	@RequestMapping("/login/social.ins")
	public String login_social(@RequestParam Map map, Model model, HttpSession session) throws Exception {
		
		
		String name = map.get("socialEmail").toString();
		session.setAttribute("user_id", name);
		
		return "home.tiles";
	}
	

}
