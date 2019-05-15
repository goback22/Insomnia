package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.service.AdminService;
import com.kosmo.insomnia.service.AdminSubDTO;

@Repository
public class AdminDAO implements AdminService{

	// SqlSessionTemplate객체 주입]
	@Resource(name = "template")
	private SqlSessionTemplate template;
		
	@Override
	public List<AdminDTO> selectList(Map map) {
		return template.selectList("adminMember",map);
	}
	@Override
	public List<AdminDTO> selectNewMemberList(Map map) {
		return template.selectList("adminNewMember",map);
	}
	
	
	@Override
	public List<AdminDTO> selectBandList(Map map) {
		return template.selectList("adminMainMember",map);
	}
	
	@Override
	public List<AdminDTO> selectBandMusicList(String string) {
		return template.selectList("adminMainMusicList",string);
	}

	@Override
	public AdminDTO selectOne(String string) {
		return template.selectOne("memberDetailView",string);
	}

	@Override
	public int delete(Map map) {
		return 0;
	}

	@Override
	public int insert(Map map) {
		return 0;
	}

	@Override
	public int update(Map map) {
		return 0;
	}

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("totalMembers", map);
	}
	@Override
	public int getNewMember(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("getNewMember",map);
	}
	@Override
	public int getGenderCount(Map map) {
		return 0;
	}

	@Override
	public int getFemaleMember(String string) {
		return template.selectOne("femaleMember",string);
	}
	@Override
	public int selectTodayNewMember(Map map) {
		return template.selectOne("todayNewMember",map);
	}
	@Override
	public int selectYesterDayNewMember(Map map) {
		return template.selectOne("yesterdayNewMember",map);
	}
	@Override
	public int selectTwoDaysAgoNewMember(Map map) {
		return template.selectOne("twoDayAgoMember",map);
	}
	@Override
	public List<AdminDTO> selectBandMember(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("bandMember",map);
	}
	@Override
	public List<AdminDTO> selectMemberViewPay(String string) {
		return template.selectList("memberViewPay",string);
	}
	@Override
	public List<AdminSubDTO> selectSubList(Map map) {
		return template.selectList("subList",map);
	}
	@Override
	public List<AdminSubDTO> selectSubMemberList(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("subMemberList",map);
	}
	@Override
	public int insertBgshire(String string) {
		// TODO Auto-generated method stub
		return template.insert("bgshire",string);
	}
	@Override
	public List<AdminSubDTO> selectHire(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("bgsHireList",map);
	}
	/////////////
	@Override
	public List<AdminDTO> selectWaitingBand(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("bandWaiting",map);
	}
	@Override
	public List<AdminDTO> selectBandSubmit(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("bandSubmit",map);
	}
	@Override
	public List<AdminDTO> selectBandSubmitReward(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("bandSubmitReward",map);
	}
	@Override
	public List<AdminSubDTO> selectSubApplyList(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("subHireMember",map);
	}
	@Override
	public List<AdminDTO> selectChartData(String string) {
		// TODO Auto-generated method stub
		return template.selectList("bandChartData",string);
	}
	@Override
	public int updateBandAccept(String string) {
		// TODO Auto-generated method stub
		return template.update("updateBandAccept",string);
	}
	
	//일승 추가 - 메인 결제 전체 조회
	@Override
	public List<Map> selectSafepayList(){
		return  template.selectList("adminMainPaySelectlist");
	}
	@Override
	public int countFundPeople(String S_NO) {
		return template.selectOne("countFundPeople",S_NO);
	}
	@Override
	public List<Map> selectBandSafepayDetail(Map map) {
		return template.selectList("selectBandSafepayDetail",map);
	}
	

}
