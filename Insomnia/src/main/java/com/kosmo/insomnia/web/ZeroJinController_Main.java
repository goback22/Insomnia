package com.kosmo.insomnia.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.w3c.dom.ls.LSInput;

import com.kosmo.insomnia.service.BGSConcertDTO;
import com.kosmo.insomnia.service.BGSConcertService;
import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.service.MainCommentService;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.CommentServiceImpl;
import com.kosmo.insomnia.serviceimpl.ListDAO;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MainCommentServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.web.sub1.PagingUtil;
import com.oreilly.servlet.MultipartRequest;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class ZeroJinController_Main {
	//메인 코멘트용
	@Resource(name="mainCommentService")
	private MainCommentServiceImpl mainCommentService;
	
	/*-----------------------------------------
	 * -----------------메인--------------------
	-------------------------------------------*/
	
	//메인 코멘트
	//목록 처리
	@ResponseBody
	@RequestMapping(value="/main/memolist.ins",produces="text/html; charset=UTF-8")
	public String mainCommentlist(@RequestParam Map map,HttpServletRequest req) throws Exception{
		//비지니스 로직 호출
		map.put("start", 1);
		map.put("end", 10);
		
		//서비스 호출]
		List<Map> comments= mainCommentService.selectList(map);
		System.out.println("comments:"+comments);
		//System.out.println("comments.get(0):"+comments.get(0)); // {C_POST_DATE=2019-04-29 08:58:38.0, PROFILE_IMG=Z.jpg, C_CONTENT=밴드서브밋 코맨트 내용3, ID=kim@naver.com, NAME=김길동, BSC_NO=3}
		
		for(Map comment:comments) {
			comment.put("C_POST_DATE", comment.get("C_POST_DATE").toString().substring(0,10));
			//엔터 값
			comment.put("C_CONTENT", comment.get("C_CONTENT").toString().replace("\r\n", "<br/>"));
		}
		
		System.out.println("잘 들어가니?:"+JSONArray.toJSONString(comments));
		
		return JSONArray.toJSONString(comments);
	}//list()	
	
	//코멘트 입력처리]
	@ResponseBody 
	@RequestMapping(value="/main/memowrite.ins",produces="text/html; charset=UTF-8")
	public String mainCommentWrite(@RequestParam Map map,HttpSession session) throws Exception{
		//서비스 호출]
		//한줄 댓글 작성자 아이디 맵에 설정
		map.put("id", session.getAttribute("id"));
		
		mainCommentService.insert(map);
		
		return map.get("bsc_no").toString();
	}//write
	
	//코멘트 수정처리]
	@ResponseBody
	@RequestMapping(value="/main/memoedit.ins",produces="text/html; charset=UTF-8")
	public String mainCommentUpdate(@RequestParam Map map) throws Exception{
		System.out.println("여기 들어오나요?");
		
		//서비스 호출]
		mainCommentService.update(map);
		
		System.out.println("여기 들어오나요??");
		
		return "";
	}//
	
	//삭제 처리]
	@ResponseBody
	@RequestMapping(value="/main/memodelete.ins",produces="text/html; charset=UTF-8")
	public String mainCommentDelete(@RequestParam Map map) throws Exception{
		//서비스 호출]
		mainCommentService.delete(map);
		
		return "";
	}//
	
	//메인 추가 개인정보 등록 폼으로 이동
	@RequestMapping("/main/writeAdditional.ins")
	public String bandSubmit() throws Exception{
		System.out.println("메인 컨트롤러까지 오냐");
		
		return "/main/writeAdditional.tiles";
	}
	
}//class