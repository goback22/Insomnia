package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.AdminDTO;
import com.kosmo.insomnia.service.AdminService;

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
	public AdminDTO selectOne(Map map) {
		return null;
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
	
	

}
