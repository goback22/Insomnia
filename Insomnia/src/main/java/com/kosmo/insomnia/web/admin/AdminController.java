package com.kosmo.insomnia.web.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
		
		//band list
		List<AdminDTO> bandList = adminService.selectBandList(map);
		
		//가입날에 따른 사람 수
		int todayMember = adminService.selectTodayNewMember(map);
		int yesterday = adminService.selectYesterDayNewMember(map);
		int twodaysAgo = adminService.selectTwoDaysAgoNewMember(map);
		
		model.addAttribute("bandList", bandList);
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
		int newMembers = adminService.getNewMember(map);
		//전체 페이지수]
		int totalPage=(int)Math.ceil((double)newMembers/pageSize);		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		map.put("start",start);
		map.put("end", end);
		String pagingString=PagingUtil.pagingBootStrapStyle(newMembers, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/newmember.ins?");
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
		model.addAttribute("newMembers", newMembers);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		
		return "/admin/AdminNewMember";
	}
	
	//main content bandlist
	@RequestMapping(value="/admin/maincontentmember.ins")
	public String mainContentMember(@RequestParam(required=false,defaultValue="1") int nowPage,HttpServletRequest req,Map map,Model model) throws Exception {
		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		map.put("start",start);
		map.put("end", end);
		//band list
		List<AdminDTO> list = adminService.selectBandList(map);
		//bandsize
		//System.out.println(list.size());
		int totalBands = list.size();
		String pagingString=PagingUtil.pagingBootStrapStyle(totalBands, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/maincontentmember.ins?");
		
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
		
		//band submit waiting
		List<AdminDTO> bandWaiting = adminService.selectWaitingBand(map);
		
		//System.out.println(bandWaiting);
		//band submit list
		List<AdminDTO> bandSubmitList = adminService.selectBandSubmit(map);
		
		model.addAttribute("bandSubmitList", bandSubmitList);
		model.addAttribute("bandWaiting", bandWaiting);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("bandMember", bandMember);
		model.addAttribute("bandlist", list);
		model.addAttribute("bandmusiclist", bandMusicAll);
		return "/admin/AdminMainContentMember";
	}
	
	//main submit list simple
	@ResponseBody
	@RequestMapping(value="/admin/bandSubmit.ins",produces="text/html; charset=UTF-8")
	public String bandSubmitList(Map map) throws Exception{
		List<AdminDTO> bandSubmit = adminService.selectBandSubmit(map);
		
		List<Map> bandSubmitMember = new Vector<Map>();
		for(AdminDTO submitMember : bandSubmit) {
			Map record = new HashMap();
			record.put("b_name", submitMember.getB_name());
			record.put("s_goal_price", submitMember.getS_goal_price()==null?"--":submitMember.getS_goal_price()+ " 원");
			record.put("s_goal_deadline", submitMember.getS_goal_deadline()==null?"미정":submitMember.getS_goal_deadline().substring(0, 10));
			bandSubmitMember.add(record);
		}
		System.out.println("submit:"+JSONArray.toJSONString(bandSubmitMember));//이 형태 ok
		
		return JSONArray.toJSONString(bandSubmitMember);
	}
	
	//main + submit ing
	@RequestMapping(value="/admin/maincontentsubmit.ins")
	public String mainContentSubmit(@RequestParam(required=false,defaultValue="1") int nowPage,HttpServletRequest req,Map map,Model model) throws Exception{
		//band submit list
		List<AdminDTO> bandSubmit = adminService.selectBandSubmit(map);
		
		//band submit reward list
		List<AdminDTO> bandSubmitReward = adminService.selectBandSubmitReward(map);
		
		model.addAttribute("bandSubmitReward", bandSubmitReward);
		model.addAttribute("bandSubmit", bandSubmit);
		//System.out.println(bandSubmit.size());
		return "/admin/AdminMainContentSubmit";
	}
	//main submit chart
	@ResponseBody
	@RequestMapping(value="/admin/maincontentchart.ins",produces="text/html; charset=UTF-8")
	public String mainContentChart(@RequestParam String s_no,Map map,Model model) throws Exception {
		System.out.println("input param:"+s_no);
		List<AdminDTO> bandChartdata = adminService.selectChartData(s_no);
		
	
		List<Map> bandChartInfo = new Vector<Map>();
		for(AdminDTO chartInfo : bandChartdata) {
			Map record = new HashMap();
			
			record.put("b_name", chartInfo.getB_name());
			record.put("r_no", chartInfo.getR_no());
			record.put("s_no", chartInfo.getS_no());
			record.put("r_name", chartInfo.getR_name());
			record.put("sp_reward_qty", chartInfo.getSp_reward_qty());
			record.put("s_goal_accumulation", chartInfo.getS_goal_accumulation());
			record.put("s_goal_price", chartInfo.getS_goal_price());
			record.put("priceOfQty", Integer.parseInt(chartInfo.getSp_reward_qty().toString())*Integer.parseInt(chartInfo.getR_price().toString()));
			
//			record.put("r_name", chartInfo.getR_name());
//			record.put("sum_reward_qty_1", chartInfo.getSum_reward_qty_1()==null?"0":chartInfo.getSum_reward_qty_1());
//			record.put("sum_reward_qty_2", chartInfo.getSum_reward_qty_2()==null?"0":chartInfo.getSum_reward_qty_2());
//			record.put("sum_reward_qty_3", chartInfo.getSum_reward_qty_3()==null?"0":chartInfo.getSum_reward_qty_3());
			
			bandChartInfo.add(record);
		}
		
		
		System.out.println(JSONArray.toJSONString(bandChartInfo));

		
		
		
		
		//total price
		
		//reward
		
		return JSONArray.toJSONString(bandChartInfo);
		//return "";
	}
	
	//pay
	@RequestMapping("/admin/paymain.ins")
	public String payMain(Model model) throws Exception{
		List<Map> maps = adminService.selectSafepayList();
		for(Map map : maps) {			
//			System.out.println(map);
			int fundCountPeople = adminService.countFundPeople(map.get("S_NO").toString());			
			map.put("fundCountpeople", String.valueOf(fundCountPeople));
			String date = map.get("S_GOAL_DEADLINE") != null ? map.get("S_GOAL_DEADLINE").toString().substring(0,10): "";
			map.put("S_GOAL_DEADLINE",date);
		}
		model.addAttribute("selectSafepayList",maps);
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
		
				
		model.addAttribute("subList", list);
		return "/admin/AdminSubContent";
	}
	//서브 bgsapply
	@ResponseBody
	@RequestMapping(value="/admin/submember.ins",produces="text/html; charset=UTF-8")
	public String subMemberPolling(Map map,Model model) throws Exception {
		//subcontent
		List<AdminSubDTO> list = adminService.selectSubMemberList(map);
		
		//subhire
		List<AdminSubDTO> hireList = adminService.selectHire(map);
//				System.out.println(hireList.size());
//				for(int i=0;i<hireList.size();i++) {
//					System.out.println(hireList.get(i).getAp_no());
//				}
		Set ids = new HashSet();
		for(int i=0;i<hireList.size();i++) {
			for(int j=0;j<list.size();j++) {			
				if(hireList.get(i).getAp_no().toString().equals(list.get(j).getAp_no().toString())) {
					ids.add(list.get(j).getId());
				}
			}
		}
		
		Iterator listiter = list.iterator();
		while(listiter.hasNext()) {
			Object obj2 = listiter.next();
			Iterator iter = ids.iterator();
			while(iter.hasNext()) {
				Object obj = iter.next();
				if(((AdminSubDTO)obj2).getId().toString().equals(obj.toString())) {
					listiter.remove();
				}
			}
		}
		
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
			record.put("name", subMember.getName());
			subMembers.add(record);
		}
		
		//System.out.println(JSONArray.toJSONString(subMembers));//이 형태 ok
		return JSONArray.toJSONString(subMembers);
	}
	//서브 bgshire bgsapply(수락버튼 ap_no전달,방구석 신청 수락)
	@ResponseBody
	@RequestMapping(value="/admin/submemberApplySingle.ins",produces="text/html; charset=UTF-8")
	public String subMemberApplySingle(@RequestParam String ap_no,Map map,Model model) throws Exception{
		int succFail = adminService.insertBgshire(ap_no);//bgshire,
		
		
		model.addAttribute("succFail", succFail);
//		return "/admin/Message";
		return "/admin/AdminSubContent";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/submemberApplyMember.ins",produces="text/html; charset=UTF-8")
	public String subMemberApplyMember(@RequestParam Map map,Model model) throws Exception{
		//System.out.println("컨트롤러옵니다.");
		//System.out.println("map:"+map);
//		List<AdminSubDTO> list = adminService.selectSubApplyList2(map);
		//서비스 호출
		List<AdminSubDTO> list = adminService.selectSubApplyList(map);
//		List<Map> subHireMembers = new Vector<Map>();
		
		List<HashMap> records = new ArrayList<HashMap>();
		
		for(AdminSubDTO subHireMember : list) {
			HashMap record = new HashMap();
			record.put("ap_postdate", subHireMember.getAp_postdate());
			record.put("ap_genre", subHireMember.getAp_genre());
			record.put("id", subHireMember.getId());
			record.put("name", subHireMember.getName());
			//record.put("ap_content", subHireMember.getAp_content().toString());
			records.add(record);
		}
		
		
////		model.addAttribute("bgsHireMember",subHireMembers);
//		System.out.println("????????:"+list.get(0).getAp_content().toString());
		
		//System.out.println("여기까지 옵니다.:"+JSONArray.toJSONString(records));
		return JSONArray.toJSONString(records);
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/bandIsacceptApply.ins",produces="text/html; charset=UTF-8")
	public void bandAccept(@RequestParam String b_no,Map map,Model model) throws Exception{
		System.out.println(b_no);
		int acceptT = adminService.updateBandAccept(b_no);
		System.out.println(acceptT);
		
	}
	
	
	////일승 추가 - main(결제) 밴드별 리워드 safepay상세보기
	@ResponseBody
	@RequestMapping(value="/admin/selectBandSafepayDetail.ins", produces="text/html; charset=UTF-8")
	public String selectBandSafepayDetail(@RequestParam Map map, Model model) throws Exception{
//		System.out.println("map:" +map);
		List<Map> SafePaydetails = adminService.selectBandSafepayDetail(map);
		for(Map asdasd : SafePaydetails) {
			asdasd.put("SP_REWARD_QTY",asdasd.get("SP_REWARD_QTY").toString());
			asdasd.put("R_DESCRIPTION",asdasd.get("R_DESCRIPTION").toString());
			asdasd.put("SP_DATE",asdasd.get("SP_DATE").toString().substring(0,10));
			asdasd.put("R_NAME",asdasd.get("R_NAME").toString());
			asdasd.put("R_PRICE",asdasd.get("R_PRICE").toString());
			asdasd.put("R_NO",asdasd.get("R_NO").toString());
			asdasd.put("ID",asdasd.get("ID").toString());
			asdasd.put("R_PRICE",asdasd.get("R_PRICE").toString());
			asdasd.put("SP_SUPPORT",asdasd.get("SP_SUPPORT").toString());
		}
		return JSONArray.toJSONString(SafePaydetails);
	}
	
	
}/////////////
