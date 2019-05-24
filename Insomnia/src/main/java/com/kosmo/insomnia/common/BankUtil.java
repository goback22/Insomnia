package com.kosmo.insomnia.common;

import java.util.List;

import com.kosmo.insomnia.service.AdminDTO;

public class BankUtil {
	
	//dto또는 넘버를 넣으면 그에 맞는 은행이름으로 변환해주는 클래스
	
	public static void convertBankNameInDTO(AdminDTO dto) {
		switch(dto.getS_account_bank()) {
		case "1":
			dto.setS_account_bank("농협은행");
			break;
		case "2":
			dto.setS_account_bank("신한은행");
			break;
		case "3":
			dto.setS_account_bank("우리은행");
			break;
		case "4":
			dto.setS_account_bank("기업은행");
			break;
		case "5":
			dto.setS_account_bank("KEB하나은행");
			break;
		case "6":
			dto.setS_account_bank("카카오뱅크");
			break;
		case "7":
			dto.setS_account_bank("국민은행");
			break;
		default:
		}//switch
	}///convertBandNameInDTO
	
	
	public static void convertBankNameInDTOList(List<AdminDTO> list) {
		for(AdminDTO dto : list) {
			try { //입력한 값이 null일경우 trycatch
				convertBankNameInDTO(dto);
			}catch(Exception e) {}
		}//for
	}///convertBankNameInDTOList
	
	
}//class
