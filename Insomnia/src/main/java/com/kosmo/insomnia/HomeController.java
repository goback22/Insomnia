package com.kosmo.insomnia;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	//로그인 폼으로 이동, 혹은 홈 화면으로 이동
	@RequestMapping(value = "/home.ins", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Map map, HttpSession session) {
		
		if(session.getAttribute("id") != null) {
			
			map.put("id", session.getAttribute("id"));
			
			MemberDTO record = memberService.selectOne(map);
			
			if(record != null) {
				
				model.addAttribute("loginRecord", record);
				record.setProfile_img(record.getProfile_img());		
				model.addAttribute("record", record);
				//record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
				//model.addAttribute("record", record);
			}

			
		}
		
		
		return "home.tiles";
	}///home
	
	//메인 프로젝트
	@RequestMapping(value="/main/mainproject.ins")
	public String mainproject() {
		return "/main/mainproject.tiles";
	}
	
	//메인 프로젝트 - 컨텐트
	@RequestMapping(value="/main/content.ins")
	public String content() {
		return "/main/content.tiles";
	}
}//classs
