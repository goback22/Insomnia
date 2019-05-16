package com.kosmo.insomnia.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandSubmitDTO;
import com.kosmo.insomnia.service.BandSubmitWaitingDTO;
import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.RewardWaitingDTO;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;
import com.kosmo.insomnia.serviceimpl.MemberServiceImpl;
import com.kosmo.insomnia.web.my.FileUpDownUtils;
import com.sun.mail.iap.Response;

@Controller
public class BandSubmitController {
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
	//bandSubmt.jsp로 넘어갈때
	@RequestMapping("/main/bandSubmit.ins")
	public String toBandSubmit(@RequestParam Map params, Map dismap, HttpSession session, Model model) {
		//세션에 있는 값 넘겨받는다.
		String b_name = session.getAttribute("b_name").toString();
		String b_no = session.getAttribute("b_no").toString();
		String id = session.getAttribute("id").toString();
		
		//필요한 DTO객체 얻기 / bandDTO
		BandDTO bandDto = bandService.getBandDTOByB_name(b_name);
		
		//model에 필요한 값 넘긴다.
		model.addAttribute("bandDto", bandDto);
		
		//session에 id, b_no, b_name 넣어서 넘긴다.
		session.setAttribute("id", session.getAttribute("id"));
		session.setAttribute("b_name", b_name);
		session.setAttribute("b_no",b_no);
		
			////슬라이드 메뉴 위한 부분
		
			dismap.put("id", session.getAttribute("id"));
			MemberDTO loginRecord = memberService.selectOne(dismap);
			
			if(loginRecord != null) {
				model.addAttribute("loginRecord", loginRecord);
				//record.setProfile_img(record.getProfile_img());		
				//model.addAttribute("record", record);	
			}	
				
			////슬라이드메뉴
		
		return "main/bandSubmit.tiles";           
	}//toBandSubmit;
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/setprofile.ins", produces="text/html; charset=UTF-8")
	public String setProfileImg(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, HttpSession session, MultipartRequest multipartRequest) throws Exception {

		//파일과 경로, 이름 얻어오기
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/content/main/banner");
		MultipartFile upload = multipartRequest.getFile("upload_profile");
		String newFileName = upload.getOriginalFilename();
		
		String b_name = session.getAttribute("b_name").toString();
		String b_no = bandService.getB_noByB_name(b_name);
		
		//파일 이름과 경로 재설정 b_name.jpg
		newFileName = b_no+newFileName.substring(newFileName.lastIndexOf("."));
		File file = new File(physicalPath + File.separator + newFileName);
		
		//밴드 프로필, 배너 업로드
		upload.transferTo(file);
		
		return newFileName;
	}//setProfile
	
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/setimages.ins", produces="text/html; charset=UTF-8")
	public String setImages(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, HttpSession session, MultipartRequest multipartRequest) throws Exception {
		List<Map<String, String>> fileNameList = new Vector<Map<String,String>>();
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/content/main/shows");
		Iterator<String> names = multipartRequest.getFileNames();
		int index = 0;
		while(names.hasNext()) {
			//파일객체 / 원래 이름 얻어오기
			MultipartFile upload = multipartRequest.getFile(names.next());
			String newFileName = upload.getOriginalFilename();
			
			String b_no = bandService.getB_noByB_name(session.getAttribute("b_name").toString());
			
			//파일 경로, 객체 이름 재설정 : bName_index.jpg 후 업로드
			newFileName = b_no+"_"+index+newFileName.substring(newFileName.lastIndexOf("."));
			File file = new File(physicalPath + File.separator + newFileName);
			upload.transferTo(file);
			
			model.addAttribute("profile_name"+"_"+index, newFileName);
			Map<String, String> fileNameMap = new HashMap<String, String>();
			fileNameMap.put("image"+index, newFileName);
			fileNameList.add(fileNameMap);
			index++;
		}//while hasNext
		
		return JSONArray.toJSONString(fileNameList);
	}//setImages
	
	
	
