package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.MemberService;

@Service("insService")
public class MemberServiceImpl implements MemberService{

	//DAO객체 주입
	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	//전체 조회
	@Override
	public List<MemberDTO> selectList() {
		return dao.selectList();
	}

	//로그인 처리
	@Override
	public boolean isMember(Map map) {
		System.out.println("asdasdasdasdasd");
		return dao.isMember(map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
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
}