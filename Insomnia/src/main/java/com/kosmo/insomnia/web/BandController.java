package com.kosmo.insomnia.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kosmo.insomnia.web.my.FileUpDownUtils;

@Controller
public class BandController {
	
	@RequestMapping("/band/bandInfo.ins")
	public String goToBandInfoPage() {
		return "main/bandInfo.tiles";
	}///geToBandInfoPage
	
	
	@RequestMapping("/band/createNewBand.ins")
	public String goToCreateNewBand() {
		return "main/createNewBand.tiles";
	}///goToCreateNewBand
	
	@ResponseBody
	@RequestMapping("/band/uploadCover.ins")
	public String setProfileImg(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest) throws Exception {
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/temp/cover");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_cover");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload�� null�ε�
		File file = new File(physicalPath + File.separator + newFileName);
		
		upload.transferTo(file);
		
		return newFileName;
	}//uploadCover
	
	@ResponseBody
	@RequestMapping(value="/band/searchMember.ins", produces="text/html; charset=UTF-8")
	public String searchMember(@RequestParam Map map, HttpSession session) throws Exception{
		List<Map<String, String>> record = new Vector<Map<String, String>>();
		Map<String, String> oneMap = new HashMap<String, String>();
		oneMap.put("id", map.get("searchId").toString());
		oneMap.put("profile", "default_profile_img.jpg");
		record.add(oneMap);
		System.out.println(record.toString());
		return JSONArray.toJSONString(record); 
	}///search Member
	
	@ResponseBody
	@RequestMapping(value="/band/uploadBandImageInBandInfo.ins", produces="text/html; charset=UTF-8")
	public String addBandImage(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest) throws Exception{
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/temp");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_band_img");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		File file = new File(physicalPath + File.separator + newFileName);
		
		upload.transferTo(file);
		
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
	public String addBandMusic(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, MultipartRequest multipartRequest) throws Exception{
		System.out.println(map.toString());
		
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/temp/music");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_band_music");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
		File file = new File(physicalPath + File.separator + newFileName);
		
		upload.transferTo(file);
		
		List<Map<String, String>> musicInfo = new Vector<Map<String, String>>();
		Map<String, String> info = new HashMap<String, String>();
		info.put("title", newFileName);
		info.put("category", map.get("select_category").toString());
		musicInfo.add(info);
		
		return JSONArray.toJSONString(musicInfo);
	}///addBandImage
	
	
}//class
