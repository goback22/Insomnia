package com.kosmo.insomnia.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class SupportersController {

	@Resource(name="memberService")
	
	
	@RequestMapping("/login.ins")
	public String adasd(Model model) throws Exception{
		
		
		
		
		return "/main/home.tiles";
	}
	
	
	
	
	
}
