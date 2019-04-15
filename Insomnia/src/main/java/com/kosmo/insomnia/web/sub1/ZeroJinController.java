package com.kosmo.insomnia.web.sub1;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.ls.LSInput;

import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class ZeroJinController {
	@Resource(name="insService")
	private ListServiceImpl insService;
	
	//로그인
	@RequestMapping("/login.ins")
	public String login(HttpSession session, Model model, @RequestParam Map map) throws Exception{
		boolean flag = insService.isMember(map);
		if(flag) {
			session.setAttribute("id", map.get("id"));
			
			
			//admin@naver.com으로 로그인시 바로 관리자 페이지로 이동 - 임시
			if(map.get("id").equals("admin")) {
				return "/admin/AdminIndex";
			}
			
		}
		else model.addAttribute("errorMessage", "아이디 또는 비밀번호가 불일치합니다.");
		
		return "home.tiles";
	}
	
	//로그아웃
	@RequestMapping("/logout.ins")
	public String logout(HttpSession session) throws Exception{
		//로그아웃 처리
		session.invalidate();
		
		return "home.tiles";
	}
	
	//서브 프로젝트
	@RequestMapping(value="/sub1/subprojects.ins")
	public String subprojects() throws Exception{
		return "/sub1/subprojects.tiles";
	}
		
	//서브 프로젝트 -> 방구석 기타리스트 // 목록처리
	@RequestMapping(value="/sub1/subcontent.ins")
	public String subcontent(Model model, @RequestParam Map map) throws Exception{
		//서비스 호출
		List<ListDTO> list = insService.selectList(map);
		
		model.addAttribute("list",list);
		System.out.println(list);
		
		return "/sub1/subcontent.tiles";
	}
	
	//방구석 기타리스트 - write폼으로 이동
	@RequestMapping(value="/sub1/write.ins", method=RequestMethod.GET)
	public String write() throws Exception{
		return "/sub1/write.tiles";
	}
	
	//방구석 기타리스트 - write처리
	@RequestMapping(value="/sub1/write.ins", method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map, HttpSession session) throws Exception{
		//서비스 호출
		map.put("id", session.getAttribute("id")); //☆
		
		insService.insert(map);
		
		return "forward:/sub1/subcontent.ins";
	}
	
	//방구석 기타리스트 - view
	@RequestMapping(value="/sub1/view.ins")
	public String view(@RequestParam Map map, Model model) throws Exception{
		//서비스 호출
		ListDTO record = insService.selectOne(map);
		
		//데이타 저장 및 줄바꿈 처리
		record.setAp_content(record.getAp_content().replace("\r\n", "<br/>"));
		model.addAttribute("record",record);
		
		return "/sub1/view.tiles";
	}
	
    //방구석 기타리스트 - edit
    @RequestMapping(value="/sub1/edit.ins")
    public String edit(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception{
		//edit 폼에 값을 뿌려주기 위한 record 설정
		if (req.getMethod().equals("GET")) {
			ListDTO record = insService.selectOne(map);
			model.addAttribute("record", record);
			return "/sub1/edit.tiles";
		}
		
		int sucFail = insService.update(map);
		model.addAttribute("WHERE", "EDT");
		model.addAttribute("SUCFAIL", sucFail);
		return "sub1/Message";
    }
    
	//delete
    @RequestMapping("/sub1/delete.ins")
	public String delete(@RequestParam Map map, Model model) throws Exception {
		int sucFail = insService.delete(map);
		model.addAttribute("SUCFAIL", sucFail);
		return "sub1/Message";
	}    
}
