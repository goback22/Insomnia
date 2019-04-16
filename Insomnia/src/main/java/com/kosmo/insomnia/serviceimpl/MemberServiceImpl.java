package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	//DAO객체 주입
	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	//전체 조회
	@Override
	public List<MemberDTO> selectList() {
		return dao.selectList();
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
		return dao.insert(map);
	}
	

	@Override
	public int update(Map map) {
		return 0;
	}
	
	//소셜 로그인
	@Override
	public boolean isSocialMember(Map map) {
		return dao.isSocialMember(map);
	}
	
	//소셜 회원가입
	@Override
	public boolean socialRegister(Map map) {
		return dao.socialRegister(map);
	}

	
}