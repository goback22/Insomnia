package com.kosmo.insomnia.web.sub1;

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
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.ls.LSInput;

import com.kosmo.insomnia.service.BGSConcertDTO;
import com.kosmo.insomnia.service.BGSConcertService;
import com.kosmo.insomnia.service.ListDTO;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.serviceimpl.CommentServiceImpl;
import com.kosmo.insomnia.serviceimpl.ListDAO;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.web.sub1.PagingUtil;
import com.oreilly.servlet.MultipartRequest;
import com.sun.xml.internal.ws.server.ServiceDefinitionImpl;

@Controller
public class ZeroJinController {
	@Resource(name = "insService")
	private ListServiceImpl insService;
	
	@Resource(name="commentService")
	private CommentServiceImpl commentService;

	@Resource(name="bGSConcertService")
	private BGSConcertService bGSConcertService;
	
	@Resource
	private MemberServiceImpl memberService;
	
   // 로그인
   @RequestMapping(value = "/login.ins")
   public String login(HttpSession session, Model model, @RequestParam Map map) throws Exception {
	   
      boolean flag = insService.isMember(map);
      
      if(flag) {
    	  session.setAttribute("id", map.get("id"));
    	  
    	  MemberDTO record = memberService.selectOne(map);

    	  record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
    	  
    	  model.addAttribute("record", record);

    	  session.setAttribute("login_user_name", record.getName());
	      session.setAttribute("login_user_phoneNb", record.getPhone());
	      System.out.println(record.getPhone());
    	  
//    	  if(map.get("id").equals("admin")) {
//    		  return "/admin/AdminIndex";
//    	  }
      } else {
    	  model.addAttribute("errorMessage", "아이디 또는 비밀번호가 불일치합니다.");
    	 /* return "forward:/loginErr/ajax.ins";*/
      }
      return "home.tiles";
   }
   
 /*  ////로그인 ajax
   @ResponseBody
   @RequestMapping(value="/loginErr/ajax.ins", produces="text/html; charset=UTF-8")
   public String loginErrAjax(Model model) throws Exception {
	   
	   model.addAttribute("errorMessage", "아이디 또는 비밀번호가 불일치합니다.");
	   return "틀렸습니다.";

   }*/

	// 로그아웃
	@RequestMapping("/logout.ins")
	public String logout(HttpSession session) throws Exception {
		// 로그아웃 처리
		session.invalidate();

		return "home.tiles";
	}

	// 서브 프로젝트
	@RequestMapping(value = "/sub1/subprojects.ins")
	public String subprojects() throws Exception {
		return "/sub1/subprojects.tiles";
	}
	
	// 서브 프로젝트 -> 방구석 기타리스트 
	@RequestMapping(value = "/sub1/subcontent.ins")
	public String subcontent(Model model) throws Exception {
		List<Map> product_List = bGSConcertService.selectList();
		
		model.addAttribute("bgs1", product_List.get(0));
		model.addAttribute("bgs2", product_List.get(1));
		return "/sub1/subcontent.tiles";
	}

	// 목록처리]
	// 리소스 파일(memo.properties)에서 읽어오기
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
		
