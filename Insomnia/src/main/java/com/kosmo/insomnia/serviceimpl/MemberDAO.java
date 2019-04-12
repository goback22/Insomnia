package com.kosmo.insomnia.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.insomnia.service.MemberDTO;
import com.kosmo.insomnia.service.MemberService;


@Repository
public class MemberDAO implements MemberService {
	// SqlSessionTemplate객체 주입]
	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<MemberDTO> selectList() {
		return template.selectList("memberSelectList");
	}

	@Override
	public boolean isMember(Map map) {
		return (Integer)template.selectOne("memberIsMember", map) == 0 ? false : true;
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