	///섬머노트에 이미지 업로드했을때 서버에 저장하고 파일이름 넘겨줌
	@ResponseBody
	@RequestMapping(value="/bandsubmit/b_banner_description.ins", produces="text/html; charset=UTF-8")
	public void b_bannerImageUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//업로드할 폴더 경로
		String realPath = request.getSession().getServletContext().getRealPath("/upload/content/main/dummy");
		UUID uuid = UUID.randomUUID();
		
		//업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;
		
		String filepath = realPath+"\\"+str_filename;
		
		File f = new File(filepath);
		if(!f.exists())
			f.mkdirs();
		file.transferTo(f);
		out.println("/insomnia/upload/content/main/dummy/"+str_filename);
		out.close();
	}//b_bannerImageUpload
	 
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/addNewBandSubmitWaiting.ins", produces="text/html; charset=UTF-8")
	public String addNewBandSubmitWaiting(BandSubmitWaitingDTO dto, HttpSession session) throws Exception{
		String b_no = session.getAttribute("b_no").toString();
		String b_name = session.getAttribute("b_name").toString();
		
		//1. 밴드 넘버 등록
		dto.setB_no(session.getAttribute("b_no").toString());
		
		//2. 섬머노트에 입력한 내용들을 텍스트 파일로 저장한다.
		String longPath = session.getServletContext().getRealPath("/upload/content/main/sw_long_description");
		String longDescription = dto.getSw_long_description();
		String contentPath = session.getServletContext().getRealPath("/upload/content/main/sw_content");
		String contentDescription = dto.getSw_content();
		
		File file = new File(longPath, b_no+".txt");
		if(!file.exists())
			file.createNewFile();
		OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(file));
		osw.write(longDescription);
		osw.close();
		
		file = new File(contentPath, b_no+ ".txt");
		if(!file.exists())
			file.createNewFile();
		osw = new OutputStreamWriter(new FileOutputStream(file));
		osw.write(contentDescription);
		osw.close();
		
		dto.setSw_long_description(b_no+".txt");
		dto.setSw_content(b_no + ".txt");
		
		//dto객체를 db에 등록한다.
		int affected = bandService.addBandSubmitWaiting(dto);
		if(affected == 1)
			return "SUC";
		else
			return "FAIL";
	}///addNewBandSubmitWaiting();
	
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/addRewardWaiting.ins", produces="text/html; charset=UTF-8")
	public String addRewardWaiting(RewardWaitingDTO dto, HttpSession session) throws Exception{
		//밴드 넘버로 sw_no얻어오기
		String b_no = session.getAttribute("b_no").toString().toString();
		List<BandSubmitWaitingDTO> records = bandService.getBandSubmitWaitingDTO(b_no);
		BandSubmitWaitingDTO record = records.get(records.size()-1);
		String sw_no = record.getSw_no();
		
		//dto에 sw_no 넣고 CRUD
		dto.setSw_no(sw_no);
		int affected = bandService.addRewardWaiting(dto); 
		
		if(affected == 1) 
			return "SUC";
		else
			return "FAIL"; 
	}//addRewardWaiting
	
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/writeAdditionalComplete.ins", produces="text/html; charset=UTF-8")
	public String writeAdditionalComplete(BandSubmitDTO dto, HttpSession session, Model model) throws Exception{
		//bandSubmitWaiting complete
		int isComplete = bandService.completeBandSubmitWaiting(dto.getSw_no());
		if(isComplete != 1) 
			return "F";
		
		//insert into bandSubmit
		//콤마빼고 다시 dto세팅
		dto.setS_goal_price(dto.getS_goal_price().replaceAll(",", ""));
		int affected = bandService.addBandSubmit(dto);
		if(affected == 1)
			return "T";
		else
			return "F";
	}///writeAdditionalComplete
}//class
