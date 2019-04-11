package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	
	//전체조회
	@Override
	public List<MemberDTO> selectList() {
		return dao.selectList();
	}


	//로그인 조회
	@Override
	public boolean isMember(Map map) {
		return dao.isMember(map);
	}
	
	
	

	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
