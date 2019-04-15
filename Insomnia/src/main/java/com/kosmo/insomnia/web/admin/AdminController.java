package com.kosmo.insomnia.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value="/admin/index.ins")
	public String admin() {
		return "/admin/AdminIndex";
	}
	
	@RequestMapping(value="/admin/allmember.ins")
	public String allMember() {
		return "/admin/AdminAllMember";
	}
	
	@RequestMapping(value="/admin/newmember.ins")
	public String newMember() {
		return "/admin/AdminNewMember";
	}
	
	@RequestMapping(value="/admin/submember.ins")
	public String subMember() {
		return "/admin/AdminSubMember";
	}
	
	@RequestMapping(value="/admin/maincontent.ins")
	public String mainContent() {
		return "/admin/AdminMainContentMember";
	}
	
	//서브
	@RequestMapping(value="/admin/subcontent.ins")
	public String subContent() {
		return "/admin/AdminSubContent";
	}
}/////////////
