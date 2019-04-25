package com.kosmo.insomnia.web.admin;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.serviceimpl.AdminServiceImpl;


@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	@Value("${ADMINPAGESIZE}")
	private int pageSize;
	@Value("${ADMINBLOCKPAGE}")
	private int blockPage;
	
	//adminindex
	@RequestMapping(value="/admin/index.ins")
	public String admin(Map map,Model model) throws Exception {
		//총 회원수
		int totalMembers = adminService.getTotalRecord(map);
		//여자 회원수
		String female = "F";
		int femaleMembers= adminService.getFemaleMember(female);
		
		//전체 페이지수]
		int totalPage=(int)Math.ceil((double)totalMembers/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		map.put("start","1");
		map.put("end", "5");
		List<AdminDTO> list = adminService.selectList(map);
		
		//new member
		//신입 회원보기
		List<AdminDTO> newMemberList = adminService.selectNewMemberList(map);	
		
		//가입날에 따른 사람 수
		int todayMember = adminService.selectTodayNewMember(map);
		int yesterday = adminService.selectYesterDayNewMember(map);
		int twodaysAgo = adminService.selectTwoDaysAgoNewMember(map);
		
		model.addAttribute("newMemberList", newMemberList);
		model.addAttribute("todayMember", todayMember);
		model.addAttribute("yesterdayMember", yesterday);
		model.addAttribute("twodayagoMember", twodaysAgo);
		model.addAttribute("totalMemberCount", totalMembers);
		model.addAttribute("femaleMember", femaleMembers);
		model.addAttribute("allMemberList", list);
		
		return "/admin/AdminIndex";
	}
	
	
	//전체 회원보기
	@RequestMapping(value="/admin/allmember.ins")
	public String allMember(HttpServletRequest req,Map map,Model model,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception {
		//총 회원수
		int totalMembers = adminService.getTotalRecord(map);
		
		//여자 회원수
		String female = "F";
		int femaleMembers= adminService.getFemaleMember(female);
		
		//전체 페이지수]
		int totalPage=(int)Math.ceil((double)totalMembers/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		map.put("start",start);
		map.put("end", end);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalMembers, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/allmember.ins?");
		
		//전체 회원 보이기
		List<AdminDTO> allMemberList = adminService.selectList(map);
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("totalMemberCount", totalMembers);
		model.addAttribute("femaleMember", femaleMembers);
		model.addAttribute("list", allMemberList);
		model.addAttribute("pagingString", pagingString);
		return "/admin/AdminAllMember";
	}
	
	//신규회원보기(3일간)
	@RequestMapping(value="/admin/newmember.ins")
	public String newMember(Map map,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception {
		//총 회원수
		int totalMembers = adminService.getTotalRecord(map);
		//전체 페이지수]
		int totalPage=(int)Math.ceil((double)totalMembers/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		map.put("start",start);
		map.put("end", end);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalMembers, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/newmember.ins?");
		//오늘부터 3일간 접속한 사람 보이기
		List<AdminDTO> list = adminService.selectNewMemberList(map);
		//가입날에 따른 사람 수
		int todayMember = adminService.selectTodayNewMember(map);
		//int yesterday = adminService.selectYesterDayNewMember(map);
		//int twodaysAgo = adminService.selectTwoDaysAgoNewMember(map);
		
		model.addAttribute("todayMember", todayMember);
		//model.addAttribute("yesterdayMember", yesterday);
		//model.addAttribute("twodayagoMember", twodaysAgo);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("totalMemberCount", totalMembers);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		
		return "/admin/AdminNewMember";
	}
	
	@RequestMapping(value="/admin/submember.ins")
	public String subMember()throws Exception {
		return "/admin/AdminSubMember";
	}
	
	//main
	@RequestMapping(value="/admin/maincontentmember.ins")
	public String mainContentMember(Map map,Model model) throws Exception {
		//band list
		List<AdminDTO> list = adminService.selectBandList(map);
		//bandmusic
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
	
	@RequestMapping(value="/admin/maincontentsubmit.ins")
	public String mainContentSubmit(Map map,Model model) throws Exception{
		
		return "/admin/AdminMainContentSubmit";
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
	
	//member detail view
	@RequestMapping(value="/admin/memberView.ins")
	public String memberView(Map map,Model model) throws Exception{
		
		return "/admin/AdminMainMemberView";
	}
}/////////////
