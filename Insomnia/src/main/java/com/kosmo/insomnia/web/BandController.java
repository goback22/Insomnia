package com.kosmo.insomnia.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kosmo.insomnia.common.CategoryUtil;
import com.kosmo.insomnia.common.DTOUtil;
import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandImgDTO;
import com.kosmo.insomnia.service.BandMemberDTO;
import com.kosmo.insomnia.service.BandMusicDTO;
import com.kosmo.insomnia.service.BandSubmitWaitingDTO;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;
import com.kosmo.insomnia.web.my.FileUpDownUtils;

@Controller
public class BandController {
	
	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
	@RequestMapping("/band/bandInfo.ins")
	public String goToBandInfoPage(@RequestParam Map params, HttpSession session, Model model) {
		System.out.println("bandInfo에 넘겨진 파라미터 : " + params.toString());
		//createNewBand를 통해 넘어왔을 경우에 밴드 생성해서 등록
		if(params != null && params.get("select_category") != null && params.get("band_name") != null) {
			//멤버들 분리
			String[] bandMemberArr = params.get("bandMembers").toString().split(" ");
			String b_name = params.get("band_name").toString();
			
			//밴드 등록
			//등록전에 파일 이름 바꿔주기
			String fileName = params.get("coverName").toString();
			String extension = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = b_name + extension;
			params.put("coverName", newFileName);
			bandService.addNewBand(params);
			//bandMember 등록
			for(String bandMember : bandMemberArr) {
				Map<String, String> oneMap = new HashMap<String, String>();
				oneMap.put("id", bandMember);
				oneMap.put("b_name", b_name);
				bandService.addNewBandMember(oneMap);
			}//bandMember
			
			//파일 이름 b_name으로 바꾸기
				String path = session.getServletContext().getRealPath("/upload/band/cover");
				
				File oldFile = new File(path, newFileName);
				if(oldFile.exists()) {
					oldFile.delete();
				}//파일 이름이 겹치는게 있으면 미리 삭제
				File file = new File(path, fileName);
				file.renameTo(new File(path, newFileName));
		}//밴드 생성if
		
		
		//세션에서 아이디 얻어온다.
		String id = session.getAttribute("id").toString();
		// 아이디가 BandMember 테이블에 있는 지 확인 있으면 List<String>반환
		List<BandMemberDTO> bandMemberList = bandService.isMemberBand(id);
		System.out.println(bandMemberList.toString());
		if(bandMemberList.size() == 0) { //소속된 밴드가 없을 경우
			model.addAttribute("isBandMember", false);
			return "main/bandInfo.tiles";
		}else { 						 //소속된 밴드가 있을 경우
			model.addAttribute("isBandMember", true);
		}
		String b_name = bandMemberList.get(0).getB_name().toString();
		//model 객체를 통해서 값 bandInfo에 필요한 값 넘겨주기
		//band객체를 얻어온다. b_name로 검색
		BandDTO record = bandService.getBandDTOByB_name(b_name);
		record.setB_album_cover(record.getB_album_cover() == null ? "default_band_profile_img.jpg" : record.getB_album_cover().toString());
		model.addAttribute("record", record);
		
		//session 설정
		//session에 b_no 넣어두기
		BandDTO bandDto = bandService.getBandDTOByB_name(b_name);
		session.setAttribute("b_no", bandDto.getB_no());
		
		
		//PlayList 목록 Map에 넣어 반환
		//PlayList 얻어오기
		List<BandMusicDTO> playList = bandService.getPlayList(bandDto.getB_no());
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
		
		return "main/bandInfo.tiles";
	}///geToBandInfoPage
	
	
	@RequestMapping("/band/createNewBand.ins")
	public String goToCreateNewBand(HttpSession session) {
		session.setAttribute("id", session.getAttribute("id"));
		return "main/createNewBand.tiles";
	}///goToCreateNewBand
	
	
	@ResponseBody
	@RequestMapping("/band/uploadCover.ins")
	public String setProfileImg(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest) throws Exception {
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/band/cover");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_cover");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload�� null�ε�
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
		String oneMemberProfileName = bandService.getMemberProfile(map.get("searchId").toString());
		System.out.println("oneMemberProfileName : " + oneMemberProfileName);
		//담는 그릇 생성
		List<Map<String, String>> record = new Vector<Map<String, String>>();
		Map<String, String> oneMap = new HashMap<String, String>();
		
		//검색한 아이디가 멤버인지 판단
		if(!bandService.isMember(map.get("searchId").toString())) {
			return "occur 500error";
		}//if
		
		//아이디, 프로필 사진 이름 넣고 리턴 //프로필 없으면 profile_none.jpg
		oneMap.put("id", map.get("searchId").toString());
		oneMap.put("profile", oneMemberProfileName == null ? "profile_none.jpg" : oneMemberProfileName);
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
		System.out.println(b_no);
		//뒤에 붙을 인덱스 값 얻어오기 / +1 이 다음에 붙을 인덱스값
		int currentInt = bandService.getTotalBandImg(b_no);
		int nextIndex = currentInt + 1;
		System.out.println("currentInt : "+currentInt);
		System.out.println("nextInt : " + nextIndex);
		newFileName = b_no + "_" + nextIndex + newFileName.substring(newFileName.lastIndexOf("."));
		System.out.println("newFileName : "+newFileName);
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
		System.out.println(map.toString());
		
		/* 밴드 이미지 파일 업로드
		 * 
		 * 
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		//파일 이름 설정 : BandImg : b_no_index.extension : ex) 2_3.jpg
		String b_no = (String)session.getAttribute("b_no");
		System.out.println(b_no);
		//뒤에 붙을 인덱스 값 얻어오기 / +1 이 다음에 붙을 인덱스값
		int currentInt = bandService.getTotalBandImg(b_no);
		int nextIndex = currentInt + 1;
		System.out.println("currentInt : "+currentInt);
		System.out.println("nextInt : " + nextIndex);
		newFileName = b_no + "_" + nextIndex + newFileName.substring(newFileName.lastIndexOf("."));
		System.out.println("newFileName : "+newFileName);
		File file = new File(physicalPath + File.separator + newFileName);
		upload.transferTo(file);
		
		//데이터베이스에 입력
		//맵을 만들어서 넘겨주자
		Map dto = new HashMap<String, String>();
		dto.put("b_no", b_no);
		dto.put("newFileName", newFileName);
		
		bandService.addBandImg(dto);
		
		return newFileName;
		*/
		
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
		System.out.println("params.toString() : " + params.toString());
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




























