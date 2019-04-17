package com.kosmo.insomnia.web.pay;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.service.BGSConcertService;

@Controller
public class PayController {
	

	
	//결제페이지[서브]로 이동]
	@RequestMapping(value="/Pay/PayPage.ins")
	public String payPage(@RequestParam Map map,Map view,HttpSession session) throws Exception{
		view.put("id",session.getAttribute("id"));
		view.putAll(map);
		return "/Pay/PayPage.tiles";
	}///payPage()
	
	//결제 완료페이지]
	@RequestMapping(value="/Pay/PayComplete.ins")
	public String payComplete(@RequestParam Map map,Model model) throws Exception {
		
		return "/Pay/PayComplete.tiles";
	}/////payComplete()
	

}/////class
