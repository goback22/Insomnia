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

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
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
	
	
	//소셜 로그인
	@RequestMapping("/login/social.ins")
	public String socialLogin(@RequestParam Map map,  HttpSession session, Model model) throws Exception {
		
		//공급자가 제공한 소셜 아이디 얻기
		String socialId = map.get("socialId").toString();
		
		if(memberService.isSocialMember(map)) {  // 계정 있을시 로그인
			
			//로그인 처리
			session.setAttribute("id", socialId);
			
			/*
			//현재 로그인한 사용자의 정보 가져오는 dao 메서드, 한결님 메서드 사용 예정
			MemberDTO record = memberService.selectOne(map);
			model.addAttribute("socialName", record.getName());
			model.addAttribute("socialProfile", map.get("socialProfile").toString());  //사진은 매번 새로
			model.addAttribute("socialEmail", record.getEmail());
			
			String birthday = record.getBirthDay();
			String[] birthArr = birthday.split("/");
			birthday = String.format("20%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);
			
			model.addAttribute("socialBirth", birthday);
			*/
			
			return "home.tiles";
		} else {   					 	 //최초 접속시 회원가입 처리
			return "forward:/register/social.ins";
		}
		
	}/////socialLogin()
	
	
	//소셜 회원가입
	@RequestMapping("/register/social.ins")
	public String socialRegister(@RequestParam Map map, Model model, HttpSession session) throws Exception {
		
		///현재 사용자의 SNS계정 정보 가져오기
		String socialId = map.get("socialId").toString();
		String socialName = map.get("socialName").toString();
		String socialEmail = map.get("socialEmail").toString();
		String socialProfile = map.get("socialProfile").toString();
		String socialBirth = map.get("socialBirth").toString();
		
		System.out.println(socialBirth + " 가 이것!");
		
		//생일 처리
		/*String[] birthArr = socialBirth.split("/");
		socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);*/
		//지정한 월이 부적합합니다. 오류. String타입으로 저장해야 하지만, 뿌려줄 때만 이렇게 바꿔서 뿌려주고 저장할 때는 Date형식으로 저장하자.
		String[] birthArr = socialBirth.split("/");
		String year = birthArr[2].substring(2);
		socialBirth = year + "/" + birthArr[0] + "/" + birthArr[1];
		map.put("socialBirth", socialBirth);
		
		
		//DB에 저장
		boolean isRegistered = memberService.socialRegister(map);
		
		//저장에 성공했다면
		if(isRegistered) {
			
			//로그인 처리
			session.setAttribute("id", socialId);
			//현재 로그인한 사용자의 정보 가져오는 dao 메서드 사용 예정
			
			//회원의 최초 정보 가져오기(DB에서 가져올 수도 있지만 최초 가입이니까 form에서 직접 가져와도 무방하다고 판단)
			model.addAttribute("socialName", socialName);
			model.addAttribute("socialProfile", socialProfile);
			model.addAttribute("socialEmail", socialEmail);
			//출력시 생일 처리 (DB저장된 값과는 다르다)
			socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);
			model.addAttribute("socialBirth", socialBirth);
			
		} else { //실패했다면
			model.addAttribute("socialRegisterErr", "소셜 회원가입에 실패했습니다.");
		}
				
		return "home.tiles";
		
	}////socialRegister()
	
	
	
	

}/////////class
