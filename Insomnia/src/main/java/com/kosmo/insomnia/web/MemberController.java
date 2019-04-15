package com.kosmo.insomnia.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class MemberController {
	
	@RequestMapping("/home/Members.ins")
	public String select(Model model) throws Exception{
		return "home.tiles";
	}//home.tilte
	
	
	@RequestMapping("/register/term.ins")
	public String toRegisterTerm() throws Exception{
		return "my/RegisterTerm.tiles";
	}//toRegisterTerm
	
	@RequestMapping("/register/form.ins")
	public String toRegisterForm(@RequestParam Map params, Model model) throws Exception{
		model.addAttribute("advertise", params.get("advertise")==null ? "" :  params.get("advertise").toString());
		return "my/RegisterForm.tiles";
	}//toRegisterForm
	
	@RequestMapping("/register/complete.ins")
	public String toComplete(@RequestParam Map params) throws Exception{
		System.out.println(params.toString());
		return "home.tiles";
	}//toComplete
	

}//class