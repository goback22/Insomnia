package com.kosmo.insomnia.web.sub1;

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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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
import com.kosmo.insomnia.service.CommentDTO;
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
public class ZeroJinController_Sub {
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
   public String login(HttpSession session, Model model, @RequestParam Map map, Authentication auth) throws Exception {
      
      boolean flag = insService.isMember(map);
      
      //UserDetails authenticated = (UserDetails)auth.getPrincipal();
      
      if(flag) {
         session.setAttribute("id", map.get("id"));
      
           //map.put("id", authenticated.getUsername());
         
         MemberDTO record = memberService.selectOne(map);

         //record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
         
         model.addAttribute("loginRecord", record);
         
         //session.setAttribute("id", authenticated.getUsername());
         session.setAttribute("login_user_name", record.getName());
         session.setAttribute("login_user_phoneNb", record.getPhone());
         System.out.println(record.getPhone());
         
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
   public String subprojects(Model model, Map map, HttpSession session) throws Exception {
      
      if(session.getAttribute("id") != null) {
         map.put("id", session.getAttribute("id"));
         
         MemberDTO record = memberService.selectOne(map);
         if(record != null) {
              //record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
              model.addAttribute("loginRecord", record);
         }
      }
      return "/sub1/subprojects";
   }
   
   // 방구석 기타리스트 - review 게시판으로 이동
   @RequestMapping(value="/sub1/review.ins")
   public String reviewGo() throws Exception{
      
      return "/sub1/review.tiles";
   }
   
   // 서브 프로젝트 -> 방구석 기타리스트 
   @RequestMapping(value = "/sub1/subcontent.ins")
   public String subcontent(@RequestParam Map androidmap, Model model, Map map, HttpSession session) throws Exception {
      List<Map> product_List = bGSConcertService.selectList();
      
      if(session.getAttribute("id") != null) {
         map.put("id", session.getAttribute("id"));
      }
      else {
         session.setAttribute("id", androidmap.get("id"));
         map.put("id", session.getAttribute("id"));
         System.out.println("서브 들어갈 때 id : "+session.getAttribute("id"));
         return null;
      }
         MemberDTO record = memberService.selectOne(map);
         
         model.addAttribute("loginRecord", record);
         
         
         model.addAttribute("bgs1", product_List.get(0));
         model.addAttribute("bgs2", product_List.get(1));
         
         //이런저런 문제로 인해 tiles빼고 jsp만
         return "sub1/subcontent";
      
   }

   // 목록처리]
   // 리소스 파일(memo.properties)에서 읽어오기
   @Value("${PAGESIZE}")
   private int pageSize;
   @Value("${BLOCKPAGE}")
   private int blockPage;
      
   // 방구석 기타리스트 게시판
   @RequestMapping(value = "/sub1/list.ins")
   public String list(Model model, @RequestParam Map map, HttpServletRequest req, HttpSession session,
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
      
      //서기환 추가
      map.put("id", session.getAttribute("id"));
     MemberDTO record = memberService.selectOne(map);
       record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
       model.addAttribute("loginRecord", record);
      
      
      model.addAttribute("list", list);
      model.addAttribute("nowPage", nowPage);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("totalRecordCount", totalRecordCount);
      model.addAttribute("pagingString", pagingString);
      
//      System.out.println("조회수:"+list.get(0).getAp_visit()); // 이게 널이면 java.lang.IndexOutOfBoundsException - index : 0  에러 뜸
//      System.out.println("궁금해:"+list.get(0).getAp_genre());
      
      return "/sub1/list.tiles";
   }
      
   // 방구석 기타리스트 게시판 - write폼으로 이동
   @RequestMapping(value = "/sub1/write.ins", method = RequestMethod.GET)
   public String write() throws ServletException, IOException {
      return "sub1/write";
   }

   // 방구석 기타리스트 게시판 - write처리 및 파일업로드
   @RequestMapping(value = "/sub1/write.ins", method= RequestMethod.POST)
   public String writeOk(Model model, HttpServletRequest req, MultipartHttpServletRequest mtfRequest, @RequestParam Map map, HttpSession session) throws IOException, ServletException{
      // 서비스 호출
      map.put("id", session.getAttribute("id")); // ☆
      
      MemberDTO record = memberService.selectOne(map);
        record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
       
        model.addAttribute("loginRecord", record);
      
      //★input=file은 name파라미터를 리퀘스트 영역에서 받을 수 없고 아래 형식에 따라 받아서 Map에 추가해줘야한다.
      MultipartFile ap_attachedfile = mtfRequest.getFile("ap_attachedfile");

      map.put("ap_attachedfile", ap_attachedfile.getOriginalFilename());
      
      System.out.println("map:"+map);
      
      insService.insert(map);
      //System.out.println(insService.insert(map));
      
      
      List<MultipartFile> fileList = mtfRequest.getFiles("ap_attachedfile");
      //System.out.println("a:"+fileList);

        //파일 저장 위치
      String path = mtfRequest.getServletContext().getRealPath("/upload/content/sub/");
      System.out.println("path:"+path);
        
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            //System.out.println("originFileName : " + originFileName);
            //System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
//            String safeFile = originFileName;
            System.out.println("safeFile:"+safeFile);
            try {
                mf.transferTo(new File(safeFile));
                //System.out.println("try");
            } catch (IllegalStateException e) {
               //System.out.println("catch");
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }//for
      
      return "forward:/sub1/list.ins";
      //return "/sub1/list.tiles";로하면 안돼
   }
   
   // 다운로드 처리
   @RequestMapping(value = "/sub1/download.ins")
   public void download(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //파라미터 받기]      
      String no = req.getParameter("no");
      //System.out.println("a:"+no);
      String filename = req.getParameter("filename");
      //System.out.println("b:"+filename);
      
      //다운로드 호출]
      //밑에 한줄 대소문자 가린다.
      FileUtils.download(req,resp,"/upload/content/sub",filename);
   }
      
   // 방구석 기타리스트 게시판  - view
   @RequestMapping(value = "/sub1/view.ins")
   public String view(@RequestParam Map map, Model model, HttpSession session) throws Exception {
      
      map.put("id", session.getAttribute("id"));
      MemberDTO loginrecord = memberService.selectOne(map);
          loginrecord.setProfile_img(loginrecord.getProfile_img() == null ? "profile_none.jpg" : loginrecord.getProfile_img());
       
          model.addAttribute("loginRecord", loginrecord);
      
      
      // 서비스 호출
      ListDTO record = insService.selectOne(map);
      
      System.out.println("1:"+record.getAp_attachedfile()); //null
      
      // 데이타 저장 및 줄바꿈 처리
      if(record.getAp_content() != null) {
         record.setAp_content(record.getAp_content().replace("\r\n", "<br/>"));
      }
      model.addAttribute("record", record);
      
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
   public String viewadmin(Model model, Map map, HttpSession session) throws Exception {
      
      map.put("id", session.getAttribute("id"));
     MemberDTO record = memberService.selectOne(map);
       record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
       model.addAttribute("loginRecord", record);
      
      return "/sub1/viewadmin.tiles";
   }
   
   // 방구석 기타리스트 게시판 - edit로 이동
   @RequestMapping(value = "/sub1/edit.ins", method = RequestMethod.GET)
   public String edit(@RequestParam Map map, Model model, HttpSession session ) throws Exception {
      
     map.put("id", session.getAttribute("id"));
     MemberDTO loginrecord = memberService.selectOne(map);
       loginrecord.setProfile_img(loginrecord.getProfile_img() == null ? "profile_none.jpg" : loginrecord.getProfile_img());
       model.addAttribute("loginRecord", loginrecord);
      
      
      // edit 폼에 값을 뿌려주기 위한 record 설정
      ListDTO record = insService.selectOne(map);
      model.addAttribute("record", record);
      return "sub1/edit";
      }

   // 방구석 기타리스트 게시판 - edit처리 및 파일업로드
   @RequestMapping(value = "/sub1/edit.ins", method = RequestMethod.POST)
   public String edit(HttpSession session, MultipartHttpServletRequest mtfRequest, @RequestParam Map map, HttpServletRequest req, Model model) throws Exception {
      List<MultipartFile> fileList = mtfRequest.getFiles("ap_attachedfile");
      //System.out.println("a:"+fileList);
      
      map.put("id", session.getAttribute("id"));
       MemberDTO loginrecord = memberService.selectOne(map);
          loginrecord.setProfile_img(loginrecord.getProfile_img() == null ? "profile_none.jpg" : loginrecord.getProfile_img());
          model.addAttribute("loginRecord", loginrecord);

        //파일 저장 위치
      String path = mtfRequest.getServletContext().getRealPath("/upload/content/sub/");
      
      MultipartFile ap_attachedfile = mtfRequest.getFile("ap_attachedfile");

      map.put("ap_attachedfile", ap_attachedfile.getOriginalFilename());
        
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            //System.out.println("originFileName : " + originFileName);
            //System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
            //System.out.println("???????:"+System.currentTimeMillis());
            //System.out.println("safeFile:"+safeFile);
            try {
                mf.transferTo(new File(safeFile));
                //System.out.println("try");
            } catch (IllegalStateException e) {
               //System.out.println("catch");
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
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
   
   //----------------------------
   //----------------------------
   //방구석 기타리스트 - reviews(댓글)
   //코멘트 전체 목록 가져오기
   @ResponseBody 
   @RequestMapping(value="/sub1/memolist.ins", produces="text/html; charset=UTF-8")
   public String list(@RequestParam Map map,HttpServletRequest req) throws Exception{
      //비지니스 로직 호출
      map.put("start", 1);
      map.put("end", 10);
      
      //서비스 호출]
      List<Map> comments= commentService.selectList(map);
      
      for(Map comment:comments) {
         comment.put("POSTDATE", comment.get("POSTDATE").toString().substring(0,19));
         //엔터 값
         comment.put("CONTENT", comment.get("CONTENT").toString().replace("\r\n", "<br/>"));
      }
      
//      comments.get("PROFILE_IMG")
      
//      System.out.println(comments.get("PROFILE_IMG").to);
      
      System.out.println("원래 댓글 목록:"+JSONArray.toJSONString(comments));
      return JSONArray.toJSONString(comments);
   }//list()
   
   //스크롤 시 새로운 댓글 20개 가져오기(무한 스크롤)
   @ResponseBody 
   @RequestMapping(value="/sub1/newCommentList.ins", produces="text/html; charset=UTF-8")
   public String newList(@RequestParam Map map,HttpServletRequest req) throws Exception{
      System.out.println("느 들어오긴하니??");
      
      System.out.println("새로운 댓글의 Map:"+map); // 마지막 번호가 map으로 잘 넘어오니?
      
      //서비스 호출]
      List<Map> comments= commentService.newSelectList(map);
      
      for(Map comment:comments) {
         comment.put("POSTDATE", comment.get("POSTDATE").toString().substring(0,19));
         //엔터 값
//         comment.put("CONTENT", comment.get("CONTENT").toString().replace("\r\n", "<br/>"));
      }
      
      System.out.println("새로운 댓글 목록:"+JSONArray.toJSONString(comments));
      return JSONArray.toJSONString(comments);
   }//newCommentList()
      
   //코멘트 입력처리]
   @ResponseBody 
   @RequestMapping(value="/sub1/memowrite.ins",produces="text/html; charset=UTF-8")
   public String write(@RequestParam Map map,HttpSession session) throws Exception{
      System.out.println("map:"+map);
      
      //서비스 호출]
      //한줄 댓글 작성자 아이디 맵에 설정
      map.put("id", session.getAttribute("id"));

      commentService.insert(map);
      
      //리턴으로 안넘겨줘도 된다.
      //return map.get("r_no").toString();
      return "";
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
   public String mainCommentDelete(@RequestParam Map map,Model model) throws Exception{
//      System.out.println("삭제 메소드로 오냐");
      
      System.out.println("map:"+map);
      
//      System.out.println("?:"+map.get("r_no").toString()+"1");
      
      //c_refer를 맵에 담아야하는데 c_refer는 곧 해당 댓글 번호이므로 댓글 번호를 넣어준다.
      map.put("refer", map.get("r_no"));
//         System.out.println("map이 뭔데?:"+map);
      
      System.out.println("mapmap:"+map);
      
      //댓글에 자식이 있니?
      boolean flag = commentService.isChild(map);
      
      System.out.println("flag:"+flag);
      
      //자식이 있는 경우 원 댓글 삭제 안되게 하기
      if(flag) {
         //ajax이므로 당연히 request영역에는 담을 수 없다.
//         model.addAttribute("errorMessage", "답글이 있는 댓글은 삭제할 수 없습니다.");
         //메세지를 return에 담아줘야 한다.
    	  return flag ? "답글 있음" : "";
      }
      
      //서비스 호출]
      commentService.delete(map);
      
      return "";
   }//
   
   //Reply Comment
   @ResponseBody
   @RequestMapping(value="/sub1/replywrite.ins",produces="text/html; charset=UTF-8") 
   public String replyWrite(@RequestParam Map map,HttpSession session) throws Exception{
      //선택한 번호에 대해 selectOne를 해서 정보를 가져온다.
      CommentDTO record = commentService.selectOne(map);
      
      System.out.println("map.get(\"r_no\"):"+map.get("r_no"));
      System.out.println("record.toString():"+record.toString());
      
      //selectOne을 해서 나온 refer,step,depth를 map에 넣어준다
      map.put("id", session.getAttribute("id"));
      map.put("refer", record.getRefer().toString());
      map.put("step", record.getStep().toString());
      map.put("depth", record.getDepth().toString());
      
      System.out.println("Map:"+map);
      
      //insert하기 전 관련 답글들의 step을 1씩 증가시켜야한다.
      commentService.replyBeforeUpdate(map);
      
      //insert 서비스 호출
      commentService.reply(map);
   
//      return map.get("r_no").toString();
      return "";
   }
      
}//class