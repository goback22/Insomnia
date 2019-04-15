package com.kosmo.insomnia.web.my;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;

@Controller
public class SGHController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;

	@RequestMapping("/menu/mypage.ins")
	public String mypage() throws Exception {
		
		return "my/MyPage.tiles";
	}
	
	@RequestMapping("/menu/mypage/edit.ins")
	public String mypage_edit() throws Exception {
		
		return "my/MemberEdit.tiles";
	}
	
	
	//소셜 회원가입/로그인 구분  ==> DB에 없을 경우, 저장 후 추가정보 입력
	@RequestMapping("/social.ins")
	public String which_social(@RequestParam Map map) throws Exception {
		String socialEmail = map.get("socialName").toString();
		
		//분기: DB에 없을 시 가입 메세지, DB에 있을시 바로 로그인 메서드로.
		/*if(memberService.isMember()) {
			
		}*/
		
		return "forward:/login/social.ins";
	}
	
	
	////소셜 로그인 : DB저장, el로 값 뿌려주기
	@RequestMapping("/login/social.ins")
	public String login_social(@RequestParam Map map, Model model, HttpSession session) throws Exception {
		
		
		String socialName = map.get("socialName").toString();
		String socialEmail = map.get("socialEmail").toString();
		String socialProfile = map.get("socialProfile").toString();
		String socialBirth = map.get("socialBirth").toString();
		
		//생일 처리
		String[] birthArr = socialBirth.split("/");
		socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);
		
		
		
		//세션에 저장할 필요가?
		session.setAttribute("id", socialName);
		
		//모델에 저장 : 이메일, 이미지,생일
		model.addAttribute("socialName", socialName);  //세션에도 저장했지만, 일반 로그인과 소셜 로그인시 화면 구분을 위해 임시로 넣어두었다.
		model.addAttribute("socialEmail", socialEmail);
		model.addAttribute("socialProfile", socialProfile);
		model.addAttribute("socialBirth", socialBirth);
				
		return "home.tiles";
	}
	
	
	
	

}
