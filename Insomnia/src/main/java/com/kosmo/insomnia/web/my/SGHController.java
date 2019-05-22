package com.kosmo.insomnia.web.my;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.kosmo.insomnia.service.BGSConcertDTO;
import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandService;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.serviceimpl.BGSConcertServiceImpl;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.serviceimpl.RewardServiceImpl;
import com.kosmo.insomnia.util.login.MailHandler;
import com.kosmo.insomnia.web.sub1.PagingUtil;

////////////FCM 푸시 위한 import
import java.util.Scanner;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.OutputStream;
import java.io.BufferedReader;
import org.json.simple.JSONObject;
import com.google.android.gcm.server.Result;
import java.util.List;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Sender;
//import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;




@SessionAttributes("id")
@Controller
public class SGHController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="rewardServiceImpl")
	private RewardServiceImpl rewardService;
	
	@Resource(name="bGSConcertService")
	private BGSConcertServiceImpl bgsService;
	
	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
	@Inject
	private JavaMailSender mailSender;
	
	/*@Autowired
	private FacebookConnectionFactory connectionFactory;
	
	@Autowired
	private OAuth2Parameters oAuth2Parameters;*/
	
	//////////////////////////////////////////의존성 주입////////////////////////////////////////////
	
	@ResponseBody
	@RequestMapping("/menu/mypage3.ins")
	public String myyyyy(@RequestParam Map map1) {
		System.out.println("map" + map1);
		System.out.println("sadasdMap" + map1.get("photoUrl"));
		
		return map1.get("photoUrl").toString();
	}

	
	/////마이페이지 이동
	@RequestMapping("/menu/mypage.ins")
	public String mypage(@RequestParam Map map1, HttpSession session, Map map, Model model, @RequestParam(required=false, defaultValue="1") int nowPage) throws Exception {
		
		if(session.getAttribute("id") != null) {
			Map map2 = new HashMap();
			map2.put("id", session.getAttribute("id"));
			String img = memberService.selectOne(map2).getProfile_img();
			System.out.println("들어오니?:"+map1.get("url"));
	
			int length = map1.get("url").toString().lastIndexOf("/");
			String img_default = map1.get("url").toString().substring(0,length+1);
			System.out.println("기본 path : "+img_default);
			if(img.trim().equals("default_cover_img.jpg")) {
				model.addAttribute("img", img_default+"default_cover_img.jpg");
			}else {
				model.addAttribute("img", map1.get("url"));
			}
		
		
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
			if(record == null) 
				return "my/MyPage2.tiles";
			
			//record.setProfile_img(record.getProfile_img() == null ? "profile_none.jpg" : record.getProfile_img());
			 
			System.out.println("갖고온 이름은? " + record.getName());
			
			//반환한 레코드 객체(1명) 모델에 담아서 반환
			model.addAttribute("loginRecord", record);
			
			/////처음 로딩시 펀딩한(이게 제일 앞이니까) 목록을 보여주어야.
			//페이징을 위한 로직
			
			//전체 레코드수
			int totalRecordCount = rewardService.getCount(map); //map은 검색용 혹시 에러나면 지우기 null 들어갈 테니
			
			System.out.println("최초의 totalRecordCount : " + totalRecordCount);
			//한 페이지에서 보여줄 div 수
			int pageSize = 4;  //나중에 .properties로?
			//페이징 수
			int blockPage = 5;
			//전체 페이지수
			int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
			
			System.out.println("최초의 totalPage " + totalPage);
			
			//int start = (nowPage-1)*pageSize + 1;
			//int end = nowPage*pageSize;
			//map.put("start", start);
			//map.put("end", end);
			
			//System.out.println("최초의 strt와 end : " + start + ", " + end);
			
			//String pagingString = PagingUtilSGH.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "/mypage/history.ins?");
			
			//System.out.println("최초의 pagingString " + pagingString);
			
			List<RewardDTO> fundingRecords = rewardService.selectList(map);
			model.addAttribute("fundingRecords", fundingRecords);
			//model.addAttribute("pagingString", pagingString);
			System.out.println("fundingRecords는?" + fundingRecords);
			
			MemberDTO record2 = memberService.selectOne(map);
			
			model.addAttribute("fundingCount", rewardService.getCount(map2));  //펀딩 갯수
			model.addAttribute("bgsCount", bgsService.getCount(map2));
			
			map2.put("choice", "like");
			model.addAttribute("likeCount", bandService.getLikeNFollow(map2));
			
			
			model.addAttribute("loginRecord", record2);
			
		}  //// != null
		return "my/MyPage2.tiles";
	}
	
	@RequestMapping("/menu/mypage/edit.ins")
	public String mypage_edit(Model model, Map map, HttpSession session) throws Exception {
		
		map.put("id", session.getAttribute("id"));
		MemberDTO editRecord = memberService.selectOne(map);
		
		String address = editRecord.getShipping_address();
		System.out.println("비아 주소 : " + address );
		if(address != null) {
			
			StringTokenizer tkz = new StringTokenizer(address, "^");
			
			//String[] addArr = address.split("");
			//System.out.println("첫번째: " + addArr[0]);
			//System.out.println("두번째: " + addArr[1]);
			
			/*model.addAttribute("road", addArr[0]);
			model.addAttribute("road", addArr[1]);
			model.addAttribute("road", addArr[2]);*/
			
			  model.addAttribute("road", tkz.hasMoreTokens() ? tkz.nextToken() : null);
		      model.addAttribute("jibun", tkz.hasMoreTokens() ? tkz.nextToken() : null);
		      model.addAttribute("detail", tkz.hasMoreTokens() ? tkz.nextToken() : null);
			
		}
		if(session.getAttribute("id") != null) {
			
			map.put("id", session.getAttribute("id"));
			MemberDTO record = memberService.selectOne(map);
			
			if(record != null) {
				model.addAttribute("loginRecord", record);
				//record.setProfile_img(record.getProfile_img());		
				//model.addAttribute("record", record);	
		}	
		
	}/////if문
	
		model.addAttribute("editRecord", editRecord);
		
		
		return "my/MemberEdit2.tiles";
	}
	
	@RequestMapping("/menu/mypage/editProcess.ins")
	public String editProcess(@RequestParam Map map, Map dismap, HttpSession session, Model model) throws Exception {
		
		dismap.put("id", session.getAttribute("id"));
		dismap.put("password", map.get("password"));
		dismap.put("email", map.get("email"));
		dismap.put("phone", map.get("phone"));
		
		String address = map.get("road").toString() + "^" + map.get("jibun") + "^" + map.get("detail");
		System.out.println("포스트는 안 되지만 여기는 들어오는지?");
		dismap.put("shipping_address", address);
		
		return "forward:/home.ins";
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
			
			model.addAttribute("loginMessage", "old");
			
			return "home.tiles";
		} else {   					 	 //최초 접속시 회원가입 처리
			return "forward:/register/social.ins";
		}
		
		//비번을 잘 못 입력하였을 경우에는 아예 우리가 값 자체를 못 받는다. 그건 페이스북 단에서 처리해 줄 것 같은데, 어떤 메세지 뜨는지 한 번 살펴보자.
		
	}/////socialLogin()
	
	
	//소셜 회원가입
	@RequestMapping("/register/social.ins")
	public String socialRegister(@RequestParam Map map, Model model, HttpSession session) throws Exception {
		
		
		String socialBirth = map.get("socialBirth").toString();
		String socialSite = map.get("socialSite").toString();
		
		///생일 출력 형식 지정하기
		String[] birthArr = socialBirth.split("/");
		//socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);*/

		///오라클 형식으로 입력하기
		/*if(!socialSite.equals("kakao")) {
			String[] birthArr = socialBirth.split("/");
			String year = birthArr[2].substring(2);
			socialBirth = year + "/" + birthArr[0] + "/" + birthArr[1];
			map.put("socialBirth", socialBirth);
		}*/
		
		
		if(!socialSite.equals("kakao") && !socialSite.equals("naver")) {
			
			socialBirth = birthArr[2] + "/" + birthArr[0] + "/" + birthArr[1];
			map.put("socialBirth", socialBirth);
			System.out.println("페이스북 새로운 소셜벌스는 " + socialBirth);
			
		}
		
		map.put("id", map.get("socialId"));
		
		//DB에 저장
		boolean isRegistered = memberService.socialRegister(map);  
		
		//저장에 성공했다면
		if(isRegistered) {
			
			//로그인 처리
			session.setAttribute("id", map.get("socialId"));
			//현재 로그인한 사용자의 정보 가져오는 dao 메서드 사용 예정
			
			map.put("id", session.getAttribute("id"));
			MemberDTO record = memberService.selectOne(map);
			
			/*//출력시 생일 처리 (DB저장된 값과는 다르다)
			socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);*/
			//나중에 생일 출력해주는 데서 써먹자. 이대로 record.setXXX(socialBirth) 해주면 될 듯
			
			model.addAttribute("loginRecord", record);
			//String message = "INSOMNIA에 가입하신 것을 진심으로 축하합니다.\r\n INSOMNIA의 다양한 상품과 이벤트를 즐기시려면 마이페이지에서 추가정보를 입력해주세요.";
			model.addAttribute("loginMessage", "new");
						
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
	public String editProfileImgAjax(@RequestParam Map map, Map dismap, HttpSession session) throws Exception {
		
/*<<<<<<< HEAD
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/member/profile");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("imgUpload");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload가 null인듯
		File file = new File(physicalPath + File.separator + newFileName);
		
		System.out.println("newFileName은? " + newFileName);
		
		upload.transferTo(file);
		
		dismap.put("profile_img", newFileName);
=======*/
		
		String profile_img = map.get("fileName").toString();

		System.out.println("profile_img : "+profile_img);
		dismap.put("profile_img", profile_img);

		dismap.put("id", session.getAttribute("id"));
		

		memberService.updateProfile(dismap);
		
		return profile_img;
	
	}	
	
	////펀딩, 좋아요, 제작 목록 가져오는 ajax 메서드
	@ResponseBody
	@RequestMapping(value="/mypage/history.ins", produces="text/html; charset=UTF-8")
	public String getHistory(@RequestParam Map map, @RequestParam(required=false, defaultValue="1") int nowPage, Map dismap, HttpSession session) throws Exception {
		
		///요청한 유저의 id를 쿼리문으로 전달하기 위해 dismap에 저장
		dismap.put("id", session.getAttribute("id"));
		dismap.put("choice", "like");
		
		//펀딩, 공연, 좋아한 중 선택
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
				totalRecordCount = bandService.getLikeNFollow(dismap);
				break;
		}
		
		 
		//한 페이지에서 보여줄 div 수
		int pageSize = 4;  //나중에 .properties로?
		//페이징 수
		int blockPage = 5;
		//전체 페이지수
		int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
		
		
		//int start = (nowPage-1)*pageSize + 1;
		//int end = nowPage*pageSize;
		//dismap.put("start", start);
		//dismap.put("end", end);
		
		//String pagingString = PagingUtilSGH.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "/mypage/history.ins?");
		
		
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
				if(records.size() == 0) {
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
					tempMap.put("S_Album_cover", record.getSw_banner());
					
					resultList.add(tempMap);
				}
				
				//pagingMap.put("pagingString", pagingString);
				//resultList.add(pagingMap);
				
				//System.out.println("음반은 나오냐 페이징 : " + pagingString);
				
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
				
				//pagingMap.put("pagingString", pagingString);
				//resultList.add(pagingMap);
				
				System.out.println("공연 : " + JSONArray.toJSONString(resultList));
				return JSONArray.toJSONString(resultList);
				
		} else /*(requestStr.equals("좋아한"))*/ {
			
			///일단, 밴드가 뮤직을 등록을 해 놨는지
			
			int doesBandRegisterMusic =  bandService.doesBandRegisterMusic(dismap);
			List<BandDTO> records;
				///좋아한 리워드 목록 가져오기
			if(doesBandRegisterMusic == 0) {
				records = bandService.getLikeBand(dismap);
			} else {
				records = bandService.getLikeBand2(dismap);
			}
			
				if(records.size() == 0) {
					blankMap.put("noData", "noData");
					blankMap.put("which", "좋아한");
					resultList.add(blankMap);
					return JSONArray.toJSONString(resultList);
				}
				
				
				///값이 있을 때
				for(BandDTO record : records) {
					
					//맵 생성
					Map tempMap = new HashMap();
					tempMap.put("b_name", record.getB_name());
					tempMap.put("b_description", record.getB_description());
					tempMap.put("b_album_cover", record.getB_album_cover());
					tempMap.put("bm_name", record.getBm_name());

					if(record.getBm_name() == null) {
						tempMap.put("bm_name", "리워드 준비중");
					}
					System.out.println("이게 왜 널이냐? " + record.getB_no());
					dismap.put("b_no", record.getB_no());
					int likeCount = bandService.getBandLikeNFollow(dismap);
					
					tempMap.put("b_liked", likeCount);
				
					resultList.add(tempMap);			
				}
				
				//System.out.println("대체 왜 안나오냐 페이징 : " + pagingString);
				//pagingMap.put("pagingString", pagingString);
				//resultList.add(pagingMap);
				
				return JSONArray.toJSONString(resultList);
				
		} 
	

	}//////////////json으로 구매한 목록들 뿌려주기
	
	////아이디 비밀번호 찾기 페이지 이동
	
	@RequestMapping("/find/findId.ins")
	public String findIdPage(@RequestParam Map map, Model model) throws Exception {
		
		///최초 이동시가 아닌, 이메일 링크 클릭 후 이동 시 필요한 정보들
		if(map.get("q") != null) {
			//model.addAttribute("givenEmail", map.get("foundId"));
			model.addAttribute("fromEmailLink", "fromEmailLink"); 
			model.addAttribute("thisEmail", map.get("emailt"));
			
		}
		
		
		
		return "my/FindIdPassword.tiles";
	}
	
	////아이디 찾기 결과 화면
	@ResponseBody
	@RequestMapping("/find/findIdAjax.ins")
	public String findIdAjax(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		
		String id = map.get("findId").toString();
		
		System.out.println("아이디 찾기 입력값은?" + id);
		boolean isMember = memberService.checkSignup(id) == 1 ? true : false;
		
		
		
		if(isMember) {
			return "memberOk" + "^" + id;
		}
		
		return "memberNo" + "^" + id;
		
	}////아이디 이메일로 전송시키는 기능 추가해야.
	
	////비밀번호 찾기 결과 화면  /////////////////////////이거 뭐하는 컨트롤러?////////////////////////////////////////////
	@ResponseBody
	@RequestMapping("/find/findPwdAjax.ins")
	public String findPwdAjax(@RequestParam Map map, HttpSession session) throws Exception {
		
		String id = map.get("findPass").toString();
		boolean isMember = memberService.checkSignup(id) == 1 ? true : false;
		
		return "";
	}
	
	@RequestMapping("/registerSocial/form.ins")
	public String registerFormSocial(Model model, Map map, Map recordMap, HttpSession session) throws Exception {
		
		map.put("id", session.getAttribute("id"));
		MemberDTO record = memberService.selectOne(map);
		
		//String[] birthArr = record.getBirthDay().split("/");
		
		/*model.addAttribute("birthYear", "20" + birthArr[0] + "년");
		
		
		model.addAttribute("birthMonth", birthArr[1].substring(1, 2)  + "월"); 
		model.addAttribute("birthDay", birthArr[2] + "일"); */
		
		String[] emailArr = new String[2];
		String[] birthArr = new String[3];
		String emailBack;
		
		System.out.println("로그인 체인은?" + record.getLogin_chain());
		
		if(!record.getLogin_chain().equals("kakao") && !record.getLogin_chain().equals("naver")) {
			
			birthArr = record.getBirthDay().substring(0, 10).split("-");
		}
		
		if(!record.getLogin_chain().equals("kakao")) {
		
			
			emailArr = record.getEmail().split("@");
			
				
			emailBack = emailArr[1];
			if(!(emailBack.equals("naver.com") || emailBack.equals("daum.net") || emailBack.equals("nate.com") || emailBack.equals("google.com") || emailBack.equals("hanmail.net") )) {
				emailBack = "직접입력";
			}
			
			System.out.println("가입과정에서 emailBack의 값은?" + emailBack);
			
			recordMap.put("emailFront", emailArr[0]);
			recordMap.put("emailBack", emailBack);
			System.out.println("처리후 year: " + birthArr[0]);
			recordMap.put("birthYear", birthArr[0]);
			recordMap.put("birthMonth", birthArr[1]);
			recordMap.put("birthDay", birthArr[2]);
			
			System.out.println("네이버의 이메일 프론트는? " + emailArr[0]);

		}
		
		
		recordMap.put("name", record.getName());
		recordMap.put("gender", record.getGender());
		
		
		model.addAttribute("recordMap", recordMap);
		model.addAttribute("record", record);
		
		
		
		return "my/RegisterFormSocial.tiles";
	}
	
	@RequestMapping("/registerSocial/update.ins")
	public String registerUpdateSocial(@RequestParam Map map, Map recordMap, Model model, HttpSession session) throws Exception {
		
		//아이디로 저장되는 이메일을 이메일 항목에 저장함에 유의
		
		//record.put("id", map.get("email").toString()+"@"+map.get("portal").toString());
		//record.put("password", map.get("user_pwd").toString());
		//record.put("name", map.get("user_nm").toString());
		
		recordMap.put("gender", map.get("gender").toString());
		
		
		recordMap.put("zip_code", map.get("zip_code").toString());
		/*recordMap.put("address",
				"R:" + map.get("roadAddress") == null ? ""
						: map.get("roadAddress").toString() + " J:" + map.get("jibunAddress") == null ? ""
								: map.get("jibunAddress").toString() + " D:" + map.get("detailAddress") == null ? ""
										: map.get("detailAddress").toString());
		recordMap.put("phone", "010" + map.get("phone1").toString() + map.get("phone2").toString());*/
		//recordMap.put("sms_recieve", map.get("advertise") == null ? "F" : "T");
		
		String road = map.get("roadAddress").toString();
		String jibun = map.get("jibunAddress").toString();
		String detail = map.get("detailAddress").toString();
		
		recordMap.put("address", road + "^" + jibun + "^" + detail);
		
		
		recordMap.put("phone", "010" + map.get("phone1").toString() + map.get("phone2").toString());
		System.out.println("연결된 주소값은? " + recordMap.get("address"));
		System.out.println("컨트롤러 생일 : " + map.get("birth_year") + " " + map.get("birth_month") + " " + map.get("birth_flag"));
		recordMap.put("birthday", map.get("birth_year").toString() + "/" + map.get("birth_month").toString() + "/"
				+ map.get("birth_day").toString());
		recordMap.put("birth_flag", map.get("birth_flag"));
		
		recordMap.put("email", map.get("email")+"@"+map.get("portal").toString());
		recordMap.put("id", session.getAttribute("id"));
		int flag = memberService.socialUpdate(recordMap);
		
		
		
		MemberDTO loginRecord = memberService.selectOne(recordMap);
		
		model.addAttribute("loginRecord", loginRecord);
		model.addAttribute("social_complete", "yes");
		
		
		return "home.tiles";
	}
	
	/////회원정보 수정
	@ResponseBody
	@RequestMapping("/find/passwordByEmail.ins")
	public String findPasswordEmail(@RequestParam Map map, Model model) throws Exception {
		
		String email = map.get("findPass").toString();
		
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("INSOMNIA 비밀번호 찾기 링크입니다.");
			
			Date current = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd(EEE) hh:mm");
			String currentStr = format.format(current);
			
			String message;
			//여기부터
			message = "<div style=\"max-width: 595px; margin: 0 auto\">\r\n" + 
					"		<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
					"			style=\"max-width: 595px; width: 100%; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif; background-color: #fff; -webkit-text-size-adjust: 100%; text-align: left\">\r\n" + 
					"			<!-- Header -->\r\n" + 
					"			<tbody>\r\n" + 
					"				<tr>\r\n" + 
					"					<td height=\"30\"></td>\r\n" + 
					"				</tr>\r\n" + 
					"				<tr>\r\n" + 
					"					<td style=\"padding-right: 27px; padding-left: 21px\">\r\n" + 
					"						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
					"							<tbody>\r\n" + 
					"								<tr>\r\n" + 
					"									<td style=\"\" width=\"61\"><img\r\n" + 
					"										src=\"<c:url value='/img/logo.png'/>\"\r\n" + 
					"										alt=\"Insomnia\" width=\"61\"></td>\r\n" + 
					"									<td style=\"padding-left: 5px\"><img\r\n" + 
					"										src=\"http://static.naver.com/common/ems/nid_dm/nid_201412.gif\"\r\n" + 
					"										alt=\"회원정보\" width=\"42\"></td>\r\n" + 
					"								</tr>\r\n" + 
					"							</tbody>\r\n" + 
					"						</table>\r\n" + 
					"					</td>\r\n" + 
					"				</tr>\r\n" + 
					"				<tr>\r\n" + 
					"					<td height=\"13\"></td>\r\n" + 
					"				</tr>\r\n" + 
					"				<tr>\r\n" + 
					"					<td\r\n" + 
					"						style=\"padding-right: 27px; padding-left: 18px; line-height: 34px; font-size: 29px; color: #424240; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"						새로운 비밀번호를<br>\r\n" + 
					"					<span style=\"color: #1ec800\">설정하시겠습니까?</span>\r\n" + 
					"					</td>\r\n" + 
					"				</tr>\r\n" + 
					"				<tr>\r\n" + 
					"					<td height=\"22\"></td>\r\n" + 
					"				</tr>\r\n" + 
					"				<tr>\r\n" + 
					"					<td height=\"1\" style=\"background-color: #e5e5e5;\"></td>\r\n" + 
					"				</tr>\r\n" + 
					"				<!-- //Header -->\r\n" + 
					"				<tr>\r\n" + 
					"					<td\r\n" + 
					"						style=\"padding-top: 24px; padding-right: 27px; padding-bottom: 32px; padding-left: 20px\">\r\n" + 
					"						<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
					"							width=\"100%\"\r\n" + 
					"							style=\"font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"							<tbody>\r\n" + 
					"								<tr>\r\n" + 
					"									<td height=\"6\"></td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr style=\"display: none;\">\r\n" + 
					"									<td\r\n" + 
					"										style=\"padding: 9px 15px 10px; background-color: #f4f4f4; font-size: 14px; color: #000; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"										이 메일은 아띠(rlgh****)의 비상 연락처에 등록된 메일 주소로 발송되었습니다. 본인의 네이버 계정이\r\n" + 
					"										아니라면 <a href=\"#\" target=\"_blank\"\r\n" + 
					"										style=\"color: #009e25; text-decoration: underline\"\r\n" + 
					"										rel=\"noreferrer noopener\"><span style=\"color: #009E25\">여기에서\r\n" + 
					"												수정</span></a>하세요. 해당 페이지는 <strong>별도의 로그인을 요구하지 않습니다. 또한 주소창에\r\n" + 
					"											[NAVER Corp.]와 자물쇠 마크</strong>가 있으니 꼭 확인하세요.\r\n" + 
					"									</td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr style=\"display: none;\">\r\n" + 
					"									<td height=\"24\"></td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td\r\n" + 
					"										style=\"font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"										회원님의 아이디 <span style=\"color: #009E25\">" + email +"</span><strong>로\r\n" + 
					"											비밀번호 요청이 수신되었습니다.</strong><br> 아래의 로그인이 회원님의 활동이 맞는지 확인해주세요.<br>\r\n" + 
					"										회원님의 활동이 아니라면, 관리자에게 문의해 주시기 바랍니다.\r\n" + 
					"									</td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td height=\"24\"></td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td\r\n" + 
					"										style=\"font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"										<table cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
					"											style=\"width: 100%; margin: 0; padding: 0\">\r\n" + 
					"											<tbody>\r\n" + 
					"												<tr>\r\n" + 
					"													<td height=\"23\"\r\n" + 
					"														style=\"font-weight: bold; color: #000; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"														로그인 정보</td>\r\n" + 
					"												</tr>\r\n" + 
					"												<tr>\r\n" + 
					"													<td height=\"2\" style=\"background: #424240\"></td>\r\n" + 
					"												</tr>\r\n" + 
					"												<tr>\r\n" + 
					"													<td height=\"20\"></td>\r\n" + 
					"												</tr>\r\n" + 
					"												<tr>\r\n" + 
					"													<td>\r\n" + 
					"														<table cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
					"															style=\"width: 100%; margin: 0; padding: 0\">\r\n" + 
					"															<tbody>\r\n" + 
					"																<tr>\r\n" + 
					"																	<td width=\"110\"\r\n" + 
					"																		style=\"padding-bottom: 5px; color: #696969; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"																		시간</td>\r\n" + 
					"																	<td\r\n" + 
					"																		style=\"padding-bottom: 5px; color: #000; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"																		" + currentStr + "</td>\r\n" + 
					"																</tr>\r\n" + 
					"																<tr>\r\n" + 
					"																	<td width=\"110\"\r\n" + 
					"																		style=\"padding-bottom: 5px; color: #696969; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"																		위치</td>\r\n" + 
					"																	<td\r\n" + 
					"																		style=\"padding-bottom: 5px;; color: #000; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"																		대한민국 (211.251.220.133)</td>\r\n" + 
					"																</tr>\r\n" + 
					"																<tr>\r\n" + 
					"																	<td width=\"110\"\r\n" + 
					"																		style=\"padding-bottom: 5px; color: #696969; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"																		기기</td>\r\n" + 
					"																	<td\r\n" + 
					"																		style=\"padding-bottom: 5px;; color: #000; line-height: 23px; vertical-align: top; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"																		웹브라우저</td>\r\n" + 
					"																</tr>\r\n" + 
					"															</tbody>\r\n" + 
					"														</table>\r\n" + 
					"													</td>\r\n" + 
					"												</tr>\r\n" + 
					"												<tr>\r\n" + 
					"													<td height=\"20\"></td>\r\n" + 
					"												</tr>\r\n" + 
					"												<tr>\r\n" + 
					"													<td height=\"1\" style=\"background: #d5d5d5\"></td>\r\n" + 
					"												</tr>\r\n" + 
					"											</tbody>\r\n" + 
					"										</table>\r\n" + 
					"									</td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td height=\"24\"></td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td\r\n" + 
					"										style=\"font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"										<strong>회원님이 비밀번호를 요청하셨나요?<br> 새로운 비밀번호를 설정하시려면\r\n" + 
					"											[비밀번호 설정]을 눌러주세요.\r\n" + 
					"									</strong>\r\n" + 
					"									</td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td\r\n" + 
					"										style=\"height: 34px; font-size: 14px; color: #696969; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"										<a\r\n" + 
					"										href=\"http://localhost:8080/insomnia/find/findId.ins?q=link&emailt=" + email +"\"\r\n" + 
					"										style=\"display: inline-block; padding: 10px 10px 10px; margin-top: 10px; background-color: #08a600; color: #fff; text-align: center; text-decoration: none;\"\r\n" + 
					"										target=\"_blank\" rel=\"noreferrer noopener\">비밀번호 설정</a> <a\r\n" + 
					"										href=\"https://localhost:8080/insomnia/home.ins\"\r\n" + 
					"										style=\"display: inline-block; padding: 10px 10px 10px; margin-top: 10px; background-color: #8e8e8e; color: #fff; text-align: center; text-decoration: none;\"\r\n" + 
					"										target=\"_blank\" rel=\"noreferrer noopener\">관리자 문의</a>\r\n" + 
					"									</td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td height=\"24\"></td>\r\n" + 
					"								</tr>\r\n" + 
					"								<tr>\r\n" + 
					"									<td\r\n" + 
					"										style=\"font-size: 14px; color: #696969; line-height: 24px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;\">\r\n" + 
					"										보다 자세한 내용은 아이디 도용에 대한 <a href=\"http://naver.me/GsdVn7dq\"\r\n" + 
					"										target=\"_blank\"\r\n" + 
					"										style=\"text-decoration: underline; color: #009e25\"\r\n" + 
					"										rel=\"noreferrer noopener\">도움말</a>을 확인 해주시기 바랍니다.<br> 더욱\r\n" + 
					"										편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.\r\n" + 
					"									</td>\r\n" + 
					"								</tr>\r\n" + 
					"							</tbody>\r\n" + 
					"						</table>\r\n" + 
					"					</td>\r\n" + 
					"				</tr>\r\n" + 
					"				<!-- footer -->\r\n" + 
					"				<tr>\r\n" + 
					"					<td\r\n" + 
					"						style=\"padding-top: 26px; padding-left: 21px; padding-right: 21px; padding-bottom: 13px; background: #f9f9f9; font-size: 12px; font-family: '나눔고딕', NanumGothic, '맑은고딕', Malgun Gothic, '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif; color: #696969; line-height: 17px\">\r\n" + 
					"						본 메일은 발신전용 입니다. INSOMNIA 서비스관련 궁금하신 사항은 INSOMNIA <a\r\n" + 
					"						href=\"https://help.naver.com/support/alias/membership/p.membership/p.membership_26.naver\"\r\n" + 
					"						style=\"color: #696969; font-weight: bold; text-decoration: underline\"\r\n" + 
					"						rel=\"noreferrer noopener\" target=\"_blank\">고객센터</a>에 문의하세요.\r\n" + 
					"					</td>\r\n" + 
					"				</tr>\r\n" + 
					"				<tr>\r\n" + 
					"					<td\r\n" + 
					"						style=\"padding-left: 21px; padding-right: 21px; padding-bottom: 57px; background: #f9f9f9; font-size: 12px; font-family: Helvetica; color: #696969; line-height: 17px\">\r\n" + 
					"						Copyright ⓒ <strong>INSOMNIA</strong> Corp. All Rights Reserved.\r\n" + 
					"					</td>\r\n" + 
					"				</tr>\r\n" + 
					"				<!-- //footer -->\r\n" + 
					"			</tbody>\r\n" + 
					"		</table>\r\n" + 
					"	</div>";
		
			//여기까지
			sendMail.setText(message);
			sendMail.setFrom("admin@insomnia.com", "INSOMNIA 개인정보 관리 담당자");
			sendMail.setTo(email);
			sendMail.send();
			
			// model.addAttribute("mailSucFail", "yes");
			return "sendSuccess";
			
				
		} catch (MessagingException | UnsupportedEncodingException e) {
			// model.addAttribute("mailSucFail", "no");
			e.printStackTrace();
			
			return "sendFail";
		}
		
		//return "home.tiles";
	}
	
	/////비밀번호 새로 설정하는 링크 
	@RequestMapping("/find/newPassword.ins")
	public String insertNewPassword(@RequestParam Map map, HttpSession session, Map dismap, Model model) throws Exception {
		
		
		dismap.put("thisEmail", map.get("thisEmail"));
		System.out.println("비밀번호 새로 설정시 이메일은? " + map.get("thisEmail"));
		dismap.put("password", map.get("insertPass").toString());
		
		MemberDTO record = memberService.getIdByEmail(dismap);
		dismap.put("id", record.getId());
		
		System.out.println("그래서 아이디는? " + record.getId());
		memberService.changePassword(dismap);
		
		return "forward:/home.ins";
	}
	
	
	/*@RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code) throws Exception {
 
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
            System.out.println("Redirect URI : " + redirectUri);
            System.out.println("Code : " + code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
                //logger.info("accessToken is expired. refresh token = {}", accessToken);
            };
            
        
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            
            try
 
            {            
                String [] fields = { "id", "email",  "name"};
                User userProfile = facebook.fetchObject("me", User.class, fields);
                System.out.println("유저이메일 : " + userProfile.getEmail());
                System.out.println("유저 id : " + userProfile.getId());
                System.out.println("유저 name : " + userProfile.getName());
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
                System.out.println("오류다.오류다.");
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "home.tiles";
 
    }*/
	
	///좋아요, 팔로우
	@ResponseBody
	@RequestMapping("/band/like.ins") 
	public String like(@RequestParam Map map, Map dismap, HttpSession session) throws Exception {
		
		System.out.println("좋아요/팔로우 들어오는지");
		
		dismap.put("id", session.getAttribute("id"));
		dismap.put("b_no", map.get("b_no"));
		dismap.put("choice", map.get("choice"));
		
		boolean flag = bandService.distinguishLike(dismap) >= 1 ? false : true;  //1보다 크거나 같다면
		
		System.out.println("플래그는? "  + flag);
		if(flag) {
			int like = bandService.like_follow_insert(dismap);
			System.out.println("성공했으면 insert " + like);
		} else {
			int delete = bandService.like_follow_delete(dismap);  //팝업으로 띄워? 토스트 같은 거 있으면 좋은데.
			System.out.println("실패했으면 delete " + delete);
		}
		
		System.out.println("밴드의 좋아요 팔로우 개수는 몇갠지" + bandService.getBandLikeNFollow(dismap));
		
		return String.valueOf(bandService.getBandLikeNFollow(dismap));
	}
	
	
	//////FCM 푸시 위한 컨트롤러
	@RequestMapping("/fcm/pushToPhone.ins")
	public String fcmPush(HttpServletRequest request) throws Exception {
		
		//token값저장용
	    ArrayList<String> token = new ArrayList<String>();  
		
		 
	    //Firebase Console->프로젝트 선택->설정->프로젝트 설정
	    //->클라우드 메시징->서버키 복사
	    String simpleApiKey = "AAAAN4iICA8:APA91bH1lAxyS2mrQNk_1erIDf5Ee9zjmiDnDuztaWnstPgsoRf1tS6-SqIGHSHT73gK-SyBf5X0TjX5aCa9DZ0LzTrQGVcKdplg5fT1yltn3Wcdz0wkuRDgn9rVu4VK9UrE72H85oJ6";
	    //String gcmURL = "https://android.googleapis.com/fcm/send";    
	    String gcmURL ="https://fcm.googleapis.com/fcm/send";
	    java.sql.Connection conn = null; 
	    PreparedStatement psmt = null; 
	    ResultSet rs = null;
	    
	    String message = request.getParameter("message");
	    String title = request.getParameter("title");;
	    int successTokens=0;
	    try {
	    	Class.forName("oracle.jdbc.OracleDriver");
	       
	        conn = DriverManager.getConnection("jdbc:oracle:thin:@orcl.c3yirc2i0ocz.ap-northeast-2.rds.amazonaws.com:1521:orcl","project","12341234");
	        System.out.println("conn의 값은?" + conn);////////
	        psmt= conn.prepareStatement("SELECT TOKEN FROM FCM_TOKENS");
	        rs = psmt.executeQuery();       
	       
	        while(rs.next()){
	            token.add(rs.getString(1));
	        }
	        conn.close();     
	      
	        Sender sender = new Sender(simpleApiKey);
	        Message msg = new Message.Builder()        
	        .addData("message",message)//데이타 메시지
	        .addData("title",title)//데이타 타이틀
	        .build();
	        System.out.println("메세지는? " + message);
	        System.out.println("타이틀은? " + title);
	        System.out.println("msg객체는? " + msg);
	        
	        //등록된 모든 토큰에 푸쉬 메시지 전송.
	        MulticastResult multicast = sender.send(msg,token,3);//3는 메시지 전송실패시 재시도 횟수
	        
	        System.out.println("multicast 값까지 오나? " + multicast);
	        //푸쉬 결과  
	        
	        if (multicast != null) {
	            List<Result> resultList = multicast.getResults();
	            
	            
	            for (Result result : resultList) {
	            	if(result.getMessageId()!=null) successTokens++;   
	            	
	                System.out.println("메시지 아이디:"+result.getMessageId());
	                
	            }
	            System.out.println(successTokens+"개의 기기에 전송되었어요...");
	        }
	       

	    }catch (Exception e) {
	        e.printStackTrace();
	    }
	    

		/*<script>
			alert("<%=successTokens%>개의 기기에 메시지가 전송되었어요...");
			//location.href="PushMessageSend.jsp";
			location.href="<c:url value='/main/bandSubmit.ins'/>";
		</script>*/
		
		
		
		return "forward:/band/bandInfo.ins";
	}
	
	/////개인정보 수정/
	@RequestMapping("/menu/memberEditEmail.ins")
	public String memberEditEmail(@RequestParam Map map, Map dismap, Model model, HttpSession session) throws Exception {
		
		dismap.put("id", session.getAttribute("id"));
		dismap.put("email", map.get("email"));
		memberService.editEmail(dismap);
		
		return "forward:/menu/mypage/edit.ins";
	}
	
	@RequestMapping("/menu/memberEditPhone.ins")
	public String memberEditPhone(@RequestParam Map map, Map dismap, Model model, HttpSession session) throws Exception {
		
		dismap.put("id", session.getAttribute("id"));
		dismap.put("phone", map.get("phone"));
		memberService.editPhone(dismap);
		
		return "forward:/menu/mypage/edit.ins";
		
	}
	
	
	
	
	

}/////////class
