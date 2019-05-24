package com.kosmo.insomnia.android;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.service.RewardService;
import com.kosmo.insomnia.serviceimpl.BGSConcertServiceImpl;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;

@Controller
public class androidController {
	
	@Resource(name="insService")
	private ListServiceImpl listservice;
	@Resource(name="bGSConcertService")
	private BGSConcertServiceImpl bgsconcertservice;
	@Resource(name="rewardServiceImpl")
	private RewardService rewardService;
	@Resource
	private MemberServiceImpl memberService;
	
	//안드로이드 통신관련
	@RequestMapping(value="/AjaxJson.ins",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxJson(@RequestParam Map map) throws Exception{
		System.out.println("버튼 클릭했다");

		//비지니스 로직 호출

		boolean isLogin=listservice.isMember(map);
		System.out.println("id : "+map.get("id"));
		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성

		JSONObject json=new JSONObject();
		json.put("bgslist", bgsconcertservice.selectList());
		
		json.put("name",memberService.selectOne(map).getName());
		
		//JSON객체의 put("키값","값")메소드로 저장하면

		//{"키값":"값"} JSON형태의 데이타로 저장됨.

		json.put("isLogin", isLogin ? "Y":"다음 기회에...");

		System.out.println("json.toString():"+json.toString());

		System.out.println("json.toJSONString():"+json.toJSONString());

		return json.toJSONString();

	}///////////ajaxJson()
	
	//안드로이드 통신관련 - 홈 - 펀딩  뿌리기
	@RequestMapping(value="/androidFunding.ins",produces="text/html; charset=UTF-8")
	@ResponseBody
	public String androidFunding() throws Exception{
		List<Map> list = rewardService.selectFunding();
		List data = new ArrayList();
		for(Map m : list) {
			Map mm = new HashMap();
			
			mm.put("S_GOAL_PRICE", m.get("S_GOAL_PRICE").toString());
			if(m.get("S_GOAL_ACCUMULATION") == null) {
				mm.put("S_GOAL_ACCUMULATION", "0");
			}else {
				mm.put("S_GOAL_ACCUMULATION", m.get("S_GOAL_ACCUMULATION").toString());
			}
			mm.put("S_GOAL_DEADLINE", m.get("S_GOAL_DEADLINE").toString().substring(0, 10));
			mm.put("B_DESCRIPTION", m.get("B_DESCRIPTION").toString());
			mm.put("B_ALBUM_COVER", m.get("B_ALBUM_COVER").toString());
			mm.put("B_NAME", m.get("B_NAME").toString());
			mm.put("CT_NAME", m.get("CT_NAME").toString());
			
			data.add(mm);
		}
		

		return JSONArray.toJSONString(data);

	}///////////ajaxJson()
	
	//안드로이드 통신관련 - 펀딩 홈 목록 뿌리기
		@RequestMapping(value="/androidFunding2.ins",produces="text/html; charset=UTF-8")
		@ResponseBody
		public String androidFunding2(@RequestParam Map map) throws Exception{
			List<Map> list = rewardService.selectAndroidReward2(map);
			List data = new ArrayList();
			for(Map m : list) {
				Map mm = new HashMap();
				
				mm.put("S_GOAL_PRICE", m.get("S_GOAL_PRICE").toString());
				if(m.get("S_GOAL_ACCUMULATION") == null) {
					mm.put("S_GOAL_ACCUMULATION", "0");
				}else {
					mm.put("S_GOAL_ACCUMULATION", m.get("S_GOAL_ACCUMULATION").toString());
				}
				mm.put("S_GOAL_DEADLINE", m.get("S_GOAL_DEADLINE").toString().substring(0, 10));
				mm.put("B_DESCRIPTION", m.get("B_DESCRIPTION").toString());
				mm.put("B_ALBUM_COVER", m.get("B_ALBUM_COVER").toString());
				mm.put("B_NAME", m.get("B_NAME").toString());
				mm.put("CT_NAME", m.get("CT_NAME").toString());
				
				data.add(mm);
			}
			

			return JSONArray.toJSONString(data);

		}///////////ajaxJson()
		
		//안드로이드 통신관련 - 펀딩 all 목록 뿌리기
				@RequestMapping(value="/androidFunding3.ins",produces="text/html; charset=UTF-8")
				@ResponseBody
				public String androidFunding3() throws Exception{
					List<Map> list = rewardService.selectFunding2();
					List data = new ArrayList();
					for(Map m : list) {
						Map mm = new HashMap();
						
						mm.put("S_GOAL_PRICE", m.get("S_GOAL_PRICE").toString());
						if(m.get("S_GOAL_ACCUMULATION") == null) {
							mm.put("S_GOAL_ACCUMULATION", "0");
						}else {
							mm.put("S_GOAL_ACCUMULATION", m.get("S_GOAL_ACCUMULATION").toString());
						}
						mm.put("S_GOAL_DEADLINE", m.get("S_GOAL_DEADLINE").toString().substring(0, 10));
						mm.put("B_DESCRIPTION", m.get("B_DESCRIPTION").toString());
						mm.put("B_ALBUM_COVER", m.get("B_ALBUM_COVER").toString());
						mm.put("B_NAME", m.get("B_NAME").toString());
						mm.put("CT_NAME", m.get("CT_NAME").toString());
						mm.put("CT_NO",m.get("CT_NO").toString());
						
						data.add(mm);
					}
					System.out.println(JSONArray.toJSONString(data));

					return JSONArray.toJSONString(data);

				}///////////ajaxJson()
	
	//안드로이드 카카오페이
		@RequestMapping(name="/kakao/pay.ins",method=RequestMethod.GET)
		public String kakaopay(@RequestParam Map map,Map map1) throws Exception{
			System.out.println("여기까지 들어올까요?");
			System.out.println(map.get("list"));
			StringTokenizer token = new StringTokenizer(map.get("list").toString(), ",");
		
			String list[] = new String[token.countTokens()];
			
			for(int i=0;token.hasMoreTokens(); i++) {
				list[i] = token.nextToken();
				System.out.println(list[i]);
			}
			
			for(int i=0;i<list.length; i++) {
				System.out.println(i+"번째 : "+list[i]);
			}
			
			map1.put("title", list[0]);
			map1.put("name", list[1]);
			map1.put("email", list[2]);
			map1.put("phone", list[3]);
			map1.put("money", list[4]);
			map1.put("message", list[5]);
			map1.put("paymethod", list[6]);
			
			
			return "/Pay/Androidkakao.tiles";
		}
		
		@RequestMapping("/insomnia/Pay/KakaoPayComplete.ins")
		public String kakaoComplete() throws Exception{
			System.out.println("결제가 완료되면 여기로 이동합니다.");
			return "";
		}

	
	
}/////class
