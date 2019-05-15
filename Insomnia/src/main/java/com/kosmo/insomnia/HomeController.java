package com.kosmo.insomnia;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.AdminServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	/*@Autowired
	private FacebookConnectionFactory connectionFactory;
	
	@Autowired
	private OAuth2Parameters oAuth2Parameters;*/
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	//로그인 폼으로 이동, 혹은 홈 화면으로 이동
	@RequestMapping(value = "/home.ins", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Map map, HttpSession session) {
		
		////페이스북 로그인
		//OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        //String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
        
		
		
		if(session.getAttribute("id") != null) {
			
			map.put("id", session.getAttribute("id"));
			MemberDTO record = memberService.selectOne(map);
			
			if(record != null) {
				model.addAttribute("loginRecord", record);
				//record.setProfile_img(record.getProfile_img());		
				model.addAttribute("record", record);	
			}	
			
		}/////if문
		
		//model.addAttribute("facebook_url", facebook_url);
        //System.out.println("/facebook" + facebook_url);
		
		
		//2019 05 15 임한결 추가 방문자수 카운트
		adminService.updateVisitor();
		System.out.println("아 넘어가나요~");
		
		return "home.tiles";
	}///home
	
}//classs
