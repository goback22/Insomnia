package com.kosmo.insomnia.web.sub1;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class ZeroJinController {

	@Resource(name="insService")
	private MemberServiceImpl insService;
	
	//로그인
	@RequestMapping("/login.ins")
	public String login(HttpSession session, Model model, @RequestParam Map map) throws Exception{
		boolean flag = insService.isMember(map);
		if(flag) {
			session.setAttribute("id", map.get("id"));
			//admin@naver.com으로 로그인시 바로 관리자 페이지로 이동 - 임시
			if(map.get("id").equals("admin@naver.com")) {
				return "/admin/AdminIndex";
			}//
		}//if
		else model.addAttribute("errorMessage", "아이디 또는 비밀번호가 불일치합니다.");
		return "home.tiles";
	}
	
	//로그아웃
	@RequestMapping("/logout.ins")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "home.tiles";
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
}
