package com.kosmo.insomnia.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.insomnia.serviceimpl.SupportersServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class SupportersController {

	@Resource(name="supportersServiceImpl")
	private SupportersServiceImpl supportersService;
	
	@RequestMapping("/home/supporters.ins")
	public String select(Model model) throws Exception{
		List list = supportersService.selectList();
		model.addAttribute("list",list);
		return "home.tiles";
	}
}
