package com.kosmo.insomnia.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.google.android.gcm.server.MulticastResult;
import com.kosmo.insomnia.common.CategoryUtil;
import com.kosmo.insomnia.common.DTOUtil;
import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandImgDTO;
import com.kosmo.insomnia.service.BandMemberDTO;
import com.kosmo.insomnia.service.BandMusicDTO;
import com.kosmo.insomnia.service.BandSubmitDTO;
import com.kosmo.insomnia.service.BandSubmitWaitingDTO;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.SeqDTO;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.web.my.FileUpDownUtils;

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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

@Controller
public class BandController {
	
	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="/band/bandInfo.ins")
	public String goToBandInfoPage(@RequestParam Map params, HttpSession session, Map dismap, Model model, ServletRequest request) {
		String b_no = null;
		//createNewBand를 통해 넘어왔을 경우에 밴드 생성해서 등록
		if(params != null && params.get("select_category") != null && params.get("band_name") != null) {
			//CRUD될 밴드의 currval값을 가져온다.
			SeqDTO seqDto = new SeqDTO();
			bandService.getSeq_band(seqDto);
			b_no = String.valueOf(seqDto.getId());
			
			//멤버들 분리
			String[] bandMemberArr = params.get("bandMembers").toString().split(" ");
			String b_name = params.get("band_name").toString();
			
			//밴드 등록
			//등록전에 파일 이름 바꿔주기
			String fileName = params.get("coverName").toString();
			String extension = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = b_no + extension;
			params.put("coverName", newFileName);
			bandService.addNewBand(params);
			//bandMember 등록
			for(String bandMember : bandMemberArr) {
				Map<String, String> oneMap = new HashMap<String, String>();
				oneMap.put("id", bandMember);
				oneMap.put("b_name", b_name);
				bandService.addNewBandMember(oneMap);
			}//bandMember
			
			//파일 이름 b_no으로 바꾸기
				String path = session.getServletContext().getRealPath("/upload/band/cover");
				
				File oldFile = new File(path, newFileName);
				if(oldFile.exists()) {
					oldFile.delete();
				}//파일 이름이 겹치는게 있으면 미리 삭제
				File file = new File(path, fileName);
				file.renameTo(new File(path, newFileName));
		}//밴드 생성if
		
		
		///결과 b_name
		String b_name = null;
		b_no = null;
		//결과들을 조합할 플래그 선언
		boolean isBandMember = false; //밴드 등록을 안 한 상태의 flag로 초기화
		boolean isSame = false;  //조회하는 밴드와 해당 아이디가 다른 flag로 초기화
		
		//1] 해당 아이디가 밴드 등록을 했는지 여부 검사
		String id = session.getAttribute("id").toString();
		List<BandMemberDTO> bandMemberList = bandService.isMemberBand(id);
		//해당 아이디의 밴드 이름을 얻어온다.
		String id_b_name = null;
		
		if(bandMemberList.size() != 0) {
			for(BandMemberDTO dto : bandMemberList)
				id_b_name = dto.getB_name();
			isBandMember = true;}
		//해당 아이디가 밴드 등록을 하지 않은 경우
		
		//2] 조회하는 밴드의 b_no를 얻어온다.
		///만약 밴드관리:내 밴드 로 접근했을 경우 b_no는 null / funding에서 진행했을 경우 b_no는 파라미터값을 가져온다.
		b_no = request.getParameter("b_no") == null? null : request.getParameter("b_no").toString();
		if(b_no == null) 
			isSame = true;
		
		//3] isBandMember, isSame을 조합하여 케이스를 만든다.
		//case 1 - 조회하는 아이디가 밴드등록을 하지 않았을 때 자신의 밴드관리에 들어갈 때
		if(isBandMember == false && isSame == true) {
			model.addAttribute("isBandMember", "F");
			model.addAttribute("thirdLook", "F");
			return "main/bandInfo.tiles";}
		//case 2 - 조회하는 아이디가 밴드등록을 한 상태로 자신의 밴드관리에 들어갈 때
		else if(isBandMember == true && isSame == true) {
			model.addAttribute("isBandMember", "T");
			model.addAttribute("thirdLook", "F");
			b_name = id_b_name;}
		//case 3 - 조회하는 아이디가 밴드 등록을 하지 않았을 때 다른 밴드정보에 접근한 경우
		//case 4 - 조회하는 아이디가 밴드 등록을 했을 때 다른 밴드정보에 접근한 경우
		else if(isSame == false) {
			model.addAttribute("isBandMember", "T");
			model.addAttribute("thirdLook", "T");
			BandDTO paramBandDTO = bandService.getBandDTOByB_no(b_no);
			b_name = paramBandDTO.getB_name();}
		
		//b_name만 설정해놓으면 알아서 간다.
		//model 객체를 통해서 값 bandInfo에 필요한 값 넘겨주기
		//band객체를 얻어온다. b_name로 검색
		BandDTO record = bandService.getBandDTOByB_name(b_name);
		record.setB_album_cover(record.getB_album_cover() == null ? "default_band_profile_img.jpg" : record.getB_album_cover().toString());
		model.addAttribute("record", record);

		session.setAttribute("b_no", record.getB_no());
		session.setAttribute("b_name", b_name);
		
		dismap.put("b_no", record.getB_no());
		
		//PlayList 목록 Map에 넣어 반환
		//PlayList 얻어오기
		List<BandMusicDTO> playList = bandService.getPlayList(record.getB_no());
		//등록된 PlayList가 없으면 isExist "F"넣고 반환
		if(playList.size() == 0) {
			BandMusicDTO tempDto = new BandMusicDTO();
			tempDto.setIsExist("F");
			playList.add(tempDto);
		}//if
		else { //있으면 playList의 ct_name, ct_name_css를 구한다.
			playList = CategoryUtil.convertListCt_noToListCt_name(playList);
			//인덱스를 넣는다.
			playList = DTOUtil.addIndexToBandMusicDTO(playList);
		}
		//있으면 모델객체에 넣어 반환한다.
		model.addAttribute("playList", playList);
		
		
		//BandSubmitWaiting이 있으면 dto를 반환한다.
		//세션에서 b_no얻어오기 
		b_no = session.getAttribute("b_no").toString();
		List<BandSubmitWaitingDTO> waiting = bandService.getBandSubmitWaitingDTO(b_no);
		//b_name 추가  //category 추가
		for(BandSubmitWaitingDTO dto : waiting) {
			dto.setB_name(b_name);
			CategoryUtil.setCt_noInBandSubmitWaitingDTO(dto, record.getCt_no().toString());
			//bandsubmitWaiting이 complete된 상태라면 진짜 funding 페이지를 보여준다.
			BandSubmitDTO bandsubmitDto = bandService.getBandSubmitDTO(dto.getSw_no());
			if(bandsubmitDto != null) {
				dto.setS_no(bandsubmitDto.getS_no());
				dto.setS_goal_price(bandsubmitDto.getS_goal_price());
				dto.setS_goal_accumulation(bandsubmitDto.getS_goal_accumulation());
				dto.setS_goal_deadline(bandsubmitDto.getS_goal_deadline());
				dto.setS_liked(bandsubmitDto.getS_liked());
				dto.setComma_Accumulation(String.format("%,d", Integer.parseInt(dto.getS_goal_accumulation())));
			}///if
		}//for
		
		dismap.put("choice", "like"); //
		int like = bandService.getBandLikeNFollow(dismap);
		dismap.put("choice", "follow");
		int follow = bandService.getBandLikeNFollow(dismap);
		
		model.addAttribute("like", like);
		model.addAttribute("follow", follow);
		
		model.addAttribute("waiting", waiting);
		
		/////////////////////////////서기환 추가  5월 14일
		if(params.get("fcm") != null) {
		//token값저장용
		ArrayList<String> token = new ArrayList<String>();  
		
		
		//Firebase Console->프로젝트 선택->설정->프로젝트 설정
		//->클라우드 메시징->서버키 복사
		String simpleApiKey = "AAAAdxhW5go:APA91bEOM7vrXSiQusce7meRsZNwU_2ZRBXjT1WF_dW1EjMrh-k2BlAzzx61OWg_0JxhMBltse2Ps40pJJobsLCWAw8z2BkU85h7V_NTqNHQQ2oX40dPW0p5tveRAX3h7TMXM5KzvH8M";
		//String gcmURL = "https://android.googleapis.com/fcm/send";    
		String gcmURL ="https://fcm.googleapis.com/fcm/send";
		Connection conn = null; 
		PreparedStatement psmt = null; 
		ResultSet rs = null;
		
		//String message = request.getParameter("message");
		String b_description = params.get("b_description").toString();
		System.out.println("밴드인포컨트롤러의 b_description" + b_description);
		//String title = request.getParameter("title");
		String b_banner_description = params.get("b_banner_description").toString();
		System.out.println("밴드인포컨트롤러의 b_banner_description" + b_banner_description);
		
		String title = b_description;
		String message = "";
		
		dismap.put("id", session.getAttribute("id"));
		message += memberService.selectOne(dismap).getName() + "님의 펀딩이 신청되었습니다.<br>신청 내용이 아래와 동일한지 확인하세요.";
		message += "<b>" + b_banner_description + "</b>";
		
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
		System.out.println("msg에 addData 후 메세지는? " + message);
		System.out.println("msg에 addData 후 타이틀은? " + title);
		System.out.println("msg에 addData 후 msg객체는? " + msg);
		
		System.out.println("==========문제적인 부분=========");
		System.out.println("token의 값은? : " + token);
		System.out.println("sender의 값은? : " + sender);
		System.out.println("msg의 값은? : " + msg);
		System.out.println("token의 값은? : " + token);
		
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
		}
		//////FCM 끝 : 서기환, 5월 14일//////
		
		////슬라이드 메뉴 위한 부분
		
		dismap.put("id", session.getAttribute("id"));
		MemberDTO loginRecord = memberService.selectOne(dismap);
		
		if(loginRecord != null) {
			model.addAttribute("loginRecord", loginRecord);
			//record.setProfile_img(record.getProfile_img());		
			//model.addAttribute("record", record);	
		}	
		
		////슬라이드메뉴
		
		
		
		return "main/bandInfo.tiles";
	}///geToBandInfoPage
	
	

	
	@RequestMapping("/band/createNewBand.ins")
	public String goToCreateNewBand(HttpSession session, Map dismap, Model model) {
		session.setAttribute("id", session.getAttribute("id"));
		
		////슬라이드 메뉴 위한 부분
		
			dismap.put("id", session.getAttribute("id"));
			MemberDTO loginRecord = memberService.selectOne(dismap);
			
			if(loginRecord != null) {
				model.addAttribute("loginRecord", loginRecord);
				//record.setProfile_img(record.getProfile_img());		
				//model.addAttribute("record", record);	
			}	
			
			////슬라이드메뉴

			////2019 05 17 임한결 추가 프로필 이미지 받아와서 넘기기
			String id = session.getAttribute("id").toString();
			String profile = bandService.getMemberProfile(id);
			
			//case 1 : s3에 등록된 기본 이미지일 경우
			if(profile.equals("default_cover_img.jpg")) {
				profile="https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/default_cover_img.jpg";}
			//case 2 : 소셜로그인으로 가져온 프로필 이미지일 겨웅
			else if(profile.startsWith("http")) {}///
			//case 3 : s3에 개인이 등록된 이미지일 경우
			else {
				profile = "https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/"+profile;}
			//모델에 값 넣고 리턴하기
			model.addAttribute("profile", profile);
			////2019 05 17 임한결 추가 프로필 이미지 받아와서 넘기기 끝
	
		return "main/createNewBand.tiles";
	}///goToCreateNewBand
	
	
	@ResponseBody
	@RequestMapping("/band/uploadCover.ins")
	public String setProfileImg(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest) throws Exception {
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/band/cover");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_cover");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		File file = new File(physicalPath + File.separator + newFileName);
		
		upload.transferTo(file);
		
		return newFileName;
	}//uploadCover
	
	@ResponseBody
	@RequestMapping(value = "/band/isExistBand.ins", produces="text/html; charset=UTF-8")
	public String isExistBand(@RequestParam Map map) throws Exception{
		if(bandService.isExistBand(map.get("bandName").toString())) {
			return "T";
		};
		return "F"; 
	}//isExistBand()
	
	
	///밴드를 만들때 회원을 찾아 같은 밴드에 등록하는 메서드
	@ResponseBody
	@RequestMapping(value="/band/searchMember.ins", produces="text/html; charset=UTF-8")
	public String searchMember(@RequestParam Map map, HttpSession session) throws Exception{
		//아이디 받아오기 - 아이디가 있으면 프로필 사진 이름 반환
		//case1 : s3서버에 등록된 프로필 사진일 경우
				//https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/default_cover_img.jpg
		String oneMemberProfileName = bandService.getMemberProfile(map.get("searchId").toString());
		if(oneMemberProfileName.equals("default_cover_img.jpg")) {
			oneMemberProfileName = "https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/default_cover_img.jpg";
		}//default_cover_img;
		else if(oneMemberProfileName.startsWith("http")) {
		}///소셜 로그인으로 프로필 이미지를 가져올 경우
		else {
			oneMemberProfileName = "https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/"+oneMemberProfileName;
			System.out.println("onMemberProfileName result : " + oneMemberProfileName);
		}/// s3에 기본프로필 사진이 아닌 개인이 등록한 사진일 경우
		
		
		//담는 그릇 생성
		List<Map<String, String>> record = new Vector<Map<String, String>>();
		Map<String, String> oneMap = new HashMap<String, String>();
		
		//검색한 아이디가 멤버인지 판단
		if(!bandService.isMember(map.get("searchId").toString())) {
			return "occur 500error";
		}//if
		
		//아이디, 프로필 사진 이름 넣고 리턴 
		oneMap.put("id", map.get("searchId").toString());//Map에 담고 리턴
		oneMap.put("profile", oneMemberProfileName);
		record.add(oneMap);
		return JSONArray.toJSONString(record); 
	}///search Member
	
	
	
	@ResponseBody
	@RequestMapping(value="/band/uploadBandImageInBandInfo.ins", produces="text/html; charset=UTF-8")
	public String addBandImage(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest, HttpSession session) throws Exception{
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/band/img");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_band_img");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		//파일 이름 설정 : BandImg : b_no_index.extension : ex) 2_3.jpg
		String b_no = (String)session.getAttribute("b_no");
		//뒤에 붙을 인덱스 값 얻어오기 / +1 이 다음에 붙을 인덱스값
		int currentInt = bandService.getTotalBandImg(b_no);
		int nextIndex = currentInt + 1;
		newFileName = b_no + "_" + nextIndex + newFileName.substring(newFileName.lastIndexOf("."));
		File file = new File(physicalPath + File.separator + newFileName);
		upload.transferTo(file);
		
		//데이터베이스에 입력
		//맵을 만들어서 넘겨주자
		Map dto = new HashMap<String, String>();
		dto.put("b_no", b_no);
		dto.put("newFileName", newFileName);
		
		bandService.addBandImg(dto);
		
		return newFileName;
	}///addBandImage
	
	/*
	 * <option value="folk-pop">포크·팝</option>
									              <option value="jazz-classic">재즈·클래식</option>
									              <option value="hiphop">힙합</option>
									              <option value="dance-electronic">댄스·일렉트로닉</option>
									              <option value="rock-metal">락·메탈</option>
									              <option value="traditional">국악</option>
	 * 
	 */
	
	@ResponseBody
	@RequestMapping(value="/band/uploadBandMusicInBandInfo.ins", produces="text/html; charset=UTF-8")
	public String addBandMusic(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest, HttpSession session) throws Exception{

		//파일 객체 얻어오기
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/band/music");
		MultipartFile upload = multipartRequest.getFile("upload_band_music");
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		String b_no = (String)session.getAttribute("b_no");
		
		//뒤에 붙을 인덱스 값 얻어오기 / +1 이 다음에 붙을 인덱스값 / 파일 이름 재설정
		int nextIndex = bandService.getTotalBandMusic(b_no) + 1;
		newFileName = b_no + "_" + nextIndex + newFileName.substring(newFileName.lastIndexOf("."));
		File file = new File(physicalPath + File.separator + newFileName);
		
		//파일 업로드 완료
		upload.transferTo(file);
		
		//데이터베이스에 입력
		BandMusicDTO dto = new BandMusicDTO();
		dto.setBm_name(map.get("title").toString());
		dto.setBm_description(map.get("upload_band_music_description").toString());
		dto.setCt_name_css(map.get("select_category").toString());
		dto.setB_no(b_no);
		dto.setBm_liked("0");
		dto.setBm_filename(newFileName);
		//ct_no로 변환해서 저장
		dto = CategoryUtil.convertCt_name_cssToCt_no(dto);
		bandService.addBandMusic(dto);
		
		List<Map<String, String>> musicInfo = new Vector<Map<String, String>>();
		Map<String, String> info = new HashMap<String, String>();
		info.put("title", newFileName);
		info.put("category", map.get("select_category").toString());
		musicInfo.add(info);
		
		return JSONArray.toJSONString(musicInfo);
	}///addBandImage
	
	
	
	@ResponseBody
	@RequestMapping(value="/band/getBandSubmitWaitingList.ins", produces="text/html; charset=UTF-8")
	public String getBandSubmitList(@RequestParam Map params) throws Exception{
		String b_no = params.get("b_no").toString();
		List<BandSubmitWaitingDTO> BSWList = bandService.getBandSubmitWaitingDTO(b_no);
		List<Map<String, String>> resultArray = new Vector<Map<String, String>>();
		if(BSWList.size() == 0 || BSWList == null) { //펀딩 대기중인 내역이 없을때
			BandSubmitWaitingDTO dto = new BandSubmitWaitingDTO();
			dto.setIsExist("F");
			resultArray.add(DTOUtil.convertDTOToMap(dto));
			return JSONArray.toJSONString(resultArray);
		}///if
		
		//펀딩 대기중인 내역이 있을 경우
		return "";
	}///getBansSubmitList
	
	
	
	@ResponseBody
	@RequestMapping(value="/band/getBandImgList.ins", produces="text/html; charset=UTF-8")
	public String getBandImgList(@RequestParam Map params, HttpSession session) throws Exception{
		String b_no = params.get("b_no").toString();
		List<BandImgDTO> BIList = bandService.getBandImgDTO(b_no);
		//결과가 담길 맵형 리스트
		List<Map<String, String>> resultArray = new Vector<Map<String, String>>();
		if(BIList.size() == 0 || BIList == null) { //등록한 이미지가 없을때
			BandImgDTO dto = new BandImgDTO();
			dto.setIsExist("F");
			resultArray.add(DTOUtil.convertDTOToMap(dto));
			return JSONArray.toJSONString(resultArray);
		}//if
		
		//등록한 이미지가 있을때
		// DTO형 리스트에서 맵형리스트로 변환
		for(Object obj : BIList) {
			resultArray.add(DTOUtil.convertDTOToMap(obj));
		}///for
		
		//제이선 객체로 반환한다.
		return JSONArray.toJSONString(resultArray);
	}//getBandImgList
	
}//class




























