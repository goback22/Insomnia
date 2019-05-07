package com.kosmo.insomnia.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.channels.ScatteringByteChannel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.common.CategoryUtil;
import com.kosmo.insomnia.service.BandDTO;
import com.kosmo.insomnia.service.BandMusicDTO;
import com.kosmo.insomnia.service.BandSubmitWaitingDTO;
import com.kosmo.insomnia.service.RewardWaitingDTO;
import com.kosmo.insomnia.serviceimpl.BandServiceImpl;

@Controller
public class BandContentController {

	@Resource(name="bandService")
	private BandServiceImpl bandService;
	
	//메인 프로젝트 - 컨텐트
	@RequestMapping(value="/main/content.ins")
	public String content(@RequestParam Map params, HttpSession session, Model model) {
		
		////////////////////////////////////////////////////////////////////////세션에서 필요한 정보얻기
		String b_no = session.getAttribute("b_no").toString();
		String b_name = session.getAttribute("b_name").toString();
		String id = session.getAttribute("id").toString();
		
		
		
		
		////////////////////////////////////////////////////////////////BandSubmitWaitingDTO 얻어서 반환
		List<BandSubmitWaitingDTO> records =  bandService.getBandSubmitWaitingDTO(b_no);
		//하나만 얻어온다. //b_name 설정
		BandSubmitWaitingDTO record = records.get(records.size()-1);
		record.setB_name(b_name);
		
		//저장된 텍스트 파일 String형 메모리로 불러와서 객체에 재저장
		try {
			String longFileName = record.getSw_long_description();
			String contentFileName = record.getSw_content();
			String longFilePath = session.getServletContext().getRealPath("/upload/content/main/sw_long_description");
			String contentFilePath = session.getServletContext().getRealPath("/upload/content/main/sw_content");
			
			File longFile = new File(longFilePath, longFileName);
			File contentFile = new File(contentFilePath, contentFileName);
			
			InputStream is = new FileInputStream(longFile);
			StringBuffer longBuffer = new StringBuffer();
			byte[] b = new byte[16384];
			int longi;
			while((longi = is.read(b)) != -1) {
				longBuffer.append(new String(b, 0, longi));
			}//while
			String longResult = longBuffer.toString();
			is.close();
			
			InputStream contentIs = new FileInputStream(contentFile);
			StringBuffer contentBuffer = new StringBuffer();
			byte[] contentB = new byte[16384];
			int contenti;
			while((contenti = contentIs.read(contentB))!= -1) {
				contentBuffer.append(new String(contentB, 0, contenti));
			}//while
			String contentResult = contentBuffer.toString();
			contentIs.close();
			
			record.setSw_long_description(longResult);
			record.setSw_content(contentResult);
		}catch(IOException e) {e.printStackTrace();}
		
		//yotube thumbnail url 만들어 넣기
		String url = record.getSw_youtube();
		String inputUrl = url.substring(url.indexOf("watch?v=")+8);
		String thUrl = "http://img.youtube.com/vi/" + inputUrl + "/mqdefault.jpg";
		System.out.println("url : " +url);
		System.out.println("inputUrl : " +inputUrl);
		System.out.println("thUrl : " +thUrl);
		record.setSw_youtube_thumbnail(thUrl);
		
		//모델에 넣고 반환
		model.addAttribute("record", record);
		
		
		
		
		//////////////////////////////////////////////////////////////////////밴드가 등록한 음악 얻기
		List<BandMusicDTO> beforPlayList = bandService.getListBandMusicDTO(b_no);
		//playList에 ct_name, ct_name_css설정
		List<BandMusicDTO> playList = new Vector<BandMusicDTO>();
		for(BandMusicDTO dto : beforPlayList) 
			playList.add(CategoryUtil.convertCt_noToCt_name(dto));
		//모델에 넣고 반환
		model.addAttribute("playList", playList);
		
		
		///////////////////////////////////////////////////////////////////////밴드가 등록한 리워드 얻기
		List<RewardWaitingDTO> rewardList =  bandService.getListRewardWaitingDTO(record.getSw_no().toString());
		model.addAttribute("rewardList", rewardList);
		
		
		//세션에 저장
		session.setAttribute("b_no", b_no);
		session.setAttribute("b_name", b_name);
		session.setAttribute("id", id);
		return "/main/content.tiles";
	}///content
	
	
	

	
	
	///밴드별 BandMusicDTO 받아와서 제이썬객체로 변환후 넘겨주기
	@ResponseBody
	@RequestMapping(value="/band/loadPlayList.ins", produces="text/html; charset=UTF-8")
	public String loadPlayList(@RequestParam Map params, HttpSession session) throws Exception{

		String b_no = session.getAttribute("b_no").toString();
		String b_name = session.getAttribute("b_name").toString();
		String musicPath = session.getServletContext().getRealPath("/upload/band/music");
		String coverPath = session.getServletContext().getRealPath("/upload/band/cover");
		
		List<BandMusicDTO> playList = bandService.getListBandMusicDTO(b_no);
		BandDTO band = bandService.getBandDTOByB_name(b_name);
		
		List<Map<String, String>> playMap = new Vector<Map<String, String>>();
		
		for(BandMusicDTO music : playList) {
			Map<String, String> number  = new HashMap<String, String>();
			number.put("title", music.getBm_name());
			number.put("artist", b_name);
			number.put("mp3", "/insomnia/upload/band/music/" + music.getBm_filename());
			number.put("poster","/insomnia/upload/band/cover/"+ band.getB_album_cover());
			
			playMap.add(number);
		}//for
		
		return JSONArray.toJSONString(playMap);
	}///loadPlaylIst
	
	
	
	
	
	
	
	
	//모든 밴드 정보를 받아서 카테고리별로 뿌려준다.
	//메인 프로젝트
	@RequestMapping(value="/main/mainproject.ins")
	public String mainproject(@RequestParam Map params, HttpSession session, Model model) {
		System.out.println("mainproject시작 : " + params.toString());
		
		//모든 밴드의 필요한 정보를 가져온다.
		List<BandDTO> beforeAllBand = bandService.allBand();
		List<BandDTO> folk = new Vector<BandDTO>();
		List<BandDTO> jazz = new Vector<BandDTO>();
		List<BandDTO> hiphop = new Vector<BandDTO>();
		List<BandDTO> dance = new Vector<BandDTO>();
		List<BandDTO> rock = new Vector<BandDTO>();
		List<BandDTO> traditional = new Vector<BandDTO>();
		//ct_name, ct_name_css 채우고 장르별 분류
		for(BandDTO dto : beforeAllBand) {
			switch(dto.getCt_no()) {
			case "1":
				folk.add(CategoryUtil.setCt_nameInBandDTO(dto));
				break;
			case "2":
				jazz.add(CategoryUtil.setCt_nameInBandDTO(dto));
				break;
			case "3":
				hiphop.add(CategoryUtil.setCt_nameInBandDTO(dto));
				break;
			case "4":
				dance.add(CategoryUtil.setCt_nameInBandDTO(dto));
				break;
			case "5":
				rock.add(CategoryUtil.setCt_nameInBandDTO(dto));
				break;
			case "6":
				traditional.add(CategoryUtil.setCt_nameInBandDTO(dto));
				break;
			}//switch
		}//for
		
		model.addAttribute("folk", folk);
		model.addAttribute("jazz", jazz);
		model.addAttribute("hiphop", hiphop);
		model.addAttribute("dance", dance);
		model.addAttribute("rock", rock);
		model.addAttribute("traditional", traditional);
		
		return "/main/mainproject.tiles";
	}//mainproject

}//class