	// 방구석 기타리스트 게시판
	@RequestMapping(value = "/sub1/list.ins")
	public String list(Model model, @RequestParam Map map, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "1") int nowPage) throws Exception {
		int totalRecordCount = insService.getTotalRecord(map);

		// 전체 페이지수]
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		map.put("start", start);
		map.put("end", end);
		
		// 서비스 호출
		List<ListDTO> list = insService.selectList(map);
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/sub1/list.ins?");

		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pagingString", pagingString);
		
//		System.out.println("조회수:"+list.get(0).getAp_visit()); // 이게 널이면 java.lang.IndexOutOfBoundsException - index : 0  에러 뜸
//		System.out.println("궁금해:"+list.get(0).getAp_genre());
		
		return "/sub1/list.tiles";
	}
		
	// 방구석 기타리스트 게시판 - write폼으로 이동
	@RequestMapping(value = "/sub1/write.ins", method = RequestMethod.GET)
	public String write() throws ServletException, IOException {
		return "sub1/write";
	}

	// 방구석 기타리스트 게시판 - write처리
	@RequestMapping(value = "/sub1/write.ins", method= RequestMethod.POST)
	public String writeOk(@RequestParam Map map, HttpSession session,HttpServletRequest req) throws IOException, ServletException{
		// 서비스 호출
		map.put("id", session.getAttribute("id")); // ☆
		
		insService.insert(map);
		
		return "forward:/sub1/list.ins";
		//return "/sub1/list.tiles";로하면 안돼
	}
	
	// 방구석 기타리스트 게시판  - view
	@RequestMapping(value = "/sub1/view.ins")
	public String view(@RequestParam Map map, Model model) throws Exception {
		// 서비스 호출
		ListDTO record = insService.selectOne(map);
		
		// 데이타 저장 및 줄바꿈 처리
		if(record.getAp_content() != null) {
			record.setAp_content(record.getAp_content().replace("\r\n", "<br/>"));
		}
		model.addAttribute("record", record);
		
		// System.out.println(record.getAp_content());
		
		// 이전 글
		ListDTO prev = insService.prevSelectOne(map);
		// 다음 글
		ListDTO next = insService.nextSelectOne(map);
		
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		//조회수 호출
		insService.updateVisitCount(map);
		
		/*조회수 xml sql문
		//★ UPDATE bgsapply SET ap_visit = {ap_visit}+1 WHERE ap_no =#{ap_no}이 아니라 UPDATE bgsapply SET ap_visit = ap_visit+1 WHERE ap_no =#{ap_no}이다. */ 

		return "/sub1/view.tiles";
	}
	
	// 방구석 기타리스트 게시판 - view 공지사항으로 이동
	@RequestMapping(value = "/sub1/viewadmin.ins", method = RequestMethod.GET)
	public String viewadmin() throws Exception {
		return "/sub1/viewadmin.tiles";
	}

	// 방구석 기타리스트 게시판 - edit
	@RequestMapping(value = "/sub1/edit.ins")
	public String edit(@RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
		// edit 폼에 값을 뿌려주기 위한 record 설정
		if (req.getMethod().equals("GET")) {
			ListDTO record = insService.selectOne(map);
			model.addAttribute("record", record);
			return "sub1/edit";
		}

		int sucFail = insService.update(map);
		model.addAttribute("WHERE", "EDT");
		model.addAttribute("SUCFAIL", sucFail);
		return "sub1/Message";
	}

	// 방구석 기타리스트 게시판 - delete
	@RequestMapping("/sub1/delete.ins")
	public String delete(@RequestParam Map map, Model model) throws Exception {
		int sucFail = insService.delete(map);
		model.addAttribute("SUCFAIL", sucFail);
		return "sub1/Message";
	}
	
	// 방구석 기타리스트 게시판 - read눌렀을 때 높은 조회수 순으로 뿌려주기
	@ResponseBody
	@RequestMapping(value="/sub1/sort.ins", produces="text/html; charset=UTF-8")
	public String readSort(@RequestParam Map map) throws Exception{
		//비지니스 로직 호출
		map.put("start", 1);
		map.put("end", 10);
				
		//서비스 호출
		List<ListDTO> read = insService.readDesc(map);
		List<Map> collections = new Vector<Map>();
		for(ListDTO dto : read) {
			Map record = new HashMap();
			record.put("ap_no", dto.getAp_no());
			record.put("ap_genre", dto.getAp_genre());
			record.put("ap_title", dto.getAp_content());
			record.put("name", dto.getName());
			record.put("ap_visit", dto.getAp_visit());
			record.put("ap_postdate", dto.getAp_postdate().toString());
			collections.add(record);
		}
 		
		System.out.println("??:"+JSONArray.toJSONString(collections));
		
		return JSONArray.toJSONString(collections);
	}
	
	// 방구석 기타리스트 게시판 - read눌렀을 때 낮은 조회수 순으로 뿌려주기
	@ResponseBody
	@RequestMapping(value="/sub1/sortAsc.ins", produces="text/html; charset=UTF-8")
	public String readSortAsc(@RequestParam Map map) throws Exception{
		//비지니스 로직 호출
		map.put("start", 1);
		map.put("end", 10);
				
		//서비스 호출
		List<ListDTO> read = insService.readAsc(map);
		List<Map> collections = new Vector<Map>();
		for(ListDTO dto : read) {
			Map record = new HashMap();
			record.put("ap_no", dto.getAp_no());
			record.put("ap_genre", dto.getAp_genre());
			record.put("ap_title", dto.getAp_content());
			record.put("name", dto.getName());
			record.put("ap_visit", dto.getAp_visit());
			record.put("ap_postdate", dto.getAp_postdate().toString());
			collections.add(record);
		}
 		
		return JSONArray.toJSONString(collections);
	}
	
	//----------------------------
	//----------------------------
	//----------------------------
	//방구석 기타리스트 - reviews(댓글)
	//코멘트 전체 목록 가져오기
	@ResponseBody 
	@RequestMapping(value="/sub1/memolist.ins", produces="text/html; charset=UTF-8")
	public String list(@RequestParam Map map) throws Exception{
		//비지니스 로직 호출
		map.put("start", 1);
		map.put("end", 10);
		
		//서비스 호출]
		List<Map> comments= commentService.selectList(map);
		
		for(Map comment:comments) {
			comment.put("POSTDATE", comment.get("POSTDATE").toString().substring(0,10));
			//엔터 값
			comment.put("CONTENT", comment.get("CONTENT").toString().replace("\r\n", "<br/>"));
		}
		
		System.out.println(JSONArray.toJSONString(comments));
		return JSONArray.toJSONString(comments);
	}//list()
		
	//코멘트 입력처리]
	@ResponseBody 
	@RequestMapping(value="/sub1/memowrite.ins",produces="text/html; charset=UTF-8")
	public String write(@RequestParam Map map,HttpSession session) throws Exception{
		//서비스 호출]
		//한줄 댓글 작성자 아이디 맵에 설정
		map.put("id", session.getAttribute("id"));
		
		commentService.insert(map);
		
		return map.get("r_no").toString();
	}//write
	
	//코멘트 수정처리]
	@ResponseBody
	@RequestMapping(value="/sub1/memoedit.ins",produces="text/html; charset=UTF-8")
	public String update(@RequestParam Map map) throws Exception{
		//서비스 호출]
		commentService.update(map);
		
		return "";
	}//
	
	//삭제 처리]
	@ResponseBody
	@RequestMapping(value="/sub1/memodelete.ins",produces="text/html; charset=UTF-8")
	public String delete(@RequestParam Map map) throws Exception{
		//서비스 호출]
		commentService.delete(map);
		
		return "";
	}//	
}