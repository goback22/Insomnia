package com.kosmo.insomnia.android;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.serviceimpl.ListServiceImpl;

@Controller
public class androidController {
	
	@Resource(name="insService")
	private ListServiceImpl listservice;
	
	//안드로이드 통신관련
	@RequestMapping(value="/AjaxJson.ins",produces="text/html; charset=UTF-8")

	@ResponseBody

	public String ajaxJson(@RequestParam Map map) throws Exception{
		System.out.println("버튼 클릭했다");

		//비지니스 로직 호출

		boolean isLogin=listservice.isMember(map);

		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성

		JSONObject json=new JSONObject();

		//JSON객체의 put("키값","값")메소드로 저장하면

		//{"키값":"값"} JSON형태의 데이타로 저장됨.

		json.put("isLogin", isLogin ? "Y":"다음 기회에...");

		System.out.println("json.toString():"+json.toString());

		System.out.println("json.toJSONString():"+json.toJSONString());

		return json.toJSONString();

	}///////////ajaxJson()

	
	
}/////class
