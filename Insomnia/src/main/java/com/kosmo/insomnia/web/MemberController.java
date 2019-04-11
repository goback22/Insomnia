package com.kosmo.insomnia.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class MemberController {
	
	
	@RequestMapping("/home/Members.ins")
	public String select(Model model) throws Exception{
		
		return "home.tiles";
	}
	

}
