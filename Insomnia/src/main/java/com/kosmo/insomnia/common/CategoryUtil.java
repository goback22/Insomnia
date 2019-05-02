package com.kosmo.insomnia.common;

import java.util.List;
import java.util.Vector;

import com.kosmo.insomnia.service.BandMusicDTO;

public class CategoryUtil {

	//ct_no값을 가진 DTO를 입력해 view에서 클래스명으로 쓰일 텍스트로 변환해서 다시 저장해준다.
	public static BandMusicDTO convertCt_noToCt_name(BandMusicDTO dto) {
		switch(dto.getCt_no()) {
		case "1": 
			dto.setCt_name("포크·팝");
			dto.setCt_name_css("folk-pop");
			break;
		case "2": 
			dto.setCt_name("재즈·클래식");
			dto.setCt_name_css("jazz-classic");
			break;
		case "3": 
			dto.setCt_name("힙합");
			dto.setCt_name_css("hiphop");
			break;
		case "4": 
			dto.setCt_name("댄스·일렉트로닉");
			dto.setCt_name_css("dance-electronic");
			break;
		case "5": 
			dto.setCt_name("락·메탈");
			dto.setCt_name_css("rock-metal");
			break;
		case "6": 
			dto.setCt_name("국악");
			dto.setCt_name_css("traditional");
			break;
		}//switch
		return dto;
	}//convertCt_noToCt_Name
	
	//ct_css값을 가진 DTO를 입력해 ct_no, ct_name을 붙여준다.
	public static BandMusicDTO convertCt_name_cssToCt_no(BandMusicDTO dto) {
		switch(dto.getCt_name_css()) {
		case "folk-pop":
			dto.setCt_no("1");
			dto.setCt_name("포크·팝");
			break;
		case "jazz-classic": 
			dto.setCt_no("2");
			dto.setCt_name("재즈·클래식");
			break;
		case "hiphop": 
			dto.setCt_no("3");
			dto.setCt_name("힙합");
			break;
		case "dance-electronic": 
			dto.setCt_no("4");
			dto.setCt_name("댄스·일렉트로닉");
			break;
		case "rock-metal": 
			dto.setCt_no("5");
			dto.setCt_name("락·메탈");
			break;
		case "traditional": 
			dto.setCt_no("6");
			dto.setCt_name("국악");
			break;
		}///switch
		return dto;
	}///convertCt_name_cssToCt_no
	
	
	//ct_no 값을 가진 DTO를 저장한 List를 입력해 ct_name과 ct_name_css를 채워서 반환
	public static List<BandMusicDTO> convertListCt_noToListCt_name(List<BandMusicDTO> playList){
		List<BandMusicDTO> newPlayList = new Vector<BandMusicDTO>();
		for(BandMusicDTO dto : playList) 
			newPlayList.add(convertCt_noToCt_name(dto));
		return newPlayList;
	}//
	
}//class
