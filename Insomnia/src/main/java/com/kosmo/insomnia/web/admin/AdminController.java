package com.kosmo.insomnia.web.admin;

import java.text.SimpleDateFormat;
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
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.common.BankUtil;
import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.service.AdminSubDTO;
import com.kosmo.insomnia.service.BandService;
import com.kosmo.insomnia.serviceimpl.AdminServiceImpl;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;


@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
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
		
		///전체회원보기 2019 05 15 임한결 추가
		List<AdminDTO> list = adminService.selectList(map);
		for(AdminDTO dto : list) {
			String phone = dto.getPhone();
			dto.setPhone("0"+phone.substring(0, 2)+"-"+phone.substring(2, 6)+"-"+phone.substring(6, phone.length()));
		}///list
		
		//new member
		//신입 회원보기
		List<AdminDTO> newMemberList = adminService.selectNewMemberList(map);	
		for(AdminDTO dto : newMemberList) {
			String phone = dto.getPhone();
			dto.setPhone("0"+phone.substring(0, 2)+"-"+phone.substring(2, 6)+"-"+phone.substring(6, phone.length()));
		}//for
		
		//band list
		List<AdminDTO> bandList = adminService.selectBandList(map);
		
		//진행중인 밴드 목록추가
		List<AdminDTO> bandSubmitList = adminService.selectBandSubmitList();
		model.addAttribute("bandSubmitList", bandSubmitList);
		for(AdminDTO dto: bandSubmitList) {  ///타이틀 넘버 받아서 음악이름 찾아넣기 //b_no로
			dto.setBm_name(adminService.selectOneBandMusic(dto.getB_no()));
			//subString 처리;
			try {
				dto.setS_goal_deadline(dto.getS_goal_deadline().substring(0, 10));
			}catch(Exception e) {}
			try {	
				dto.setS_submit_date(dto.getS_submit_date().substring(0, 10));
			}catch(Exception e) {}
		}///
		
		
		List<AdminDTO> mainFundingList = adminService.selectBandSafepayDetailAllList();
		//구매자 아이디값으로 name얻어오기
		for(AdminDTO dto : mainFundingList) {
			dto.setName(adminService.getNameById(dto.getId()));
			//가격 총합 구해서 넣기
			dto.setSumPrice(String.format("%,d", Integer.parseInt(dto.getSp_reward_qty()==null ? "1": dto.getSp_reward_qty()) * Integer.parseInt(dto.getR_price())));
			//구매일자 잘라넣기
			dto.setSp_date(dto.getSp_date().substring(0, 10));
		}///for
		model.addAttribute("mainFundingList", mainFundingList);
		
		
		List<AdminDTO> subPayList = adminService.selectSubPayList();
		for(AdminDTO dto : subPayList) {
			dto.setName(adminService.getNameById(dto.getId()));
			if(dto.getNon_bankbook_complete().equals("N")) {
				dto.setNon_bankbook_complete("입금 전");
			}else {
				dto.setNon_bankbook_complete("입금 확인");}
			
			///가격총합 구해넣기
			try {
				dto.setSumPrice(String.format("%,d", Integer.parseInt(dto.getQty()) * Integer.parseInt(dto.getC_price())));
			}catch(Exception e) {}
			
		}//for
		model.addAttribute("subPayList", subPayList);
		
		
		///총 인원 구해서 넣어주기
		String totalPeople = adminService.getTotalPeople();
		model.addAttribute("totalPeople", totalPeople);
		
		// 방문자수 구해서 넣어주기
		String visitor = adminService.getVisitor();
		model.addAttribute("visitor", visitor);
		
		//2019 05 15 임한결 추가 끝
		
		
		
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
							@RequestParam Map map,
							Model model,
							@RequestParam(required=false,defaultValue="1") int nowPage
							) throws Exception {
		//총 회원수
		int totalMembers = adminService.getTotalRecord(map);
		//여자 회원수
		String female = "F";
		int femaleMembers= adminService.getFemaleMember(female);
		
		
		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		map.put("start",start);
		map.put("end", end);
		
		
		//전체 회원 보이기
		List<AdminDTO> allMemberList = adminService.selectList(map);
		
		
		//전체 페이지수]
		int totalPage=(int)Math.ceil((double)totalMembers/pageSize);	
		String searchColumn = map.get("searchColumn") == null ? "" :map.get("searchColumn").toString() ;
		String searchWord = map.get("searchWord") == null ? "" :map.get("searchWord").toString();
		String pagingString=null;
		if(searchColumn != "") {
			pagingString=PagingUtil.pagingBootStrapStyle(totalMembers, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/allmember.ins?searchColumn=" + searchColumn + "&searchWord="+ searchWord + "&");
		}
		else {
			pagingString=PagingUtil.pagingBootStrapStyle(totalMembers, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/allmember.ins?");
		}
		////////////////////////////////////////////////////////////2019 05 14 임한결 수정 / 프로필이미지, 생일
		//birthDay 출력을 위한 simpledateFormat 설정
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat simpleParse = new SimpleDateFormat("yy/MM/dd");
		for(AdminDTO dto : allMemberList) {
			//*입력된 값이 null일때는 기본 이미지 넣어준다.
		try {
			//1. 프로필 사진이 우리 프로젝트쪽에 있는 경우
			if(!dto.getProfile_img().startsWith("http://")) {
				String fileName = dto.getProfile_img();
				dto.setProfile_img("/insomnia/upload/member/profile/"+fileName);
			}else {
				//2. 프로필 사진이 웹서버에 등록되어 있는 경우 그대로 경로를 준다.
			}///
		}catch(Exception e) {////입력된 값이 null 일때
			dto.setProfile_img("/insomnia/upload/member/profile/default_profile_img.jpg");
		}//catch
		
		
		/// 생일정보 양식에 맞추어 세팅하기
		try {
			///birthday 수정 yy/MM/dd 형태로
			dto.setBirthDay(simpleParse.format(simple.parse(dto.getBirthDay())));
		}catch(Exception e) {
			///birthday를 입력하지 않아 null일 경우
			dto.setBirthDay("입력되지 않은 생일");
		}////
		
		//핸드폰 번호 재조합해서 넣어주기
		try {
			String phoneBefore = dto.getPhone();
			dto.setPhone("0"+phoneBefore.substring(0, 2)+"-"+phoneBefore.substring(2,6)+"-"+phoneBefore.substring(6, phoneBefore.length()));
		}catch(Exception e) {
			//입력값이 null일 경우
			dto.setPhone("등록되지 않음");
		}
		
		}////입력값 재수정해서 넣어주기
		////////////////////////////////////////////////////////////2019 05 14 임한결 수정 / 프로필이미지, 생일
		
//		System.out.println(searchColumn==""?"null":searchColumn);//""
		model.addAttribute("searchColumn", searchColumn);
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
		//birthDay 출력을 위한 simpledateFormat 설정
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat simpleParse = new SimpleDateFormat("yy/MM/dd");
		for(AdminDTO dto : list) {
			//*입력된 값이 null일때는 기본 이미지 넣어준다.
			try {
				//1. 프로필 사진이 우리 프로젝트쪽에 있는 경우
				if(!dto.getProfile_img().startsWith("http://")) {
					String fileName = dto.getProfile_img();
					dto.setProfile_img("/insomnia/upload/member/profile/"+fileName);
				}else {
					//2. 프로필 사진이 웹서버에 등록되어 있는 경우 그대로 경로를 준다.
				}///
			}catch(Exception e) {////입력된 값이 null 일때
				dto.setProfile_img("/insomnia/upload/member/profile/default_profile_img.jpg");
			}//catch
			
			
			/// 생일정보 양식에 맞추어 세팅하기
			try {
				///birthday 수정 yy/MM/dd 형태로
				dto.setBirthDay(simpleParse.format(simple.parse(dto.getBirthDay())));
			}catch(Exception e) {
				///birthday를 입력하지 않아 null일 경우
				dto.setBirthDay("입력되지 않은 생일");
			}////
			
			//핸드폰 번호 재조합해서 넣어주기
			String phoneBefore = dto.getPhone();
			dto.setPhone("0"+phoneBefore.substring(0, 2)+"-"+phoneBefore.substring(2,6)+"-"+phoneBefore.substring(6, phoneBefore.length()));
		}////입력값 재수정해서 넣어주기
		////////////////////////////////////////////////////////////2019 05 14 임한결 수정 / 프로필이미지, 생일
		
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
	public String mainContentMember(@RequestParam(required=false,defaultValue="1") int nowPage,HttpServletRequest req,@RequestParam Map map,Model model) throws Exception {
		
		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		
		map.put("start",start);
		map.put("end", end);
		
		
		//band list
		List<AdminDTO> list = adminService.selectBandList(map);
//		for(int i=0;i<list.size();i++) {
//			System.out.println(list.get(i).getCt_name());
//		}
		//bandsize
		int totalBands = adminService.selectBandCount(map);
//		System.out.println(totalBands);
		
		String searchColumn = map.get("searchColumn") == null ? "" :map.get("searchColumn").toString() ;
		String searchWord = map.get("searchWord") == null ? "" :map.get("searchWord").toString();
		String pagingString=null;
		if(searchColumn != "") {
			pagingString=PagingUtil.pagingBootStrapStyle(totalBands, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/maincontentmember.ins?searchColumn=" + searchColumn + "&searchWord="+ searchWord + "&");
		}
		else {
			pagingString=PagingUtil.pagingBootStrapStyle(totalBands, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/maincontentmember.ins?");
		}
		
		
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
		//////2019-05-15 임한결 추가 1000단위로 , 붙이기
		for(AdminDTO dto : bandSubmit) {
			try {
				dto.setS_goal_price(String.format("%,d", Integer.parseInt(dto.getS_goal_price())));
			}catch(Exception e) {}///목표치가 설정되지 않은 null값일 경우
		}///for
		/////2019 05 15 임한결 추가 1000단위로 , 찍기 끝
		
		/*
		 * Map<String, Object> mp = new HashMap<String, Object>();
       mp.put("data", collections);


       JSONObject re = new JSONObject();
       re.put("data", collections);
       //Object result = mp;
       
      
       System.out.println("=============");
       System.out.println(re.toJSONString());
       System.out.println("=============");
       return re.toJSONString();
		 */
		
		/*
		 * {"data":[{"PARTNERSTATUS":"1","TEL":"01012345678","ID":"admin","EMAIL":"이메일","NAME":"관리자","ADDR":"주소"},{"PARTNERSTATUS":"0","TEL":"01012345678","ID":"aaaa","EMAIL":"yuemj@naver.com","NAME":"타는사람","ADDR":"06267:!:서울 강남구 도곡동 957-13;!@weqwewqe"},{"PARTNERSTATUS":"1","TEL":"01056782134","ID":"bbbb","EMAIL":"yuemj@naver.com","NAME":"태워줄사람","ADDR":"06267:!:서울 강남구 도곡동 957-13;!@weqwewqe"},{"PARTNERSTATUS":"1","TEL":"01032970922","ID":"csj910226","EMAIL":"csj_910226@naver.com","NAME":"최성준","ADDR":"08593:!:서울 금천구 가산동 343-8;!@1234"}]}
		 */
		
		
		List<Map<String, String>> bandSubmitMember = new Vector<Map<String, String>>();
		for(AdminDTO submitMember : bandSubmit) {
			Map<String, String> record = new HashMap<String, String>();
			record.put("b_name", submitMember.getB_name());
			record.put("s_goal_price", submitMember.getS_goal_price()==null?"--":submitMember.getS_goal_price()+ " 원");
			record.put("s_goal_deadline", submitMember.getS_goal_deadline()==null?"미정":submitMember.getS_goal_deadline().substring(0, 10));
			bandSubmitMember.add(record);
		};
		
		JSONObject re = new JSONObject();
		re.put("data",bandSubmitMember);
		System.out.println(re.toJSONString());
		return re.toJSONString();
		
	}///////////////
	
	//main + submit ing
	@RequestMapping(value="/admin/maincontentsubmit.ins")
	public String mainContentSubmit(@RequestParam(required=false,defaultValue="1") int nowPage,HttpServletRequest req,Map map,Model model) throws Exception{
		//band submit list
		List<AdminDTO> bandSubmit = adminService.selectBandSubmit(map);
		
		//2019 05 15 임한결 추가 - 은행번호를 은행이름으로 바꿔주는 메서드 호출
		BankUtil.convertBankNameInDTOList(bandSubmit);
		for(AdminDTO dto : bandSubmit) {///1000단위로 콤마찍기
			try {
				dto.setS_goal_price(String.format("%,d", Integer.parseInt(dto.getS_goal_price())));
			}catch(Exception e) {}///목표치가 설정되지 않은 null값일 경우
			try {
				dto.setS_goal_accumulation(String.format("%,d", Integer.parseInt(dto.getS_goal_accumulation())));
			}catch(Exception e) {} //펀딩 누적액이 설정되지 않은 경우
		}///for
		//2019 05 15 임한결 추가 끝
		
		
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
		System.out.println(bandChartdata.size());
		System.out.println(bandChartdata.get(0).getR_no());
		
		Set<String> set = new HashSet<String>();
		for(AdminDTO dto : bandChartdata) {
			set.add(dto.getR_no());
			System.out.println(set);
		}
		
		
		List<Map> bandChartInfo = new Vector<Map>();
		
		AdminDTO rewardName = new AdminDTO();
		String rewardQty="";
		Iterator<String> ite = set.iterator();
		while(ite.hasNext()) {
			Map record = new HashMap();
			String selectByR_no = ite.next();
			System.out.println("selectByR_no" + selectByR_no);
			//a로 쿼리 두개 돌리고
			rewardName = adminService.getRewardName(selectByR_no);
			System.out.println("rewardName" + rewardName.getR_name());
			rewardQty = adminService.getRewardQty(selectByR_no);
			System.out.println("rewardQty" + rewardQty);
			record.put("b_name", rewardName.getB_name());
			record.put("r_name", rewardName.getR_name());
			record.put("qtys", rewardQty);
			bandChartInfo.add(record);
		}
		
		
//		System.out.println(JSONArray.toJSONString(bandChartInfo));
//
//		return JSONArray.toJSONString(bandChartInfo);
		
		JSONObject re = new JSONObject();
		re.put("data",bandChartInfo);
		System.out.println(re.toJSONString());
		return re.toJSONString();
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
			
			///2019 05 15 임한결 추가 1000단위로 , 찍기
			try {
				map.put("S_GOAL_PRICE", String.format("%,d",Integer.parseInt(map.get("S_GOAL_PRICE").toString())));
			}catch(Exception e) {}
			try {
				map.put("S_GOAL_ACCUMULATION", String.format("%,d",Integer.parseInt(map.get("S_GOAL_ACCUMULATION").toString())));
			}catch(Exception e) {}
			
			//2019 05 15 임한결 추가  
			AdminDTO payDto = adminService.getAdminPayDTO(map.get("S_NO").toString());
			if(payDto == null) {
				map.put("isPaying", "F");
			}////pay내역이 존재하지 않는다면
			else {
				map.put("isPaying", "T");
			}///존재할경우
		}//for
		model.addAttribute("selectSafepayList",maps);
		return "/admin/AdminMainPay";
	}//payMain
	
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
		//전화번호
		String beforePhone = memberView.getPhone();
//		System.out.println(beforePhone);
		String afterPhone = "0"+beforePhone.substring(0, 2)+"-"+beforePhone.substring(2,6)+"-"+beforePhone.substring(6);
//		System.out.println(afterPhone);
		memberView.setPhone(afterPhone);
		//주소
		String addressArray[];
		String address="";
		if(memberView.getShipping_address()!=null) {
			addressArray = memberView.getShipping_address().replace("^", "!").split("!");
			for(int i=0;i<addressArray.length;i++) {
				if(i==0) {
					address+="[도로명주소]<br/>"+addressArray[i]+"<br/>";
				}
				else if(i==1){
					address+="[지번주소]<br/>"+addressArray[i]+"<br/>";
				}
				else {
					address+=addressArray[i]+"<br/>";
				}
			}
			memberView.setShipping_address(address);
			System.out.println(address);
		}
		
		//System.out.println(list);
		List<AdminDTO> memberViewPay = adminService.selectMemberViewPay(id);
		System.out.println(memberViewPay.size());
		
		
		model.addAttribute("name", memberView.getName());
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
		return "/admin/AdminSubContent";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/submemberApplyMember.ins",produces="text/html; charset=UTF-8")
	public String subMemberApplyMember(@RequestParam Map map,Model model) throws Exception{
		//서비스 호출
		List<AdminSubDTO> list = adminService.selectSubApplyList(map);
		
		List<HashMap> records = new ArrayList<HashMap>();
		
		for(AdminSubDTO subHireMember : list) {
			HashMap record = new HashMap();
			record.put("ap_postdate", subHireMember.getAp_postdate());
			record.put("ap_genre", subHireMember.getAp_genre());
			record.put("id", subHireMember.getId());
			record.put("name", subHireMember.getName());
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
			System.out.println(asdasd);
			asdasd.put("NAME",asdasd.get("NAME").toString());
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
	
	//차단 멤버
		@ResponseBody
		@RequestMapping(value="/admin/memberBlock.ins",produces="text/html; charset=UTF-8")
		public void memberBlock(@RequestParam(value="id") List<String> ids,Map map) throws Exception{
			System.out.println("con"+ids);
			for(int i=0;i<ids.size();i++) {
				System.out.println("컨트롤러에서의 아이디:"+ids.get(i));
				int youBlock = adminService.blockMember(ids.get(i));
			}
		}///memberBlock
		
		@ResponseBody
		@RequestMapping(value="/admin/memberUnBlock.ins",produces="text/html; charset=UTF-8")
		public void memberUnBlock(@RequestParam(value="id") List<String> ids,Map map) throws Exception{
			System.out.println("con"+ids);
			for(int i=0;i<ids.size();i++) {
				System.out.println("컨트롤러에서의 아이디:"+ids.get(i));
				int youBlock = adminService.unBlockMember(ids.get(i));
			}
		}///memberBlock
	
	@ResponseBody
	@RequestMapping(value="/admin/bandSubmitWaiting.ins",produces="text/html; charset=UTF-8")
	public String bandSubmitWaiting(@RequestParam Map map, Model model) throws Exception {
		List<AdminDTO> bandWaitingList = adminService.selectBandSubmitWaiting(map);
		//
		List<Map<String, String>> bandSubmitMember = new Vector<Map<String, String>>();
		for(AdminDTO bandWaiting : bandWaitingList) {
			Map<String, String> record = new HashMap<String, String>();
			record.put("b_name", bandWaiting.getB_name());
			record.put("ct_name", bandWaiting.getCt_name()==null?"--":bandWaiting.getCt_name());
			record.put("sw_postdate", bandWaiting.getSw_postdate().substring(0, 10)==null?"미정":bandWaiting.getSw_postdate().substring(0, 10));
			bandSubmitMember.add(record);
		};
		
		JSONObject re = new JSONObject();
		re.put("data",bandSubmitMember);
		System.out.println(re.toJSONString());
		return re.toJSONString();
	}
	
}/////////////
