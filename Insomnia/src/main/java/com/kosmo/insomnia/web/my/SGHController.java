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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.RewardDTO;
import com.kosmo.insomnia.serviceimpl.ListServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.serviceimpl.RewardServiceImpl;

@Controller
public class SGHController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="rewardServiceImpl")
	private RewardServiceImpl rewardService;
	
	/////마이페이지 이동
	@RequestMapping("/menu/mypage.ins")
	public String mypage(HttpSession session, Map map, Model model) throws Exception {
		
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
		
		
		return "my/MyPage2.tiles";
	}
	
	@RequestMapping("/menu/mypage/edit.ins")
	public String mypage_edit() throws Exception {
		
		return "my/MemberEdit.tiles";
	}
	
	
	//소셜 로그인
	@RequestMapping("/login/social.ins")
	public String socialLogin(@RequestParam Map map,  HttpSession session, Model model) throws Exception {
		
		//공급자가 제공한 소셜 아이디 얻기
		String socialId = map.get("socialId").toString();
		
		if(memberService.isSocialMember(map)) {  // 계정 있을시 로그인
			
			//로그인 처리
			session.setAttribute("id", socialId);
			
			/*
			//현재 로그인한 사용자의 정보 가져오는 dao 메서드, 한결님 메서드 사용 예정
			MemberDTO record = memberService.selectOne(map);
			model.addAttribute("socialName", record.getName());
			model.addAttribute("socialProfile", map.get("socialProfile").toString());  //사진은 매번 새로
			model.addAttribute("socialEmail", record.getEmail());
			
			String birthday = record.getBirthDay();
			String[] birthArr = birthday.split("/");
			birthday = String.format("20%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);
			
			model.addAttribute("socialBirth", birthday);
			*/
			
			return "home.tiles";
		} else {   					 	 //최초 접속시 회원가입 처리
			return "forward:/register/social.ins";
		}
		
	}/////socialLogin()
	
	
	//소셜 회원가입
	@RequestMapping("/register/social.ins")
	public String socialRegister(@RequestParam Map map, Model model, HttpSession session) throws Exception {
		
		///현재 사용자의 SNS계정 정보 가져오기
		String socialId = map.get("socialId").toString();
		String socialName = map.get("socialName").toString();
		String socialEmail = map.get("socialEmail").toString();
		String socialProfile = map.get("socialProfile").toString();
		String socialBirth = map.get("socialBirth").toString();
		
		System.out.println(socialBirth + " 가 이것!");
		
		//생일 처리
		/*String[] birthArr = socialBirth.split("/");
		socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);*/
		//지정한 월이 부적합합니다. 오류. String타입으로 저장해야 하지만, 뿌려줄 때만 이렇게 바꿔서 뿌려주고 저장할 때는 Date형식으로 저장하자.
		String[] birthArr = socialBirth.split("/");
		String year = birthArr[2].substring(2);
		socialBirth = year + "/" + birthArr[0] + "/" + birthArr[1];
		map.put("socialBirth", socialBirth);
		
		
		//DB에 저장
		boolean isRegistered = memberService.socialRegister(map);
		
		//저장에 성공했다면
		if(isRegistered) {
			
			//로그인 처리
			session.setAttribute("id", socialId);
			//현재 로그인한 사용자의 정보 가져오는 dao 메서드 사용 예정
			
			//회원의 최초 정보 가져오기(DB에서 가져올 수도 있지만 최초 가입이니까 form에서 직접 가져와도 무방하다고 판단)
			model.addAttribute("socialName", socialName);
			model.addAttribute("socialProfile", socialProfile);
			model.addAttribute("socialEmail", socialEmail);
			//출력시 생일 처리 (DB저장된 값과는 다르다)
			socialBirth = String.format("%s년 %s월 %s일", birthArr[2], birthArr[0], birthArr[1]);
			model.addAttribute("socialBirth", socialBirth);
			
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
	public String getHistory(@RequestParam Map map, Map dismap, HttpSession session) throws Exception {
		
		///요청한 유저의 id를 쿼리문으로 전달하기 위해 dismap에 저장
		dismap.put("id", session.getAttribute("id"));
		
		System.out.println("컨트롤러에는 들어오니?");
		
		//펀딩, 좋아요, 제작 목록 중 어떤 요청인지 확인
		
		System.out.println("dismap.get()의 값은?" + dismap.get("id"));
				
		System.out.println("switch에 들어가는 값은 " + map.get("target").toString());
		switch(map.get("target").toString()) {
		
			case "펀딩한" :
				//구한 리스트 - 이걸 쓰면 안 된다.
				List<RewardDTO> records = rewardService.selectList(dismap);
				
				//json을 위해 선언한 리스트
				List<Map> resultList = new Vector<>();
				
				for(RewardDTO dto: records) {
					//맵 생성
					Map tempMap = new HashMap<>();
					tempMap.put("R_no", dto.getR_no());
					tempMap.put("S_no", dto.getS_no());
					tempMap.put("R_Price", dto.getR_Price());
					tempMap.put("R_Name", dto.getR_Name());
					tempMap.put("R_Description", dto.getR_Description());
					tempMap.put("B_name", dto.getB_name());
					tempMap.put("BM_name", dto.getBM_name());
					tempMap.put("S_Album_cover", dto.getS_Album_cover());
					resultList.add(tempMap);
				}
				System.out.println("json배열의 값은?" + JSONArray.toJSONString(resultList));
				return JSONArray.toJSONString(resultList);
				
			case "좋아한" :
				
				break;
			case "만든" :
				
				break;
			
		}
		
		return "";
	}
	
	
	
	

}/////////class
