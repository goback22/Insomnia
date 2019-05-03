package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface BandService {

	//1] 밴드 관리 페이지로 이동시 해당 회원이 밴드에 소속된 회원인지 유무판단
	List<BandMemberDTO> isMemberBand(String id);
	
	//2] 밴드 만들때 아이디 입력해서 멤버여부와 프로필 사진 이미지 얻어오기
	String getMemberProfile(String id);
	
	//3] Band테이블에 새로운 밴드 등록
	void addNewBand(Map map);
	
	//4] BandMember 테이블에 만든 밴드의 
	
	//5] 회원인지 여부판단 //없는 회원인 경우 null을 반환한다.
	boolean isMember(String id);
	
	//6] 밴드 이름으로 밴드 넘버값 구해오기
	String getB_noByB_name(String b_name);
	
	//7] BandMember테이블에 입력
	int addNewBandMember(Map bandMember);
	
	//8] 이미등록된 Band이름인지 검사
	boolean isExistBand(String b_name);
	
	//9] 밴드 이름으로 검색해 밴드 객체 얻어오기
	BandDTO getBandDTOByB_name(String b_name);
	
	//10] 해당밴드가 펀딩을 대기중인지 확인
	//대기중이라면 객체의 isExist값 "T" 아니면 "F"
	List<BandSubmitWaitingDTO> getBandSubmitWaitingDTO(String b_no);
	
	//11] 밴드가 등록한 이미지를 반환
	//등록한 이미지가 없다면 객체의 isExist값 "F"
	List<BandImgDTO> getBandImgDTO(String b_no);
	
	//12] 밴드가 등록한 이미지의 총개수를 반환
	// +1이 다음에 붙을 이미지의 인덱스 번호다.
	int getTotalBandImg(String b_no);
	
	//13] 밴드 테이블에 이미지파일 등록, 만약 중복된 이미지파일 이름이 있다면 행을 추가 하지 않는다.
	int addBandImg(Map map);
	
	//14] 밴드 테이블에 이미 이미지파일이 등록되었는지 확인
	String isExistBandImg(String newFileName);
	
	//15] 밴드가 등록한 음악들을 DTO객체로 얻어온다.
	List<BandMusicDTO> getPlayList(String b_no);
	
	//16] 밴드가 등록한 음악의 총개수 반환
	// +1 이 다음에 붙을 음악의 인덱스 번호
	int getTotalBandMusic(String b_no);
	
	//17] dto객체로 밴드 음악 등록
	int addBandMusic(BandMusicDTO dto);
	
	//18] dto 객체로 bandSubmitWaiting 등록
	int addBandSubmitWaiting(BandSubmitWaitingDTO dto);
	
	//19] dto 객체로 rewardWaiting 등록
	int addRewardWaiting(RewardWaitingDTO dto);
	
	//20] b_name으로 List BandMusicDTO 얻기
	List<BandMusicDTO> getListBandMusicDTO(String b_no);
	
	//21] sw_no 으로 List RewardWaitingDTO 얻기
	List<RewardWaitingDTO> getListRewardWaitingDTO(String sw_no);
	
	//22] 모든 밴드의 정보 DTO가져오기
	List<BandDTO> allBand();
	
}//interface BadnService
