package com.kosmo.insomnia;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.ins", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		*/
		return "home.tiles";
	}///home
	
	//메인 프로젝트
	@RequestMapping(value="/main/mainproject.ins")
	public String mainproject() {
		return "/main/mainproject.tiles";
	}
	
	//메인 프로젝트 - 컨텐트
	@RequestMapping(value="/main/content.ins")
	public String content() {
		return "/main/content.tiles";
	}
	
	//서브 프로젝트
	@RequestMapping(value="/sub1/subprojects.ins")
	public String subprojects() {
		return "/sub1/subprojects.tiles";
	}
	
	//서브 프로젝트 -> 방구석 기타리스트
	@RequestMapping(value="/sub1/subcontent.ins")
	public String subcontent() {
		return "/sub1/subcontent.tiles";
	}
	
	//방구석 기타리스트 - view
	@RequestMapping(value="/sub1/view.ins")
	public String view() {
		return "/sub1/view.tiles";
	}
	
   //방구석 기타리스트 - edit
   @RequestMapping(value="/sub1/edit.ins")
   public String edit() {
      return "/sub1/edit.tiles";
   }
}//classs
