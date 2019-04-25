package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.service.AdminService;

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
	
	@Override
	public AdminDTO selectOne(Map map) {
		return dao.selectOne(map);
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

	
	
	

	

}
