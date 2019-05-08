package com.kosmo.insomnia.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.service.AdminSubDTO;
import com.kosmo.insomnia.serviceimpl.AdminServiceImpl;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;


@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	//임한결 추가 2019 05 05 어린이날 - 수락버튼 실제동작 처리
	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
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
	public String allMember(HttpServletRequest req,
							Map map,
							Model model,
							@RequestParam(required=false,defaultValue="1") int nowPage
							) throws Exception {
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
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("totalMemberCount", totalMembers);//
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
		int yesterday = adminService.selectYesterDayNewMember(map);
		int twodaysAgo = adminService.selectTwoDaysAgoNewMember(map);
		
		model.addAttribute("todayMember", todayMember);
		model.addAttribute("yesterdayMember", yesterday);
		model.addAttribute("twodayagoMember", twodaysAgo);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("totalMemberCount", totalMembers);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		
		return "/admin/AdminNewMember";
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
		//bandmember
		List<AdminDTO> bandMember = adminService.selectBandMember(map);
		
		model.addAttribute("bandMember", bandMember);
		model.addAttribute("bandlist", list);
		model.addAttribute("bandmusiclist", bandMusicAll);
		return "/admin/AdminMainContentMember";
	}
	
	@RequestMapping(value="/admin/maincontentsubmit.ins")
	public String mainContentSubmit(Map map,Model model) throws Exception{
		
		return "/admin/AdminMainContentSubmit";
	}
	
	//pay
	@RequestMapping("/admin/paymain.ins")
	public String payMain() throws Exception{
		return "/admin/AdminMainPay";
	}
	
	//pay
	@RequestMapping("/admin/paysub.ins")
	public String paySub() throws Exception{
		return "/admin/AdminSubPay";
	}
	
	//member detail view
	@RequestMapping(value="/admin/memberView.ins")
	public String memberView(@RequestParam String id,Map map,Model model) throws Exception{
		//System.out.println("id넘어가는지 확인 :"+id);
		AdminDTO memberView = adminService.selectOne(id);
		//System.out.println(list);
		List<AdminDTO> memberViewPay = adminService.selectMemberViewPay(id);
		System.out.println(memberViewPay.size());
		
		model.addAttribute("memberViewPay", memberViewPay);
		model.addAttribute("id", id);
		model.addAttribute("memberView", memberView);
		return "/admin/AdminMainMemberView";
	}
	
	//서브
	@RequestMapping(value="/admin/subcontent.ins")
	public String subContent(Map map,Model model) throws Exception {
		//sublist
		List<AdminSubDTO> list = adminService.selectSubList(map);
		//System.out.println(list.size());
		
		//subhire
		List<AdminSubDTO> hireList = adminService.selectHire(map);
		System.out.println(hireList.size());
		for(int i=0;i<5;i++) {
			System.out.println(hireList.get(i).getAp_no());
		}
		model.addAttribute("bgsHireAp_nos", hireList);
		model.addAttribute("subList", list);
		return "/admin/AdminSubContent";
	}
	//서브 bgsapply
	@ResponseBody
	@RequestMapping(value="/admin/submember.ins",produces="text/html; charset=UTF-8")
	public String subMemberPolling(Map map,Model model) throws Exception {
		//subcontent
		List<AdminSubDTO> list = adminService.selectSubMemberList(map);
		//subcontent 신청한 member
		List<Map> subMembers = new Vector<Map>();
		for(AdminSubDTO subMember : list) {
			Map record = new HashMap();
			record.put("ap_no", subMember.getAp_no());
			record.put("ap_title", subMember.getAp_title());
			record.put("ap_content", subMember.getAp_content());
			record.put("ap_postdate", subMember.getAp_postdate());
			record.put("ap_visit", subMember.getAp_visit());
			record.put("ap_genre", subMember.getAp_genre());
			record.put("id", subMember.getId());
			subMembers.add(record);
		}
		model.addAttribute("bgsapplyList", list);
		//int no = 111124750;
		//String str = String.format("%,d", no);
		//System.out.println(JSONArray.toJSONString(subMembers));//이 형태 ok
		return JSONArray.toJSONString(subMembers);
	}
	//서브 bgshire bgsapply(수락버튼 ap_no전달,방구석 신청 수락)
	@ResponseBody
	@RequestMapping(value="/admin/submemberApplySingle.ins",produces="text/html; charset=UTF-8")
	public String subMemberApplySingle(@RequestParam String ap_no,Map map,Model model) throws Exception{
		int succFail = adminService.insertBgshire(ap_no);//bgshire,
		model.addAttribute("succFail", succFail);
		return "/admin/Message";
	}

	///////////////////////////////////////// 임한결 추가 2019 05 05 어린이날 - 수락버튼으로 실제 서브밋으로 가도록 처리
	@ResponseBody
	@RequestMapping(value="/admin/acceptBandSubmitWaiting.ins", produces="text/html; charset=UTF-8")
	public String applyBandSubmitWaiting(@RequestParam Map map, Model model) throws Exception{
		String b_no = map.get("b_no").toString();
		int affected = bandService.acceptBandSubmitWaiting(b_no);
		if(affected == 1)
			return "T";
		else 
			return "F";
	}//applyBandSubmitwaiting
		
}/////////////
