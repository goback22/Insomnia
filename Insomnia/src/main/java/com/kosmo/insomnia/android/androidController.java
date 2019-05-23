package com.kosmo.insomnia.android;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.serviceimpl.BGSConcertServiceImpl;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.RewardServiceImpl;

@Controller
public class androidController {
	
	@Resource(name="insService")
	private ListServiceImpl listservice;
	@Resource(name="bGSConcertService")
	private BGSConcertServiceImpl bgsconcertservice;
	@Resource(name="rewardServiceImpl")
	private RewardServiceImpl rewardService;
	
	
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

		//JSON객체의 put("키값","값")메소드로 저장하면

		//{"키값":"값"} JSON형태의 데이타로 저장됨.

		json.put("isLogin", isLogin ? "Y":"다음 기회에...");

		System.out.println("json.toString():"+json.toString());

		System.out.println("json.toJSONString():"+json.toJSONString());

		return json.toJSONString();

	}///////////ajaxJson()
	
	
	///리워드 펀딩 목록과 안드로이드 연동
	@RequestMapping(value="/AjaxAndroidReward1.ins", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxAndroidReward(@RequestParam Map map) throws Exception {
		
		List<Map> records = rewardService.selectAndroidReward1(map);
		
		System.out.println("records는? " + records);
		
		//현재 날짜 구하기
		Date today = new Date();
		//날짜 형식 위한 포맷
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<Map> jsonList = new ArrayList<>();
		
		for(Map record : records) {
			
			//임시 맵
			Map tempMap = new HashMap();
			///남은 날자 계산
			
			System.out.println("날짜형식이 뭐지?" + record.get("S_GOAL_DEADLINE").toString());
			Date goalDate = dateFormat.parse(record.get("S_GOAL_DEADLINE").toString());
			long diff = goalDate.getTime() - today.getTime();
			long diffDays = diff / (24*60*60*1000);
			
			
			///목표 달성률
			double nowTotal = Double.parseDouble(record.get("S_GOAL_ACCUMULATION").toString());
			double goalTotal = Double.parseDouble(record.get("S_GOAL_PRICE").toString());
			
			System.out.println("대체 뭐가 문제냐? " + "nowTotal: " + nowTotal + "goalTotal : " + goalTotal);
			double totalRate = (int)(nowTotal/goalTotal)*100;
			System.out.println("그래서 퍼센트는1? " + totalRate);
			totalRate = Math.round(totalRate);
			System.out.println("그래서 퍼센트는2? " + totalRate);
			//현재까지 모은 돈
			
			
			tempMap.put("ct_name", record.get("CT_NAME").toString());
			tempMap.put("b_album_cover", record.get("B_ALBUM_COVER").toString());
			tempMap.put("b_name", record.get("B_NAME").toString());
			tempMap.put("b_description", record.get("B_DESCRIPTION").toString());
			tempMap.put("s_goal_accumulation", record.get("S_GOAL_ACCUMULATION").toString());
			tempMap.put("s_goal_price", record.get("S_GOAL_PRICE").toString());
			tempMap.put("s_goal_deadline", record.get("S_GOAL_DEADLINE").toString());
			tempMap.put("remainDays", String.valueOf(diffDays));
			tempMap.put("totalRate", String.valueOf(totalRate));
			
			System.out.println("그래서 퍼센트는3? " + totalRate);
			
			
			jsonList.add(tempMap);
				
		}
		

		System.out.println("안드로이드 리워딩을 위한 컨트롤러입니다." + JSONArray.toJSONString(jsonList));
		
		return JSONArray.toJSONString(jsonList);
	}

	
	//////////////////////////////////////
	///리워드 펀딩 목록과 안드로이드 연동
		@RequestMapping(value="/AjaxAndroidReward2.ins", produces="text/html; charset=UTF-8")
		@ResponseBody
		public String ajaxAndroidReward2(@RequestParam Map map) throws Exception {
			
			List<Map> records = rewardService.selectAndroidReward2(map);
			
			System.out.println("records는? " + records);
			
			//현재 날짜 구하기
			Date today = new Date();
			//날짜 형식 위한 포맷
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			List<Map> jsonList = new ArrayList<>();
			
			for(Map record : records) {
				
				//임시 맵
				Map tempMap = new HashMap();
				///남은 날자 계산
				
				System.out.println("날짜형식이 뭐지?" + record.get("S_GOAL_DEADLINE").toString());
				Date goalDate = dateFormat.parse(record.get("S_GOAL_DEADLINE").toString());
				long diff = goalDate.getTime() - today.getTime();
				long diffDays = diff / (24*60*60*1000);
				
				
				///목표 달성률
				double nowTotal = Double.parseDouble(record.get("S_GOAL_ACCUMULATION").toString());
				double goalTotal = Double.parseDouble(record.get("S_GOAL_PRICE").toString());
				
				System.out.println("대체 뭐가 문제냐? " + "nowTotal: " + nowTotal + "goalTotal : " + goalTotal);
				double totalRate = (int)(nowTotal/goalTotal)*100;
				System.out.println("그래서 퍼센트는1? " + totalRate);
				totalRate = Math.round(totalRate);
				System.out.println("그래서 퍼센트는2? " + totalRate);
				//현재까지 모은 돈
				
				
				tempMap.put("ct_name", record.get("CT_NAME").toString());
				tempMap.put("b_album_cover", record.get("B_ALBUM_COVER").toString());
				tempMap.put("b_name", record.get("B_NAME").toString());
				tempMap.put("b_description", record.get("B_DESCRIPTION").toString());
				tempMap.put("s_goal_accumulation", record.get("S_GOAL_ACCUMULATION").toString());
				tempMap.put("s_goal_price", record.get("S_GOAL_PRICE").toString());
				tempMap.put("s_goal_deadline", record.get("S_GOAL_DEADLINE").toString());
				tempMap.put("remainDays", String.valueOf(diffDays));
				tempMap.put("totalRate", String.valueOf(totalRate));
				
				System.out.println("그래서 퍼센트는3? " + totalRate);
				
				
				jsonList.add(tempMap);
					
			}
			

			System.out.println("안드로이드 리워딩을 위한 컨트롤러입니다." + JSONArray.toJSONString(jsonList));
			
			return JSONArray.toJSONString(jsonList);
		}
	
	
}/////class
