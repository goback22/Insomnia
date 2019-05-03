package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	//전체보기
	List<AdminDTO> selectList(Map map);//전체회원보기
	List<AdminDTO> selectNewMemberList(Map map);//그제 어제 오늘 가입한 사람
	//신규 가입자 사람 수(3일)
	int selectTodayNewMember(Map map);
	int selectYesterDayNewMember(Map map);
	int selectTwoDaysAgoNewMember(Map map);
	//bandlist
	List<AdminDTO> selectBandList(Map map);
	//band music
	List<AdminDTO> selectBandMusicList(String string);
	//bandmember
	List<AdminDTO> selectBandMember(Map map);
	
	//상세보기
	AdminDTO selectOne(String string);
	
	
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
	//천제 레코드
	int getTotalRecord(Map map);
	
	//전체회원 성별
	int getGenderCount(Map map);
	//여성회원
	int getFemaleMember(String string);
}
