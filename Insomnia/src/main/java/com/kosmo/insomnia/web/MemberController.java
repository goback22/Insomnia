package com.kosmo.insomnia.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.login.LoginServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class MemberController {

	@Resource(name = "loginServiceImpl")
	LoginServiceImpl service;

	@Resource(name = "memberService")
	MemberServiceImpl memberService;

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/checkSignup.ins", method = RequestMethod.POST)
	public String checkSignup(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		System.out.println("id:" + id);
		int rowcount = memberService.checkSignup(id);
		return String.valueOf(rowcount);
	}

	@RequestMapping("/home/Members.ins")
	public String select(Model model) throws Exception {
		return "home.tiles";
	}// home.tilte

	@RequestMapping("/register/term.ins")
	public String toRegisterTerm() throws Exception {
		return "my/RegisterTerm.tiles";
	}// toRegisterTerm

	@RequestMapping("/register/form.ins")
	public String toRegisterForm(@RequestParam Map map, Model model) throws Exception {
		model.addAttribute("advertise", map.get("advertise") == null ? "" : map.get("advertise").toString());
		return "my/RegisterForm.tiles";
	}// toRegisterForm

	@RequestMapping("/register/complete.ins")
	public String toComplete(@RequestParam Map map) throws Exception {
		System.out.println(map.toString());
		return "my/RegisterComplete.tiles";
	}// toComplete

	@RequestMapping(value = "/register.ins", method = RequestMethod.POST)
	public String RegisterPost(@RequestParam Map map, RedirectAttributes rttr, HttpServletRequest request,
			HttpSession session) throws Exception {
 		Map<String, String> record = new HashMap();
 		
		record.put("id", map.get("email").toString()+"@"+map.get("portal").toString());
		record.put("password", map.get("user_pwd").toString());
		record.put("name", map.get("user_nm").toString());
		record.put("gender", map.get("gender").toString());
		record.put("birthday", map.get("birth_year").toString() + "/" + map.get("birth_month").toString() + "/"
				+ map.get("birth_day").toString());
		record.put("birth_flag", map.get("birth_flag").toString());
		record.put("zip_code", map.get("zip_code").toString());
		record.put("address",
				"R:" + map.get("roadAddress") == null ? ""
						: map.get("roadAddress").toString() + " J:" + map.get("jibunAddress") == null ? ""
								: map.get("jibunAddress").toString() + " D:" + map.get("detailAddress") == null ? ""
										: map.get("detailAddress").toString());
		record.put("phone", "010" + map.get("phone1").toString() + map.get("phone2").toString());
		record.put("sms_recieve", map.get("advertise") == null ? "F" : "T");
		
		service.create(record);
		rttr.addFlashAttribute("authmsg", "이메일 인증 후 사용 가능합니다.");
//		return "redirect:/";
		return "home.tiles";
	}

	@RequestMapping(value = "/emailConfirm.ins", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam Map<String,String> map, Map resultMap) throws Exception { // 이메일인증
		map.put("active", "Y");
		service.userAuth(map);
		resultMap.put("result","이메일 인증 완료");
		return "home.tiles";
	}
}// class