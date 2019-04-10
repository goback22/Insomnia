package com.kosmo.insomnia.web.my;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	

}
