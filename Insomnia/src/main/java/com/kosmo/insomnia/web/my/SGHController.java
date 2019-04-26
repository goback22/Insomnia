package com.kosmo.insomnia.web.my;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.kosmo.insomnia.service.BGSConcertDTO;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.serviceimpl.BGSConcertServiceImpl;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.serviceimpl.RewardServiceImpl;
import com.kosmo.insomnia.web.sub1.PagingUtil;

@SessionAttributes("id")
@Controller
public class SGHController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="rewardServiceImpl")
	private RewardServiceImpl rewardService;
	
	@Resource(name="bGSConcertService")
	private BGSConcertServiceImpl bgsService;
	
	/////마이페이지 이동
	@RequestMapping("/menu/mypage.ins")
	public String mypage(HttpSession session, Map map, Model model, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception {
		
		//세션에 저장된 아이디값 구하기
		String id = session.getAttribute("id") == null ? null : session.getAttribute("id").toString();
		if(id == null) {
			return "my/MyPage2.tiles";
		}
		
		System.out.println("저장된 id는 " + id);
		
		//서비스 객체가 쓸 map객체
		map.put("id", id);
		//서비스 객체를 통해 DTO객체 받기
		MemberDTO record = memberService.selectOne(map);
		
		record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
		 
		System.out.println("갖고온 이름은? " + record.getName());
		
		//반환한 레코드 객체(1명) 모델에 담아서 반환
		model.addAttribute("record", record);
		
		/////처음 로딩시 펀딩한(이게 제일 앞이니까) 목록을 보여주어야.
		//페이징을 위한 로직
		
		//전체 레코드수
		int totalRecordCount = rewardService.getCount(map); //map은 검색용 혹시 에러나면 지우기 null 들어갈 테니
		//한 페이지에서 보여줄 div 수
		int pageSize = 4;  //나중에 .properties로?
		//페이징 수
		int blockPage = 5;
		//전체 페이지수
		int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
		
		int start = (nowPage-1)*pageSize + 1;
		int end = nowPage*pageSize;
		map.put("start", start);
		map.put("end", end);
		
		String pagingString = PagingUtilSGH.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "/mypage/history.ins?");
		
		List<RewardDTO> fundingRecords = rewardService.selectList(map);
		model.addAttribute("fundingRecords", fundingRecords);
		model.addAttribute("pagingString", pagingString);
		System.out.println("fundingRecords는?" + fundingRecords);
		
		
		
		return "my/MyPage2.tiles";
	}
	
	@RequestMapping("/menu/mypage/edit.ins")
	public String mypage_edit() throws Exception {
		
		return "my/MemberEdit2.tiles";
	}
	
	
	//소셜 로그인
	@RequestMapping("/login/social.ins")
	public String socialLogin(@RequestParam Map map,  HttpSession session, Model model) throws Exception {
		
		//공급자가 제공한 소셜 아이디 얻기
		String id = map.get("socialId").toString();
		
		if(memberService.isSocialMember(map)) {  // 계정 있을시 로그인 //굳이 따로 만든 이유: 회원의 비번을 조회할 필요가 없다. 페이스북에서 처리
			//인증이 안 되면 hidden 폼에 id값 자체가 안 들어 온다.
			
			//로그인 처리
			session.setAttribute("id", id);
			map.put("id", id);
			
			//정보 가져오기
			MemberDTO record = memberService.selectOne(map);
			model.addAttribute("loginRecord", record);
			
			String message = record.getName() + "님 환영합니다!";
			model.addAttribute("loginMessage", message);
			
			return "home.tiles";
		} else {   					 	 //최초 접속시 회원가입 처리
			return "forward:/register/social.ins";
		}
		
		//비번을 잘 못 입력하였을 경우에는 아예 우리가 값 자체를 못 받는다. 그건 페이스북 단에서 처리해 줄 것 같은데, 어떤 메세지 뜨는지 한 번 살펴보자.
		
	}/////socialLogin()
	
	
	//소셜 회원가입
	@RequestMapping("/register/social.ins")
	public String socialRegister(@RequestParam Map map, Model model, HttpSession session) throws Exception {
		
		//여기나 아님 저 밑에 중간 부분에서 추가 정보 띄울 수도 있겠다.
		
		///현재 사용자의 SNS계정 정보 가져오기
		String socialId = map.get("socialId").toString();  //굳이 socialId로 한 이유. 일반 회원의 id랑 이름 겹칠까봐
		String socialName = map.get("socialName").toString();
		String socialEmail = map.get("socialEmail").toString();
		String socialProfile = map.get("socialProfile").toString();
		String socialBirth = map.get("socialBirth").toString();
		String socialSite = map.get("socialSite").toString();
		
		if(socialSite == "kakao") {
			
			map.put("socialBirth", null);
			map.put("socialEmail", null);
			
		}
		System.out.println("카카오 소셜 이름은? " + socialName);
		System.out.println("카카오 소셜 사이트는? " + socialSite);
		
		//생일 처리
		/*String[] birthArr = socialBirth.split("/");
		socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);*/
		//지정한 월이 부적합합니다. 오류. String타입으로 저장해야 하지만, 뿌려줄 때만 이렇게 바꿔서 뿌려주고 저장할 때는 Date형식으로 저장하자.
		
		if(socialSite != "kakao") {
			String[] birthArr = socialBirth.split("/");
			String year = birthArr[2].substring(2);
			socialBirth = year + "/" + birthArr[0] + "/" + birthArr[1];
			map.put("socialBirth", socialBirth);
		}
		
		//DB에 저장
		boolean isRegistered = memberService.socialRegister(map);  //map에 담긴 정보:아이디, 이름, 이메일, 사진, 생일
		
		//저장에 성공했다면
		if(isRegistered) {
			
			//로그인 처리
			session.setAttribute("id", socialId);
			//현재 로그인한 사용자의 정보 가져오는 dao 메서드 사용 예정
			
			map.put("id", session.getAttribute("id"));
			MemberDTO record = memberService.selectOne(map);
			
			/*//출력시 생일 처리 (DB저장된 값과는 다르다)
			socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);*/
			//나중에 생일 출력해주는 데서 써먹자. 이대로 record.setXXX(socialBirth) 해주면 될 듯
			
			model.addAttribute("loginRecord", record);
			String message = "INSOMNIA에 가입하신 것을 진심으로 축하합니다.<br/> INSOMNIA의 다양한 상품과 이벤트를 즐기시려면 마이페이지에서 추가정보를 입력해주세요.";
			model.addAttribute("loginMessage", message);
						
		} else { //실패했다면
			model.addAttribute("socialRegisterErr", "소셜 회원가입에 실패했습니다.");
		}
				
		return "home.tiles";
		
	}////socialRegister()
	
	
	////////////사진 업로드
	@RequestMapping("/edit/profileImg.ins")  
	public String editProfileImg(MultipartHttpServletRequest mhsr, Model model, Map map, HttpSession session) throws Exception {
		
		//1]서버의 물리적 경로 얻기
		
		String physicalPath = mhsr.getServletContext().getRealPath("/upload");
		MultipartFile upload = mhsr.getFile("imgUpload");
		
		//2] 파일객체 생성/ 파일 이름 중복시 이름변경
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		File file = new File(physicalPath + File.separator + newFileName);
		//3] 업로드 처리
		upload.transferTo(file);
		
		//DB에 저장- 이걸 완료해야 뷰단에서 이미지 구분해서 보임
		map.put("profile_img", newFileName);
		map.put("id", session.getAttribute("id"));
		
		memberService.update(map);

		
		//4]리퀘스트 영역에 데이터 저장
		mhsr.setAttribute("fileName", newFileName);
		System.out.println("파일이름은? " + newFileName);
		
		return "forward:/menu/mypage.ins";  //마이페이지 컨트롤러 메서드로. 지금은 이동만 하고 있으나 데이터 뿌려주어야 한다.
	}
	
	
	@ResponseBody  //요거 꼭 붙여야 됨
	@RequestMapping(value="/edit/profileImgAjax.ins", produces="text/html; charset=UTF-8")  //한글깨짐 방지
	public String editProfileImgAjax(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, Map dismap, HttpSession session, MultipartRequest multipartRequest) throws Exception {
		
		String physicalPath = mhsr.getServletContext().getRealPath("/upload");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("imgUpload");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload가 null인듯
		File file = new File(physicalPath + File.separator + newFileName);
		
		System.out.println("newFileName은? " + newFileName);
		
		upload.transferTo(file);
		
		dismap.put("profile_img", newFileName);
		dismap.put("id", session.getAttribute("id"));
		
		memberService.update(dismap);
		
		return newFileName;
	
	}	
	
	////펀딩, 좋아요, 제작 목록 가져오는 ajax 메서드
	@ResponseBody
	@RequestMapping(value="/mypage/history.ins", produces="text/html; charset=UTF-8")
	public String getHistory(@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage, Map dismap, HttpSession session) throws Exception {
		
		///요청한 유저의 id를 쿼리문으로 전달하기 위해 dismap에 저장
		dismap.put("id", session.getAttribute("id"));
		
		//펀딩, 좋아요, 제작 목록 중 어떤 요청인지 확인
		String requestStr = map.get("target").toString();
		
		//페이징을 위한 로직
		//전체 레코드수
		int totalRecordCount = 0;
				
		switch(requestStr) {
		
			case "음반" :
				totalRecordCount = rewardService.getCount(dismap);
				break;
			case "공연" :
				totalRecordCount = bgsService.getCount(dismap);
				break;
			case "좋아한" :
				break;
			case "만든" :
				break;
		}
		
		 
		//한 페이지에서 보여줄 div 수
		int pageSize = 4;  //나중에 .properties로?
		//페이징 수
		int blockPage = 5;
		//전체 페이지수
		int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
		
		int start = (nowPage-1)*pageSize + 1;
		int end = nowPage*pageSize;
		dismap.put("start", start);
		dismap.put("end", end);
		
		String pagingString = PagingUtilSGH.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "/mypage/history.ins?");
		
		
		//json을 위해 선언한 리스트
		List<Map> resultList = new Vector<>();
		//값이 없을 경우 뿌려줄 메세지용
		Map blankMap = new HashMap();
		///페이징을 위한 맵
		Map pagingMap = new HashMap();
		
		
		if(requestStr.equals("음반")) {
		
				////리워드 값 얻어오기
				List<RewardDTO> records = rewardService.selectList(dismap);
				
				///json을 위해 선언한 list를 바깥으로 꺼냄
				
				////값이 없을 때
				if(records == null) {
					blankMap.put("noData", "noData");
					blankMap.put("which", "음반");
					resultList.add(blankMap);
					return JSONArray.toJSONString(resultList);
				}
				
				////값이 있을 때
				for(RewardDTO record: records) {
					//맵 생성
					Map tempMap = new HashMap();
					tempMap.put("R_no", record.getR_no());
					tempMap.put("S_no", record.getS_no());
					tempMap.put("R_Price", record.getR_price());
					tempMap.put("R_Name", record.getR_name());
					tempMap.put("R_Description", record.getR_description());
					tempMap.put("B_name", record.getB_name());
					tempMap.put("BM_name", record.getBm_name());
					tempMap.put("S_Album_cover", record.getS_album_cover());
					
					resultList.add(tempMap);
				}
				
				pagingMap.put("pagingString", pagingString);
				resultList.add(pagingMap);
				
				System.out.println("음반 : " + JSONArray.toJSONString(resultList));
				return JSONArray.toJSONString(resultList);  //null이면 목록이 없습니다 뿌려주기 어떻게 판단?
				
		} else if(requestStr.equals("공연")) {
				
				
				///방구석 공연 값 얻어오기
				List<BGSConcertDTO> records =  bgsService.selectMyList(dismap);
				
				System.out.println("왜 방구석 records가 null이 아니냐? " + records);
				///json을 위해 선언한 list를 바깥으로 꺼냄
				
				///값이 없을 때 
				if(records.size() == 0) {
					
					blankMap.put("noData", "noData");
					blankMap.put("which", "공연");
					resultList.add(blankMap);
					System.out.println("값이 없을 때 공연일 때 " + JSONArray.toJSONString(resultList));
					return JSONArray.toJSONString(resultList);
				}
				
				///값이 있을 때
				for(BGSConcertDTO record : records) {
					
					//맵 생성
					Map tempMap = new HashMap();
					tempMap.put("bgsco_no", record.getBgsco_no());
					tempMap.put("b_title", record.getB_title());
					tempMap.put("b_place", record.getB_place());
					tempMap.put("b_content", record.getB_content());
					tempMap.put("concertDate", record.getC_concertDate());
					tempMap.put("price_bgs", record.getC_price());
					tempMap.put("qty_bgs", record.getQty());
					
					resultList.add(tempMap);			
				}
				
				pagingMap.put("pagingString", pagingString);
				resultList.add(pagingMap);
				
				System.out.println("공연 : " + JSONArray.toJSONString(resultList));
				return JSONArray.toJSONString(resultList);
				
		} else /*(requestStr.equals("좋아한"))*/ {
				
				blankMap.put("noData", "noData");
				blankMap.put("which", "좋아한");
				resultList.add(blankMap);
				return JSONArray.toJSONString(resultList);
				
		} /*else if(requestStr.equals("만든")) {		

				blankMap.put("noData", "noData");
				blankMap.put("which", "만든");
				resultList.add(blankMap);
				return JSONArray.toJSONString(resultList);
						
		}*/
		

		

	}//////////////json으로 구매한 목록들 뿌려주기
	
	
	
	

}/////////class
