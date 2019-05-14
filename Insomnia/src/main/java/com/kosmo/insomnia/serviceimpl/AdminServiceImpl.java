package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.service.AdminService;
import com.kosmo.insomnia.service.AdminSubDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDAO")
	private AdminDAO dao;
	
	@Override
	public List<AdminDTO> selectList(Map map) {
		return dao.selectList(map);
	}
	
	@Override
	public List<AdminDTO> selectBandList(Map map) {
		return dao.selectBandList(map);
	}

	@Override
	public List<AdminDTO> selectBandMusicList(String string) {
		return dao.selectBandMusicList(string);
	}
	
	//member 상세보기
	@Override
	public AdminDTO selectOne(String string) {
		return dao.selectOne(string);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}

	@Override
	public int getGenderCount(Map map) {
		return 0;
	}

	@Override
	public int getFemaleMember(String string) {
		return dao.getFemaleMember(string);
	}

	@Override
	public List<AdminDTO> selectNewMemberList(Map map) {
		return dao.selectNewMemberList(map);
	}

	@Override
	public int selectTodayNewMember(Map map) {
		return dao.selectTodayNewMember(map);
	}

	@Override
	public int selectYesterDayNewMember(Map map) {
		return dao.selectYesterDayNewMember(map);
	}

	@Override
	public int selectTwoDaysAgoNewMember(Map map) {
		return dao.selectTwoDaysAgoNewMember(map);
	}

	@Override
	public List<AdminDTO> selectBandMember(Map map) {
		return dao.selectBandMember(map);
	}

	@Override
	public List<AdminDTO> selectMemberViewPay(String string) {
		return dao.selectMemberViewPay(string);
	}

	@Override
	public List<AdminSubDTO> selectSubList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectSubList(map);
	}
	@Override
	public List<AdminSubDTO> selectSubMemberList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectSubMemberList(map);
	}

	@Override
	public int insertBgshire(String string) {
		// TODO Auto-generated method stub
		return dao.insertBgshire(string);
	}

	@Override
	public List<AdminSubDTO> selectHire(Map map) {
		// TODO Auto-generated method stub
		return dao.selectHire(map);
	}
	//////////////

	@Override
	public List<AdminDTO> selectWaitingBand(Map map) {
		// TODO Auto-generated method stub
		return dao.selectWaitingBand(map);
	}

	@Override
	public List<AdminDTO> selectBandSubmit(Map map) {
		// TODO Auto-generated method stub
		return dao.selectBandSubmit(map);
	}

	@Override
	public List<AdminDTO> selectBandSubmitReward(Map map) {
		// TODO Auto-generated method stub
		return dao.selectBandSubmitReward(map);
	}

	@Override
	public List<AdminSubDTO> selectSubApplyList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectSubApplyList(map);
	}

	@Override
	public List<AdminDTO> selectChartData(String string) {
		// TODO Auto-generated method stub
		return dao.selectChartData(string);
	}

	@Override
	public int updateBandAccept(String string) {
		// TODO Auto-generated method stub
		return dao.updateBandAccept(string);
	}

	@Override
	public int getNewMember(Map map) {
		// TODO Auto-generated method stub
		return dao.getNewMember(map);
	}
	
	//일승 추가 - 메인 결제 전체 조회
	@Override
	public List<Map> selectSafepayList(){
		return  dao.selectSafepayList();
	}
	//일승 추가 - 메인 총 구매자 수 조회 쿼리
	@Override
	public int countFundPeople(String S_NO) {
		return dao.countFundPeople(S_NO);
	}

	@Override
	public List<Map> selectBandSafepayDetail(Map map) {
		return dao.selectBandSafepayDetail(map);
	}

	

}
