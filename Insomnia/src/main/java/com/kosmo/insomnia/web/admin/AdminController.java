package com.kosmo.insomnia.web.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.serviceimpl.AdminServiceImpl;

@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	@RequestMapping(value="/admin/index.ins")
	public String admin(Map map,Model model) throws Exception {
		List<AdminDTO> list = adminService.selectList(map);	
		model.addAttribute("list", list);
		return "/admin/AdminIndex";
	}
	
	@RequestMapping(value="/admin/allmember.ins")
	public String allMember(Map map,Model model) throws Exception {
		List<AdminDTO> list = adminService.selectList(map);	
		model.addAttribute("list", list);
		return "/admin/AdminAllMember";
	}
	
	@RequestMapping(value="/admin/newmember.ins")
	public String newMember(Map map,Model model) throws Exception {
		
		map.put("todayJoin", "sysdate");
		List<AdminDTO> list = adminService.selectList(map);	
		model.addAttribute("list", list);
		return "/admin/AdminNewMember";
	}
	
	@RequestMapping(value="/admin/submember.ins")
	public String subMember()throws Exception {
		return "/admin/AdminSubMember";
	}
	
	//main
	@RequestMapping(value="/admin/maincontentvote.ins")
	public String mainContentVote() throws Exception {
		return "/admin/AdminMainContentVote";
	}
	
	@RequestMapping(value="/admin/maincontentmember.ins")
	public String mainContentMember(Map mapBandList,Map musicList,Model model) throws Exception {
		//band list
		List<AdminDTO> list = adminService.selectBandList(mapBandList);
		
		
		List<AdminDTO> bandMusicAll = new Vector<AdminDTO>();
		for(AdminDTO dto :list ) {
			List<AdminDTO> bandMusicList = adminService.selectBandMusicList(dto.getB_name());
			for(AdminDTO dto2 : bandMusicList) {
				bandMusicAll.add(dto2);
			}
		}
		
		
		
		
		model.addAttribute("bandlist", list);
		model.addAttribute("bandmusiclist", bandMusicAll);
		return "/admin/AdminMainContentMember";
	}
	
	//서브
	@RequestMapping(value="/admin/subcontent.ins")
	public String subContent() throws Exception {
		return "/admin/AdminSubContent";
	}
	
	//pay
	@RequestMapping("/admin/paymain.ins")
	public String payMain() throws Exception{
		return "/admin/AdminMainPay";
	}
}/////////////
