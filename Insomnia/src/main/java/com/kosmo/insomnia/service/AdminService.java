package com.kosmo.insomnia.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	//전체보기
	List<AdminDTO> selectList(Map map);//전체회원보기
	//전체회원 성별
	int getGenderCount(Map map);
	//신규회원 count
	int getNewMember(Map map);
	//여성회원
	int getFemaleMember(String string);
	//상세보기
	AdminDTO selectOne(String string);
	//member detail
	List<AdminDTO> selectMemberViewPay(String string);
	
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
	//band waiting
	List<AdminDTO> selectWaitingBand(Map map);
	//bandsubmit
	List<AdminDTO> selectBandSubmit(Map map);
	//bandsubmitreward
	List<AdminDTO> selectBandSubmitReward(Map map);
	//band chart data
	List<AdminDTO> selectChartData(String string);
	//band accept
	int updateBandAccept(String string);
	
	//subList
	List<AdminSubDTO> selectSubList(Map map);
	List<AdminSubDTO> selectSubMemberList(Map map);
	int insertBgshire(String string);
	List<AdminSubDTO> selectHire(Map map);
	List<AdminSubDTO> selectSubApplyList(Map map);
	
	//입력/수정/삭제용]
	int delete(Map map);
	int insert(Map map);
	int update(Map map);
	
	//천제 레코드
	int getTotalRecord(Map map);
	
	
	//메인 결제 전체조회 
	public List<Map> selectSafepayList();
	//총 구매자 수 조회 쿼리
	public int countFundPeople(String S_NO);
	//safepay 상세보기 쿼리
	public List<Map> selectBandSafepayDetail(Map map);
}
