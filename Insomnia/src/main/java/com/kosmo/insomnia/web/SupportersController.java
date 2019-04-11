package com.kosmo.insomnia.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class SupportersController {

	@Resource(name="insService")
	private MemberServiceImpl insService;
	
	//로그인 처리
	@RequestMapping("/login.ins")
	public String login(HttpSession session, Model model, @RequestParam Map map) throws Exception{
		
		//서비스 호출
		boolean flag = insService.isMember(map);
		
		System.out.println(map.get("id"));
		System.out.println(map.get("password"));
		System.out.println(flag);
		
		if(flag) {
			session.setAttribute("id", map.get("id"));
		}
		else {
			model.addAttribute("errorMessage", "아디, 비번 불일치");
		}
		
		return "home.tiles";
	}
	
	
	
	
	
}
