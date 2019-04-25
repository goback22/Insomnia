package com.kosmo.insomnia.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Iterator;
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
public class BandSubmitController {
	
	@RequestMapping("/main/bandSubmit.ins")
	public String toBandSubmit() {
		return "main/bandSubmit.tiles";           
	}//toBandSubmit;
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/setprofile.ins", produces="text/html; charset=UTF-8")
	public String setProfileImg(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, Map dismap, HttpSession session, MultipartRequest multipartRequest) throws Exception {
		
		////////////////////////////////////////////////////
		//// ���ε�� ���� upload/temp�� �ӽ÷� ����
		//// ���ε� ������ upload�� �˸��� ������ primary key ���� �Բ� ������ temp���� �����ؾ���
		/////////////////////////////////////////////////////
		
		/*
		System.out.println(multipartRequest.getMultiFileMap().toString());
		String physicalPath = System.getProperty("user.home")+"\\git\\Insomnia\\Insomnia\\src\\main\\webapp\\upload\\temp";
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_profile");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload�� null�ε�
		File file = new File(physicalPath + File.separator + newFileName);
		System.out.println("newFileName��? " + newFileName);
		
		upload.transferTo(file);
		
		if(!file.exists()) {
			file.createNewFile();
		}//if
		
		dismap.put("profile_name", newFileName);
		
		return newFileName;
		*/
		
		
		////////////// realPath ���͸��� ������ �̹��� ���Ӱ��� �����ϰ� �ִ´�.
		////////////// ������ �Ǹ� �ӽð�ο��� ������ ������ �����Ѵ�.
		////////////// �ƴϸ� ��Ŭ������ ������ �ʿ���� was��ο��� ���ε� ������ �����ϸ� ��.
		
		
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/temp");
		//MultipartFile upload = mhsr.getFile("imgUpload");
		MultipartFile upload = multipartRequest.getFile("upload_profile");
		
		String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload�� null�ε�
		File file = new File(physicalPath + File.separator + newFileName);
		
		upload.transferTo(file);
	
		System.out.println(file.getAbsolutePath());

		dismap.put("profile_name", newFileName);
		
		return newFileName;
	}//setProfile
	
	
	@ResponseBody
	@RequestMapping(value="/bandsubmit/setimages.ins", produces="text/html; charset=UTF-8")
	public String setImages(@RequestParam Map map, MultipartHttpServletRequest mhsr, Model model, Map dismap, HttpSession session, MultipartRequest multipartRequest) throws Exception {
		System.out.println("controller setImage Start");
		List<Map<String, String>> fileNameList = new Vector<Map<String,String>>();
		String physicalPath = mhsr.getServletContext().getRealPath("/upload/temp");
		Iterator<String> names = multipartRequest.getFileNames();
		int index = 0;
		while(names.hasNext()) {
			MultipartFile upload = multipartRequest.getFile(names.next());
			String newFileName = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());///upload�� null�ε�
			File file = new File(physicalPath + File.separator + newFileName);
			System.out.println(newFileName);
			upload.transferTo(file);
			model.addAttribute("profile_name"+"_"+index, newFileName);
			Map<String, String> fileNameMap = new HashMap<String, String>();
			fileNameMap.put("image"+index, newFileName);
			fileNameList.add(fileNameMap);
			System.out.println("file transferTo and setAttribute to model_" + index);
			index++;
		}//while hasNext
		
		System.out.println("controller : setImages END");
		return JSONArray.toJSONString(fileNameList);
	}//setImages
	
}//class
